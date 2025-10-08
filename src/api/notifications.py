from fastapi import APIRouter, HTTPException, status

from src.models.notification import Notification, NotificationCreate
from src.services.notification_service import NotificationService

router = APIRouter()
notification_service = NotificationService()


@router.post("/", response_model=Notification)
async def create_notification(notification: NotificationCreate):
    """
    Create a new notification
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.get("/{notification_id}", response_model=Notification)
async def get_notification(notification_id: str):
    """
    Get a notification by ID
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.put("/{notification_id}", response_model=Notification)
async def update_notification(notification_id: str, notification: dict):
    """
    Update a notification
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.delete("/{notification_id}")
async def delete_notification(notification_id: str):
    """
    Delete a notification
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )
