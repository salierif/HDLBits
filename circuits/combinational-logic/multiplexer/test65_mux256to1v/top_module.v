module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    assign out = {in[sel*4+3],in[sel*4+2],in[sel*4+1],in[sel*4]};
    /*
    assign out = in[sel * 4 +: 4];
    //这种写法是verilog 2001标准中新增加的，是向量部分选择的意思，
    //如果sel等于0，in[sel * 4 +: 4]代表从0开始向上数4位，
    //即in[3:0]，建议大家学习使用这种方法，
    //在sel位宽较大是可以有效减小工作量。
    */
endmodule