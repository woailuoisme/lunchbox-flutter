# Shared Module

This directory contains code that is shared across multiple features but is not core infrastructure.

## Directory Structure

```
shared/
├── models/         # Shared data models used by multiple features
├── services/       # Shared services used by multiple features
└── widgets/        # Shared UI widgets used by multiple features
```

## Difference Between Core and Shared

### Core
- Infrastructure and foundational code
- Network configuration, error handling, base classes
- Should be stable and rarely change
- No business logic

### Shared
- Business-related code used by multiple features
- Can contain business logic that's common across features
- More likely to change as features evolve
- Examples: common data models, shared business services

## What Belongs in Shared?

**YES - Include in Shared:**
- Data models used by 2+ features (e.g., User, Location)
- Business services used by 2+ features
- Complex widgets used by 2+ features
- Common business logic utilities

**NO - Keep in Features:**
- Code used by only one feature
- Feature-specific business logic
- Feature-specific UI screens

## Usage Guidelines

1. **Shared vs Feature**: If code is used by only one feature, keep it in that feature
2. **Shared vs Core**: If code is infrastructure, put it in core; if it's business logic, put it in shared
3. **Refactor when needed**: Start in a feature, move to shared when reused
4. **Document dependencies**: Clearly document which features use shared code
