# Cache Coherence

This repository contains a SystemC-based simulation project
designed to explore cache coherence protocols and memory
interactions in a simplified environment. The project uses
Docker for a reproducible development and execution environment.

## Folder Structure

```text
cache_coherence/
|
├── build/                   - Build directory (compiled binaries and object files)
|
├── doc/                     - Documentation folder
|   └── protocol_design.md   - Documentation for the protocol being implemented
|
├── docker/                  - Docker-related files
|   └── Dockerfile.coherence_dev - Dockerfile for the development environment
|
├── scripts/                 - Auxiliary scripts
|   └── run_tests.sh         - Script to execute tests inside the container
|
├── src/                     - Source files for the simulation
|   ├── Cache.cpp            - Cache module implementation
|   ├── Cache.h              - Cache module header
|   ├── Memory.cpp           - Memory module implementation
|   ├── Memory.h             - Memory module header
|   └── main.cpp             - Main entry point for the simulation
|
├── tests/                   - Unit test files
|   └── test_coherence.cpp   - Tests for validating cache coherence and interactions
|
├── docker-compose.coherence_dev.yml - Docker Compose configuration
├── start_docker.sh          - Script to start the Docker container
├── stop_docker.sh           - Script to stop the Docker container
├── enter_docker.sh          - Script to enter the running container
├── Makefile                 - Build automation for the simulation and tests
└── README.md                - This file
```

## Available scripts

1. `start_docker.sh`
   Purpose: Builds and starts the Docker container for the
   development environment.
   Important: This script must be run from a WSL shell,
   NOT PowerShell.
   Usage:  
   ```shell
   ./start_docker.sh
   ```

2. `stop_docker.sh`
   Purpose: Stops and removes the running Docker container.
   Usage: 
   ```shell
   ./stop_docker.sh
   ```

3. `enter_docker.sh`
   Purpose: Attaches to the running Docker container for
   interactive development.
   Usage:  
   ```shell
   ./enter_docker.sh
   ```

4. run_tests.sh
   Purpose: Runs all the tests inside the Docker container.
   Usage:  
   ```shell
   ./scripts/run_tests.sh
   ```

## Building and Running the simulations


1. Compile the Simulation Binary:
   Inside the Docker container, run:
   ```shell
   make
   ```

2. Run the Simulation:
   Inside the Docker container, execute:
    
   ```shell
   ./build/simulation
   ```

## Key Details


Environment Setup:
- This repository uses Docker to ensure a consistent development environment.
- Dependencies include:
  - SystemC 2.3.3
  - GCC, Make, and other build tools

Simulation:
- The main entry point is `src/main.cpp`. It includes a
  predefined list of memory accesses for testing the
  interactions between `Cache` and `Memory` modules.

Testing:
- Unit tests are located in the `tests/` directory.
- `test_coherence.cpp` validates the cache coherence behavior.

## Next steps


1. Enhance the Simulation:
   - Implement advanced cache coherence protocols (MESI, MOESI).
   - Simulate scenarios with multiple caches and shared memory.

2. Add More Tests:
   - Extend test coverage for edge cases and performance metrics.
   - Validate behavior under contention and high load.

3. Optimize the Project:
   - Profile and optimize the simulation for scalability.
   - Explore multithreading for better performance.

4. Document the Protocol:
   - Update `doc/protocol_design.md` with detailed explanations
     and visual diagrams of the protocol.

## KNOWN ISSUES


1. Windows Compatibility:
   - The `start_docker.sh` script does not work directly
     in PowerShell. Use a WSL (Windows Subsystem for Linux)
     shell instead.

