`timescale 1ns / 1ps

//This is the Instruction Decode stage
//This is both the register file and the ID module
module Stage_2(Clk, Reset, Instr_1, WriteData, //ALUOut
		WriteSelect, WriteEnable,
		WriteSelect_S2, ReadData_1, ReadData_2, DataSrc, Imm, ALUOp
);
//Inputs------------------------------------------------------------
	input 			Clk;
	input 			Reset;
	input [31:0] 	Instr_1;
	input	[31:0]	WriteData;
	input [4:0]		WriteSelect;
	input				WriteEnable;
//Outputs-----------------------------------------------------------
	output 	[4:0] WriteSelect_S2;
	output 		[31:0]	ReadData_1;
	output 		[31:0]	ReadData_2;
	output	DataSrc;					//I-type or R-type
	output	[31:0] Imm;
	output	[2:0]	ALUOp;
//Code--------------------------------------------------------------

	wire [31:0] ReadData1, ReadData2;	//Stores the output of register file
	//This code calls the regsiter file
	nbit_register_file	#(5,32) NBRF(WriteData,   // Input data----ALUOut
                          ReadData1,   // Output data 1
                          ReadData2,   // Output data 2
                          Instr_1[20:16], // Select lines for output 1
                          Instr_1[15:11], // Select lines for output 2
                          WriteSelect, // Select lines for input---from stage 3
                          WriteEnable, // Causes write to take place on posedge---You decide the value
                          Reset,       // Synchronous reset
                          Clk);        // Clock
//This is the ID module, where the instruction is broken up and stored into regsiters

nbit_reg #(32)	nb1( ReadData1,ReadData_1, WriteEnable, Reset, Clk);
nbit_reg #(32)	nb2( ReadData2,ReadData_2, WriteEnable, Reset, Clk);
nbit_reg #(32)	nb3({{16'b0000_0000_0000_0000},Instr_1[15:0]}, Imm, WriteEnable, Reset, Clk);
nbit_reg #(3)	nb4(Instr_1[28:26], ALUOp, WriteEnable, Reset, Clk);
nbit_reg #(1)	nb5(Instr_1[29], DataSrc, WriteEnable, Reset, Clk);
nbit_reg #(5)	nb6(Instr_1[25:21], WriteSelect_S2, WriteEnable, Reset, Clk);
	
		
endmodule

