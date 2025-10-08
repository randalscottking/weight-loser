from fastapi import APIRouter, HTTPException, status

from src.models.user import User, UserCreate
from src.services.user_service import UserService

router = APIRouter()
user_service = UserService()


@router.post("/register", response_model=User)
async def register_user(user: UserCreate):
    """
    Register a new user
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.post("/login")
async def login_user(email: str, password: str):
    """
    Login a user
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )
