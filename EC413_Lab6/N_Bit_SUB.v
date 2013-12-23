`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:13 10/08/2013 
// Design Name: 
// Module Name:    N_Bit_SUB 
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
module N_Bit_SUB(diff, a, b
    );
//This is the N Bit SUB module
	 parameter Nsize = 4;
	 
	 input	[Nsize-1:0] a,b;
	 wire		bor_in;		//Hard code to zero
	 assign 	bor_in =0;
	 
	 wire		[Nsize-1:0] borwire;
	 output	[Nsize-1:0] diff;
	 wire		bor_out;

	 
	 FullSubtractor	FS[Nsize-1:0]	(diff,{bor_out, borwire[Nsize-1:1]}, a,b, {borwire[Nsize-1:1], bor_in});


endmodule
