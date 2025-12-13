# 04 – Single-Cycle RISC-V CPU (RV32I)

A complete single-cycle 32-bit RISC-V processor in SystemVerilog.

Supports core RV32I integer instructions (add, sub, and, or, xor, shifts, branches, loads, stores, immediates).

## Features
- 32-bit datapath
- 32 registers (x0-x31, x0 hardwired to 0)
- Separate instruction and data memory

## Files
- rtl/ → all module design
- tb/tb_cpu.sv → testbench
- waves/cpu_waveform.png → waveform

## Live Demo
[EDA Playground]()

## What I Learned
- Everything happens in parallel, clock edges matter
- Clean RTL coding style: separate combinational and sequential logic
- SystemVerilog is better than old Verilog
