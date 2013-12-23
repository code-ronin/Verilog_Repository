`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:49:53 10/03/2013
// Design Name:   TimedRCA_64bit
// Module Name:   C:/Users/Raymond Li/Documents/Verilog/EC413_Lab4/TEST_TimedRCA_64bit.v
// Project Name:  EC413_Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TimedRCA_64bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_TimedRCA_64bit;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg cin;

	// Outputs
	wire [63:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	TimedRCA_64bit uut (
		.sum(sum), 
		.cout(cout), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		a = 64'b 1111111111111111111111111111111111111111111111111111111111111111;
		b = 64'b 1;
		cin =0; #20;
		
		
		a = 64'h FFFFFFFFFFFFFFFF;
		b = 64'h FFFFFFFFFFFFFFFF;
		cin =0; #20;
	end
      
endmodule

