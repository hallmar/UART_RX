# UART_RX
![Block diagram](/images/block.jpg)


### Design rules

Reset rb_i for each block is active low

clk_i is 50Mhz

Always follow names of inputs and outputs of blocks from blockdiagram

### Checklist

- [x] Top Entity **(UARTrx)** 

- [x] Top Entity testbench

- [x] D flip flop **(dff)**

- [x] D flip flop test bench

- [x] Divide by six **(div6)**

- [x] Divide by six testbench

- [x] Divide by 25 mega **(div50meg)**

- [x] Divide by 25 mega testbench

- [x] Parity Generator **(pargen)**

- [x] Parity Generator testbench

- [x] Shift register **(shiftreg)**

- [x] Shift register testbench

- [x] Sample timing and start bit FSM **(FSM)**

- [x] Sample timing and start bit FSM testbench

- [x] 8 bit compare **(eightcomp)**

- [x] 8 bit compare testbench

- [x] ROM **(rom)**

- [x] ROM testbench

- [x] 1 bit compare **(xnoren)**

- [x] 1 bit compare testbench

