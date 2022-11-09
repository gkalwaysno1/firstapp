//import 'dart:ffi';
//import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hello/jdsh.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/second':(context)=>SecondPage()
    },
  )); //MaterialApp
}
class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(),
        body: new Checkbox(
            value: false,
            onChanged: null
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double weight = 100;
  double height = 100;




  double bmic(){
    double bmi = (weight) / (height)*(height);
    print(bmi);
    return bmi;
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Gopro"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height:500,
            width: 500,
            color: Colors.lightGreenAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height=${height.round()}cm",style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )),
                Slider(value: height,min:50,max:200, onChanged: (value){
                  setState(() {
                    height=value;
                  });
                }),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          child: Text(
                              "+".toUpperCase(),
                              style: TextStyle(fontSize: 14)
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: () => setState(() {
                            height=height+10;
                          })
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          child: Text(
                              "-".toUpperCase(),
                              style: TextStyle(fontSize: 14)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: () =>
                              setState(() {
                                height=height-10;
                              })
                      ),
                      /*Text("\n\n\n\nBMI=${(height.round())*(height.round())}",style:TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ))*/
                    ]
                ),

                Text("\n\nWeight=${weight.round()}kg",style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )),
                Slider(value: weight,min:50,max:200, onChanged: (value){
                  setState(() {
                    weight=value;
                  });
                }),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          child: Text(
                              "+",
                              style: TextStyle(fontSize: 14)
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: () => setState(() {
                            weight=weight+10;
                          })
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          child: Text(
                              "-".toUpperCase(),
                              style: TextStyle(fontSize: 14)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: () =>
                              setState(() {
                                weight=weight-10;
                              })
                      )
                    ]
                ),
                // Text("\n\n\n\nBMI=${((weight)/((height)*(height)))}",style:TextStyle(
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold
                // )),
                TextButton(
                    child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 14)
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            )
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeRoute(bmi: ((weight)*10000/ ((height)*(height))))));
                    })
              ],
            ),
          )
        ],
      ),
    );

  }
}