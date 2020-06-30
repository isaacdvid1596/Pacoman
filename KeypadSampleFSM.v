module KeypadSampleFSM(
    input clk,
    input rst,
    input [31:0] timer,
    input [7:0] keypad,
    output reg [11:0] vga_addr,
    output reg vga_we,
    output reg [15:0] vga_data
);
    reg [5:0] cs /*verilator public*/; // Current state
    reg [5:0] ns; // Next state

    reg [6:0] row /*verilator public*/; // Current row
    reg [6:0] col /*verilator public*/; // Current col

    reg [11:0] vga_addr_reg /*verilator public*/; // VGA address
    reg [31:0] delay; // Used for delay

    assign vga_addr = vga_addr_reg;

  
    // VGA Write Enable
        always @ (*) begin
        case(cs)
        6'd0:  vga_we = 1'd0;
        6'd1:  vga_we = 1'd0;
        6'd2:  vga_we = 1'd1;
        6'd3:  vga_we = 1'd0;
        6'd4:  vga_we = 1'd1;
        6'd5:  vga_we = 1'd0;
        6'd6:  vga_we = 1'd1;
        6'd7:  vga_we = 1'd0;
        6'd8:  vga_we = 1'd1;
        6'd9:  vga_we = 1'd1;

        6'd10: vga_we = 1'd0;
        6'd11: vga_we = 1'd0;
        6'd12: vga_we = 1'd1;
        6'd13: vga_we = 1'd0;
        6'd14: vga_we = 1'd1;
        6'd15: vga_we = 1'd0;
        6'd16: vga_we = 1'd0;
        6'd17: vga_we = 1'd0;
        
        6'd18: vga_we = 1'd0;
        6'd19: vga_we = 1'd0;
        6'd20: vga_we = 1'd1;
        6'd21: vga_we = 1'd0;
        6'd22: vga_we = 1'd1;
        6'd23: vga_we = 1'd0;
        6'd24: vga_we = 1'd0;
        6'd25: vga_we = 1'd0;

        6'd26: vga_we = 1'd1;
        6'd27: vga_we = 1'd0;
        6'd28: vga_we = 1'd1;
        6'd29: vga_we = 1'd0;
        6'd30: vga_we = 1'd1;
        6'd31: vga_we = 1'd0;
        6'd32: vga_we = 1'd0;
        6'd33: vga_we = 1'd0;

        6'd34: vga_we = 1'd1;
        6'd35: vga_we = 1'd0;
        6'd36: vga_we = 1'd1;
        6'd37: vga_we = 1'd0;
        6'd38: vga_we = 1'd1;
        6'd39: vga_we = 1'd0;
        6'd40: vga_we = 1'd0;
        6'd41: vga_we = 1'd0;

        6'd42: vga_we = 1'd0;
        6'd43: vga_we = 1'd0;
        6'd44: vga_we = 1'd1;
        6'd45: vga_we = 1'd0;
        6'd46: vga_we = 1'd0;
        6'd47: vga_we = 1'd1;

        // 6'd42: vga_we = 1'd0;
        // 6'd43: vga_we = 1'd0;
        // 6'd44: vga_we = 1'd1;
        // 6'd45: vga_we = 1'd0;
        // 6'd46: vga_we = 1'd0;
        // 6'd47: vga_we = 1'd1;

        6'd48: vga_we = 1'd0;
        6'd49: vga_we = 1'd0;
        6'd50: vga_we = 1'd1;
        6'd51: vga_we = 1'd0;
        6'd52: vga_we = 1'd0;
        6'd53: vga_we = 1'd1;

        


        default:
        vga_we = 1'd0;

        endcase
    end

    // VGA data
        always @ (*)begin
        case(cs)
        6'd0: 
        vga_data =  16'hx;

        6'd1: 
        vga_data =  16'hx;

        6'd2:
        vga_data =  16'h0e01;

        6'd3:
        vga_data =  16'h0e02;

        6'd4:
        vga_data =  16'h0e02;

        6'd5:
        vga_data =  16'hx;

        6'd6:
        vga_data =  16'hx;

        6'd7:
        vga_data =  16'hx;

        6'd8:
        vga_data =  16'h0e02;

        6'd9:
        vga_data =  16'h0e02;

        6'd10:
        vga_data =  16'hx;

        6'd11:
        vga_data =  16'h0e01;

        6'd12:
        vga_data =  16'h0e01;

        6'd13:
        vga_data =  16'h0e02;

        6'd14:
        vga_data =  16'h0e02;

        6'd15:
        vga_data =  16'hx;

        6'd16:
        vga_data =  16'hx;

        6'd17:
        vga_data =  16'hx;

        6'd18:
        vga_data =  16'hx;

        6'd19:
        vga_data =  16'h0e04;

        6'd20:
        vga_data =  16'h0e04;

        6'd21:
        vga_data =  16'h0e03;

        6'd22:
        vga_data =  16'h0e03;

        6'd23:
        vga_data =  16'hx;

        6'd24:
        vga_data =  16'hx;

        6'd25:
        vga_data =  16'hx;

        6'd26:
        vga_data =  16'h0e07;

        6'd27:
        vga_data =  16'h0e08;

        6'd28:
        vga_data =  16'h0e08;

        6'd29:
        vga_data =  16'h0e07;

        6'd30:
        vga_data =  16'h0e07;

        6'd31:
        vga_data =  16'hx;

        6'd32:
        vga_data =  16'hx;

        6'd33:
        vga_data =  16'hx;

        6'd34:
        vga_data =  16'h0e06;

        6'd35:
        vga_data =  16'h0e05;

        6'd36:
        vga_data =  16'h0e05;

        6'd37:
        vga_data =  16'h0e06;

        6'd38:
        vga_data =  16'h0e06;

        6'd39:
        vga_data =  16'hx;

        6'd40:
        vga_data =  16'hx;

        6'd41:
        vga_data =  16'hx;

        6'd42:
        vga_data =  16'h0001;

        6'd43:
        vga_data =  16'h0001;

        6'd44:
        vga_data =  16'h0001;

        6'd45:
        vga_data =  16'h0002;

        6'd46:
        vga_data =  16'h0002;

        6'd47:
        vga_data =  16'h0002;



        6'd48:
        vga_data =  16'h0003;

        6'd49:
        vga_data =  16'h0003;

        6'd50:
        vga_data =  16'h0003;

        6'd51:
        vga_data =  16'h0004;

        6'd52:
        vga_data =  16'h0004;

        6'd53:
        vga_data =  16'h0004;

        
        default:begin
        vga_data  = 16'hx;
        end
        endcase        

    end    




    // Next state
   
    always @ (*) begin
        
        case (cs)

        6'd0: ns = 6'd1;
        6'd1: ns = 6'd2;
        6'd2: ns = 6'd3;
        6'd3: ns = 6'd4;
        6'd4: ns = 6'd5;
        
        6'd5: 
        begin
            if(keypad[0])
            ns = 6'd48;
            else if(keypad[1])
            ns = 6'd42;
            else if(keypad[2])
            ns = 6'd8;
            else if(keypad[3])
            ns = 6'd9;
            else 
            ns = 6'd5;
        end

        //izquierda
        6'd48:  ns = 6'd49;
        6'd49:  ns = 6'd50;
        6'd50:  ns = 6'd51;
        6'd51:  ns = 6'd52;
        6'd52:  ns = 6'd53;
        6'd53:  ns = 6'd6;
        6'd6: ns = (col > 2)? 6'd18 : 6'd23;
        //true
        6'd18: ns = 6'd19;
        6'd19: ns = 6'd20;
        6'd20: ns = 6'd21;
        6'd21: ns = 6'd22;
        6'd22: ns = 6'd5;
        //false
        6'd23: ns = (row<28)? 6'd24 : 6'd25;
        6'd24: ns = 6'd18;
        6'd25: ns = 6'd18;


        //derecha
        6'd42:  ns = 6'd43;
        6'd43:  ns = 6'd44;
        6'd44:  ns = 6'd45;
        6'd45:  ns = 6'd46;
        6'd46:  ns = 6'd47;
        6'd47:  ns = 6'd7;
        6'd7:  ns = (col<78)? 6'd10 : 6'd15;
        //true
        6'd10: ns = 6'd11;
        6'd11: ns = 6'd12;
        6'd12: ns = 6'd13;
        6'd13: ns = 6'd14;
        6'd14: ns = 6'd5;
        //false
        6'd15: ns = (row<28)? 6'd16 : 6'd17;
        6'd16: ns = 6'd10;
        6'd17: ns = 6'd10;



        //abajo
        6'd8:  ns = (row<28)? 6'd26 : 6'd31;
        //true
        6'd26: ns = 6'd27;
        6'd27: ns = 6'd28;
        6'd28: ns = 6'd29;
        6'd29: ns = 6'd30;
        6'd30: ns = 6'd5;
        //false
        6'd31: ns = (col>2)? 6'd32 : 6'd33;
        6'd32: ns = 6'd26;
        6'd33: ns = 6'd26;

        //arriba
        6'd9:  ns = (row>2)? 6'd34 : 6'd39;
        //true
        6'd34: ns = 6'd35;
        6'd35: ns = 6'd36;
        6'd36: ns = 6'd37;
        6'd37: ns = 6'd38;
        6'd38: ns = 6'd5;
        //false
        6'd39: ns = (col<78)? 6'd40 : 6'd41;
        6'd40: ns = 6'd34;
        6'd41: ns = 6'd34;

        default:
        ns = 6'd0; 

        endcase

    end    

    always @ (posedge clk)
    begin
        if (rst)
            cs <= 6'd0;
        else
            cs <= ns;
    end

    // Register col
    always @ (posedge clk)
    begin
        case (cs)
            6'd0:  col <= 7'd10;
            6'd2:  col <= col + 7'd1;
            6'd10: col <= col + 7'd1;
            6'd12: col <= col + 7'd1;
            6'd15: col <= 7'd0;
            6'd18: col <= col - 7'd1;
            6'd20: col <= col - 7'd1;
            6'd23: col <= 7'd78;
            6'd28: col <= col - 7'd1;
            6'd32: col <= col - 7'd1;
            6'd33: col <= 7'd78;
            6'd36: col <= col + 7'd1;
            6'd40: col <= col + 7'd1;
            6'd41: col <= 7'd1;
            6'd42: col <= col - 7'd1;
            6'd45: col <= col + 7'd1;
            6'd48: col <= col + 7'd1;
            6'd51: col <= col - 7'd1;
            default:
                col <= col;
        endcase
    end

    // Register row
    always @ (posedge clk)
    begin
        case (cs)
            6'd0:  row <= 7'd10;
            6'd16: row <= row + 7'd1;
            6'd17: row <= 7'd0;
            6'd24: row <= row + 7'd1;
            6'd25: row <= 7'd0;
            6'd26: row <= row + 7'd1;
            6'd31: row <= 7'd0;
            6'd34: row <= row - 7'd1;
            6'd39: row <= 7'd28;

            default:
                row <= row;
        endcase
    end

    // Register delay
    always @ (posedge clk)
    begin
        if (cs == 6'd3)
            delay <= timer + 32'd100;
    end

      // Register vga_addr
    always @ (posedge clk)
    begin

    
        if (cs == 6'd1)
            /*verilator lint_off WIDTH*/
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd3)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd11)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd13)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd19)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd21)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd27)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd29)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd35)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd37)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd43)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd46 )
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd49)
            vga_addr_reg <= row * 7'd80 + col;

        if (cs == 6'd52)
            vga_addr_reg <= row * 7'd80 + col;
    
    end


    // //generate maze

    // always @ (*) begin

    




    // end
    


    

endmodule