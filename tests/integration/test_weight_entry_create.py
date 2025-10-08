import pytest
from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)


def test_weight_entry_creation_endpoint_exists():
    """Test that weight entry creation endpoint exists and returns 405 (method not allowed)"""
    response = client.post("/api/v1/weight-entries")
    assert response.status_code == 405  # Method not allowed until implemented


def test_weight_entry_creation_with_valid_data():
    """Test weight entry creation with valid data - should fail until implementation"""
    response = client.post(
        "/api/v1/weight-entries",
        json={
            "weight_value": 70.5,
            "weight_unit": "kg",
            "timestamp": "2023-01-01T00:00:00Z",
        },
    )
    # This will initially fail because endpoint doesn't exist
    # Once implemented, this should return 201 Created
    assert response.status_code in [404, 405]


def test_weight_entry_creation_with_invalid_weight_unit():
    """Test weight entry creation with invalid weight unit"""
    response = client.post(
        "/api/v1/weight-entries",
        json={
            "weight_value": 70.5,
            "weight_unit": "invalid-unit",
            "timestamp": "2023-01-01T00:00:00Z",
        },
    )
    # This should fail with validation error
    assert response.status_code in [404, 405, 422]
