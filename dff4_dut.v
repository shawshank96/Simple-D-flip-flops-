module dff4_dut(d, clk, rst, en, q);
input d, clk, rst, en;
output q;
wire d, clk, rst, en;
reg q;

always@(posedge clk or negedge rst)
begin
    if(rst == 0)
    begin
    q <= 0;
    end
    else
    begin
        if(en == 1)
        begin
            q <= q;
        end
        else
        begin
            q <= d;
        end
    end
end
endmodule
