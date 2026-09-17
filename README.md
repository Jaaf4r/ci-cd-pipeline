# C++ CI/CD Pipeline

[![CI-CD](https://github.com/Jaaf4r/ci-cd-pipeline/actions/workflows/ci-cd.yml/badge.svg?branch=main)](https://github.com/Jaaf4r/ci-cd-pipeline/actions/workflows/ci-cd.yml)

A small C++ project that demonstrates a complete GitHub Actions delivery pipeline: build, test, package an artifact, and deploy it to a simulated server.

## What it does

- Compiles a C++ executable named `pp` with strict compiler warnings enabled.
- Runs a shell-based integration test that checks the program output.
- Uploads the built executable as a GitHub Actions artifact.
- On pushes to `main`, downloads that artifact and simulates deployment to a server directory.

## Requirements

- A C++ compiler with C++ support (such as `c++`, GCC, or Clang)
- GNU Make
- Bash

## Run locally

```bash
# Build the executable
make

# Run it
./pp

# Verify its output
make test
```

Expected output:

```text
alo test
```

### Make targets

| Command | Description |
| --- | --- |
| `make` | Compile the project and create `pp`. |
| `make clean` | Remove object files. |
| `make fclean` | Remove object files and the executable. |
| `make re` | Rebuild everything from scratch. |
| `make test` | Build the executable if needed, then verify its output. |

## Automation

The workflows in [`.github/workflows`](.github/workflows) run on GitHub-hosted Ubuntu runners.

| Workflow | Trigger | Actions |
| --- | --- | --- |
| `CI` | Pushes to `main` | Builds the program and runs the test suite. |
| `CI-CD` | Pull requests and pushes to `main` | Builds and tests with GCC and Clang, uploads the GCC-built `pp` artifact, and deploys it after a push to `main`. |

The deployment is intentionally local to the runner: the artifact is copied into a `fake-server/` directory and executed as a final verification step. This keeps the repository safe to experiment with while illustrating the artifact handoff used in a real deployment pipeline.

## Project structure

```text
.
├── .github/workflows/  # GitHub Actions workflows
├── include/pp.hpp      # Shared C++ header
├── src/main.cpp        # Program entry point
├── Makefile            # Build targets
└── test.sh             # Output verification test
```

## Pipeline overview

```text
Push / pull request
        │
        ▼
      Build ──► Test ──► Upload artifact
                              │
                    push to main only
                              ▼
                           Deploy
```

## License

This project is distributed under the [MIT License](LICENSE).
