# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2025-03-18

### Added
- Initial release of PostgreSQL 17 with PostGIS 3.5.2 and TimescaleDB
- Based on official TimescaleDB Alpine image
- GitHub Actions workflow for automated building
- Support for both AMD64 and ARM64 architectures using native GitHub runners
- Docker Compose configuration for easy local development
- PostGIS extension automatically enabled
- Alpine package manager (apk) based installation for smaller image size 