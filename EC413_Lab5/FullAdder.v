`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:45 10/07/2013 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(output sum, carry, input a, b, cin
    );

	wire xor1, and1, and2;
//Gates for FA circuitry
	XorGate 	x1 (xor1,a,b);
	XorGate	x2 (sum,xor1,cin);
	and 	(and1, xor1,cin);
	and 	(and2, a,b);
	or 	(carry, and1, and2);
endmodule
