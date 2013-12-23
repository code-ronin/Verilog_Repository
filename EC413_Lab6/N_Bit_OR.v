`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:14:17 10/09/2013 
// Design Name: 
// Module Name:    N_Bit_OR 
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
module N_Bit_OR(result, a,b
    );
//This is the N Bit OR module
	parameter Nsize = 8;
	 
	output	[Nsize-1:0] result;
	input		[Nsize-1:0] a,b;

	OR_1bit	OB[Nsize-1:0] (result,a,b);


endmodule
