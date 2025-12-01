import 'package:apitest/nameListapi.dart';
import 'package:flutter/material.dart';

class NamelistView extends StatefulWidget {
  const NamelistView({super.key});

  @override
  State<NamelistView> createState() => _NamelistViewState();
}

bool isLoading = true ;




class _NamelistViewState extends State<NamelistView> {

  List  NameListData = [];

  nameLoadData () async  {


    setState(() {});
    isLoading = true;
    print("aaaa$isLoading aaaa");
    await Future.delayed(Duration (seconds: 3) ,);
    var a = await NameApi().getNameApi();

    NameListData = a['data'];

    isLoading = false;
    print("aaaaa $isLoading aaa");

    setState(() {

    });
  }

  @override

  void initState(){
    super.initState();
    nameLoadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9E9E9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffE9E9E9),
        title: Text(
          "Jewish Baby Names",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    prefixIcon: Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.grey,
                    ),
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
                itemCount: NameListData.length,
                itemBuilder: (context, i) => Stack(
                  children: [
                    Card(
                      elevation: 5,
                      color: Color(0xffF8F7F2),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          spacing: 15,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${NameListData[i]['name_bn']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "${NameListData[i]['name_en']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Divider(),
                            SizedBox(height: 12),
                            Text(
                              "${NameListData[i]['bn_meaning']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 35,
                        right:25 ,
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xff6C98CA),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.catching_pokemon,color: Colors.white,),
                              Text("Boy",style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 15,
                        right:25 ,
                        child: Row(
                          spacing: 8,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xff6C98CA),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.star_border_purple500,),
                            ),
                            Text("Judanism",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w600),)
                          ],

                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
