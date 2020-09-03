module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    assign s = a + b;
    assign overflow = a[7] & b[7] & ~s[7] | ~a[7] & ~b[7] & s[7];
    /*
    2's-complement补码
    1's-complement反码
    */
endmodule