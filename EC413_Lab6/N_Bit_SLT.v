`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:08 10/09/2013 
// Design Name: 
// Module Name:    N_Bit_SLT 
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
module N_Bit_SLT(result, a ,b
    );
//This is the N Bit SLT module
	 //If A<B, return 1 or else return 0
	 parameter Nsize = 4;
	 
	 output	[Nsize-1:0] result;
	 input	[Nsize-1:0] a, b;
	 
	 wire		a_high;
	 assign	a_high=a[Nsize-1];	//high bit from A
	 wire		b_high; 
	 assign 	b_high=b[Nsize-1];	//high bit from B
	 wire		[Nsize-1:0]	sub_res;
	 N_Bit_SUB #(Nsize)	AA(sub_res, a, b);
	 wire		sub_res_high;
	 assign	sub_res_high=sub_res[Nsize-1];	//high bit of (A-B)
	 //This is the logical circutry for comparing
	 wire and0, and1, and2;
	 wire	inv_b_high;
	 not	(inv_b_high, b_high);
	 and	(and0, a_high, sub_res_high);
	 and	(and1, a_high, inv_b_high);
	 and	(and2, inv_b_high, sub_res_high);
	or	(result[0], and0, and1, and2);	
	
	//Create additional 0 bits for excess SLT 
	genvar i;
	generate
		for (i=1; i<Nsize; i=i+1) begin:Loop
			N_Bit_MOV ss(result[i],0);
		end
	endgenerate

endmodule
