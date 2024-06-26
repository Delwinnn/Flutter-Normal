import 'package:flutter/material.dart';
import 'package:program/AddTransactionPage.dart';
import 'package:program/component/cardtransaksi.dart';
import 'package:program/component/data.dart';
import 'package:provider/provider.dart';

class SalesView extends StatefulWidget {
  SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  TextEditingController search = TextEditingController();
  List data = [];
  List filtered = [];
  
  @override
  void initState() {
    super.initState();
    data = Provider.of<ProviderGudang>(context,listen: false).Gudang.sales;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Sales", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(7),
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: search,
                  onChanged: (value) {
                    setState(() {
                      if (value!=""){
                        filtered=[];
                        for (int i = 0;i < data.length; i++) {
                          if (data[i][0].toLowerCase().contains(value.toLowerCase()) || data[i][2].toLowerCase().contains(value.toLowerCase()) || data[i][3].toLowerCase().contains(value.toLowerCase())) {
                            filtered.add(data[i]);
                          }
                        }
                      }
                      else{
                        filtered = data;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search",
                  ),
                ),
              ),
              ...
              search.text == ""
              ? Provider.of<ProviderGudang>(context).Gudang.sales.reversed.map<Widget>((item) {
                return CardTrans(x: item, type: "Sales");
              })
              : filtered.reversed.map<Widget>((item) {
                return CardTrans(x: item, type: "Sales");
              }),
            ]
          ),
        )
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTransaction(type: "Sales",),)
          );
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 7,
          padding: EdgeInsets.all(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add,size: 28,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}