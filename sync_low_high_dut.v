//Code by Shashank Shivashankar - 08/29/2020
//Synchronous active LOW reset and active HIGH enable D-flip flop

module dff3_dut(d, clk, rst, en, q);
input d, clk, rst, en;
output q;
wire d, clk, rst, en;
reg q;

always@(posedge clk)
begin
	if(rst == 0)
	begin
	q <= 0;
	end
	else
	begin
		if(en == 1)
		begin
		q <= d;
		end
		else
		begin
		q <= q;
		end
	end
end
endmodule
