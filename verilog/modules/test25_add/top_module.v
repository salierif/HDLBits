module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire    lo_cout,hi_cout,hi_cin;
    wire    [15:0]  sum_lo,sum_hi;
    add16 add16_u1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_lo),
        .cout(lo_cout)
    );
    assign  hi_cin = lo_cout;
    add16 add16_u2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(hi_cin),
        .sum(sum_hi),
        .cout(hi_cout)
    );   
    assign sum = {sum_hi,sum_lo}; 
endmodule