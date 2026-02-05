# Core Module

This directory contains shared code used across all features in the application.

## Directory Structure

```
core/
├── base/           # Base classes for views and view models
├── config/         # Application configuration (API, theme, etc.)
├── constants/      # Application-wide constants
├── error/          # Error handling and Failure types
├── network/        # Network layer configuration (Dio)
├── providers/      # Core Riverpod providers
├── services/       # Core services (API, storage, location)
├── theme/          # Application theme configuration
├── utils/          # Utility functions and helpers
├── values/         # Application values (colors, assets, constants)
└── widgets/        # Shared UI widgets
```

## Architecture Principles

### Dependency Direction
- Core modules should NOT depend on feature modules
- Core provides infrastructure and utilities for features
- Features depend on core, not the other way around

### What Belongs in Core?

**YES - Include in Core:**
- Network configuration (Dio setup, interceptors)
- Error types and error handling utilities
- Common data models used across features
- Shared UI components (buttons, cards, loading indicators)
- Application-wide services (storage, logging)
- Theme and styling configuration
- Utility functions (date formatting, validation)

**NO - Keep in Features:**
- Business logic specific to a feature
- Feature-specific data models
- Feature-specific UI screens
- Feature-specific repositories

## Key Components

### Error Handling
- `error/failure.dart` - Sealed class hierarchy for type-safe error handling
- Uses fpdart's Either type for functional error handling

### Network Layer
- `network/dio_provider.dart` - Dio HTTP client configuration
- Includes interceptors for authentication, logging, and error handling

### Services
- `services/api_service.dart` - Base API service with common HTTP methods
- `services/storage_service.dart` - Local storage abstraction
- `services/location_service.dart` - Location services wrapper

### Providers
- Core Riverpod providers for dependency injection
- Configuration providers
- Service providers

## Usage Guidelines

1. **Import from core**: Features should import from core using relative imports
2. **No circular dependencies**: Core should never import from features
3. **Keep it generic**: Core code should be reusable across features
4. **Document public APIs**: All public classes and functions should have dartdoc comments
