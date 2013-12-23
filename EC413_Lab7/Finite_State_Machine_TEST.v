`timescale 1ns / 1ps


module Finite_State_Machine_TEST;

	// Inputs
	reg [5:0] in;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	Finite_State_Machine uut (
		.out(out), 
		.in(in), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	//Here lies the tests for the 5 different Opcodes that exist in the finite state machine
	#10;
	in = 6'b 100011;		//LW
	#100;
	in = 6'b 101011;		//SW
	#200;
	in = 6'b 000000;		//R-type
	#300;
	in = 6'b 000100;		//BEQ
	#400;
	in = 6'b 000010;		//J
	#500;
	end
	always begin
		#5 {clk} = {clk} +1;
	end
      
endmodule

