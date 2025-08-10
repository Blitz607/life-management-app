# 🚀 Life Management App

**A complete full-stack productivity platform built with React, Node.js, and MongoDB**

## ✨ Live Demo
🌍 **[View Live App](https://your-deployment-url.vercel.app)** *(Will be updated after deployment)*

## 📱 Features

### 🎯 Core Functionality
- **Task Management** - Create, organize, and track tasks with priorities and due dates
- **Habit Tracking** - Build positive habits with streak tracking and progress analytics  
- **Goal Setting** - Set SMART goals and monitor progress with visual charts
- **Finance Tracking** - Track expenses, budgets, and financial goals
- **Health Metrics** - Monitor wellness indicators and health trends
- **Analytics Dashboard** - Comprehensive insights and progress reports

### 🎨 User Experience
- **Dark/Light Mode** - Toggle between themes for optimal viewing
- **Responsive Design** - Works perfectly on desktop, tablet, and mobile
- **Material-UI Design** - Clean, modern interface with smooth animations
- **Real-time Updates** - Live data synchronization across devices
- **Secure Authentication** - JWT-based user accounts and data protection

## 🛠️ Tech Stack

### Frontend
- **React 18** - Modern component-based UI framework
- **Material-UI** - Professional React component library
- **React Router** - Client-side routing and navigation
- **Axios** - HTTP client for API communication
- **Date-fns** - Modern date utility library

### Backend  
- **Node.js** - JavaScript runtime environment
- **Express.js** - Fast, minimal web framework
- **MongoDB** - NoSQL database for flexible data storage
- **Mongoose** - Elegant MongoDB object modeling
- **JWT** - JSON Web Tokens for secure authentication
- **bcryptjs** - Password hashing and security

### Deployment & DevOps
- **Vercel** - Frontend hosting and deployment
- **MongoDB Atlas** - Cloud database hosting
- **Git** - Version control and collaboration
- **Docker** - Containerization (optional)

## 🚀 Quick Start

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local or Atlas)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Blitz607/life-management-app.git
   cd life-management-app
   ```

2. **Install dependencies**
   ```bash
   # Backend dependencies
   cd backend
   npm install
   
   # Frontend dependencies  
   cd ../frontend
   npm install
   ```

3. **Environment Setup**
   ```bash
   # Copy environment template
   cp .env.example .env
   
   # Edit .env with your configuration
   # Add MongoDB connection string
   # Set JWT secret key
   ```

4. **Start Development Servers**
   ```bash
   # Terminal 1: Start backend (from backend directory)
   npm run dev
   
   # Terminal 2: Start frontend (from frontend directory)  
   npm start
   ```

5. **Open Application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000

## 🌐 Deployment

### Vercel Deployment (Recommended)

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push origin master
   ```

2. **Deploy on Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Sign up with GitHub
   - Import your repository
   - Configure environment variables
   - Deploy!

### Environment Variables for Production
```bash
MONGODB_URI=your_mongodb_atlas_connection_string
JWT_SECRET=your_secure_32_character_secret
NODE_ENV=production
REACT_APP_API_URL=https://your-app.vercel.app/api
```

## 📊 Project Structure

```
life-management-app/
├── frontend/                 # React application
│   ├── public/              # Static assets
│   ├── src/
│   │   ├── components/      # Reusable UI components
│   │   ├── pages/          # Main application pages
│   │   ├── services/       # API communication
│   │   ├── utils/          # Helper functions
│   │   └── styles/         # CSS and theme files
│   └── package.json
├── backend/                 # Node.js API server
│   ├── controllers/        # Request handlers
│   ├── models/            # Database schemas
│   ├── routes/            # API route definitions
│   ├── middleware/        # Authentication & validation
│   ├── config/            # Database configuration
│   └── package.json
├── deployment/            # Deployment configurations
├── docs/                 # Documentation
└── README.md
```

## 🔧 API Endpoints

### Authentication
- `POST /api/auth/register` - Create new user account
- `POST /api/auth/login` - User login
- `GET /api/auth/profile` - Get user profile

### Tasks  
- `GET /api/tasks` - Get all tasks
- `POST /api/tasks` - Create new task
- `PUT /api/tasks/:id` - Update task
- `DELETE /api/tasks/:id` - Delete task

### Habits
- `GET /api/habits` - Get user habits
- `POST /api/habits` - Create new habit
- `PUT /api/habits/:id/complete` - Mark habit complete

### Goals & Analytics
- `GET /api/goals` - Get user goals
- `GET /api/analytics` - Get user analytics
- `GET /api/dashboard` - Dashboard statistics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙋‍♂️ Support

- **Issues**: [GitHub Issues](https://github.com/Blitz607/life-management-app/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Blitz607/life-management-app/discussions)
- **Email**: focusflowstudio@mail.com

## 🌟 Show Your Support

If this project helped you, please give it a ⭐ star on GitHub!

---

**Built with ❤️ for productivity enthusiasts worldwide**
