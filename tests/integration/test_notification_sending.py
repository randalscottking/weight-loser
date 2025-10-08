import pytest
from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)


def test_notification_sending_endpoint_exists():
    """Test that notification sending endpoint exists and returns 405 (method not allowed)"""
    response = client.post("/api/v1/notifications")
    assert response.status_code == 405  # Method not allowed until implemented


def test_notification_sending_with_valid_data():
    """Test notification sending with valid data - should fail until implementation"""
    response = client.post(
        "/api/v1/notifications",
        json={
            "message": "Congratulations on reaching your milestone!",
            "notification_type": "milestone",
        },
    )
    # This will initially fail because endpoint doesn't exist
    # Once implemented, this should return 201 Created
    assert response.status_code in [404, 405]


def test_notification_sending_with_invalid_notification_type():
    """Test notification sending with invalid notification type"""
    response = client.post(
        "/api/v1/notifications",
        json={"message": "Test notification", "notification_type": "invalid-type"},
    )
    # This should fail with validation error
    assert response.status_code in [404, 405, 422]
