#!/usr/bin/env python3
"""
Simple test runner to verify the project structure is set up correctly
"""

import os
import sys


def test_project_setup():
    """Test that all required files are in place"""
    required_files = [
        "requirements.txt",
        "pyproject.toml",
        "src/main.py",
        "src/models/user.py",
        "src/models/weight_entry.py",
        "src/models/goal.py",
        "src/models/notification.py",
        "src/services/user_service.py",
        "src/services/weight_entry_service.py",
        "src/services/goal_service.py",
        "src/services/notification_service.py",
        "src/api/auth.py",
        "src/api/weight_entries.py",
        "src/api/goals.py",
        "src/api/notifications.py",
        "src/api/dashboard.py",
        "tests/integration/test_user_registration.py",
        "tests/integration/test_weight_entry_create.py",
        "tests/integration/test_goal_setting.py",
        "tests/integration/test_notification_sending.py",
    ]

    print("Checking project structure...")
    missing_files = []

    for file_path in required_files:
        if not os.path.exists(file_path):
            missing_files.append(file_path)
            print(f"❌ Missing: {file_path}")
        else:
            print(f"✅ Found: {file_path}")

    if missing_files:
        print(f"\n❌ {len(missing_files)} files are missing:")
        for f in missing_files:
            print(f"  - {f}")
        return False
    else:
        print(f"\n✅ All {len(required_files)} required files are present!")
        return True


if __name__ == "__main__":
    success = test_project_setup()
    sys.exit(0 if success else 1)
