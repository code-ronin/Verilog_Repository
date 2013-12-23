`timescale 1ns / 1ps


//This is the instruction fetch sequence
//Essentially just takes an instruction and passes it to Stage 2

module Stage1(InstrIn,
					Instr_1);

//Inputs-------------------------------
input	[31:0] InstrIn;

//Outputs------------------------------
output [31:0] Instr_1;
//Code---------------------------------

	assign Instr_1 = InstrIn;	//assign output
	
endmodule
