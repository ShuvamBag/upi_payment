import 'package:flutter/material.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
double amt = 0;
UPIDetails upiDetails = UPIDetails(
    upiID: "8145945538@paytm",
    payeeName: "Shuvam Bag",
    amount: amt,
    transactionNote: "Hello World");

bool generateqr = false;
class _HomePageState extends State<HomePage> {
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Center(child: Text("QR Generator",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),)),),
      backgroundColor: Colors.green.shade100,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Column(
            children: [
              TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                  hintText: 'Enter Amount in Rs',
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  child: Text('Generate QR',style: TextStyle(fontSize: 20),),
                  onPressed: (){

                    setState(() {
                      generateqr = true;
                      amt = double.parse(amount.text);
                    });

                  },
                ),
              ),
              SizedBox(height: 20,),
              generateqr ?
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: UPIPaymentQRCode(
                  upiDetails: upiDetails,
                  size: 220,
                  upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
                ),
              ) : Image.asset("assets/images/qr.gif",scale: 0.2,)
            ],
          ),
        ),
      ),

    );
  }
}
