
module TB;


  reg clk;
  reg Xinput;
  reg rst;
  wire Yout; 

  controller contr (
    .clk(clk), 
    .rst(rst), 
    .Xinput(Xinput),
	.Yout(Yout)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    Xinput = 1;
    rst = 1; 
    #10;
    rst = 0; 
    #10;
    Xinput = 1;
    #10;
	Xinput = 0;
    #10;
	Xinput = 1;
    #10;
	Xinput = 0;
    #10;
	Xinput = 1;
    #10;
	Xinput = 1;
    #10;
	Xinput = 0;
    #10;
	Xinput = 1;
    #10;
	Xinput = 1;
    #10;
	Xinput = 1;
    #10;
	Xinput = 0;
    #10;
	Xinput = 1;
	#10;
	Xinput = 1;
	#10;
	Xinput = 1;
	#10;
	Xinput = 0;
	#10;

    #50;
    $finish;
  end

endmodule