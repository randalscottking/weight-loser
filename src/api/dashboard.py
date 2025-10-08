from fastapi import APIRouter, HTTPException, status

router = APIRouter()


@router.get("/")
async def get_dashboard():
    """
    Get user dashboard with summary data
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.get("/stats")
async def get_dashboard_stats():
    """
    Get dashboard statistics
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )


@router.get("/chart-data")
async def get_chart_data():
    """
    Get chart data for weight trends
    """
    # This endpoint will be implemented in later tasks
    raise HTTPException(
        status_code=status.HTTP_405_METHOD_NOT_ALLOWED,
        detail="Endpoint not implemented yet",
    )
