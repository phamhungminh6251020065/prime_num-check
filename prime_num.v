module prime_num(a,y);
  input [7:0] a;    // Input 8-bit number
  output reg y;     // Output indicating if the number is prime

  integer i;        // Variable for the loop
  
  always @(a) begin
    if (a < 2) begin
      y = 1'b0;      // Numbers less than 2 are not prime
    end 
    else begin
      y = 1'b1;      // Assume the number is prime
      for (i = 2; i * i <= a; i = i + 1) begin
        if (a % i == 0) begin
          y = 1'b0;  // If divisible by any number, it's not prime
       //   break;     // Exit the loop early if not prime
        end
      end
    end
  end
endmodule

//testbench
module prime_num_tb();
reg [7:0] a;
wire y;

prime_num DUT(a,y);
initial begin
 $monitor("a= %d, y= %b",a,y);

 #10 a=8'd123;
 #10 a=8'd14;
 #10 a=8'd103;
 #10 a=8'd201;
 #10 a=8'd17;
 #10 a=8'd18;
 #10 a=8'd19;
 #10 $finish;
 end
endmodule
