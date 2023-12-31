// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:flutter/material.dart';

class CurrencyMaterialPage extends StatelessWidget{
  const CurrencyMaterialPage({super.key});
    
  @override
  Widget build(BuildContext context) {
    int result = 0;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,title: Text("Currency converter"),toolbarHeight: 20,),
      backgroundColor: Colors.blueGrey,
        body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              // ignore: duplicate_ignore
              children: [ 
                Text("Currency Converter",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white70
                )
                ),
                SizedBox(height: 8),
                // ignore: prefer_const_constructors
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField( style : TextStyle(color: Colors.black),
                  decoration: InputDecoration(hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon:Icon(Icons.monetization_on_sharp),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  cursorColor: Colors.black,
                  ),
                ),
                SizedBox(height: 8,),
                ElevatedButton (onPressed: () {
                  print('Trying to convert');
                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(7),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  fixedSize: MaterialStateProperty.all(Size(200, 50)),
                ),
                child: Text("Convert")),
                ]
            ),
          ),
          bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[400],
        child: SizedBox(
          height: 30.0,
          child: Center(
            child: Text(
              'Made with ❤️',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//                                         Left on 11:52:00