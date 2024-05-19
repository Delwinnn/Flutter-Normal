import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final List<dynamic> picture = Provider.of<ProviderGudang>(context).Gudang.user[2];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account',
          style: TextStyle(color: Colors.white, ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, 
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[400],
        padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("Account List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Column(
                children: 
                  user.mapIndexed((index, e) => CardAccount(acc: user[index], pwd: pass[index], pics: picture[index],)).toList()
              ),
          ]),
        ),
      ),
    );
  }
}

class CardAccount extends StatefulWidget {
  final String acc;
  final String pwd;
  final String pics;
  const CardAccount({super.key, required this.acc,  required this.pwd, required this.pics});

  @override
  State<CardAccount> createState() => _CardAccountState();
}

class _CardAccountState extends State<CardAccount> {
  bool _seePass = false;
  @override
  Widget build(BuildContext context) {
  final TextEditingController password = TextEditingController(text : widget.pwd);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsetsDirectional.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:[ 
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("${widget.pics}"), 
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.acc}",style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Container(
                    width: 160,
                    height: 30,
                    child: TextField(
                      obscureText: !_seePass,
                      controller: password,
                      enabled: false,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none, 
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
          Row(
            children: [
              Container(
                height: 75,
                width: 1,
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  Text("Password"),
                  Switch(
                    value: _seePass,
                    onChanged: (value) {
                      setState(() {
                        _seePass = value;
                      });
                    },
                  ),
                ],
              ),
            ]
          ),
        ],
      ),
    );
  }
}