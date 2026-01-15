# VITALYX – AI-Powered Healthcare Analytics Platform

## Overview

**VITALYX** is a modern, AI-driven healthcare web application designed to help users track, analyze, and improve their health through data visualization, AI assistance, and admin-level monitoring.  
The platform provides interactive dashboards, health analytics, chatbot support, and voice-based AI interaction, all wrapped in a responsive and visually rich UI.

This project is built using **Lovable**, enabling rapid development through prompts while maintaining full code control.

---

## Core Features

### 1. Authentication & Roles
- Secure login & signup system
- Role-based access control:
  - **Admin** (acts as health supervisor / trainer)
  - **User**
- Default admin credentials:
  - Email: `admin@gmail.com`
  - Password: `admin@123`
- JWT-based authentication
- Protected routes for admin-only access

---

### 2. User Health Data Management
Users can log and manage daily healthcare data such as:
- Blood Pressure (Systolic & Diastolic)
- Blood Sugar
- Heart Rate
- SpO₂ (Oxygen Level)
- Body Temperature
- Calories intake
- Steps count
- Water intake
- Sleep duration
- Height & Weight (BMI auto-calculated)

Derived insights:
- Health Score (0–100)
- Status indicators (Good / Warning / Critical)

---

### 3. User Dashboard & Analytics
A rich analytics dashboard with animated and responsive charts:
- Line charts for BP, sugar, weight trends
- Bar charts for calories and steps
- Area chart for health score progression
- Pie & donut charts for lifestyle and goal completion
- Radar chart for overall health performance

Dashboard includes:
- Summary cards
- Tooltips & legends
- Theme-aware charts (Dark / Light mode)

---

### 4. AI Healthcare Chatbot (Text)
- AI-powered chatbot using **Google LLM (Gemini)**
- Answers healthcare-related questions
- Analyzes user health data contextually
- Provides lifestyle suggestions (non-diagnostic)
- Stores all user enquiries for admin review
- Floating chat UI with typing animation

---

### 5. ElevenLabs Voice AI Integration
- Embedded ElevenLabs ConvAI widget
- Fixed on the right side for desktop
- Collapsible/floating on mobile devices
- Smooth animations and theme compatibility
- Enables voice-based healthcare interaction

---

### 6. Admin (Trainer) Dashboard
Admin capabilities:
- View all registered users
- Filter users by health status
- Access full health history of any user
- View analytics per user
- Monitor chatbot enquiries
- View overall system usage and activity

Admin analytics include:
- User activity charts
- Enquiry trends
- Health status distribution
- Active vs inactive users

---

### 7. Enquiry Management System
- Users can submit health-related questions
- Admin can:
  - View all enquiries
  - Filter by user/date
  - Review health context with each enquiry

---

### 8. UI / UX & Responsiveness
- Fully mobile-friendly (mobile-first design)
- Responsive menu bar:
  - Sidebar + top navbar (desktop)
  - Hamburger menu & bottom navigation (mobile)
- Dark & Light theme toggle
- Smooth animations and transitions
- Modern UI with glassmorphism cards
- Toast notifications and interactive feedback

---

## Tech Stack

### Frontend
- Vite
- React
- TypeScript
- Tailwind CSS
- shadcn-ui
- Chart.js / Recharts

### Backend (Planned / Integrated)
- Node.js
- Express.js
- MongoDB
- JWT Authentication

### AI & Integrations
- Google LLM (Gemini)
- ElevenLabs ConvAI (Voice AI)

---

## Project Setup

### Local Development

```sh
# Clone the repository
git clone <YOUR_GIT_URL>

# Navigate to project directory
cd <YOUR_PROJECT_NAME>

# Install dependencies
npm install

# Start development server
npm run dev
