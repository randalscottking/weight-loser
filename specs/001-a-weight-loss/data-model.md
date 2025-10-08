# Data Model: Weight Loss Tracker

## Entities

### Weight Entry
Represents a single weight measurement with date/time stamp and value.

**Fields:**
- id: UUID (primary key)
- user_id: UUID (foreign key to User)
- weight_value: Decimal (weight measurement)
- weight_unit: String (e.g., "kg", "lbs")
- timestamp: DateTime (when the measurement was recorded)
- notes: String (optional user notes about the measurement)

**Validation Rules:**
- weight_value must be positive
- weight_unit must be one of: "kg", "lbs", "st"
- timestamp must be a valid datetime
- user_id must reference an existing user

### User
Represents an individual who tracks their weight.

**Fields:**
- id: UUID (primary key)
- email: String (unique identifier)
- password_hash: String (hashed password)
- created_at: DateTime (account creation timestamp)
- updated_at: DateTime (last account update timestamp)
- is_active: Boolean (account status)

**Validation Rules:**
- email must be unique and valid format
- password_hash must be present
- created_at and updated_at must be valid timestamps

### Goal
Represents a user-defined target weight or weight loss objective.

**Fields:**
- id: UUID (primary key)
- user_id: UUID (foreign key to User)
- target_weight: Decimal (desired weight)
- start_weight: Decimal (initial weight)
- goal_type: String (e.g., "weight_loss", "weight_gain", "maintain")
- deadline: DateTime (target completion date)
- created_at: DateTime (goal creation timestamp)
- updated_at: DateTime (last goal update timestamp)
- is_active: Boolean (whether goal is currently active)

**Validation Rules:**
- target_weight must be positive
- start_weight must be positive
- goal_type must be one of: "weight_loss", "weight_gain", "maintain"
- deadline must be a valid datetime in the future
- user_id must reference an existing user

### Notification
Represents a milestone achievement notification sent to a user.

**Fields:**
- id: UUID (primary key)
- user_id: UUID (foreign key to User)
- goal_id: UUID (foreign key to Goal)
- message: String (notification content)
- sent_at: DateTime (when notification was sent)
- is_read: Boolean (whether user has viewed notification)
- notification_type: String (e.g., "milestone", "reminder")

**Validation Rules:**
- message must be present
- sent_at must be a valid datetime
- user_id must reference an existing user
- goal_id must reference an existing goal (if applicable)
- notification_type must be one of: "milestone", "reminder"

## Relationships

- One User can have many Weight Entries
- One User can have many Goals
- One User can have many Notifications
- One Goal can have many Notifications (when milestones are reached)
- One Weight Entry belongs to one User
- One Goal belongs to one User
- One Notification belongs to one User
- One Notification can belong to one Goal (optional)
