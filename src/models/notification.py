from datetime import datetime
from typing import Optional
from uuid import UUID, uuid4

from pydantic import BaseModel, Field


class NotificationBase(BaseModel):
    message: str
    notification_type: str


class NotificationCreate(NotificationBase):
    pass


class Notification(NotificationBase):
    id: UUID = Field(default_factory=uuid4)
    user_id: UUID
    goal_id: Optional[UUID] = None
    sent_at: datetime = Field(default_factory=datetime.utcnow)
    is_read: bool = False

    class Config:
        from_attributes = True
