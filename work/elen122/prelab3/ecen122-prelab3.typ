#import "./lib/pset.typ" as pset
#show: pset.ieee.with(title: "ECEN122 - Prelab 3", columns: 1, author: "Evan Stokdyk")

The goal of this lab is too add three instructions to our litle computer:
- addi: add immediate value
- subi: subtract immediate value
- disp: display a value

= Problem 1

_Modify the module interface according to the spec._

This finished code for the verilog modules is presented in @appendix-a.

= Problem 2

_Draw out an updated state diagram that accounts for the newly added
operations._

#figure(
  image("o.svg", width: 80%),
  caption: [State Diagram of the Machine]
)

= Problem 3

_Write the output table of your new Moore machine that has the additional
control output signals._

// #show table.cell.where(body: [0]): it => {
//   set text(10pt)
//   emph()[#it]
// }

#figure(
  table(
    columns: 11,
    // inset: (right: 1.5em),
    [State], [RdX], [RdY], [WrX], [Ain], [Gin], [Extern], [Gout], [add_sub], [DPin], [Iout],
    [IDLE], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0],
    [LOAD], [0], [0], [1], [0], [0], [1], [0], [0], [0], [0],
    [READ_Y], [0], [1], [0], [1], [0], [0], [0], [0], [0], [0],
    [READ_X], [1], [0], [0], [1], [0], [0], [0], [0], [0], [0],
    [ADD], [1], [0], [0], [0], [1], [0], [0], [0], [0], [0],
    [SUB], [0], [1], [0], [0], [1], [0], [0], [1], [0], [0],
    [ADDI], [0], [0], [0], [0], [1], [0], [0], [0], [0], [1],
    [SUBI], [0], [0], [0], [0], [1], [0], [0], [1], [0], [1],
    [DISPLAY], [1], [0], [0], [0], [0], [0], [0], [0], [1], [0],
    [MV], [0], [0], [0], [1], [0], [0], [0], [0], [0], [0],
    [WRITE_X], [0], [0], [1], [0], [0], [0], [1], [0], [0], [0],
    [DONE], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0],
  ),
  caption: [table showing output pins for the state machine]
)

#show: pset.appendix

= Verilog Code <appendix-a>

Below is the modifed verilog code.

#pset.codefigure()[
  #set text(10pt)
```verilog
module l3_SM(input clk,
        input execute,
        input [3:0] input_data
        input [1:0] regXaddr
        input [1:0] regYaddr
        input [2:0] operation,
        output reg _Extern,
        output reg Gout,
        output reg Ain,
        output reg Gin,
        output reg Iout,
        output reg DPin,
        output reg [1:0] AddrX,
        output reg [1:0] AddrY,
        output reg RdX,
        output reg RdY,
        output reg WrX,
        output reg add_sub,
        output [3:0] cur_state);

    // defining all my states - 8 total
    parameter IDLE 		=  4'b0000;
    parameter LOAD 		=  4'b0001;
    parameter READ_Y 	=  4'b0010;
    parameter READ_X 	=  4'b0011;
    parameter ADD 		=  4'b0100;
    parameter SUB 		=  4'b0101;
    parameter MV 		=  4'b0110;
    parameter WRITE_X 	=  4'b0111;
    parameter DONE 		=  4'b1000;
    parameter ADDI      =  4'b1001;
    parameter SUBI      =  4'b1010;

    reg [3:0] state = IDLE; // initial state being IDLE

    assign cur_state = state;

    initial begin //instead of reset
        state <= IDLE;
    end

    always@(*)
    begin
        case(state)
        IDLE:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b0;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        LOAD:
            begin
                _Extern = 1'b1;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b0;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b1;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        READ_Y:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b1;
                Gin = 1'b0;
                RdX = 1'b0;
                RdY = 1'b1;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        READ_X:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b1;
                Gin = 1'b0;
                RdX = 1'b1;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        ADD:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b1;
                RdX = 1'b1;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        SUB:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b1;
                RdX = 1'b0;
                RdY = 1'b1;
                WrX = 1'b0;
                add_sub = 1'b1;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        MV:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b1;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        WRITE_X:
            begin
                _Extern = 1'b0;
                Gout = 1'b1;
                Ain = 1'b0;
                Gin = 1'b0;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b1;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        ADDI:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b1;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b1;
                DPin = 1'b0;
            end
        SUBI:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b1;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b1;
                Iout = 1'b1;
                DPin = 1'b0;
            end
        DONE:
            begin
                _Extern = 1'b0;
                Gout = 1'b0;
                Ain = 1'b0;
                Gin = 1'b0;
                RdX = 1'b0;
                RdY = 1'b0;
                WrX = 1'b0;
                add_sub = 1'b0;
                Iout = 1'b0;
                DPin = 1'b0;
            end
        endcase
    end

    /*
    opcode encodings
    000 - load
    001 - move
    010 - subtract
    011 - add
    100 - disp
    101 - reserved
    110 - subi
    111 - addi
    */

    always@(posedge clk)
    begin
        case(state)
            /* TODO 4: complete the next state logic */
            IDLE:
                if(execute == 1 && operation == 3'b000) state <= LOAD;
                ...
            default: state <= IDLE;
        endcase
    end

endmodule
```
]
