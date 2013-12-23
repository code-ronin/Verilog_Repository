`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:14 10/08/2013 
// Design Name: 
// Module Name:    XorGate 
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
module XorGate(output out, input a, b
    );
//This is a XOR gate
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
