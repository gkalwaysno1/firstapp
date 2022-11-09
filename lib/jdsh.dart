import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Return"),
      ),
      body: new Text("BMI value"),
    );
  }
}
class HomeRoute extends StatefulWidget {
  HomeRoute({required this.bmi});
  double bmi;
  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Result", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: (){
              Navigator.pop(context);
            },
                child: Column(
                  children: [
                    Text("BMI= ${widget.bmi}", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                    )

                    ),
                    Text("\nRating ",
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                    )),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )




                  ],

                )


            )

          ]
      ),

    );
  }
}