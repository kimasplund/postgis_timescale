# Contributing to PostgreSQL with PostGIS and TimescaleDB

First off, thank you for considering contributing to this project! This document provides guidelines and steps for contributing.

## Code of Conduct

By participating in this project, you are expected to uphold a standard of respect and professionalism in all interactions.

## How Can I Contribute?

### Reporting Bugs

- Check if the bug has already been reported in [GitHub Issues](https://github.com/kimasplund/Docker-Images/postgis_timescale/issues)
- If you can't find an issue addressing the problem, [open a new one](https://github.com/kimasplund/Docker-Images/postgis_timescale/issues/new)
- Include a clear title and description
- Provide as much relevant information as possible (Docker version, host OS, etc.)
- Include steps to reproduce the issue

### Suggesting Enhancements

- Open a new issue describing your enhancement suggestion
- Explain why this enhancement would be useful
- Provide a clear and detailed explanation of what you want to happen

### Pull Requests

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Development Workflow

### Local Development

1. Clone the repository
2. Build the Docker image locally:
   ```bash
   docker build -t postgis_timescale:dev .
   ```
3. Test the image with docker-compose:
   ```bash
   docker-compose up -d
   ```
4. Connect to the database and verify extensions:
   ```bash
   docker-compose exec postgres psql -U postgres -c "\dx"
   ```

### Testing

Before submitting a pull request, please test your changes with:
- Both AMD64 and ARM64 architectures if possible
- Different PostgreSQL client applications
- Connection from common programming languages (if relevant)

## Style Guidelines

- Keep the Dockerfile clean and well-commented
- Follow best practices for Docker image building
- Minimize the number of layers in the final image
- Prioritize smaller image sizes when possible

## Questions?

Feel free to open an issue if you have any questions about contributing!

Thank you for your contributions! 