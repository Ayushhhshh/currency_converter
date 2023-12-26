import 'package:flutter/material.dart';

class CurrencyMaterialPage extends StatelessWidget{
  const CurrencyMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
        body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [ 
                Text("Currency Converter",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white70
                )
                ),
                TextField( style : TextStyle(color: Colors.black),
                decoration: InputDecoration(hintText: "Please enter the amount in USD",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon:Icon(Icons.monetization_on_sharp),
                prefixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
                ), 
                
                cursorColor: Colors.white,
              )],
            ),
          ),
        );
  }
}
