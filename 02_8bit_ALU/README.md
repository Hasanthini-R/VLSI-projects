# 02 – 8-bit ALU (8 Operations)

8-bit Arithmetic Logic Unit supporting ADD, SUB, AND, OR, XOR, SLL, SRL, and SLT.

Fully combinational design with zero flag and signed overflow detection.

## Features
- 8-bit inputs (A, B) and 8-bit result
- 3-bit opcode for 8 operations
- Zero flag (`result == 0`)
- Signed overflow detection for ADD/SUB
- Pure combinational logic (`always @(*)`)

## Operations
| Op | Code | Operation                  | Description                  |
|----|------|----------------------------|------------------------------|
| 0  | 000  | ADD                        | A + B                        |
| 1  | 001  | SUB                        | A - B                        |
| 2  | 010  | AND                        | A & B                        |
| 3  | 011  | OR                         | A \| B                       |
| 4  | 100  | XOR                        | A ^ B                        |
| 5  | 101  | SLL                        | A << B[2:0]                  |
| 6  | 110  | SRL                        | A >> B[2:0] (logical)        |
| 7  | 111  | SLT                        | Signed less-than (A < B)     |

## Files
- `rtl/alu.v` – Synthesizable RTL module
- `tb/tb_alu.v` – Testbench with random vectors
- `waves/alu_waveform.png` – Verified simulation results

## Live Demo
[Run on EDA Playground](https://www.edaplayground.com/x/fzGQ)  

Learned: Combinational logic, signed overflow detection, flag generation, waveform analysis.
