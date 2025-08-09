#!/bin/bash

# Life Management App Deployment Script
set -e

echo "🚀 Starting Life Management App Deployment"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
APP_NAME="life-management-app"
DOCKER_COMPOSE_FILE="docker-compose.yml"
ENV_FILE="../.env"

# Functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is installed and running
check_docker() {
    log_info "Checking Docker installation..."
    if ! command -v docker \&\> /dev/null; then
        log_error "Docker is not installed. Please install Docker first."
        exit 1
    fi
    
    if ! docker info \&\> /dev/null; then
        log_error "Docker is not running. Please start Docker first."
        exit 1
    fi
    
    log_success "Docker is ready"
}

# Check if environment file exists
check_env() {
    log_info "Checking environment configuration..."
    if [ ! -f "$ENV_FILE" ]; then
        log_warning "Environment file not found. Creating from example..."
        cp "../backend/.env.example" "$ENV_FILE"
        log_warning "Please update $ENV_FILE with your production values before continuing."
        log_warning "Press any key to continue after updating the environment file..."
        read -n 1 -s
    fi
    log_success "Environment configuration ready"
}

# Build and deploy
deploy() {
    log_info "Building and deploying $APP_NAME..."
    
    # Pull latest images
    log_info "Pulling latest base images..."
    docker-compose -f $DOCKER_COMPOSE_FILE pull mongodb
    
    # Build the application
    log_info "Building application..."
    docker-compose -f $DOCKER_COMPOSE_FILE build app
    
    # Stop existing containers
    log_info "Stopping existing containers..."
    docker-compose -f $DOCKER_COMPOSE_FILE down
    
    # Start the application
    log_info "Starting application..."
    docker-compose -f $DOCKER_COMPOSE_FILE up -d
    
    # Wait for services to be healthy
    log_info "Waiting for services to be healthy..."
    timeout 60s bash -c 'until docker-compose -f '$DOCKER_COMPOSE_FILE' ps | grep -q "healthy"; do sleep 2; done' || {
        log_error "Services failed to start properly"
        docker-compose -f $DOCKER_COMPOSE_FILE logs
        exit 1
    }
    
    log_success "Application deployed successfully!"
}

# Show status
show_status() {
    log_info "Application Status:"
    docker-compose -f $DOCKER_COMPOSE_FILE ps
    
    log_info "Application URLs:"
    echo "  Frontend: http://localhost:5000"
    echo "  Health Check: http://localhost:5000/health"
    echo "  API: http://localhost:5000/api"
}

# Cleanup function
cleanup() {
    log_info "Cleaning up unused Docker resources..."
    docker system prune -f
    docker volume prune -f
}

# Backup function
backup() {
    log_info "Creating database backup..."
    BACKUP_DIR="../backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    docker-compose -f $DOCKER_COMPOSE_FILE exec -T mongodb mongodump --out /tmp/backup
    docker cp life-management-mongodb:/tmp/backup "$BACKUP_DIR/"
    
    log_success "Backup created at $BACKUP_DIR"
}

# Main script
case "$1" in
    "deploy")
        check_docker
        check_env
        deploy
        show_status
        ;;
    "status")
        show_status
        ;;
    "logs")
        docker-compose -f $DOCKER_COMPOSE_FILE logs -f
        ;;
    "stop")
        log_info "Stopping application..."
        docker-compose -f $DOCKER_COMPOSE_FILE down
        log_success "Application stopped"
        ;;
    "restart")
        log_info "Restarting application..."
        docker-compose -f $DOCKER_COMPOSE_FILE restart
        log_success "Application restarted"
        ;;
    "backup")
        backup
        ;;
    "cleanup")
        cleanup
        ;;
    "update")
        check_docker
        log_info "Updating application..."
        docker-compose -f $DOCKER_COMPOSE_FILE pull
        docker-compose -f $DOCKER_COMPOSE_FILE build app
        docker-compose -f $DOCKER_COMPOSE_FILE up -d
        show_status
        ;;
    *)
        echo "Usage: $0 {deploy|status|logs|stop|restart|backup|cleanup|update}"
        echo ""
        echo "Commands:"
        echo "  deploy   - Build and deploy the application"
        echo "  status   - Show application status"
        echo "  logs     - Show application logs"
        echo "  stop     - Stop the application"
        echo "  restart  - Restart the application"
        echo "  backup   - Create database backup"
        echo "  cleanup  - Clean up unused Docker resources"
        echo "  update   - Update and redeploy the application"
        exit 1
        ;;
esac

log_success "Operation completed successfully! ✨"
