import 'dart:developer';

import 'package:apitest/quotaions/Quotaions_Updated.dart';
import 'package:flutter/material.dart';

class UpdateScreenView extends StatefulWidget {
  final int id;
  final String quote;
  final String author;

  const UpdateScreenView({
    super.key,
    required this.id,
    required this.quote,
    required this.author,
  });

  @override
  State<UpdateScreenView> createState() => _UpdateScreenViewState();
}

class _UpdateScreenViewState extends State<UpdateScreenView> {
  TextEditingController QuotationsC = TextEditingController();
  TextEditingController authorC = TextEditingController();

  bool isloading = false;
  @override
  @override
  void initState() {
    QuotationsC.text = widget.quote;
    authorC.text = widget.author;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Updated Quotations", style: TextStyle(fontSize: 28)),
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
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: authorC,
            decoration: InputDecoration(
              labelText: "Enter Your Authors Names",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          isloading == true
              ? Center(child: CircularProgressIndicator())
              : InkWell(
            onTap: () async {
              log("=============");
              setState(() {
                isloading = true;
              });

              await UpdateQuatons.UpdateData(
                id: widget.id,
                quote: QuotationsC.text,
                author: authorC.text,
              );

              setState(() {
                isloading = false;
              });


              Navigator.pop(context, true);
            },


            child: Card(
                    color: Colors.green,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Save Your Quotations",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
