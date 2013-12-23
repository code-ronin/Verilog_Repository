`timescale 1ns / 1ps


//This is the instruction fetch sequence
//Essentially just a holding register

module Stage_1(InstrIn, Clk, Reset,
					Instr_1);

//Inputs-------------------------------
input	[31:0] InstrIn;
input	Clk, Reset;
//Outputs------------------------------
output reg [31:0] Instr_1;
//Code---------------------------------
//Pass instruction at every clock cycle
always @(posedge Clk)
		if (Reset)
		begin
			Instr_1 <= 0;
		end
		
		else
		begin
			Instr_1 <= InstrIn;
		end
endmodule
