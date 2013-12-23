`timescale 1ns / 1ps

//This is the overall pipeline module for the instruction
module TopModule_Lab6(InstrIn, ALUOut, Reset, Clk, WriteEnable
    );
//Input-------------------------------------------
	input	[31:0]	InstrIn;
	input	WriteEnable, Reset, Clk;
//Output------------------------------------------
	output [31:0]	ALUOut;
//Wires-------------------------------------------
	//For Stage_1 output
	wire	[31:0] Instr_1;
	//For Stage 2 Outputs
	wire 	[4:0] WriteSelect_S2;
	wire	[31:0]	ReadData_1;
	wire	[31:0]	ReadData_2;
	wire	DataSrc;					//I-type or R-type
	wire	[31:0] Imm;
	wire	[2:0]	ALUOp;
	//For Stage 3 Outputs
	wire	[4:0] WriteSelect_S3;
	
	
//Code--------------------------------------------
	//Stage 1: Input instruction and output instruction (instruction fetch)
	Stage1 	S1 (InstrIn, Instr_1);


	//Stage 2: Decode the instruction
	Stage_2	S2(Clk, Reset, InstrIn, ALUOut, WriteSelect_S3, WriteEnable, 	//Inputs
		WriteSelect_S2, ReadData_1, ReadData_2, DataSrc, Imm, ALUOp);			//Outputs
		
	//Stage 3: Execute the instruction 
	Stage_3	S3	(
					//Inputs
					WriteSelect_S2,
					ReadData_1,
					ReadData_2,
					Imm,
					DataSrc,
					ALUOp,
					//Outputs
					WriteSelect_S3,
					ALUOut,			//This is the main output
					Clk, Reset);
					

endmodule
