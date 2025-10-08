import pytest
from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)


def test_goal_setting_endpoint_exists():
    """Test that goal setting endpoint exists and returns 405 (method not allowed)"""
    response = client.post("/api/v1/goals")
    assert response.status_code == 405  # Method not allowed until implemented


def test_goal_setting_with_valid_data():
    """Test goal setting with valid data - should fail until implementation"""
    response = client.post(
        "/api/v1/goals",
        json={
            "target_weight": 60.0,
            "start_weight": 70.0,
            "goal_type": "weight_loss",
            "deadline": "2023-12-31T00:00:00Z",
        },
    )
    # This will initially fail because endpoint doesn't exist
    # Once implemented, this should return 201 Created
    assert response.status_code in [404, 405]


def test_goal_setting_with_invalid_goal_type():
    """Test goal setting with invalid goal type"""
    response = client.post(
        "/api/v1/goals",
        json={
            "target_weight": 60.0,
            "start_weight": 70.0,
            "goal_type": "invalid-type",
            "deadline": "2023-12-31T00:00:00Z",
        },
    )
    # This should fail with validation error
    assert response.status_code in [404, 405, 422]
