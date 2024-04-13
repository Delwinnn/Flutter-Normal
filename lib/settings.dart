import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'component/data.dart';
import 'subsetting/changepicture.dart';
import 'subsetting/changename.dart'; 
import 'subsetting/changepass.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderGudang>(context);
    final currentUser = Provider.of<ProviderGudang>(context).Gudang.usinguser; 

    if (currentUser != "") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings",style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Edit Image",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(width: 30),
                ],
              ),
              
              Row(
                children: [
                  Consumer<ProviderGudang>(
                    builder: (context, provider, _) {
                      int userIndex = provider.Gudang.user[0].indexOf(currentUser);
                      if (userIndex != -1) {
                        return CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(provider.Gudang.user[2][userIndex]),
                        );
                      } else {
                        return Text("User not found!"); 
                      }
                    },
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
 style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, 
    foregroundColor: Colors.white,
  ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            onUpdateImageUrl: (newImageUrl) {
                              provider.updateUserImage(provider.Gudang.user[0].indexOf(currentUser), newImageUrl); 
                            },
                          ),
                        ),
                      );
                    },
                    child: Text("Edit"),
                  ),
                ],
              ),
              SizedBox(height: 20), 
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Edit Name",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(width: 30),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 60),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, 
    foregroundColor: Colors.white, 
  ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChangeUsernamePage(),
                        ),
                      );
                    },
                    child: Text("Edit"), 
                  ),
                ],
              ),
              SizedBox(height: 20), 
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Edit Password",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(width: 30),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 60),
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue, 
    foregroundColor: Colors.white, 
  ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordPage(), 
                        ),
                      );
                    },
                    child: Text("Edit"), 
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Please log in to access settings"),
        ),
      );
    }
  }
}
