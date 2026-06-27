# UART Communication System using Verilog HDL

## Overview

This project implements a Universal Asynchronous Receiver Transmitter (UART) communication system using Verilog HDL. The design supports asynchronous serial communication using the standard **8N1** format (8 data bits, No parity, 1 stop bit). The project includes a baud rate generator, UART transmitter, UART receiver, top-level integration module, and a testbench for simulation.

The design has been verified using Xilinx Vivado through behavioral simulation and synthesis.

---

## Features

- Verilog HDL implementation
- UART Transmitter (TX)
- UART Receiver (RX)
- Baud Rate Generator
- Top-level UART Integration
- Loopback Communication Verification
- Behavioral Simulation
- RTL Schematic Generation
- FPGA Synthesis using Vivado

---

## UART Configuration

| Parameter | Value |
|-----------|-------|
| Data Bits | 8 |
| Parity | None |
| Stop Bits | 1 |
| UART Format | 8N1 |
| Clock Frequency | 50 MHz |
| Baud Rate | 9600 bps |


---

## Module Description

### Baud Rate Generator
Generates the baud tick required for UART communication by dividing the system clock to the desired baud rate.

### UART Transmitter
Converts 8-bit parallel input data into serial data by transmitting a start bit, eight data bits (LSB first), and a stop bit.

### UART Receiver
Receives serial data, detects the start bit, samples the incoming bits using the baud tick, reconstructs the original byte, and asserts the `rx_done` signal after successful reception.

### UART Top Module
Integrates the baud rate generator, transmitter, and receiver into a complete UART communication system.

### Testbench
Applies input stimuli, performs loopback testing by connecting TX to RX, and verifies successful transmission and reception.

---

## Simulation

Simulation was performed using Xilinx Vivado.

The loopback configuration connects the transmitter output directly to the receiver input.

### Verification

- Input Data : `8'h55`
- Received Data : `8'h55`
- Baud Rate : `9600 bps`
- Result : Communication Successful

---

## Synthesis

The design was synthesized using Xilinx Vivado.

The RTL schematic confirms the correct hardware implementation of the UART communication system.

The synthesis results demonstrate that the design requires minimal FPGA resources and is suitable for embedded communication applications.

---

## Applications

- FPGA Communication
- Embedded Systems
- Microcontroller Interfaces
- GPS Modules
- Bluetooth Modules
- Serial Debugging
- Industrial Automation

---

## Future Scope

- Support for configurable baud rates
- Parity bit implementation
- FIFO-based UART communication
- Interrupt-driven UART controller
- RS-232/RS-485 interface support
- FPGA hardware implementation
- SoC integration

---

## Tools Used

- Verilog HDL
- Xilinx Vivado Design Suite

---

## Author

**Meghana Vasamshetti**

Project: UART Communication System using Verilog HDL
