from fastapi import APIRouter, HTTPException, status

from src.models.weight_entry import WeightEntry, WeightEntryCreate
from src.services.weight_entry_service import WeightEntryService

router = APIRouter()
weight_entry_service = WeightEntryService()


@router.post("/", response_model=WeightEntry)
async def create_weight_entry(weight_entry: WeightEntryCreate):
    """
    Create a new weight entry
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.get("/{weight_entry_id}", response_model=WeightEntry)
async def get_weight_entry(weight_entry_id: str):
    """
    Get a weight entry by ID
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.put("/{weight_entry_id}", response_model=WeightEntry)
async def update_weight_entry(weight_entry_id: str, weight_entry: dict):
    """
    Update a weight entry
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.delete("/{weight_entry_id}")
async def delete_weight_entry(weight_entry_id: str):
    """
    Delete a weight entry
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )
