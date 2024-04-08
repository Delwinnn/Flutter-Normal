import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:program/AboutPage.dart';
import 'package:program/AccountView.dart';
import 'package:program/component/data.dart';
import 'package:program/loginpage.dart';
import 'package:program/purchasingpage.dart';
import 'package:program/salesPage.dart';
import 'package:program/stockPage.dart';

class HomeView extends StatelessWidget {
  final Company data;
  final String user;
  final List<dynamic> fitur;
  final dynamic tujuan;
  HomeView({super.key, required this.data, required this.fitur, required this.user})
    :tujuan = [PurchasingView(),SalesView(),StockView(),AboutView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(data.companyname, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Hello ${user}...', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => tujuan[i],
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(fitur[0][i],size: 65,),
                        Text(fitur[1][i],style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                );
              },),
              if(user == "MAIN")
                Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AccountView())
                    );
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,size: 25,),
                      SizedBox(width: 10,),
                      Text("Account List", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                    ]),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 10,
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    padding:EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Log Out"),
                          content: Text("Are you sure you want to Log Out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel",style: TextStyle(color: Colors.grey[800]),),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => LoginView()),
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              child: Text("Log Out",style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout,size: 25,),
                      SizedBox(width: 10,),
                      Text("Log Out", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
                    ]),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    elevation: 10,
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    padding:EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}