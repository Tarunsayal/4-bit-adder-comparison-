module cskaTB;

reg [3:0]a;
reg [3:0]b;
reg cin;
wire cout;
wire [3:0]sum;

reg [4:0]tem;
integer i;

cska dut
(
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .sum(sum)
);

initial begin
    for(i=0; i<512; i=i+1)begin
        cin=i[0];
        a=i[4:1];
        b=i[8:5];
        #1
        tem=a+b+cin;

        if(tem!=={cout,sum})begin
             $display("sum is incorrect for a=%b b=%b cin=%b | sum=%b | tem=%b",a,b,cin,sum,tem);

        end

    end
    $display("All test completed");
    $finish;
end

endmodule