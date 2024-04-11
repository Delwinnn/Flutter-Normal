import 'package:flutter/material.dart';

class Company{
  String companyname;
  String usinguser;
  String key;
  List user;
  List product;
  int salescode;
  List sales;
  int purchasecode;
  List purchase;

  Company({
    required this.companyname, 
    required this.usinguser, 
    required this.key, 
    required this.user, 
    required this.product, 
    required this.salescode, 
    required this.sales, 
    required this.purchasecode,
    required this.purchase
  });
}

class ProviderGudang extends ChangeNotifier{
  Company Gudang = Company(
    companyname: "Normal Store", 
    usinguser: "",
    key: "Hello", 
    user: [
      ["MAIN","K1","K2"],
      ["+62","123","456"]
    ], 
    product: [
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah","EKL",230],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik","EKL",230],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau","EKL",250],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09","EKL Baskom Plastik 042 Ukuran Sedang","EKL",300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5","EKL Baskom Plastik 783 Ukuran Besar","EKL",300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2","OllO",200],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality","EKL",220],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2","OllO",250],
    ], 
    salescode: 3,
    sales: [
      ["S000001","05-03-2024","Jokiiii","K1",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah",22000,70],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau",15000,50]],
      2290000],
      ["S000002","10-03-2024","Bobyyyy","K2",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2",30000,50],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2",30000,100]],
      4500000],
      ["S000003","20-03-2024","Pinyyyy","K2",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality",60000,80],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik",18000,70],],
      6060000],
    ], 
    purchasecode: 3,
    purchase: [
      ["P000001","05-03-2024","Budiiiii","K2",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cl52179","EKL Hanger Baju Merah",15000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r992-lsct022cjqhl13","EKL Ember Cor Plastik Hijau",15000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98r-lsct022cibx568","EKL Gantungan Baju Lidi Plastik",12000,300]],
      12600000],
      ["P000002","09-03-2024","Andiiiii","K1",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98v-lsct022cgxmu09","EKL Baskom Plastik 042 Ukuran Sedang",30000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98u-lt7kukaiu8ue77","Raskam Plastik PVC EKL Premium Quality",35000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r990-lsct022cny6xe5","EKL Baskom Plastik 783 Ukuran Besar",45000,300]],
      33000000],
      ["P000003","11-03-2024","Rianaaaa","K2",
      [["https://down-id.img.susercontent.com/file/id-11134207-7r98y-lthnk07b51xe03","OllO Keran Air PVC Premium Ukuran 1/2",25000,300],
      ["https://down-id.img.susercontent.com/file/id-11134207-7r98z-lti1e8325da029","OllO Keran Air Putar PVC Premium ukuran 1/2",25000,300]],
      15000000],
    ],
  );

  void addStock(List x) {
    Gudang.product.add(x);
    notifyListeners();
  }

  void addAccount(String x, String y) {
    Gudang.user[0].add(x);
    Gudang.user[1].add(y);
    notifyListeners();
  }

  void addPurchase(List x) {
    Gudang.purchase.add(x);
    notifyListeners();
  }

  void addSales(List x) {
    Gudang.sales.add(x);
    notifyListeners();
  }
}

List<dynamic> listfitur = [[
    Icons.attach_money,
    Icons.sell,
    Icons.warehouse,
    Icons.info
  ],[
    "Purchasing","Sales","Stock","About"
  ]];