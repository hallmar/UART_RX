# UART_RX

### Design rules

Reset rb_i for each block is active low

clk_i is 50Mhz

Always follow names of inputs and outputs of blocks from blockdiagram

### Checklist

- [x] Top Entity **(UARTrx)** 

- [ ] Top Entity testbench

- [x] D flip flop **(dff)**

- [x] D flip flop test bench

- [x] Divide by four **(div4)**

- [x] Divide by four testbench

- [x] Divide by 25 mega **(div50meg)**

- [x] Divide by 25 mega testbench

- [x] Parity Generator **(pargen)**

- [x] Parity Generator testbench

- [ ] Shift register **(shiftreg)**

- [ ] Shift register testbench

- [ ] Sample timing and start bit FSM **(FSM)**

- [ ] Sample timing and start bit FSM testbench

- [ ] 8 bit compare **(eightcomp)**

- [ ] 8 bit compare testbench

- [ ] ROM **(rom)**

- [ ] ROM testbench

- [ ] 1 bit compare **(xnoren)**

- [ ] 1 bit compare testbench

