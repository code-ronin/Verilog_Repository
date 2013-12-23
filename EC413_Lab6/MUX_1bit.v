`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:02 10/09/2013 
// Design Name: 
// Module Name:    MUX_1bit 
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
module MUX_1bit(output select, input aop2, aop1, aop0, 
		mov_op, not_op, add_op, sub_op, or_op, and_op, slt_op
    );
//There are SEVEN functions. This will produce a 7 bit binary number, of 7b' 0000000
//Only one bit will be active at a time. Except for 000000, which doesn't exist from 
//given ALU op codes
	wire n_aop2, n_aop1, n_aop0; //For inverter
	not (n_aop2, aop2);
	not (n_aop1, aop1);
	not (n_aop0, aop0);
	wire w1,w2,w3,w4,w5,w6,w7;	//for OP_ALU
	wire s1,s2,s3,s4,s5,s6,s7;	//for selection of operational answer
//MOV select
	and	(w1, n_aop2, n_aop1, n_aop0);		
	and 	(s1, mov_op, w1);
//NOT select
	and	(w2, n_aop2, n_aop1, aop0);	
	and 	(s2, not_op, w2);
//ADD select
	and	(w3, n_aop2, aop1, n_aop0);		
	and 	(s3, add_op, w3);
//SUB select
	and	(w4, n_aop2, aop1, aop0);			
	and 	(s4, sub_op, w4);
//OR select
	and	(w5, aop2, n_aop1, n_aop0);		
	and 	(s5, or_op, w5);
//AND select
	and	(w6, aop2, n_aop1, aop0);			
	and 	(s6, and_op, w6);
//SLT select
	and	(w7, aop2, aop1, n_aop0);			
	and 	(s7, slt_op, w7);
//Pick correct operation
	or 	(select, s1,s2,s3,s4,s5,s6,s7);

endmodule
