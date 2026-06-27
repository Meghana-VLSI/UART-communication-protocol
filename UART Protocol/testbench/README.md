# Testbench

## Overview

This folder contains the Verilog testbench used to verify the UART Communication System.

## Files

- uart_tb.v

## Description

The testbench generates the clock and reset signals, applies input data, and performs loopback testing by connecting the transmitter output directly to the receiver input.

The simulation verifies correct serial transmission and reception of data according to the UART 8N1 protocol.
