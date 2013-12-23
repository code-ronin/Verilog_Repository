`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:08:12 10/07/2013 
// Design Name: 
// Module Name:    AdderSub 
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
module AdderSub(output sum, carry, input a, b, cin
    );
	 
	//wires
	wire xor1, and1, and2;
	//Choose ADD or SUB (A+B or A-B)
	wire b_out;
	XorGate	x0 (b_out, b, cin);
	//gates
	XorGate 	x1 (xor1,a,b_out);
	XorGate	x2 (sum,xor1,cin);
	and 	(and1, xor1,cin);
	and 	(and2, a,b_out);
	or 	(carry, and1, and2);
endmodule
