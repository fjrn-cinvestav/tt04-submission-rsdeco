module rs_write_decodifier
(
input [11:0] in_RS_write,
output [11:0] out_RS_write
);

genvar i;
generate
	for (i=0;i<12;i++)
		begin: CASCADE_GENERATOR
			if(i==0) assign out_RS_write[i] = ~in_RS_write[i];
			else assign out_RS_write[i] = (~in_RS_write[i] && (&in_RS_write[i-1:0]));
		end
endgenerate

endmodule 
