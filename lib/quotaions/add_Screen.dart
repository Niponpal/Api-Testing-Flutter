

import 'dart:developer';

import 'package:apitest/quotaions/Quotaions_Updated.dart';
import 'package:apitest/quotaions/add-api.dart';
import 'package:flutter/material.dart';

class AdDataScreen extends StatefulWidget {
  const AdDataScreen({super.key});

  @override
  State<AdDataScreen> createState() => _AdDataScreenState();
}

class _AdDataScreenState extends State<AdDataScreen> {
  TextEditingController QuotationsC = TextEditingController();
  TextEditingController authorC = TextEditingController();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Quotations", style: TextStyle(fontSize: 28),),
        backgroundColor: Colors.green,
      ),
      body: ListView(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        children: [

          TextField(
            controller: QuotationsC,
            decoration: InputDecoration(
              labelText: "Enter Your Quotations...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),

          ),
          SizedBox(height: 20,),
          TextField(
            controller: authorC,
            decoration: InputDecoration(
                labelText: "Enter Your Authors Names",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            ),

          ),
          SizedBox(height: 20,),
          isloading==true?Center(child: CircularProgressIndicator()):    InkWell(
              onTap: ()async {
                log("=============");
                setState(() {
                });
                isloading = true;
                log("======${QuotationsC.text}=======");
                log("=============");
                log("====${authorC.text}=========");
              await  AddApiData.AddSorreData(quote:QuotationsC.text,author: authorC.text );
              isloading = false;
              setState(() {

              });
              Navigator.pop(context);
              },
              child: Card(
                color: Colors.green,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add Your Quotations",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    ))
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
