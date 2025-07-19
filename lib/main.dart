import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,    
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300, 
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),),
            
              SizedBox(height: 21,),
            
                  TextField(
                controller: wtController,      
                  decoration: InputDecoration(
                  label: Text("Enter your weight in (kg)", 
                  style: TextStyle(
                  color: Colors.black, 
                  fontSize: 16,),),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
            
              SizedBox(height: 11,),
            
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text("Enter your height in (feet)",
                  style: TextStyle( 
                  color: Colors.black, 
                  fontSize: 16,),),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
            
              SizedBox(height: 11,),
            
               TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text("Enter your height in (inches)", 
                  style: TextStyle(
                  color: Colors.black, 
                  fontSize: 16,),),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
        
               SizedBox(height: 16,),
        
              ElevatedButton(onPressed: (){
               
                var weight = wtController.text.toString();
                var feet = ftController.text.toString();
                var inches = inController.text.toString();
        
                if(!weight.isEmpty && !feet.isEmpty && !inches.isEmpty){
                  var iWt = int.parse(weight);
                  var iFt = int.parse(feet);
                  var iIn = int.parse(inches);
        
                  var tinches = (iFt * 12) + iIn;
                  var tcm = tinches * 2.54; // converting inches to cm
                  var tm = tcm / 100; // converting cm to m
                  var bmi = iWt / (tm * tm);
                  var msg = "";
                  if(bmi < 18){
                    msg = "You are underweight";
                    bgColor = Colors.orange;
                  }
                  else if(bmi > 25){
                     msg = "You are overweight";
                    bgColor = Colors.red;
                  }
                  else{
                     msg = "You are healthy";
                    bgColor = Colors.lightGreen;
                  }
                  setState(() {
                    result = "${msg} \n Your BMI is ${bmi.toStringAsFixed(2)}";                
                  });
                }
                else{
                  setState(() {
                    result = "Please enter all fields";                
                  });
                }             
              }, child: Text("Calculate BMI")),
             
              SizedBox(height: 16,),
              
               Text(result, style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),),
              ],),
          ),
        ),
      ),
      
    );
  }
}
