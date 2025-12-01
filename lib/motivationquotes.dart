import 'package:apitest/apimoti.dart';
import 'package:apitest/nameListapi.dart';
import 'package:flutter/material.dart';

class MotivationquotesView extends StatefulWidget {
  const MotivationquotesView({super.key});

  @override
  State<MotivationquotesView> createState() => _MotivationquotesViewState();
}
bool isLoading = true;

class _MotivationquotesViewState extends State<MotivationquotesView> {
  bool isloadings = true;


  List motiDatas =[];


  loadData() async {
    isloadings = true;

    var a = await NameApi().getNameApi();

    motiDatas = a['data'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3DA979),
        centerTitle: true,
        title: Text(
          "Motivation Quotes",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 23,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 28, color: Colors.grey),
                    labelText: "Search authors or Quotes.....",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: motiDatas.length,
                  itemBuilder: (context, i)=> Stack(
                    children: [
                      Card(
                        elevation: 5,
                        color: Color(0xffFEFFFF),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 80,right: 70,top: 18.0,bottom: 15),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${motiDatas[i]["quote"]}", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,),maxLines: 3,),
                              Text(""
                                  "${motiDatas[i]["author"]}",style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic,)),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 40,
                        left: 20,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xff47A2DC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/Qutaions.png",
                              width: 40,
                              height: 40,
                              color: Color(0xff47A2DC),
                            ),
                          ),
                        ),


                      )
                    ],
                  )),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
