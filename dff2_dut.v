module dff2_dut(d, clk, rst, en, q);
input d, clk, rst, en;
output q;
wire d, clk, rst, en;
reg q;

always@(posedge clk or posedge rst)
begin
    if(rst == 1)
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
