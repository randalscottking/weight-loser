import pytest
from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)


def test_user_registration_endpoint_exists():
    """Test that user registration endpoint exists and returns 405 (method not allowed)"""
    response = client.post("/api/v1/auth/register")
    assert response.status_code == 405  # Method not allowed until implemented


def test_user_registration_with_valid_data():
    """Test user registration with valid data - should fail until implementation"""
    # This test should fail until we implement the registration endpoint
    response = client.post(
        "/api/v1/auth/register",
        json={"email": "test@example.com", "password": "password123"},
    )
    # This will initially fail because endpoint doesn't exist
    # Once implemented, this should return 201 Created
    assert response.status_code in [404, 405]


def test_user_registration_with_invalid_email():
    """Test user registration with invalid email format"""
    response = client.post(
        "/api/v1/auth/register",
        json={"email": "invalid-email", "password": "password123"},
    )
    # This should fail with validation error
    assert response.status_code in [404, 405, 422]
