#include "Cache.h"
#include "Memory.h"
#include <systemc.h>

int sc_main(int argc, char* argv[]) {
    // Create a FIFO buffer for communication
    sc_fifo<int> fifo(16);  // FIFO with depth 16

    // Instantiate modules
    Cache cache("TestCache");
    Memory memory("TestMemory", fifo);

    // Connect the FIFO to the cache
    cache.mem_port(fifo);

    // Start the simulation for 100 ns
    sc_start(100, SC_NS);

    return 0;
}
