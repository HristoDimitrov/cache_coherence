# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g -DSC_API_VERSION_STRING=2_3_3 -I$(SRC_DIR)

# SystemC installation paths
SYSTEMC_HOME = /usr/local/systemc
INCLUDES = -I$(SYSTEMC_HOME)/include
LIBS = -L$(SYSTEMC_HOME)/lib-linux64 -lsystemc

# Directories
SRC_DIR = src
TESTS_DIR = tests
BUILD_DIR = build

# Source and test files
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
TEST_SRCS = $(wildcard $(TESTS_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))
TEST_OBJS = $(patsubst $(TESTS_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(TEST_SRCS))

# Output binaries
TARGET = $(BUILD_DIR)/simulation
TEST_TARGET = $(BUILD_DIR)/test_coherence

# Default target: build simulation binary
all: $(TARGET)

# Build simulation binary
$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $@ $(LIBS)

# Build test binary
test: $(TEST_TARGET)

$(TEST_TARGET): $(filter-out build/main.o,$(OBJS)) $(TEST_OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(filter-out build/main.o,$(OBJS)) $(TEST_OBJS) -o $@ $(LIBS)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Compile test files
$(BUILD_DIR)/%.o: $(TESTS_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean build directory
clean:
	rm -rf $(BUILD_DIR)

# Run the simulation
run: $(TARGET)
	$(TARGET)

# Run the tests
run_tests: test
	$(TEST_TARGET)

# Debug the simulation
debug: $(TARGET)
	gdb $(TARGET)

# Debug the tests
debug_tests:
	gdb $(TEST_TARGET)

# Phony targets
.PHONY: all clean run test run_tests debug debug_tests
