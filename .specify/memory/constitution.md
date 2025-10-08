# [PROJECT_NAME] Constitution

## Core Principles

### I. Library-First
Every feature starts as a standalone library; Libraries must be self-contained, independently testable, documented; Clear purpose required - no organizational-only libraries

### II. CLI Interface
Every library exposes functionality via CLI; Text in/out protocol: stdin/args → stdout, errors → stderr; Support JSON + human-readable formats

### III. Test-First (NON-NEGOTIABLE)
TDD mandatory: Tests written → User approved → Tests fail → Then implement; Red-Green-Refactor cycle strictly enforced

### IV. Integration Testing
Focus areas requiring integration tests: New library contract tests, Contract changes, Inter-service communication, Shared schemas

### V. Observability
Text I/O ensures debuggability; Structured logging required

### VI. Versioning & Breaking Changes
MAJOR.MINOR.BUILD format; Semantic versioning required

### VII. Simplicity
Start simple, YAGNI principles

## Development Workflow

### Technology Stack Requirements
- Backend: Python 3.11 with FastAPI
- Frontend: Swift 5.9 for iOS
- Database: PostgreSQL
- Testing: pytest, pytest-asyncio for backend, XCTest for iOS
- Storage: Core Data for iOS, PostgreSQL for backend

### Security Requirements
- All data transmission must be encrypted using TLS 1.3
- Passwords must be hashed using bcrypt with 12 rounds
- Authentication must use JWT tokens with 24-hour expiration
- Input validation must be strict and comprehensive

### Performance Standards
- Response time: <200ms p95
- Memory usage: <100MB
- Offline capability required for iOS app

### Deployment Policies
- All deployments must pass automated tests
- CI/CD pipeline required for all branches
- Production deployments must be tagged with semantic versioning

## Governance

All PRs/reviews must verify compliance; Complexity must be justified; Use [GUIDANCE_FILE] for runtime development guidance

**Version**: 2.1.1 | **Ratified**: 2025-06-13 | **Last Amended**: 2025-10-07