module claTB;
reg [3:0] a;
reg [3:0]b;
reg cin;
wire cout;
wire [3:0] sum;
reg [4:0]tem;
integer i;

cla c1
(
.a(a),
.b(b),
.cin(cin),
.cout(cout),
.sum(sum)
);

initial begin
    $dumpfile("cla.vcd");
    $dumpvars(0, claTB);

        for(i=0;i<512;i=i+1)begin
        cin=i[0];
        a=i[4:1];
        b=i[8:5];   
        
        #10;

        tem = a+b+cin;
        
        if(tem!=={cout,sum})begin
            $display("failed for values a=%b b=%b cin=%b | tem=%b |cout=%b sum=%b",a,b,cin,tem,cout,sum);
        end
    
        
end

$finish;
end
endmodule