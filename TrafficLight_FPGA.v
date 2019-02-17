// Traffic Signal on FPGA - Version 1 with rst // simulation
 
module TrafficSignal(p,clk,rst,green,red,yellow);
   
  output reg red,yellow,green;
  input p,clk,rst;
  reg [1:0] state,next_state;// S0,S1,S2;

  parameter green_S0 = 2'b00,  yellow_S1 = 2'b01, red_S2 = 2'b10, green_S1 = 2'b11;

always @(posedge clk or negedge rst)
begin
	if(!rst) //Active Low Reset : when reset is zero system goes to below deafult condition
	begin
		red = 1'b0;
		yellow = 1'b0;
		green = 1'b1;
		state = green_S0;
	end
	else

	begin
 		state = next_state; 
	end
end

always @(state or p)
begin

	case(state)
		green_S0 : if(p)
		begin
		green = 1;
		yellow = 0;
		red = 0;
		next_state = #30 yellow_S1; 
		end

		else
		begin
		green = 1;
		yellow = 0;
		red = 0;
		next_state = green_S0; 
 		end

		yellow_S1 : begin
		green = 0;
		yellow = 1;
		red = 0;
		next_state = #5 red_S2;
		end

		red_S2 : begin
		green = 0;
		yellow = 0;
		red = 1;
		next_state = #20 green_S0; 
		end

/*		green_S1 : if(!p)  //State required to automatically turn green after Red 
		begin
		green = 1;
		yellow = 0;
		red = 0;
		next_state = green_S1; 
		end
		else
		begin
		green = 1;
		yellow = 0;
		red = 0;
		next_state = green_S0;
		end*/
	endcase
	
end
endmodule

//********************************	Traffic Signal on FPGA Simulation	*************************************************************

module TrafficSignal_Simulation;

	wire red,yellow,green;
	reg p,clk, rst;
	reg [1:0] state,next_state;// S0,S1,S2;

TrafficSignal Inst1(p,clk,rst,green,red,yellow);

initial begin
   $dumpfile ("dump.vcd");
   $dumpvars (0);
   
	clk = 1'b0; 	
         rst = 1'b0;
	forever	#2.5 clk = ~clk;

 $finish;
end

 initial begin

	$monitor($time," p=%b, clk=%b , rst=%b ,state=%b, next_state=%b, red=%b, yellow=%b, green=%b", p,clk,rst,state,next_state,red,yellow,green);


        #10;
	p = 1'b0; rst = 1'b1;	#10;
	p = 1'b1; rst = 1'b1;	#20;
	p = 1'b0; rst = 1'b1;	#70;
	p = 1'b1; rst = 1'b1;	#10;
#80;
	
	
 $finish;
 end  

endmodule

//*****************************************************