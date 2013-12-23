`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:47 10/08/2013 
// Design Name: 
// Module Name:    N_Bit_ADD 
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
module N_Bit_ADD(sum, a, b
    );
//This is the N Bit ADD module
	 parameter Nsize = 32;
	 
	 
	 input	[Nsize-1:0] a,b;
	 wire		cin; //Hardcode to 0
	 assign cin =0;
	 
	 wire		[Nsize-1:0] cinwire;
	  
	 output	[Nsize-1:0] sum;
	 wire		cout;
	 
	 
	 FullAdder_1bit	FA[Nsize-1:0]	(sum,{cout, cinwire[Nsize-1:1]}, a,b, {cinwire[Nsize-1:1], cin});


endmodule
