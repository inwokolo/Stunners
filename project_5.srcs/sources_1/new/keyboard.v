`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 06:42:03 PM
// Design Name: 
// Module Name: keyboard
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module keyboard

    (
	input wire clk, reset,
        input wire ps2d, ps2c,             
        output wire [7:0] scan_code,       
        output wire scan_code_ready,         
        output wire letter_case_out       
    );
	
    localparam  BREAK    = 8'hf0,
                SHIFT1   = 8'h12,
                SHIFT2   = 8'h59, 
                CAPS     = 8'h58;

    localparam [2:0] lowercase          = 3'b000,
                     ignore_break       = 3'b001,
                     shift              = 3'b010, 
                     ignore_shift_break = 3'b011,
		     capslock           = 3'b100, 
		     ignore_caps_break  = 3'b101; 
                     
               
   
    reg [2:0] state_reg, state_next;         
    wire [7:0] scan_out;              
    reg got_code_tick;                      
    wire scan_done_tick;                      
    reg letter_case;                          
    reg [7:0] shift_type_reg, shift_type_next;
    reg [1:0] caps_num_reg, caps_num_next;   
   
    
    ps2_rx ps2_rx_unit (.clk(clk), .reset(reset), .rx_en(1'b1), .ps2d(ps2d), .ps2c(ps2c), .rx_done_tick(scan_done_tick), .rx_data(scan_out));
	
	
    always @(posedge clk, posedge reset)
        if (reset)
			begin
			state_reg      <= lowercase;
			shift_type_reg <= 0;
			caps_num_reg   <= 0;
			end
        else
			begin    
                        state_reg      <= state_next;
			shift_type_reg <= shift_type_next;
			caps_num_reg   <= caps_num_next;
			end
			
   
    always @*
        begin
       
       
        got_code_tick   = 1'b0;
	letter_case     = 1'b0;
	caps_num_next   = caps_num_reg;
        shift_type_next = shift_type_reg;
        state_next      = state_reg;
       
        case(state_reg)
			
	  
            lowercase:
                begin  
                if(scan_done_tick)                                                                   
		    begin
		    if(scan_out == SHIFT1 || scan_out == SHIFT2)                                      
		        begin
			shift_type_next = scan_out;                                                 
			state_next = shift;                                                        
			end
					
		    else if(scan_out == CAPS)                                                     
		        begin
			caps_num_next = 2'b11;                                                      
			state_next = capslock;                                                  
			end

		    else if (scan_out == BREAK)                                                    
			state_next = ignore_break;                                                  
	 
		    else                                                                                
			got_code_tick = 1'b1;                                                      
		    end	
                end
            
	    
            ignore_break:
                begin
                if(scan_done_tick)                                                                 
                    state_next = lowercase;                                                        
                end
            

            shift:
                begin
                letter_case = 1'b1;                                                                   
               
                if(scan_done_tick)                                                                
			begin
			if(scan_out == BREAK)                                                                               
			    state_next = ignore_shift_break;                                             

			else if(scan_out != SHIFT1 && scan_out != SHIFT2 && scan_out != CAPS)     
			    got_code_tick = 1'b1;                                
			end
		end
				
	     ignore_shift_break:
	         begin
		 if(scan_done_tick)                                                  
		     begin
		     if(scan_out == shift_type_reg)                                   
		         state_next = lowercase;                                        
		     else                                                           
			 state_next = shift;
		     end
		 end  
				
	     capslock:
	         begin
		 letter_case = 1'b1;                                                           
					
		 if(caps_num_reg == 0)                                                           
		     state_next = lowercase;                                                  
						
		 if(scan_done_tick)                                                             
		     begin 
		     if(scan_out == CAPS)                                                      
		         caps_num_next = caps_num_reg - 1;                                         
						
		     else if(scan_out == BREAK)                                         
			 state_next = ignore_caps_break;
						
		     else if(scan_out != SHIFT1 && scan_out != SHIFT2)                            
			 got_code_tick = 1'b1;                                                  
		     end
		 end
				
		 ignore_caps_break:
		     begin
		     if(scan_done_tick)                                                             
		         begin
			 if(scan_out == CAPS)                                                       
			     caps_num_next = caps_num_reg - 1;                                      
			 state_next = capslock;                                                 
			 end
		     end
					
        endcase
        end
		
    assign letter_case_out = letter_case; 
	
    assign scan_code_ready = got_code_tick;
	
    assign scan_code = scan_out;
	
endmodule