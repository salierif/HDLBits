module top_module (
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
/*
module add16 (
    input [15:0] a,
    input [15:0] b,
    input        cin,
    output[15:0] sum,
    output       cout
);
    wire cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8,cout9,cout10,cout11,cout12,cout13,cout14,cout15;
    wire cin1,cin2,cin3,cin4,cin5,cin6,cin7,cin8,cin9,cin10,cin11,cin12,cin13,cin14,cin15;
    assign cin1 = cout1;
    assign cin2 = cout2;
    assign cin3 = cout3;
    assign cin4 = cout4;
    assign cin5 = cout5;
    assign cin6 = cout6;
    assign cin7 = cout7;
    assign cin8 = cout8;
    assign cin9 = cout9;
    assign cin10 = cout10;
    assign cin11 = cout11;
    assign cin12 = cout12;
    assign cin13 = cout13;
    assign cin14 = cout14;
    assign cin15 = cout15;
    add1 add1_u1 ( a[0] , b[0] , cin , sum[0] , cou1);
    add1 add1_u2 ( a[1] , b[1] , cin1 , sum[1] , cout2);
    add1 add1_u3 ( a[2] , b[2] , cin2 , sum[2] , cou3);
    add1 add1_u4 ( a[3] , b[3] , cin3 , sum[3] , cou4);
    add1 add1_u5 ( a[4] , b[4] , cin4 , sum[4] , cou5);
    add1 add1_u6 ( a[5] , b[5] , cin5 , sum[5] , cou6);
    add1 add1_u7 ( a[6] , b[6] , cin6 , sum[6] , cou7);
    add1 add1_u8 ( a[7] , b[7] , cin7 , sum[7] , cou8);
    add1 add1_u9 ( a[8] , b[8] , cin8 , sum[8] , cou9);
    add1 add1_u10 ( a[9] , b[9] , cin9 , sum[9] , cou10);
    add1 add1_u11 ( a[10] , b[10] , cin10 , sum[10] , cou11);
    add1 add1_u12 ( a[11] , b[11] , cin11 , sum[11] , cou12);
    add1 add1_u13 ( a[12] , b[12] , cin12 , sum[12] , cou13);
    add1 add1_u14 ( a[13] , b[13] , cin13 , sum[13] , cou14);
    add1 add1_u15 ( a[14] , b[14] , cin14 , sum[14] , cou15);
    add1 add1_u16 ( a[15] , b[15] , cin15 , sum[15] , cout);
endmodule
*/
module add1 ( 
    input a, 
    input b, 
    input cin,   
    output sum, 
    output cout 
);
// Full adder module here
    assign sum = a ^ b ^ cin ;
    assign cout = a&b | a&cin | b&cin ;
endmodule