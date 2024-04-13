import 'package:flutter/material.dart';
import 'package:program/component/data.dart';
import 'package:program/loginpage.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatefulWidget {
  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController kunci = TextEditingController();
  TextEditingController confirm = TextEditingController();
  bool isKey = true;
  bool isPass = true;
  bool isSame = false;

  @override
  Widget build(BuildContext context) {
    Company data = Provider.of<ProviderGudang>(context).Gudang;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Icon(
                Icons.catching_pokemon,
                color: Colors.black,
                size: 120,
              ),
              SizedBox(height: 30),
              Text(
                "Register Account",
                style: TextStyle(
                  color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Username",
                    errorText: isSame ? "Username Registered" : null,
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  obscureText: true,
                  controller: pass,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  obscureText: true,
                  controller: confirm,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Confirm Password",
                    errorText: isPass ? null : "Unmatched Password",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  obscureText: true,
                  controller: kunci,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Access Key",
                    errorText: isKey ? null : "Invalid Key",
                    labelStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: (){
                if (kunci.text == data.key){
                  setState(() {
                    if (data.user[0].contains(user.text.toUpperCase())){
                      isSame = true;
                      isKey = true;
                    }
                    else if (pass.text != confirm.text) {
                      isPass = false;
                    }
                    else{
                      isKey = true;
                      isPass = true;
                      data.user[0].add(user.text.toUpperCase());
                      data.user[1].add(pass.text);
                      data.user[2].add("https://png.pngtree.com/png-vector/20191110/ourmid/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg");
                      user.text = "";
                      pass.text = "";
                      kunci.text = "";
                      confirm.text="";
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Success"),
                            content: Text("Your Account Registered..."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Okay",style: TextStyle(color: Colors.blue),),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                }
                else{
                  setState(() {
                    isKey = false;
                    user.text = "";
                    pass.text = "";
                    kunci.text = "";
                    confirm.text = "";
                  });
                }
              }, 
                child: Text("Register", style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  elevation: 7,
                  fixedSize: Size.fromWidth(150),
                  padding:EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?"),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}