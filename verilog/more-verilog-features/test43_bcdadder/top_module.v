module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum 
);
    wire [99:0] coutinside;
    generate
        genvar i;
        for (i=0;i<=99;i=i+1) begin:bcdadder
            if(i==0)begin
                bcd_fadd u0_bcdfadd(
                    .a(a[i*4+3:i*4]),
                    .b(b[i*4+3:i*4]),
                    .cin(cin),
                    .cout(coutinside[i]),
                    .sum(sum[i*4+3:i*4])
                );
            end
            else begin
                bcd_fadd ux_bcdfadd(
                    .a(a[i*4+3:i*4]),
                    .b(b[i*4+3:i*4]),
                    .cin(coutinside[i-1]),
                    .cout(coutinside[i]),
                    .sum(sum[i*4+3:i*4])
                );
            end
        end
        assign cout=coutinside[99];
    endgenerate
endmodule