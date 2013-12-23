`timescale 1ns / 1ps

module N_Bit_MUX(select, aop2, aop1, aop0, mov_op, not_op, 
	add_op, sub_op, or_op, and_op, slt_op
    );
//This is the N Bit MUX
//This takes the 7 function outputs and OP codes and chooses proper output
	parameter Nsize = 3;
	
	output	[Nsize-1:0] select;
	input		[Nsize-1:0] mov_op, not_op, add_op, sub_op, or_op, and_op, slt_op;
	input		aop2, aop1, aop0;
	
	MUX_1bit	M0[Nsize-1:0]	(select,aop2, aop1, aop0, mov_op, not_op, 
	add_op, sub_op, or_op, and_op, slt_op); //Pick final output

endmodule
