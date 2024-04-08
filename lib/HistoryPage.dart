import 'package:flutter/material.dart';
import 'package:program/component/data.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List hasil = [];

  @override
  void initState() {
    super.initState();
    List allsales = Provider.of<ProviderGudang>(context,listen: false).Gudang.sales;
    List allpurchase = Provider.of<ProviderGudang>(context,listen: false).Gudang.purchase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("${hasil}")
          ]
        ),
      ),
    );
  }
}