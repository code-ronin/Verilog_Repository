`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:16 10/03/2013 
// Design Name: 
// Module Name:    TimedCSA_64bit 
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
`define D	1		// define the delay
module TimedCSA_64bit(output [63:0] sum, output new_select, input [63:0] a,b, input cin
    );
	 
	wire c0, ns0, ns1, ns2, ns3;
	//Start off with 4 bit RCA (total 4)
	TimedRCA_4bit FBR0 (sum [3:0], c0, a[3:0], b[3:0],cin);
	//Attach 32 bit CSA (total 36 bits)
	TimedCSA_32bit CSA1 (sum[35:4], ns0,a[35:4], b[35:4], c0);
	//Attach 16 bit CSA (total 52 bits)
	TimedCSA_16bit CSA2 (sum[51:36], ns1, a[51:36], b[51:36], ns0);
	//Attach 8 bit CSA (total 60 bits)
	TimedCSA_8bit CSA3 (sum[59:52], ns2, a[59:52], b[59:52], ns1);
	//Attach 4 bit CSA (total 64 bits)
	TimedCSA_4bit CSA4 (sum[63:60], new_select, a[63:60], b[63:60], ns2);
endmodule

module TimedCSA_32bit(output [31:0] sum, output new_select, input [31:0] a,b, input select
    );

	wire ns0;
	//Use two sixteen bit CSAs
	TimedCSA_16bit A0(sum[15:0], ns0, a[15:0], b[15:0],select);
	TimedCSA_16bit A1(sum[31:16], new_select, a[31:16], b[31:16], ns0);
endmodule

module TimedCSA_16bit(output [15:0] sum, output new_select, input [15:0] a,b, input select
    );

	wire ns0;
	//Use two eight bit CSAs
	TimedCSA_8bit A0(sum[7:0], ns0, a[7:0], b[7:0],select);
	TimedCSA_8bit A1(sum[15:8], new_select, a[15:8], b[15:8], ns0);

endmodule


module TimedCSA_8bit(output [7:0] sum, output new_select, input [7:0] a,b, input select
    );

	wire ns0;
	//Use two four bit CSAs
	TimedCSA_4bit A0(sum[3:0], ns0, a[3:0], b[3:0],select);
	TimedCSA_4bit A1(sum[7:4], new_select, a[7:4], b[7:4], ns0);
endmodule

module TimedCSA_4bit(output [3:0] sum, output new_select, input [3:0] a, b, input select
    );
	reg x = 0;				//cin for low order sum
	reg y = 1;				//cin for high order sum
	wire [3:0] s0, s1;	//low and high order sums
	wire out0,out1;		//low and high order carry outs
	
	TimedRCA_4bit Low (s0 [3:0] ,out0, a[3:0] , b[3:0] , x);				//Calculate High Order Sum
	TimedRCA_4bit High(s1 [3:0] ,out1, a[3:0] , b[3:0] , y);				//Calculate Low Order Sum
	MUX_4bit Result0 (sum[3:0] , s0[3:0] , s1[3:0] , select);		//Choose Correct Sum
	MUX_Select NS0 (new_select, out0, out1, select);						//Choose new select
	
endmodule
