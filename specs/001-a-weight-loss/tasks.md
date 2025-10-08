# Tasks: Weight Loss Tracker

**Input**: Design documents from `/specs/001-a-weight-loss/`
**Prerequisites**: plan.md (required), research.md, data-model.md, contracts/

## Execution Flow (main)
```
1. Load plan.md from feature directory
   → If not found: ERROR "No implementation plan found"
   → Extract: tech stack, libraries, structure
2. Load optional design documents:
   → data-model.md: Extract entities → model tasks
   → contracts/: Each file → contract test task
   → research.md: Extract decisions → setup tasks
3. Generate tasks by category:
   → Setup: project init, dependencies, linting
   → Tests: contract tests, integration tests
   → Core: models, services, CLI commands
   → Integration: DB, middleware, logging
   → Polish: unit tests, performance, docs
4. Apply task rules:
   → Different files = mark [P] for parallel
   → Same file = sequential (no [P])
   → Tests before implementation (TDD)
5. Number tasks sequentially (T001, T002...)
6. Generate dependency graph
7. Create parallel execution examples
8. Validate task completeness:
   → All contracts have tests?
   → All entities have models?
   → All endpoints implemented?
9. Return: SUCCESS (tasks ready for execution)
```

## Format: `[ID] [P?] Description`
- **[P]**: Can run in parallel (different files, no dependencies)
- Include exact file paths in descriptions

## Phase 3.1: Setup
- [ ] T001 Create project structure per implementation plan
- [ ] T002 Initialize Python project with FastAPI dependencies
- [ ] T003 [P] Configure linting and formatting tools

## Phase 3.2: Tests First (TDD) ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These tests MUST be written and MUST FAIL before ANY implementation**
- [ ] T004 [P] Integration test user registration in tests/integration/test_user_registration.py
- [ ] T005 [P] Integration test weight entry creation in tests/integration/test_weight_entry_create.py
- [ ] T006 [P] Integration test goal setting in tests/integration/test_goal_setting.py
- [ ] T007 [P] Integration test notification sending in tests/integration/test_notification_sending.py

## Phase 3.3: Core Implementation (ONLY after tests are failing)
- [ ] T008 [P] User model in src/models/user.py
- [ ] T009 [P] WeightEntry model in src/models/weight_entry.py
- [ ] T010 [P] Goal model in src/models/goal.py
- [ ] T011 [P] Notification model in src/models/notification.py
- [ ] T012 [P] UserService CRUD in src/services/user_service.py
- [ ] T013 [P] WeightEntryService CRUD in src/services/weight_entry_service.py
- [ ] T014 [P] GoalService CRUD in src/services/goal_service.py
- [ ] T015 [P] NotificationService CRUD in src/services/notification_service.py
- [ ] T016 [P] User authentication endpoints in src/api/auth.py
- [ ] T017 [P] Weight entry endpoints in src/api/weight_entries.py
- [ ] T018 [P] Goal endpoints in src/api/goals.py
- [ ] T019 [P] Notification endpoints in src/api/notifications.py
- [ ] T020 [P] Dashboard endpoints in src/api/dashboard.py
- [ ] T021 Input validation
- [ ] T022 Error handling and logging

## Phase 3.4: Integration
- [ ] T023 Connect services to database
- [ ] T024 Auth middleware
- [ ] T025 Request/response logging
- [ ] T026 CORS and security headers

## Phase 3.5: Polish
- [ ] T027 [P] Unit tests for validation in tests/unit/test_validation.py
- [ ] T028 Performance tests (<200ms)
- [ ] T029 [P] Update docs/api.md
- [ ] T030 Remove duplication
- [ ] T031 Run manual-testing.md

## Dependencies
- Tests (T004-T007) before implementation (T008-T022)
- T008 blocks T012, T023
- T009 blocks T013, T023
- T010 blocks T014, T023
- T011 blocks T015, T023
- T016 blocks T024
- T024 blocks T026
- Implementation before polish (T027-T031)

## Parallel Example
```
# Launch T004-T007 together:
Task: "Integration test user registration in tests/integration/test_user_registration.py"
Task: "Integration test weight entry creation in tests/integration/test_weight_entry_create.py"
Task: "Integration test goal setting in tests/integration/test_goal_setting.py"
Task: "Integration test notification sending in tests/integration/test_notification_sending.py"
```

## Notes
- [P] tasks = different files, no dependencies
- Verify tests fail before implementing
- Commit after each task
- Avoid: vague tasks, same file conflicts

## Task Generation Rules
*Applied during main() execution*

1. **From Contracts**:
   - Each contract file → contract test task [P]
   - Each endpoint → implementation task
   
2. **From Data Model**:
   - Each entity → model creation task [P]
   - Relationships → service layer tasks
   
3. **From User Stories**:
   - Each story → integration test [P]
   - Quickstart scenarios → validation tasks

4. **Ordering**:
   - Setup → Tests → Models → Services → Endpoints → Polish
   - Dependencies block parallel execution

## Validation Checklist
*GATE: Checked by main() before returning*

- [ ] All contracts have corresponding tests
- [ ] All entities have model tasks
- [ ] All tests come before implementation
- [ ] Parallel tasks truly independent
- [ ] Each task specifies exact file path
- [ ] No task modifies same file as another [P] task