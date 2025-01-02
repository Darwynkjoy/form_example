import 'package:flutter/material.dart';

class FormExample extends StatefulWidget{
  const FormExample({super.key});

  @override
  State<FormExample> createState()=> _formexampleState();
}
class _formexampleState extends State<FormExample>{
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("FORM"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),labelText: "enter your name"),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return "please enter your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),labelText: "enter your email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value==null || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                    return "enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("processing data")));
                }
              }, child: Text("Submit"))
            ],
        )),
      ),
    );
  }
}