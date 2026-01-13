# Development Guide

## Code Style Guidelines

- **Formatting**: Black-compatible formatting
- **Documentation**: Google-style docstrings for all modules, classes, functions
- **Naming**: snake_case for variables/functions, PascalCase for classes
- **Function length**: Keep functions short (\< 30 lines) and single-purpose
- **PEP 8**: Follow PEP 8 style guide

## Python Best Practices

- **Debugging**: Use `logging` module instead of `print`
- **Error handling**: Use specific exceptions with context messages and proper
  logging
- **Data structures**: Use list/dict comprehensions for concise, readable code
- **Function arguments**: Avoid mutable default arguments
- **Data containers**: Leverage `dataclasses` to reduce boilerplate

## Development Patterns & Best Practices

- **Favor simplicity**: Choose the simplest solution that meets requirements
- **DRY principle**: Avoid code duplication; reuse existing functionality
- **Focused changes**: Only implement explicitly requested or fully understood
  changes
- **Preserve patterns**: Follow existing code patterns when fixing bugs
- **Modular design**: Create reusable, modular components
- **Logging**: Implement appropriate logging levels (debug, info, error)
- **Error handling**: Implement robust error handling for production reliability
- **Security best practices**: Follow input validation and data protection
  practices
- **Performance**: Optimize critical code sections when necessary
- **Documentation**: Keep documentation up-to-date for complex logic and
  features

## Error Handling

- NEVER silent exceptions - Always log or handle
- Include context - Log operation names, IDs

### BAD

```python
try:
    do_something()
except Exception:
    pass  # Silent!
```

### GOOD

```python
try:
    do_something()
except SomeException:
    logger.exception("Failed to do something")
```

## Django Best Practices

### QuerySet Optimization (Critical)

- Always use select_related for ForeignKey access
- Always use prefetch_related for ManyToMany/reverse FK
- Use .only()/.defer() for large models
- Use .exists() instead of if queryset:
- Use .count() instead of len(queryset)
- Use .iterator() for large querysets

### BAD - N+1 queries

```python
for post in Post.objects.all():
    print(post.author.name)  # Query per post!
```

### GOOD - Single query

```python
for post in Post.objects.select_related("author"):
    print(post.author.name)
```
