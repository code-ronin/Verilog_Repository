`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:32:35 10/09/2013 
// Design Name: 
// Module Name:    MOV_1bit 
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
module MOV_1bit(output result, input a
    );
//This is the 1 Bit MOV module
//To MOV, simply add 0 to the input, and return the input unchanged
	 wire c0;
	 FullAdder_1bit FA(result, c0, a,0,0);

endmodule
