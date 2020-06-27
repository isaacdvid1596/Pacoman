module KeypadSampleFSM(
    input clk,
    input rst,
    input [31:0] timer,
    input [7:0] keypad,
    output reg [11:0] vga_addr,
    output reg vga_we,
    output reg [15:0] vga_data
);
    reg [4:0] cs /*verilator public*/; // Current state
    reg [4:0] ns; // Next state

    reg [6:0] row /*verilator public*/; // Current row
    reg [6:0] col /*verilator public*/; // Current col

    reg [11:0] vga_addr_reg /*verilator public*/; // VGA address
    reg [31:0] delay; // Used for delay

    assign vga_addr = vga_addr_reg;

  
    // VGA Write Enable
        always @ (*) begin
        case(cs)
        5'd0:  vga_we = 1'd0;
        5'd1:  vga_we = 1'd0;
        5'd2:  vga_we = 1'd1;
        5'd3:  vga_we = 1'd0;
        5'd4:  vga_we = 1'd1;
        5'd5:  vga_we = 1'd0;
        5'd6:  vga_we = 1'd0;
        5'd7:  vga_we = 1'd0;
        5'd8:  vga_we = 1'd1;
        5'd9:  vga_we = 1'd1;
        5'd10: vga_we = 1'd0;
        5'd11: vga_we = 1'd0;
        5'd12: vga_we = 1'd1;
        5'd13: vga_we = 1'd0;
        5'd14: vga_we = 1'd1;
        5'd15: vga_we = 1'd0;
        5'd16: vga_we = 1'd0;
        5'd17: vga_we = 1'd0;

        default:
        vga_we = 1'd0;

        endcase
    end

    // VGA data
        always @ (*)begin
        case(cs)
        5'd0: 
        vga_data =  16'hx;
        5'd1: 
        vga_data =  16'hx;
        5'd2:
        vga_data =  16'h0e01;
        5'd3:
        vga_data =  16'h0e02;
        5'd4:
        vga_data =  16'h0e02;
        5'd5:
        vga_data =  16'hx;
        5'd6:
        vga_data =  16'hx;
        5'd7:
        vga_data =  16'hx;
        5'd8:
        vga_data =  16'h0e02;
        5'd9:
        vga_data =  16'h0e02;
        5'd10:
        vga_data =  16'hx;
        5'd11:
        vga_data =  16'h0e01;
        5'd12:
        vga_data =  16'h0e01;
        5'd13:
        vga_data =  16'h0e02;
        5'd14:
        vga_data =  16'h0e02;
        5'd15:
        vga_data =  16'hx;
        5'd16:
        vga_data =  16'hx;
        5'd17:
        vga_data =  16'hx;
        default:begin
        vga_data  = 16'hx;
        end
        endcase        

    end    




    // Next state
   
    always @ (*) begin
        
        case (cs)

        5'd0: ns = 5'd1;
        5'd1: ns = 5'd2;
        5'd2: ns = 5'd3;
        5'd3: ns = 5'd4;
        5'd4: ns = 5'd5;
        
        5'd5: 
        begin
            if(keypad[0])
            ns = 5'd6;
            else if(keypad[1])
            ns = 5'd7;
            else if(keypad[2])
            ns = 5'd8;
            else if(keypad[3])
            ns = 5'd9;
            else 
            ns = 5'd5;
        end

        //izquierda
        5'd6: ns = 5'd6;


        //derecha
        5'd7:  ns = (col<78)? 5'd10 : 5'd15;
        //true
        5'd10: ns = 5'd11;
        5'd11: ns = 5'd12;
        5'd12: ns = 5'd13;
        5'd13: ns = 5'd14;
        5'd14: ns = 5'd5;
        //false
        5'd15: ns = (row<28)? 5'd16 : 5'd17;
        5'd16: ns = 5'd10;
        5'd17: ns = 5'd10;

        //abajo
        5'd8: ns = 5'd8;

        //arriba
        5'd9: ns = 5'd9;

        default:
        ns = 5'd0; 

        endcase

    end    

    always @ (posedge clk)
    begin
        if (rst)
            cs <= 5'd0;
        else
            cs <= ns;
    end

    // Register col
    always @ (posedge clk)
    begin
        case (cs)
            5'd0:  col <= 7'd10;
            5'd2:  col <= col + 7'd1;
            5'd10: col <= col + 7'd1;
            5'd12: col <= col + 7'd1;
            5'd15: col <= 7'd0;
            default:
                col <= col;
        endcase
    end

    // Register row
    always @ (posedge clk)
    begin
        case (cs)
            5'd0:  row <= 7'd10;
            5'd16: row <= row + 7'd1;
            5'd17: row <= 7'd0;

            default:
                row <= row;
        endcase
    end

    // Register delay
    always @ (posedge clk)
    begin
        if (cs == 5'd3)
            delay <= timer + 32'd100;
    end

      // Register vga_addr
    always @ (posedge clk)
    begin

    
        if (cs == 5'd1)
            /*verilator lint_off WIDTH*/
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 5'd3)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 5'd11)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 5'd13)
            vga_addr_reg <= row * 7'd80 + col;



    
    end


    


    

endmodule