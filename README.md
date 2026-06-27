# UART Communication Protocol using Verilog HDL

## Overview

This project implements a Universal Asynchronous Receiver Transmitter (UART) communication system using Verilog HDL. The design includes a UART Transmitter, UART Receiver, Baud Rate Generator, Top Module, and Testbench. The project was designed and simulated using Xilinx Vivado.

The UART communication is verified using a loopback configuration, where the transmitter output (TX) is directly connected to the receiver input (RX). The transmitted data is successfully received and verified through simulation.

---

## Features

- UART Transmitter
- UART Receiver
- Baud Rate Generator
- Loopback Communication
- Finite State Machine (FSM) Based Design
- 8-bit Data Transmission
- Configurable Baud Rate
- Functional Simulation using Vivado
- RTL Schematic Generation

---

## Project Specifications

| Parameter | Value |
|-----------|-------|
| Language | Verilog HDL |
| Tool | Xilinx Vivado 2017.3 |
| Clock Frequency | 50 MHz |
| Baud Rate | 9600 bps |
| Data Bits | 8 |
| Start Bits | 1 |
| Stop Bits | 1 |
| Parity | None |

---

## Project Structure

```
UART_Communication/
│
├── rtl/
│   ├── baud_generator.v
│   ├── uart_tx.v
│   ├── uart_rx.v
│   └── uart_top.v
│
├── testbench/
│   └── uart_tb.v
│
├── simulation/
│   ├── RTL_uart1.png
│   └── simulation_tx_uart.png
│   |__simulation_rx_uart.png
├── synthesis/
│   └── synthesis_uart.png
│
├── block_diagram/
│   └── uart_diagram.png
│
├── state_diagram/
│   ├── uart_tx_state.png
│   └── uart_rx_state.png
│
├── documentation/
│   └── proj3(1).pdf
│
└── README.md
```

---

## Module Description

### Baud Generator

Generates baud rate timing pulses required for serial communication.

### UART Transmitter

Converts parallel 8-bit data into serial format by transmitting:

- Start Bit
- 8 Data Bits (LSB First)
- Stop Bit

### UART Receiver

Receives serial data and reconstructs the original 8-bit parallel data.

### UART Top Module

Integrates all UART modules including the baud generator, transmitter, and receiver.

### Testbench

Generates clock, reset, transmit enable signal, and verifies UART communication using loopback testing.

---

## Simulation

The UART system was simulated in Xilinx Vivado.

Simulation verifies:

- Clock generation
- Reset operation
- Data transmission
- Data reception
- FSM transitions
- Loopback communication
- Successful reception of transmitted data

Example:

```
Input Data  = 8'h55
Output Data = 8'h55
rx_done     = 1
```

---

## RTL Design

RTL synthesis confirms successful hardware implementation of the UART communication system.

The RTL schematic shows the interconnection of:

- Baud Generator
- UART Transmitter
- UART Receiver
- Top Module

---

## Applications

- Embedded Systems
- FPGA Communication
- Microcontroller Communication
- GPS Modules
- Bluetooth Modules
- Serial Debugging
- Sensor Interfaces

---

## Advantages

- Simple hardware implementation
- Low resource utilization
- Reliable serial communication
- Easy FPGA implementation
- Configurable baud rate
- Widely supported protocol

---

## Future Scope

- Configurable data length
- Parity Bit Support
- FIFO Buffer
- Interrupt Support
- Multiple UART Channels
- Error Detection
- FPGA Hardware Implementation

---

## Software Used

- Xilinx Vivado 2017.3
- Verilog HDL

---

## Author

- **Name:** Vasamshetti Meghana  
- **Intern ID:** CITS691  
- **Branch:** Electronics and Communication Engineering (ECE)  
- **Duration:** 6 Weeks  
- **Domain:** VLSI / Digital Design / Verilog HDL  
VLSI Internship Project

UART Communication Protocol using Verilog HDL
