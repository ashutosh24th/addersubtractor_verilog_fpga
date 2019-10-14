`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2018 16:51:50
// Design Name: 
// Module Name: addsub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module addsub(
    input [3:0] A,          //input of 4 bits
    input [3:0] B,          // 2nd input of 4 bits(B<A if sub)
    input Cin,              // carry in to specify add/sub-->(1=sub and 0=add)
	output [3:0] C,        // Final output of 4 bits
	output cout            // carry out
    );
	wire c1,c2,c3;
	wire k0,k1,k2,k3;
	assign k0=B[0]*(Cin)' + (B[0])'.Cin;
	assign k1=B[1]^Cin;
	assign k2=B[2]^Cin;
	assign k3=B[3]^Cin;
	
	fulladder f1(.A(A[0]),.B(k0),.Cin(Cin),.Sum(C[0]),.Cout(c1));
	fulladder f2(.A(A[1]),.B(k1),.Cin(c1),.Sum(C[1]),.Cout(c2));
	fulladder f3(.A(A[2]),.B(k2),.Cin(c2),.Sum(C[2]),.Cout(c3));
	fulladder f4(.A(A[3]),.B(k3),.Cin(c3),.Sum(C[3]),.Cout(cout));
endmodule

