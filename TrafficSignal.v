fficSignal(p,clk,rst,green,red,yellow);
   
  output reg red,yellow,green;
  input p,clk,rst;
  reg [1:0] state,next_state;// S0,S1,S2;
  reg [7:0] counterVariable;
  reg control =0;	
  parameter green_S0 = 2'b00,  yellow_S1 = 2'b01, red_S2 = 2'b10, green_S1 = 2'b11;

always@(posedge clk)
begin
if(p & control)
counterVariable = counterVariable+1'b1;
end

always@(posedge p)
if(state == green_S0)
begin
control=1;
end


always @(posedge clk or negedge rst)
begin
	if(!rst) //Active Low Reset : when reset is zero system goes to below deafult condition
	begin
		red = 1'b0;
		yellow = 1'b0;
		green = 1'b1;
		state = green_S0;
		counterVariable = 0;
	end
end

always @(posedge clk)
begin

	case(state)
		green_S0 : if(counterVariable>8'hFF) //30 sec green to yellow
		begin
		//green = 1;
		//yellow = 0;
		//red =0;
		next_state = yellow_S1; 
		green = 0;
		yellow = 1;
		red = 0;
	        counterVariable=0;
		end

		yellow_S1 :if( counterVariable>8'hF) //5 sec yellow to red
		begin
		next_state = red_S2;
		green = 0;
		yellow = 0;
		red = 1;
                counterVariable=0;
		end

		red_S2 : if( counterVariable>8'hFFF) //45 sec red to green
		begin
		next_state =  green_S0; 
		red = 1'b0;
		yellow = 1'b0;
		green = 1'b1;
		control =0;
		counterVariable=0;
		end

	endcase
	
end
endmodule

