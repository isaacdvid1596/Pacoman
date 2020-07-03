/* verilator lint_off UNDRIVEN */
module FontRom (
    input clk,
    input [11:0] addr,
    output reg [7:0] dout
    );

    reg[7:0] memory[0:4095] /*verilator public*/;

    always @(posedge clk) begin
        dout <= memory[addr];
    end

`ifndef DIGITAL
    initial begin
        $readmemh("font_rom_pacman.mif", memory, 0, 4095);
`ifdef USE_VGA_SIM
        $initVGASimFontRom(memory);
`endif
    end
`endif

endmodule
