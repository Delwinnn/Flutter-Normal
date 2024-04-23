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
      ["+62","123","456"],
       [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIgp6aJcoa9_mornRyWV1vDfEVlkN9mPImV4x-uz1XYQ&s",
        "https://i.pinimg.com/736x/da/4a/fa/da4afa2d21a74a4f829f86971e826b69.jpg",
        "https://i.pinimg.com/736x/54/72/d1/5472d1b09d3d724228109d381d617326.jpg"
      ]
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

  
  String? currentUser;

  void setCurrentUser(String user) {
    currentUser = user;
    notifyListeners();
  }

 String? getCurrentUser() {
  return currentUser?.isNotEmpty ?? false ? currentUser : null;
}

void updateUsername(String oldUsername, String newUsername) {
  int userIndex = Gudang.user[0].indexOf(oldUsername);
  
  if (userIndex != -1) {
    Gudang.user[0][userIndex] = newUsername;
    Gudang.usinguser = newUsername;
    notifyListeners();
  } else {
    print('User not found or index out of range!');
  }
}


void updatePassword(String username, String oldPassword, String newPassword) {
  // Find the index of the user in the user list
  int userIndex = Gudang.user[0].indexOf(username);
  if (userIndex != -1) {
    // Check if the old password matches
    if (Gudang.user[1][userIndex] == oldPassword) {
      // Update the password at the found index
      Gudang.user[1][userIndex] = newPassword;
      notifyListeners();
    } else {
      // Handle case where old password doesn't match
      print('Old password is incorrect!');
    }
  } else {
    // Handle case where user is not found
    print('User not found!');
  }
}


  void updateUserImage(int userIndex, String newImageUrl) {
    Gudang.user[2][userIndex] = newImageUrl;
    notifyListeners();
  }

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