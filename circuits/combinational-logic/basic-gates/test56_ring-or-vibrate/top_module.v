module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always@(*)	begin
        if (vibrate_mode)	begin
            ringer = 1'b0;
        	motor = ring;
        end
        else	begin
            ringer = ring;
            motor = 1'b0;
        end
    end
    /* 
    assign ringer = ring & ~vibrate_mode;
	assign motor = ring & vibrate_mode;
    */
endmodule