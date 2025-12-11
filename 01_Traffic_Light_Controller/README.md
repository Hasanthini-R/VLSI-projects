# 01 – Traffic Light Controller (Moore FSM)

Realistic 3-state traffic light controller  
- RED → 10 cycles  
- GREEN → 10 cycles  
- YELLOW → 4 cycles  

Fully synchronous, synthesizable Verilog design with proper reset.

## Features
- Binary state encoding (2-bit)
- Timer-based state transitions
- Combinational output decoder

## Files
- `rtl/traffic_light.v` – Main design
- `tb/tb_traffic_light.v` – Testbench
- `waves/` – Simulation waveform

## Live Demo
[Run on EDA Playground](https://www.edaplayground.com/x/piv6)

Learned: FSM design, synchronous timing, state encoding
