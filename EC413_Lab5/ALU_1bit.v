`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:58:35 10/07/2013 
// Design Name: 
// Module Name:    ALU_1bit 
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
module ALU_1bit(output result, cout, 
	input a,b, 						//two 1 bit inputs
	//three bits that make up ALUop
	input Operation,b_invert,cin	
    );
//XOR gate to use inverter. If 0 no change, if 1 change
	wire a_invert, b_out;
	XorGate	XG1(b_out,b,b_invert);	//this is the b_out used (for ADD/SUB)
//Circuit in ALU. Contains an NOT, AND, OR, and a 1-bit FA
	wire and_out, or_out, FA_sum, FA_carry;
	not			(a_invert, a)							//for the NOT operation
	and 			(and_out, a,b); 						//for the AND operation
	or 			(or_out, a,b);							//for the OR operation
	FullAdder	AS1(FA_sum,FA_carry,a,b,cin);		//For ADD and SUB
	
	
	
endmodule
