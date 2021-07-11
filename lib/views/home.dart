import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController = new TextEditingController();

  String applicationId = "39401c86";
  String applicationKey = "51ce5ff49bab2708dc9342613a78408a";

  getRecipes(String query){

    String url = "https://api.edamam.com/search?q=chicken&app_id=$applicationId&app_key=$applicationKey";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0xff213A50),
              const Color(0xff071930)
            ])),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: <Widget>[
                    Text("AppGuy", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                    ),),
                    Text(
                      "Recipes",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue,
                        ),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Text("What will you cook today?", style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
                SizedBox(height: 8),
                Text("Just Enter Ingredents you have and we will show the best recipe for you",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),),
                SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: "Enter Ingridients",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          )
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    InkWell(
                      onTap: () {
                        if(textEditingController.text.isNotEmpty) {
                          getRecipes(textEditingController.text);
                          print("Just do it");
                        } else {
                          print("Just dont do it");
                        }
                      },
                      child: Container(
                        child: Icon(Icons.search, color: Colors.white,),
                      ),
                    )
                  ],
                ),),

              ],
            ),
          )
        ],
      ),
    );
  }
}
