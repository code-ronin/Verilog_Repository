`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:25 10/03/2013 
// Design Name: 
// Module Name:    RCA_64bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RCA_64bit(output [63:0] sum, output cout, input [63:0] a, b, input cin
    );

	wire c0;
	
	RCA_32bit FBR0 (sum[31:0], c0, a[31:0], b[31:0], cin);
	RCA_32bit FBR1 (sum[63:32], cout, a[63:32], b[63:32], c0);
endmodule

module RCA_32bit(output [31:0] sum, output cout, input [31:0] a, b, input cin
    );

	wire c0;
	
	RCA_16bit FBR0 (sum[15:0], c0, a[15:0], b[15:0], cin);
	RCA_16bit FBR1 (sum[31:16], cout, a[31:16], b[31:16], c0);

endmodule

module RCA_16bit(output [15:0] sum, output cout, input [15:0] a, b, input cin
    );

	wire c0;
	
	RCA_8bit FBR0 (sum[7:0], c0, a[7:0], b[7:0], cin);
	RCA_8bit FBR1 (sum[15:8], cout, a[15:8], b[15:8], c0);

endmodule

module RCA_8bit(output [7:0] sum, output cout, input [7:0] a, b, input cin
    );

	wire c0;
	
	RCA_4bit FBR0 (sum[3:0], c0, a[3:0], b[3:0], cin);
	RCA_4bit FBR1 (sum[7:4], cout, a[7:4], b[7:4], c0);

endmodule

module RCA_4bit(output [3:0] sum, output cout, input [3:0] a, b, input cin
    );

	wire c0,c1,c2;
	//Use four one bit Full Adders for a 4 bit Full Adder
	FullAdder FA0 (sum[0], c0, a[0], b[0], cin);
	FullAdder FA1 (sum[1], c1, a[1], b[1], c0);
	FullAdder FA2 (sum[2], c2, a[2], b[2], c1);
	FullAdder FA3 (sum[3], cout, a[3], b[3], c2);

endmodule

module FullAdder(
	 output sum, carry, input a, b, cin
    );
	 
	//wires
	wire xor1, and1, and2;
	//gates
	XorGate 	x1 (xor1,a,b);
	XorGate	x2 (sum,xor1,cin);
	and 	(and1, xor1,cin);
	and 	(and2, a,b);
	or 	(carry, and1, and2);

endmodule

module XorGate(output out, input a, b
    );
	wire a0, b0;
	wire and1, and2;
	//inverters
	not (a0, a);
	not (b0, b);
	//Create the output
	and (and1, a0, b);
	and (and2, a, b0);
	or  (out, and1, and2);	//output
	
endmodule
