module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire    lo_cout,hi_cout,hi_cout1,hi_cout2;
    wire    [15:0]  sum_lo,sum_hi,sum_hi1,sum_hi2;
    add16 add16_u1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_lo),
        .cout(lo_cout)
    );
    add16 add16_u2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_hi1),
        .cout(hi_cout1)
    );
    add16 add16_u3(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_hi2),
        .cout(hi_cout2)
    );
    always @(*) begin
        case(lo_cout)
            1'b0    : sum_hi = sum_hi1;
            1'b1    : sum_hi = sum_hi2;
            default : sum_hi = 8'h0;
        endcase
    end
    assign sum = {sum_hi,sum_lo};
endmodule