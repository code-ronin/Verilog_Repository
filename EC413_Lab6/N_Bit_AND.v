`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:15:48 10/09/2013 
// Design Name: 
// Module Name:    N_Bit_AND 
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
module N_Bit_AND(result, a,b
    );
//This is the N Bit AND module
	parameter Nsize = 8;
	 
	output	[Nsize-1:0] result;
	input	[Nsize-1:0] a,b;

	AND_1bit	NB[Nsize-1:0] (result,a,b);

endmodule
