from fastapi import APIRouter, HTTPException, status

from src.models.goal import Goal, GoalCreate
from src.services.goal_service import GoalService

router = APIRouter()
goal_service = GoalService()


@router.post("/", response_model=Goal)
async def create_goal(goal: GoalCreate):
    """
    Create a new goal
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.get("/{goal_id}", response_model=Goal)
async def get_goal(goal_id: str):
    """
    Get a goal by ID
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.put("/{goal_id}", response_model=Goal)
async def update_goal(goal_id: str, goal: dict):
    """
    Update a goal
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.delete("/{goal_id}")
async def delete_goal(goal_id: str):
    """
    Delete a goal
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )
