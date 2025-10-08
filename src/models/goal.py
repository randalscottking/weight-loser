from datetime import datetime
from typing import Optional
from uuid import UUID, uuid4

from pydantic import BaseModel, Field


class GoalBase(BaseModel):
    target_weight: float
    start_weight: float
    goal_type: str
    deadline: datetime


class GoalCreate(GoalBase):
    pass


class Goal(GoalBase):
    id: UUID = Field(default_factory=uuid4)
    user_id: UUID
    created_at: datetime = Field(default_factory=datetime.utcnow)
    updated_at: datetime = Field(default_factory=datetime.utcnow)
    is_active: bool = True

    class Config:
        from_attributes = True
