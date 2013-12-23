`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:59 10/08/2013 
// Design Name: 
// Module Name:    FullAdder_1bit 
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
module FullAdder_1bit(output sum, carry, input a, b, cin
    );
//This is the 1 Bit ADD module
//This is the Full Adder form the revious lab
	wire xor1, and1, and2;
	//gates
	XorGate 	x1 (xor1,a,b);
	XorGate	x2 (sum,xor1,cin); //sum output
	and 	(and1, xor1,cin);
	and 	(and2, a,b);
	or 	(carry, and1, and2);	//carry output


endmodule
