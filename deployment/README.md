# Life Management App - Production Deployment Guide

## 📋 Pre-Deployment Checklist

### Prerequisites
- [ ] Node.js 18+ installed
- [ ] Docker and Docker Compose installed
- [ ] MongoDB Atlas account (for cloud deployment)
- [ ] Domain name (optional)
- [ ] SSL certificate (for HTTPS)

### Environment Setup
1. Copy the backend environment file:
   ```bash
   cp backend/.env.example backend/.env
   ```

2. Update the `.env` file with your production values:
   ```bash
   # Required Settings
   NODE_ENV=production
   JWT_SECRET=your-super-secure-jwt-secret-minimum-32-characters
   MONGODB_URI_PROD=mongodb+srv://username:password@cluster.mongodb.net/lifemanagement
   CLIENT_URL=https://yourdomain.com
   API_URL=https://yourdomain.com
   
   # Optional Settings
   EMAIL_SERVICE=gmail
   EMAIL_USER=your-email@gmail.com
   EMAIL_PASS=your-app-password
   ```

## 🚀 Deployment Options

### Option 1: Docker Deployment (Recommended)

#### Local Docker Deployment
1. Navigate to the deployment directory:
   ```bash
   cd deployment
   ```

2. Make the deploy script executable:
   ```bash
   chmod +x deploy.sh
   ```

3. Deploy the application:
   ```bash
   ./deploy.sh deploy
   ```

4. Check application status:
   ```bash
   ./deploy.sh status
   ```

#### Available Commands
- `./deploy.sh deploy` - Build and deploy the application
- `./deploy.sh status` - Show application status
- `./deploy.sh logs` - Show application logs
- `./deploy.sh stop` - Stop the application
- `./deploy.sh restart` - Restart the application
- `./deploy.sh backup` - Create database backup
- `./deploy.sh cleanup` - Clean up unused Docker resources
- `./deploy.sh update` - Update and redeploy the application

### Option 2: Cloud Deployment

#### Heroku Deployment
1. Install Heroku CLI
2. Login to Heroku:
   ```bash
   heroku login
   ```

3. Create a new Heroku app:
   ```bash
   heroku create your-app-name
   ```

4. Set environment variables:
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set JWT_SECRET=your-jwt-secret
   heroku config:set MONGODB_URI_PROD=your-mongodb-uri
   ```

5. Deploy:
   ```bash
   git push heroku master
   ```

#### Vercel Deployment (Frontend + Serverless Backend)
1. Install Vercel CLI:
   ```bash
   npm install -g vercel
   ```

2. Login to Vercel:
   ```bash
   vercel login
   ```

3. Deploy:
   ```bash
   vercel --prod
   ```

4. Set environment variables in Vercel dashboard:
   - `MONGODB_URI_PROD`
   - `JWT_SECRET`
   - `CLIENT_URL`
   - `API_URL`

#### Netlify Deployment (Frontend Only)
1. Install Netlify CLI:
   ```bash
   npm install -g netlify-cli
   ```

2. Build the frontend:
   ```bash
   cd frontend
   npm run build
   ```

3. Deploy:
   ```bash
   netlify deploy --prod --dir=build
   ```

### Option 3: VPS Deployment

#### Setup on Ubuntu/Debian VPS
1. Update the system:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. Install Docker:
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh
   sh get-docker.sh
   sudo usermod -aG docker $USER
   ```

3. Install Docker Compose:
   ```bash
   sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

4. Clone your repository:
   ```bash
   git clone https://github.com/yourusername/life-management-app.git
   cd life-management-app
   ```

5. Follow Docker deployment steps above.

## 🔒 Security Considerations

### Environment Variables
- Never commit `.env` files to version control
- Use strong, unique JWT secrets (minimum 32 characters)
- Use environment-specific database URLs
- Rotate secrets regularly

### MongoDB Security
- Use MongoDB Atlas with IP whitelisting
- Enable authentication
- Use strong passwords
- Enable encryption at rest

### HTTPS Setup
- Use Let's Encrypt for free SSL certificates
- Configure proper CORS origins
- Use secure headers (already configured in the app)

### Docker Security
- Run containers as non-root users (already configured)
- Keep base images updated
- Use multi-stage builds to minimize image size
- Scan images for vulnerabilities

## 📊 Monitoring and Maintenance

### Health Checks
- Application health endpoint: `GET /health`
- Database connectivity checks
- Docker health checks configured

### Logging
- Application logs: `./deploy.sh logs`
- Centralized logging with Docker
- Error tracking and monitoring

### Backups
- Database backups: `./deploy.sh backup`
- Regular automated backups recommended
- Test restore procedures

### Updates
- Regular dependency updates
- Security patches
- Feature deployments: `./deploy.sh update`

## 🚨 Troubleshooting

### Common Issues

#### 1. Database Connection Errors
- Check MongoDB URI format
- Verify network connectivity
- Check firewall rules

#### 2. Docker Issues
- Ensure Docker is running
- Check available disk space
- Verify port availability

#### 3. Build Failures
- Clear Docker cache: `docker system prune -a`
- Check Node.js version compatibility
- Verify environment variables

### Useful Commands
```bash
# Check Docker container logs
docker logs life-management-app

# Access MongoDB container
docker exec -it life-management-mongodb mongosh

# Check application processes
docker-compose ps

# Monitor resource usage
docker stats
```

## 📈 Performance Optimization

### Frontend Optimization
- Code splitting (already implemented)
- Lazy loading of components
- Asset optimization
- CDN usage for static files

### Backend Optimization
- Database indexing
- Connection pooling
- Caching strategies
- Rate limiting (configured)

### Infrastructure Optimization
- Load balancing for high traffic
- Container orchestration (Kubernetes)
- Auto-scaling configurations
- Performance monitoring

## 📞 Support

For deployment issues or questions:
1. Check this documentation
2. Review application logs
3. Check GitHub Issues
4. Contact support team

## 📝 Changelog

### v1.0.0 - Initial Production Release
- Docker containerization
- Multi-platform deployment support
- Security hardening
- Health checks and monitoring
- Automated deployment scripts

---

**Good luck with your production deployment! 🚀**
