`timescale 1ns / 1ps

//Finite State Machine from P & H
module Finite_State_Machine(out , in , clk, reset
    );
//INPUTS-------------------------------
input 	clk, reset;
input 	[5:0] in;	//OPcodes are 6 bits
//OUTPUTS------------------------------
output	reg [3:0] out;	//For 9 outputs
//OTHER-------------------------------
reg		[3:0] state;
reg		[3:0] next_state;
//CODE--------------------------------
	//Start at state 0
	initial begin
		state = 4'd0;
		next_state = 4'd0;
	end
	//Make the next state after every clock cycle
	always @ (posedge clk)
		state = next_state;
	//This helps display outputs for view on the simulation
	always @(state)
		begin 
			case (state)
				4'd0: out = 4'd0;
				4'd1: out = 4'd1;
				4'd2: out = 4'd2;
				4'd3: out = 4'd3;
				4'd4: out = 4'd4;
				4'd5: out = 4'd5;
				4'd6: out = 4'd6;
				4'd7: out = 4'd7;
				4'd8: out = 4'd8;
				4'd9: out = 4'd9;
			default: out = state;
		endcase
	end
		
	//Start state machine
	always @ (reset or state or in)
	begin
		if (reset)
			next_state = state;
		else
		case (state)
			4'd0: next_state = 4'd1;
			4'd1: if ((in == 6'b 100011) || (in == 6'b 101011))//LW and SW
						next_state = 4'd2;
					else if	(in == 6'b 000000)						//R-Type
						next_state = 4'd6;
					else if	(in == 6'b 000100)						//BEQ
						next_state = 4'd8;
					else if (in == 6'b 000010)							//J
						next_state = 4'd9;
					else
						next_state = state;
			4'd2: if	(in == 6'b 100011)			//LW
						next_state = 4'd3;	
					else if (in == 6'b 101011)		//SW
						next_state = 4'd5;
					else
						next_state = 4'd2;
			4'd3: next_state = 4'd4;
			4'd4: next_state = 4'd0;
			4'd5: next_state = 4'd0;
			4'd6: next_state = 4'd7;
			4'd7: next_state = 4'd0;
			4'd8: next_state = 4'd0;
			4'd9: next_state = 4'd0;
		endcase
		end
		
endmodule
