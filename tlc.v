module tlc(red, yellow, green, clk, rst);

input clk, rst;
output reg [0:3] red, yellow, green;

reg [0:5] pstate, nstate;

always @ (posedge clk or negedge rst)
begin
	if (!rst)
	begin
		red = 4'b1111;
		yellow = 4'b0000;
		green = 4'b0000;
		pstate = 6'b000000;
	end
	else
	begin
        pstate = nstate;
	end
end

always @ (pstate)
begin
    case (pstate)
        6'b000000 : begin                                   //0sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000001;
                    end
        6'b000001 : begin                                   //5sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000010;
                    end
        6'b000010 : begin                                   //10sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000011;
                    end
        6'b000011 : begin                                   //15sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000100;
                    end
        6'b000100 : begin                                     //20sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000101;
                    end
        6'b000101 : begin                                     //25sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000110;
                    end
        6'b000110 : begin                                   //30sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b000111;
                    end
        6'b000111 : begin                                   //35sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001000;
                    end
        6'b001000 : begin                                   //40sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001001;
                    end
        6'b001001 : begin                                   //45sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001010;
                    end
        6'b001010 : begin                                   //50sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001011;
                    end
        6'b001011 : begin                                   //55sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001100;
                    end
        6'b001100 : begin                                   //1min
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001101;
                    end
        6'b001101 : begin                                   //1min 5sec
                        red = 4'b1010;
                        yellow = 4'b0000;
                        green = 4'b0101;
                        nstate = 6'b001110;
                    end
                    
        6'b001110 : begin                                   //1min 10sec
                        red = 4'b1010;
                        yellow = 4'b0001;
                        green = 4'b0100;
                        nstate = 6'b001111;
                    end
        
        6'b001111 : begin                                   //1min 15sec
                        red = 4'b1001;
                        yellow = 4'b0000;
                        green = 4'b0110;
                        nstate = 6'b010000;
                    end
        6'b010000 : begin                                   //1min 20sec
                        red = 4'b1001;
                        yellow = 4'b0000;
                        green = 4'b0110;
                        nstate = 6'b010001;
                    end
                    
        6'b010001 : begin                                   //1min 25sec
                        red = 4'b1001;
                        yellow = 4'b0100;
                        green = 4'b0010;
                        nstate = 6'b010010;
                    end
        
        6'b010010 : begin                                   //1min 30sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b010011;
                    end
        6'b010011 : begin                                   //1min 35sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b010100;
                    end
        6'b010100 : begin                                   //1min 40sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b010101;
                    end
        6'b010101 : begin                                   //1min 45sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b010110;
                    end
        6'b010110 : begin                                   //1min 50sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b010111;
                    end
        6'b010111 : begin                                   //1min 55sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011000;
                    end
        6'b011000 : begin                                   //2min 00sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011001;
                    end
        6'b011001 : begin                                   //2min 5sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011010;
                    end
        6'b011010 : begin                                   //2min 10sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011011;
                    end
        6'b011011 : begin                                   //2min 15sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011100;
                    end
        6'b011100 : begin                                   //2min 20sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011101;
                    end
        6'b011101 : begin                                   //2min 25sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011110;
                    end
        6'b011110 : begin                                   //2min 30sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b011111;
                    end
        6'b011111 : begin                                   //2min 35sec
                        red = 4'b0101;
                        yellow = 4'b0000;
                        green = 4'b1010;
                        nstate = 6'b100000;
                    end
                    
        6'b100000 : begin                                   //2min 40sec
                        red = 4'b0101;
                        yellow = 4'b1000;
                        green = 4'b0010;
                        nstate = 6'b100001;
                    end
                    
        6'b100001 : begin                                   //2min 45sec
                        red = 4'b1001;
                        yellow = 4'b0000;
                        green = 4'b0110;
                        nstate = 6'b100010;
                    end
        6'b100010 : begin                                   //2min 50sec
                        red = 4'b1001;
                        yellow = 4'b0000;
                        green = 4'b0110;
                        nstate = 6'b100011;
                    end
                    
        6'b100011 : begin                                   //2min 55sec
                        red = 4'b1001;
                        yellow = 4'b0010;
                        green = 4'b0100;
                        nstate = 6'b000000;
                    end
        
        default : begin
                        red = 4'b1111;
                        yellow = 4'b0000;
                        green = 4'b0000;
                        nstate = 6'b000000;
                  end
    endcase
end

endmodule
