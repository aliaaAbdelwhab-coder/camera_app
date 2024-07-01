import 'package:flutter/material.dart';

final emailController = TextEditingController();

class ForgetPasswordpage extends StatelessWidget {
  const ForgetPasswordpage
({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin:  EdgeInsets.only(left: 10, right: 10),
          child: Column(
          children: [
            SizedBox(height: 100,),
          
            Image(image: AssetImage('assets/birdie_logo.png'),
            fit: BoxFit.cover,
            height: 200,
            width: 250,    
             ),
          
          SizedBox(height: 50,),          
          
          
                   TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      label: Text("E-mail",style: TextStyle(color: Colors.blue[600]),),
                      hintText: "Enter Your E-mail",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Icon(Icons.person , color: Colors.blue[600]),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                      ),
                    ),
                    validator: (value){
                      if(value! .isEmpty){
                        return "Please, Enter E-mail";
                      }
                      else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3}$').hasMatch(value!)){
                        return "Enter Valid E-mail";
                      }
                      return null;
                    },
                  ),
          
             SizedBox(height: 30,),  
             
            ElevatedButton(onPressed: (){}, 
                child: Text("Send",
                style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ButtonStyle(
                  
                  backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                  ),
                ),
                ),
          ],
          ),
        ),
      )
    );
  }
}