`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:37 10/07/2013
// Design Name:   MUX_ALUop_Select
// Module Name:   C:/Users/Raymond Li/Documents/Verilog/EC413_Lab5/TEST_MUX_ALUop_Select.v
// Project Name:  EC413_Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_ALUop_Select
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_MUX_ALUop_Select;

	// Inputs
	reg aop2;
	reg aop1;
	reg aop0;

	// Outputs
	wire [6:0] select;

	// Instantiate the Unit Under Test (UUT)
	MUX_ALUop_Select uut (
		.select(select), 
		.aop2(aop2), 
		.aop1(aop1), 
		.aop0(aop0)
	);

	initial begin
		// Initialize Inputs
		aop2 = 0;
		aop1 = 0;
		aop0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always begin
	#1 {aop0, aop1, aop2}= {aop0, aop1, aop2}+1;
	end
      
endmodule

