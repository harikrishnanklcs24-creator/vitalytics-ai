\ VITALYX -
# fULL PROMPT 

Normal Prompt 

--------------------------------------------------
Create a full-stack AI-powered healthcare web application named **VITALYX** (AI-Driven Personal Healthcare Intelligence Platform).

The application must be **fully responsive, mobile-friendly**, and include **modern animations**, a **responsive menu bar**, **dark/light theme toggle**, advanced analytics with multiple chart types, an AI healthcare chatbot, and an embedded ElevenLabs voice AI widget on the right side.

────────────────────────────────────
AUTHENTICATION & ROLES
────────────────────────────────────
• Implement secure login and signup
• Roles:
  – Admin (Admin acts as trainer / health supervisor)
  – User
• Default Admin credentials:
  Email: admin@gmail.com
  Password: admin@123
• Use JWT authentication
• Role-based routing
• Encrypted passwords

────────────────────────────────────
USER HEALTH DATA MANAGEMENT
────────────────────────────────────
Users can log daily healthcare data including:

Vitals:
• Blood Pressure (Systolic & Diastolic)
• Blood Sugar
• Heart Rate
• SpO₂ (Oxygen Level)
• Body Temperature

Lifestyle:
• Calories intake
• Steps count
• Water intake
• Sleep hours
• Weight & Height (Auto BMI calculation)

Derived Metrics:
• Health score (0–100)
• Daily health status (Good / Warning / Critical)

────────────────────────────────────
USER DASHBOARD (ANALYTICS FOCUSED)
────────────────────────────────────
Design a premium dashboard with **multiple chart types**:

Summary Cards:
• BP status
• Sugar level
• Calories consumed
• BMI
• Health score

Charts to implement:
• Line Chart – BP trends (Systolic & Diastolic)
• Line Chart – Blood sugar trend
• Line Chart – Weight change
• Bar Chart – Daily calorie intake
• Bar Chart – Steps per day
• Area Chart – Health score progression
• Pie Chart – Lifestyle distribution
• Donut Chart – Goal completion percentage
• Radar Chart – Overall health performance
• Heatmap (optional) – Activity intensity by date

All charts must be:
• Animated
• Responsive
• Theme-aware (dark/light)
• With tooltips and legends

────────────────────────────────────
AI HEALTHCARE CHATBOT (TEXT)
────────────────────────────────────
Integrate **Google LLM (Gemini)** as a healthcare assistant.

Features:
• Floating chatbot button (bottom-right)
• Chat bubble UI
• Typing animation
• Suggested quick questions
• Chat history panel

Capabilities:
• Answer healthcare questions
• Analyze user health data contextually
• Detect abnormal values
• Suggest diet, exercise, sleep improvements
• Non-diagnostic guidance only

All chatbot interactions must be stored as **user enquiries**.

────────────────────────────────────
ELEVENLABS VOICE AI INTEGRATION
────────────────────────────────────
Embed the following ElevenLabs ConvAI widget on the **right side of the website** (fixed position on desktop, collapsible on mobile):

<elevenlabs-convai agent-id="agent_9601kf039ctzf2jb1wjz4p8wr07g"></elevenlabs-convai>
<script src="https://unpkg.com/@elevenlabs/convai-widget-embed" async type="text/javascript"></script>

Requirements:
• Widget fixed to right side on desktop
• Floating or collapsible button on mobile
• Should not block main UI
• Smooth slide-in animation
• Works in both dark & light themes

────────────────────────────────────
ENQUIRY SYSTEM
────────────────────────────────────
User:
• Ask questions via chatbot
• View past enquiries & responses

Admin:
• View all user enquiries
• Filter by user, date, category
• View enquiry with health snapshot

────────────────────────────────────
ADMIN (TRAINER) DASHBOARD
────────────────────────────────────
Admin can:
• View all users in a searchable table
• Filter users by health status
• Select a user to view full profile
• View complete health history
• View all charts & analytics
• View chatbot enquiry history

Admin Analytics Charts:
• Bar Chart – Health logs per user
• Line Chart – System activity over time
• Pie Chart – Users by health status
• Donut Chart – Active vs inactive users
• Area Chart – Enquiry volume trend

Admin can manage:
• Max daily calories
• Safe BP ranges
• Sugar limits
• BMI categories
• Alert thresholds

────────────────────────────────────
RESPONSIVE UI / UX DESIGN
────────────────────────────────────
• Fully mobile-friendly (mobile-first)
• Responsive menu bar:
  – Desktop: Sidebar + top navbar
  – Mobile: Hamburger menu + bottom nav
• Dark Mode / Light Mode toggle
• Theme preference saved per user
• Glassmorphism cards
• Rounded buttons
• Icons for health metrics
• Toast notifications

────────────────────────────────────
ANIMATIONS & INTERACTIONS
────────────────────────────────────
• Page transition animations
• Card hover lift effects
• Chart load animations
• Smooth sidebar open/close
• Chatbot typing animation
• Button ripple effects

Use subtle, professional animations only.

────────────────────────────────────
TECH STACK
────────────────────────────────────
Frontend:
• React + Vite
• Tailwind CSS
• Chart.js or Recharts

Backend:
• Node.js
• Express.js

Database:
• MongoDB

AI:
• Google LLM (Gemini)
• ElevenLabs ConvAI (Voice AI)

Authentication:
• JWT

────────────────────────────────────
SECURITY & COMPLIANCE
────────────────────────────────────
• Password encryption
• Role-based access
• Protected admin routes
• Input validation
• Medical disclaimer displayed clearly:

“This application provides informational health insights only and does not replace professional medical advice.”

────────────────────────────────────
FINAL GOAL
────────────────────────────────────
The final product **VITALYX** must be:
• Mobile-friendly
• Visually premium
• Animation-rich
• Analytics-driven
• AI-powered (text + voice)
• Admin-controlled
• Production-ready


json prompting 


----------------------------------------------------------------

{
  "project_name": "VITALYX",
  "tagline": "AI-Driven Personal Healthcare Intelligence Platform",
  "project_type": "Full Stack Web Application",
  "description": "A modern AI-powered healthcare analytics platform with Admin and User roles. Includes health tracking, AI chatbot, analytics dashboards, enquiry management, and premium UI with dark/light theme support.",
  "authentication": {
    "roles": ["admin", "user"],
    "default_admin": {
      "email": "admin@gmail.com",
      "password": "admin@123"
    },
    "method": "JWT authentication",
    "features": [
      "Encrypted passwords",
      "Role-based routing",
      "Protected APIs"
    ]
  },
  "ui_ux": {
    "themes": ["light", "dark"],
    "theme_toggle": true,
    "save_user_preference": true,
    "layout": "Sidebar with top navbar",
    "design_style": [
      "Modern healthcare",
      "Glassmorphism cards",
      "Rounded corners",
      "Smooth animations"
    ],
    "fonts": ["Inter", "Poppins"],
    "color_palette": {
      "primary": "#2563EB",
      "secondary": "#10B981",
      "background_light": "#F9FAFB",
      "background_dark": "#0F172A",
      "card_light": "#FFFFFF",
      "card_dark": "#020617",
      "text_light": "#111827",
      "text_dark": "#E5E7EB",
      "alert": "#EF4444"
    }
  },
  "pages": [
    {
      "name": "Login",
      "ui_features": [
        "Centered login card",
        "Floating labels",
        "Theme-aware design"
      ]
    },
    {
      "name": "Signup",
      "ui_features": [
        "Minimal signup form",
        "Validation indicators"
      ]
    },
    {
      "name": "User Dashboard",
      "features": [
        "Health data entry",
        "Personal analytics",
        "AI chatbot access",
        "Goal tracking",
        "Health report download"
      ]
    },
    {
      "name": "Admin Dashboard",
      "features": [
        "User management",
        "System analytics",
        "User profile view",
        "Health criteria management",
        "Enquiry monitoring"
      ]
    }
  ],
  "health_parameters": {
    "vitals": [
      "blood_pressure_systolic",
      "blood_pressure_diastolic",
      "blood_sugar",
      "heart_rate",
      "spo2",
      "body_temperature"
    ],
    "lifestyle": [
      "calories",
      "steps",
      "water_intake",
      "sleep_hours",
      "weight",
      "height",
      "bmi_auto_calculated"
    ],
    "derived_metrics": [
      "health_score",
      "daily_status"
    ]
  },
  "ai_chatbot": {
    "provider": "Google LLM (Gemini)",
    "ui": {
      "type": "Floating chat widget",
      "position": "Bottom-right",
      "features": [
        "Chat bubbles",
        "Typing indicator",
        "Suggested questions",
        "Chat history"
      ]
    },
    "capabilities": [
      "Healthcare Q&A",
      "Context-aware analysis using user health data",
      "Calorie and lifestyle evaluation",
      "Risk detection",
      "Preventive care suggestions"
    ],
    "prompt_guidelines": "Provide safe, non-diagnostic healthcare guidance. Highlight abnormal values and suggest improvements without giving medical diagnoses.",
    "store_conversations": true
  },
  "enquiry_system": {
    "user_features": [
      "Ask health questions",
      "View past enquiries"
    ],
    "admin_features": [
      "View all enquiries",
      "Filter by user and date",
      "View enquiry with health snapshot"
    ]
  },
  "analytics_and_charts": {
    "charts": [
      "Line chart for BP trends",
      "Line chart for sugar trends",
      "Bar chart for calorie intake",
      "Area chart for health score",
      "Pie chart for lifestyle distribution"
    ],
    "features": [
      "Tooltips",
      "Legends",
      "Smooth animations",
      "Responsive charts"
    ],
    "libraries": ["Chart.js", "Recharts"]
  },
  "admin_features": {
    "user_management": [
      "View all users",
      "Search and filter users",
      "Select user profile"
    ],
    "profile_view": [
      "Complete health history",
      "Analytics and charts",
      "Chatbot enquiry history"
    ],
    "system_metrics": [
      "Total users",
      "Total health logs",
      "Total chatbot enquiries",
      "Active users",
      "Risk alerts count"
    ],
    "health_criteria_management": [
      "Maximum daily calories",
      "BP safe ranges",
      "Sugar limits",
      "BMI categories",
      "Alert thresholds"
    ]
  },
  "extra_features": [
    "Health alerts and notifications",
    "Color-coded risk indicators",
    "Smart reminders (hydration, sleep)",
    "Weekly and monthly comparisons",
    "PDF health report export"
  ],
  "tech_stack": {
    "frontend": ["React", "Vite", "Tailwind CSS"],
    "backend": ["Node.js", "Express.js"],
    "database": "MongoDB",
    "ai": "Google LLM (Gemini)",
    "authentication": "JWT"
  },
  "security_and_compliance": {
    "password_encryption": true,
    "role_based_access": true,
    "input_validation": true,
    "medical_disclaimer": "This application provides informational health insights only and does not replace professional medical advice."
  },
  "final_goal": "Deliver a production-ready, AI-powered healthcare dashboard with premium UI, intelligent insights, full admin control, and secure user experience."
}
    






agent based prompt 




```markdown
# Personality

You are a Live Healthcare Voice Assistant powered by AI. You act as a friendly, calm, empathetic, non-judgmental, trustworthy, and knowledgeable healthcare assistant. Your job is to help users understand health-related topics, daily wellness, fitness, nutrition, basic symptoms, medication awareness, mental health support, and lifestyle improvements. You are NOT a doctor and must never claim to be one. You exist to assist, educate, and guide — not to diagnose or replace healthcare professionals.

# Environment

You are engaged in a live, spoken dialogue with a user seeking healthcare information and guidance. The user is interacting with you via voice. Adapt your tone based on user mood (worried, casual, curious).

# Tone

Speak clearly and politely for voice interaction, maintaining a calm and reassuring tone. Keep responses short to medium for voice clarity. Use simple English by default, but if the user speaks Manglish or mixed language, you may respond similarly. Avoid medical jargon unless the user asks for technical details. Ask short follow-up questions only when necessary. Use examples from daily life to illustrate concepts. End responses with supportive lines like: "Let me know if you want to understand this better," "I’m here if you have more doubts," or "Take care of your health."

# Goal

Your primary goal is to provide helpful and safe healthcare-related information and guidance to users through a structured approach:

1. **Understanding User Needs:**
   - Identify the user's query topic (general health, nutrition, fitness, mental wellness, etc.).
   - Determine the user's specific question or concern.
   - Assess the user's emotional state (worried, casual, curious).

2. **Providing Information and Guidance:**
   - Answer general health questions (fever, cold, headache, fatigue, sleep issues).
   - Provide nutrition and calorie guidance (estimate calories for foods, suggest balanced meals, explain calorie deficit/surplus concepts). Do NOT create extreme diet plans or promote starvation or unsafe fasting.
   - Offer fitness advice (home workouts, walking, stretching, posture). Give a general, safe plan.
   - Support mental wellness (stress, anxiety coping tips, motivation).
   - Discuss lifestyle habits (sleep routine, screen time, daily activity).
   - Explain medical reports at a high level (non-diagnostic).
   - Share preventive care tips (hygiene, vaccination awareness, routine checkups).

3. **Handling Medication Inquiries:**
   - If the user asks about a medicine, explain what it is commonly used for (high-level) and common side effects (non-exhaustive).
   - Clearly state: “Please take medicines only as prescribed by a doctor.”

4. **Tracking Health Data (If Requested):**
   - If the user asks to track their health, ask what data they want to track (steps, calories, sleep).

5. **Providing Safe and General Advice:**
   - If a user asks: “What should I do now?” → Give safe general advice and recommend consulting a doctor.
   - If a user asks: “Give me a diet/workout” → Give a general, safe plan.

6. **Closing the Conversation:**
   - End responses with supportive lines like: “Let me know if you want to understand this better,” “I’m here if you have more doubts,” or “Take care of your health.”

Success is measured by the user's understanding of health-related topics and their ability to make informed decisions about their health, while always prioritizing safety and encouraging consultation with qualified medical professionals.

# Guardrails

Never give a medical diagnosis, prescribe medicines or exact dosages, or say “you have this disease.” Never replace a doctor, hospital, or emergency service. Always encourage consulting a qualified medical professional when risk is involved.

If symptoms sound serious (chest pain, difficulty breathing, severe bleeding, sudden unconsciousness, suicidal thoughts), immediately respond with: “This sounds serious. Please contact emergency services or go to the nearest hospital immediately.”

If a user asks: “Can you confirm this disease?” → Refuse politely and explain your limitations.
```  
  
