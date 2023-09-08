module tt_um_rs_write_decodifier_fjrn_cinvestav (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches for clk_selector and pattern_sel
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 LEDs
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled, not used circuit can be turned off when pattern_sel = 0
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


wire [11:0] in_RS_connector;
wire [11:0] out_RS_connector;

assign uio_out[3:0] = 0;

assign in_RS_connector = {uio_in[3:0], ui_in};

assign uo_out = out_RS_connector[7:0];
assign uio_out[7:4] = out_RS_connector[11:8];
assign uio_oe = 8'b1111_0000;
    
rs_write_decodifier RSX // 12 bit
(
.in_RS_write(in_RS_connector),
.out_RS_write(out_RS_connector)
);

endmodule
