# 03 – Synchronous FIFO (8-deep × 8-bit)

A simple synchronous FIFO with full/empty flags and almost flags.

## What it does
- Stores up to 8 bytes (8-bit wide, 8 values deep)
- Write when wr_en = 1 (if not full)
- Read when rd_en = 1 (if not empty)
- Gives exact count of items inside

## Flags
- full = 1 when 8 items
- empty = 1 when 0 items
- almost_full = 1 when 7 or 8 items
- almost_empty = 1 when 0 or 1 item

## Files
- fifo.v → FIFO design
- tb_fifo.v → testbench 
- fifo_waveform.png → screenshot

## Live Demo
[Run on EDA Playground](https://www.edaplayground.com/x/cBVg)  

Learned: pointers, count logic, simultaneous read/write handling, flag generation.
