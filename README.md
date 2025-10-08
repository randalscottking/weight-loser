# Weight Loss Tracker Application

A weight loss tracking application with goals, charts, and milestone notifications.

## Project Structure

```
.
├── README.md
├── requirements.txt
├── pyproject.toml
├── src/
│   ├── main.py
│   ├── models/
│   │   ├── user.py
│   │   ├── weight_entry.py
│   │   ├── goal.py
│   │   └── notification.py
│   ├── services/
│   │   ├── user_service.py
│   │   ├── weight_entry_service.py
│   │   ├── goal_service.py
│   │   └── notification_service.py
│   └── api/
│       ├── auth.py
│       ├── weight_entries.py
│       ├── goals.py
│       ├── notifications.py
│       └── dashboard.py
└── tests/
    └── integration/
        ├── test_user_registration.py
        ├── test_weight_entry_create.py
        ├── test_goal_setting.py
        └── test_notification_sending.py
```

## Features

- User registration and authentication
- Weight entry tracking with timestamps
- Goal setting for weight loss/maintenance/gain
- Milestone notifications
- Dashboard with statistics and charts

## Development

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Run the application:
   ```bash
   uvicorn src.main:app --reload
   ```

3. Run tests:
   ```bash
   pytest tests/
   ```

## API Endpoints

- `/api/v1/auth/register` - User registration
- `/api/v1/auth/login` - User login
- `/api/v1/weight-entries` - Weight entry management
- `/api/v1/goals` - Goal management
- `/api/v1/notifications` - Notification management
- `/api/v1/dashboard` - Dashboard endpoints

## Implementation Status

This project implements the core structure and components as defined in the specification. Individual endpoints and services are marked as not implemented and will be developed in subsequent tasks.