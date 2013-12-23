`timescale 1ns / 1ps

module ALU_Nbit(result, a,b, aop
    );
//This is the N bit ALU
	 parameter Nsize = 3;
	 
	 output	[Nsize-1:0]	result;
	 //Wires for all 7 functions
	 wire	[Nsize-1:0]	NOT_in, MOV_in, OR_in, AND_in, SUB_in, ADD_in, SLT_in;
	 input	[Nsize-1:0]	a,b;
	 input	[2:0] aop;
	 //The three bit ALU Op codes
	 wire	aop2, aop1, aop0;
	 assign aop2 = aop[2];
	 assign aop1 = aop[1];
	 assign aop0 = aop[0];

	 //Calls the seven functions the ALU can do
	 N_Bit_NOT	#(Nsize)	AA(NOT_in, a);
	 N_Bit_MOV	#(Nsize)	BB(MOV_in, a);
	 N_Bit_OR	#(Nsize)	CC(OR_in, a, b);
	 N_Bit_AND	#(Nsize)	DD(AND_in, a, b);
	 N_Bit_SUB	#(Nsize)	EE(SUB_in, a, b);
	 N_Bit_ADD	#(Nsize)	FF(ADD_in, a, b);
	 N_Bit_SLT	#(Nsize)	GG(SLT_in, a, b);
	 //Choose appropriate function desired
	 N_Bit_MUX	#(Nsize)	HH(result, aop2, aop1, aop0, MOV_in, NOT_in, ADD_in,
		SUB_in, OR_in, AND_in, SLT_in);

endmodule
