`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:11:51 10/09/2013 
// Design Name: 
// Module Name:    FullSubtractor 
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
module FullSubtractor(output diff, bor_out, input a,b, bor_in
    );
//This is the 1 bit SUB function, using a full subtractor
//Full subtractor for a-b
	wire xor1;
	XorGate	XG1	(xor1,a,b);
	XorGate	XG2	(diff,bor_in,xor1); //Difference
//Bor_out calculations
	wire not_a, not_xor1, sum1, sum2;
	not	(not_a,a);
	not	(not_xor1,xor1);
	and	(sum1,not_a,b);
	and	(sum2,not_xor1,bor_in);
	or		(bor_out, sum1, sum2);

endmodule
