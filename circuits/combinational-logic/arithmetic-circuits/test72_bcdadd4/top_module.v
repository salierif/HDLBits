module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]  cout1;
    bcd_fadd u1_bcd_fadd(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout1[0]),
        .sum(sum[3:0])
    );
    bcd_fadd u2_bcd_fadd(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(cout1[0]),
        .cout(cout1[1]),
        .sum(sum[7:4])
    );
    bcd_fadd u3_bcd_fadd(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(cout1[1]),
        .cout(cout1[2]),
        .sum(sum[11:8])
    );
    bcd_fadd u4_bcd_fadd(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(cout1[2]),
        .cout(cout1[3]),
        .sum(sum[15:12])
    );
    assign cout = cout1[3];
endmodule