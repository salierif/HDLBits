module top_module ( input a, 
                    input b, 
                    output out 
);
    mod_a mod_a_u1(
            .out(out),
            .in1(a),
            .in2(b)
    );
endmodule