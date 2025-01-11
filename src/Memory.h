#ifndef MEMORY_H
#define MEMORY_H

#include <systemc.h>

SC_MODULE(Memory) {
    sc_fifo<int>& fifo;  // FIFO passed from Top module

    // Constructor
    Memory(sc_module_name name, sc_fifo<int>& fifo_ref) : sc_module(name), fifo(fifo_ref) {
        SC_THREAD(memory_thread);  // Register the memory thread
    }

    void memory_thread() {
        while (true) {
            if (fifo.num_available() > 0) {
                int received_data = fifo.read();
                std::cout << sc_time_stamp() << " [Memory] Received data: " << received_data << std::endl;
            }
            wait(1, SC_NS);  // Simulate a delay
        }
    }

    // Required by SystemC for custom constructors
    SC_HAS_PROCESS(Memory);
};

#endif
