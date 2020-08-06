module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire lo_cout,hi_cin;
    wire [31:0] bb;
    
    always @(*) begin
        case(sub)
            1'b0    : bb = b;
            1'b1    : bb = ~b;
            default : bb = 8'h0;       
        endcase
    end

    add16 add16_u1(
        .a(a[15:0]),
        .b(bb[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(lo_cout)
    );

    assign hi_cin = lo_cout;
    
    add16 add16_u2(
        .a(a[31:16]),
        .b(bb[31:16]),
        .cin(hi_cin),
        .sum(sum[31:16]),
        .cout()
    );
endmodule