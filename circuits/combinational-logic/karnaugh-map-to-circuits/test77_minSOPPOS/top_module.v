module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    //sop:sum of product   pos:product of sum
    assign out_sop = c & d | ~a & ~b & c; 
    assign out_pos = ~((~c)|(b & ~d)|(a & ~b)|(a & c & ~d));
    //assign out_pos = ~((~c | ~d) & (a | b | ~c)); 
    
endmodule