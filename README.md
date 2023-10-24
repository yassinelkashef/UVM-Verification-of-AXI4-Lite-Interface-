# UVM Verification of AXI4-Lite Interface 

## Introduction to AXI4-Lite (Advanced Extensible Interface)
### Advanced eXtensible Interface 4 (AXI4) is a family of buses defined as part of the fourth generation of the ARM Advanced Microcontroler Bus Architectrue (AMBA) standard. AXI was first introduced with the third generation of AMBA, as AXI3, in 1996.

## AXI-Lite Channels:
### Supports 2 main operations/transactions: Read and Write.
### Read transaction:
         ### Read the address channel (data is read from here).
         ### Read the data channel.
![read arch axi](https://github.com/yassinelkashef/UVM-Verification-of-AXI4-Lite-Interface-/assets/110354392/b27ca242-9715-465e-8a84-39e1a79e72e0)
### Write transaction:
         ### Write the address channel (M Sends data to be written to S).
         ### Write a data channel.
         ### Write a response channel.
![write arch axi](https://github.com/yassinelkashef/UVM-Verification-of-AXI4-Lite-Interface-/assets/110354392/ba889b15-9ecc-4596-8d61-2788d1bdb4c1)



## Handshake Process
### All five transaction channels use the same VALID/READY handshake process to transfer address, data, and control information. This two-way flow control machanism means both the master and slave can control the rate at which the information moves between master and slave. The information source generates the VALID signal to indicate when the address, data or control information is available. The information destination generates the READY signal to indicate that it can accept the information. The handshake completes if both VALID and READY signals in a channel are asserted during a rising clock edge.
