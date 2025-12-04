import 'dart:developer';

import 'package:apitest/quotaions/add_Screen.dart';
import 'package:apitest/quotaions/getLoad.dart';
import 'package:flutter/material.dart';

class QuotationsdataScreen extends StatefulWidget {
  const QuotationsdataScreen({super.key});

  @override
  State<QuotationsdataScreen> createState() => _QuotationsdataScreenState();
}

class _QuotationsdataScreenState extends State<QuotationsdataScreen> {
  List QuationsList = [];
  bool isLoading = true;

  getDatas() async {
    isLoading = true;
    await  Future.delayed(Duration(seconds: 3));
    setState(() {});
    var a = await ApiData().getApiLoad();
    QuationsList = a['data'];
    isLoading = false;
    setState(() {});
    log("$a");
  }

  @override
  @override
  void initState() {
    getDatas();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Quotaions App",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : QuationsList.isEmpty
          ? Center(child: Text("Data Not Found"))
          : ListView.builder(
          itemCount: QuationsList.length,
          itemBuilder: (context,i)=>Card(
        elevation:3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 28),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${QuationsList[i]['quote']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${QuationsList[i]['author']}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),)
                ],
              )
            ],
          ),
        ),
      )),
      floatingActionButton:FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDataScreen())).then((v){
          getDatas();
        });
      }, child:Icon(Icons.add_box) ,) ,
    );
  }
}
