`timescale 1ns/1ps

module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] sel;

    wire [3:0] Y;

    alu4bit DUT (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y)
    );

    initial begin

        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        $monitor("Time=%0t sel=%b Y=%b",
                 $time, sel, Y);

        A = 4'b1010;
        B = 4'b0011;

        sel = 3'b000; #100;
        sel = 3'b001; #100;
        sel = 3'b010; #100;
        sel = 3'b011; #100;
        sel = 3'b100; #100;
        sel = 3'b101; #100;
        sel = 3'b110; #100;
        sel = 3'b111; #100;

        $finish;

    end

endmodule