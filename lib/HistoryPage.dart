import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:program/component/data.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  String name;
  HistoryPage({super.key,required this.name});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List historys = [];
  int found = 0;

  @override
  Widget build(BuildContext context) {
    List sales = Provider.of<ProviderGudang>(context).Gudang.sales;
    List purchase = Provider.of<ProviderGudang>(context).Gudang.purchase;
    List historys = sales;
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[350],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ...historys.map((e) {
              for (int i = 0 ; i<e[4].length ; i++) {
                if(e[4][i].contains("${widget.name}")) {
                  found+=1;
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text("${e[1]}"),
                          Spacer(),
                          Text('${e[0]}'),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Customer: ${e[2]}'),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Quantity: ${e[4][i][3]}'),
                              Text('Price: ${
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: '',
                                  decimalDigits: 0,
                                ).format(e[4][i][2])
                              }'),
                              ],
                          ),
                          Divider(
                            color: Colors.black, 
                            height: 16, 
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:'),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'Rp. ',
                                  decimalDigits: 2,
                                ).format(e[4][i][3]*e[4][i][2]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
              return SizedBox();
            }),
            if (found==0)
            Text("No History for this item") 
          ],
        )
      ),
    );
  }
}