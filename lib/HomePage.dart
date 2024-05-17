import 'package:flutter/material.dart';
import 'package:program/ProfilePage.dart';
import 'package:provider/provider.dart';
import 'package:program/aboutpage.dart';
import 'package:program/accountView.dart';
import 'package:program/component/data.dart';
import 'package:program/purchasingpage.dart';
import 'package:program/salespage.dart';
import 'package:program/stockpage.dart';

class HomeView extends StatefulWidget {
  final Company data;
  final String user;
  final List<dynamic> fitur;
  final dynamic tujuan;

  HomeView({Key? key, required this.data, required this.fitur, required this.user})
      : tujuan = [PurchasingView(), SalesView(), StockView(), AboutView(), ProfilePage()],
        super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    final indexUser = Provider.of<ProviderGudang>(context).Gudang.user[0].indexOf(widget.user); 

    return Scaffold(
  appBar: AppBar(
  automaticallyImplyLeading: false,
  title: Text(
    widget.data.companyname,
    style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Colors.blue,
  actions: [
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Consumer<ProviderGudang>(
            builder: (context, provider, _) => ProfilePage(),
          ),
        ));
      },
      child: Row(
        children: [
          SizedBox(width: 8), 
          CircleAvatar(
            radius: 20, 
            backgroundImage: NetworkImage(widget.data.user[2][widget.data.user[0].indexOf(widget.user)]),
          ),
          SizedBox(width: 8),
        ],
      ),
    ),
  ],
),


      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Hello ${widget.user}...',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => widget.tujuan[i]),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            widget.fitur[0][i],
                            size: 65,
                          ),
                          Text(
                            widget.fitur[1][i],
                            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (indexUser == 0)
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AccountView()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 25),
                        SizedBox(width: 10),
                        Text("Account List", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      elevation: 10,
                      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      );
  }
}
