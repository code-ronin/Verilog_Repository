`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:15 10/03/2013 
// Design Name: 
// Module Name:    CSA_64bit 
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
module CSA_64bit(output [63:0] sum, output new_select, input [63:0] a,b, input cin
    );
	 
	wire c0, ns0, ns1, ns2, ns3;
	//Start off with 4 bit RCA (total 4)
	RCA_4bit FBR0 (sum [3:0], c0, a[3:0], b[3:0],cin);
	//Attach 32 bit CSA (total 36 bits)
	CSA_32bit CSA1 (sum[35:4], ns0,a[35:4], b[35:4], c0);
	//Attach 16 bit CSA (total 52 bits)
	CSA_16bit CSA2 (sum[51:36], ns1, a[51:36], b[51:36], ns0);
	//Attach 8 bit CSA (total 60 bits)
	CSA_8bit CSA3 (sum[59:52], ns2, a[59:52], b[59:52], ns1);
	//Attach 4 bit CSA (total 64 bits)
	CSA_4bit CSA4 (sum[63:60], new_select, a[63:60], b[63:60], ns2);
endmodule

module CSA_32bit(output [31:0] sum, output new_select, input [31:0] a,b, input select
    );

	wire ns0;
	//Use two sixteen bit CSAs
	CSA_16bit A0(sum[15:0], ns0, a[15:0], b[15:0],select);
	CSA_16bit A1(sum[31:16], new_select, a[31:16], b[31:16], ns0);
endmodule

module CSA_16bit(output [15:0] sum, output new_select, input [15:0] a,b, input select
    );

	wire ns0;
	//Use two eight bit CSAs
	CSA_8bit A0(sum[7:0], ns0, a[7:0], b[7:0],select);
	CSA_8bit A1(sum[15:8], new_select, a[15:8], b[15:8], ns0);

endmodule


module CSA_8bit(output [7:0] sum, output new_select, input [7:0] a,b, input select
    );

	wire ns0;
	//Use two four bit CSAs
	CSA_4bit A0(sum[3:0], ns0, a[3:0], b[3:0],select);
	CSA_4bit A1(sum[7:4], new_select, a[7:4], b[7:4], ns0);
endmodule

module CSA_4bit(output [3:0] sum, output new_select, input [3:0] a, b, input select
    );
	reg x = 0;				//cin for low order sum
	reg y = 1;				//cin for high order sum
	wire [3:0] s0, s1;	//low and high order sums
	wire out0,out1;		//low and high order carry outs
	
	RCA_4bit Low (s0 [3:0] ,out0, a[3:0] , b[3:0] , x);				//Calculate High Order Sum
	RCA_4bit High(s1 [3:0] ,out1, a[3:0] , b[3:0] , y);				//Calculate Low Order Sum
	MUX_4bit Result0 (sum[3:0] , s0[3:0] , s1[3:0] , select);		//Choose Correct Sum
	MUX_Select NS0 (new_select, out0, out1, select);					//Choose new select
	
endmodule

module MUX_Select(output select, input c0, c1,cout
    );
	 //This module chooses the next select for the next CSA
	 wire w0;
	 and 	(w0, c1, cout);
	 or 	(select, w0,c0); //New select here

endmodule

module MUX_4bit(output [3:0] result, input [3:0] input_0, input_1, input select_1
    );
	//This is the 4 bit 1-2 Mux
	//Same Logic behind 1 bit 1-2 Mux, except used to control 4 different bits
	MUX_1bit M1B0(result [0],input_0[0], input_1[0], select_1);
	MUX_1bit M1B1(result [1],input_0[1], input_1[1], select_1);
	MUX_1bit M1B2(result [2],input_0[2], input_1[2], select_1);
	MUX_1bit M1B3(result [3],input_0[3], input_1[3], select_1);

endmodule

module MUX_1bit(output result, input input_0, input_1, select_1
    );
	 //This is a 1 bit 1-2 Mux
	 //Chooses High Order or Low Order bits
	 wire w0, w1, select_0;
	 
	 not (select_0, select_1);			//negate the input select_1 
	 and (w0, input_0, select_0);		//Low order output
	 and (w1, input_1, select_1);		//High order output 
	 or (result, w0, w1);				//This will give the correct select output

endmodule

