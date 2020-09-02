module top_module( 
    input [2:0] in,
    output [1:0] out );

    reg [1:0] out_temp;
    integer i;
    
    always@(*)begin
        out_temp = 2'd0;
        for(i = 0; i <= 2; i = i + 1)begin
            out_temp = out_temp + in[i];
        end
    end
    
    assign out = out_temp;
endmodule