module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] cout;
    generate
        genvar i;
        for(i=0;i<=3;i=i+1) begin:add
            if(i==0)	begin
                assign {cout[i],sum[i]} = x[i]+y[i];
            end
            else begin
                assign {cout[i],sum[i]} = x[i]+y[i]+cout[i-1];
            end
        end
    endgenerate
    assign sum[4] = cout[3];
    /*
    assign sum = x+y;
    */
endmodule