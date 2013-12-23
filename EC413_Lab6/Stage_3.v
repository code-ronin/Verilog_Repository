`timescale 1ns / 1ps

//This is the Execution Stage (Stage 3)
module Stage_3(WriteSelect_S2,
					ReadData_1,
					ReadData_2,
					Imm,
					DataSrc,
					ALUOp,
					WriteSelect_S3,
					ALUOut,
					Clk, Reset
    );
//Inputs--------------------------------------------
	input	[4:0] 	WriteSelect_S2;
	input	[31:0] 	ReadData_1, ReadData_2, Imm;	//MUX inputs
	input				DataSrc;
	input	[2:0]		ALUOp;
	input Clk, Reset;
//Outputs-------------------------------------------
	output reg	[4:0]		WriteSelect_S3;
	output reg	[31:0]	ALUOut;
//Wires---------------------------------------------
	wire 	[31:0] 	Mux_out;
	wire	[31:0]	R1;
//Code----------------------------------------------
	
	//MUX: Choose Imm or ReadData_2
	Stage_3_MUX	M1	(DataSrc, Imm, ReadData_2, Mux_out);
	//Call ALU to perform operation
	parameter ALUsize = 32;
	
	ALU_Nbit	#(ALUsize) A32(R1, ReadData_1, Mux_out, ALUOp);
	
	//Outputs by the clock
	always @(posedge Clk)
	if (Reset)
		begin
			ALUOut <= 0;
			WriteSelect_S3 <= 0;
		end
		
		else
		begin
			ALUOut <= R1;
			WriteSelect_S3 <= WriteSelect_S2;
		end
	
endmodule

//MUX Module used in Stage 3
module Stage_3_MUX (DataSrc, Imm, ReadData_2, Mux_out
	);
//Inputs---------------------------------
	input [31:0] Imm, ReadData_2;
	input DataSrc;
//Outputs--------------------------------
	output reg	[31:0] Mux_out;
//Code-----------------------------------
	always @(DataSrc or Imm or ReadData_2)
	begin
		if (DataSrc == 0)
			Mux_out <= ReadData_2;
		else
			Mux_out <= Imm;
	end
endmodule 
