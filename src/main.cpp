#include <systemc.h>
#include "Cache.h"
#include "Memory.h"
#include <vector>

// A list of predefined memory accesses
std::vector<int> predefined_accesses = {10, 20, 30, 40, 50};

SC_MODULE(Top) {
    Cache* cache;
    Memory* memory;

    // FIFO for communication
    sc_fifo<int> fifo;

    SC_CTOR(Top) : fifo(16) {  // FIFO with depth 16
        // Instantiate modules
        memory = new Memory("Memory", fifo);  // Pass FIFO reference to Memory
        cache = new Cache("Cache");

        // Connect the Cache to the FIFO
        cache->mem_port(fifo);  // Connect Cache's port to FIFO
    }

    ~Top() {
        delete cache;
        delete memory;
    }
};

int sc_main(int argc, char* argv[]) {
    Top top("Top");

    // Write predefined accesses into the Cache module
    for (int access : predefined_accesses) {
        std::cout << "Simulation: Writing access " << access << " to the cache." << std::endl;
        top.cache->mem_port->write(access);  // Send each access through the Cache's port
        sc_start(1, SC_NS);                 // Allow simulation to process for 1 ns
    }

    // Let the simulation continue until all accesses are processed
    sc_start(100, SC_NS);

    // Terminate the simulation
    sc_stop();

    return 0;
}
