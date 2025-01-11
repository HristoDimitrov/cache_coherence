#ifndef CACHE_H
#define CACHE_H

#include <systemc.h>

SC_MODULE(Cache) {
    // Ports
    sc_port<sc_fifo_out_if<int>> mem_port;  // Port to connect to memory

    // Internal cache data
    int data[16];  // A simple cache with 16 slots

    SC_CTOR(Cache) {
        SC_THREAD(cache_thread);  // Spawn a thread for cache operations
    }

    void cache_thread() {
        while (true) {
            // Example cache operation: Write data to Memory
            for (int i = 0; i < 16; i++) {
                data[i] = i * 10;
                std::cout << sc_time_stamp() << " [Cache] Writing data: " << data[i] << std::endl;
                mem_port->write(data[i]);  // Send data to Memory
                wait(1, SC_NS);  // Simulate a delay
            }
        }
    }
};

#endif
