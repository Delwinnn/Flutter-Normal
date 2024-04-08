import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:program/component/data.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
  final List<dynamic> user = Provider.of<ProviderGudang>(context).Gudang.user[0];
  final List<dynamic> pass = Provider.of<ProviderGudang>(context).Gudang.user[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account',
          style: TextStyle(color: Colors.white, ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, 
      ),
      body:Container(
        color: Colors.grey[400],
        padding: EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 7),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Account List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Column(
              children: 
                user.mapIndexed((index, e) => CardAccount(acc: user[index], pwd: pass[index], number: index,)).toList()
            ),
        ]),
      ),
    );
  }
}

class CardAccount extends StatelessWidget {
  final String acc;
  final String pwd;
  final int number;
  const CardAccount({super.key, required this.acc,  required this.pwd, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsetsDirectional.symmetric(vertical: 7),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${number+1}. ${acc}",style: TextStyle(fontSize: 16),),
          Text("${pwd}", style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}