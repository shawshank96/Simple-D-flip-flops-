`timescale 1ns/1ns

module dff2_tb();
reg d, clk, rst, en;
integer f;

//instantiating DUT
dff2_dut DUT(.d(d), .clk(clk), .rst(rst), .en(en), .q(q));

always #1 clk = ~clk; 
always #3 d = ~d;

initial 
begin
    f = $fopen("async_high_high.txt");
    clk <= 0;
    rst <= 1; 
    d <= 0; 
    en <= 1; #10;
    rst <= 0; #45;
    $finish; 
end

always@(posedge clk)
begin
$fmonitor(f,"At time %d ns, CLK = %b, RST = %b, EN = %b, D = %b, Q = %b", $time, clk, rst, en, d, q);
$display("At time %d ns, CLK = %b, RST = %b, EN = %b, D = %b, Q = %b", $time, clk, rst, en, d, q);
end
endmodule
