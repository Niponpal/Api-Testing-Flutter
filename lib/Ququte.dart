import 'package:apitest/QueteData.dart';
import 'package:apitest/api.dart';
import 'package:flutter/material.dart';

class QuquteScreenView extends StatefulWidget {
  const QuquteScreenView({super.key});

  @override
  State<QuquteScreenView> createState() => _QuquteScreenViewState();
}

class _QuquteScreenViewState extends State<QuquteScreenView> {
  bool isLoading = true;

  List qData = [];

  loadData() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration (seconds: 3) ,);
     var a = await Api().getDataApi();
   qData = a['data'];
  //  qData = QueteDatas.data['data'];
    print("aaaa$isLoading aaaa");
    isLoading = false;
    print("aaaaa $isLoading aaa");

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
        backgroundColor: Color(0xff103B44),
        centerTitle: true,
        title: Text(
          "Success & Achievement",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        actions: [
          InkWell(
              onTap: () async {
            var a =    await Api().getDataApi();
               loadData();-m

              },
              child: Icon(Icons.refresh_outlined,color: Colors.white,)),
          SizedBox(width: 10,)
        ],
      ),
      body: isLoading == true ? Center(child: CircularProgressIndicator()) :
      qData.isEmpty
          ? Center(child: Text("Data Not Found"))
          : ListView.builder(
        itemCount: qData.length,
        itemBuilder: (context, i) => Card(
          color: Color(0xffE7ECEA),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 40,
                ),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${qData[i]['quote']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${qData[i]['author']}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Image(
                  image: AssetImage("assets/images2.png"),

                  width: 25,
                  height: 25,
                ),
              ),

              Positioned(
                bottom: 8,
                right: 8,
                child: Image(
                  image: AssetImage("assets/images.png"),
                  width: 25,
                  height: 25,
                ),
              ),

              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
