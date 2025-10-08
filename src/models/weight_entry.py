from datetime import datetime
from typing import Optional
from uuid import UUID, uuid4

from pydantic import BaseModel, Field


class WeightEntryBase(BaseModel):
    weight_value: float
    weight_unit: str
    timestamp: datetime


class WeightEntryCreate(WeightEntryBase):
    pass


class WeightEntry(WeightEntryBase):
    id: UUID = Field(default_factory=uuid4)
    user_id: UUID

    class Config:
        from_attributes = True
