//Code by Shashank Shivashankar - 08/29/2020
//Test bench for sync_low_high_dut.v

`timescale 1ns/1ns

module dff3_tb();
reg d, clk, rst, en;
integer f;

//instantiating DUT
dff3_dut DUT(.d(d), .clk(clk), .rst(rst), .en(en), .q(q));

always #1 clk = ~clk; 
always #3.5 d = ~d;

initial 
begin
    f = $fopen("sync_low_high.txt");
    clk <= 0;
    rst <= 0; 
    d <= 0; #10;
    rst <= 1; #45;
    $finish; 
end

initial
begin
	en <= 0; #20
	en <= 1;
end

always@(posedge clk)
begin
$fmonitor(f,"At time %d ns, CLK = %b, RST = %b, EN = %b, D = %b, Q = %b", $time, clk, rst, en, d, q);
$display("At time %d ns, CLK = %b, RST = %b, EN = %b, D = %b, Q = %b", $time, clk, rst, en, d, q);
end
endmodule
