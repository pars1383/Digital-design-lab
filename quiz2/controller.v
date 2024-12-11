module controller(
		input clk,rst,Xinput,
		output reg Yout
		);

				
	parameter init = 3'd0,
	 		  s0 = 3'd1,
			  s1 = 3'd2,
		 	  s2 = 3'd3,
			  s3 = 3'd4,
			  s4 = 3'd5;
			  
	reg [2:0] ps, ns;
	
	always @(*)begin
		case(ps)
		init: ns = Xinput ? s0 :  init ;
		s0: ns = Xinput ? s0 : s1 ;
		s1: ns = Xinput ? s2 :  init ;
		s2: ns = Xinput ? s3 :  s1 ;
		s3: ns = Xinput ? s4 :  s1 ;
		s4: ns = Xinput ? s0 :  s1 ;
		default ns = init;
		endcase
	end

	always @(*)begin
		{Yout} = 1'b0;
		case(ps)
		s4: Yout = 1'b1;
		endcase
	end


	always @(posedge clk, posedge rst)begin
		if (rst)
			ps <= init;
		else if (clk)
			ps <= ns;
	end

endmodule