`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:20 10/08/2013 
// Design Name: 
// Module Name:    N_Bit_NOT 
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
module N_Bit_NOT(result, a
    );
//This is the N Bit NOT module
	parameter Nsize = 8;
	 
	output	[Nsize-1:0] result;
	input	[Nsize-1:0] a;

	NOT_1bit	NB[Nsize-1:0] (result,a);

endmodule
