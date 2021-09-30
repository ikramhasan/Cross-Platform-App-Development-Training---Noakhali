import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  num sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('User Input'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$sum",
                style: TextStyle(fontSize: 50),
              ),
              TextFormField(
                controller: firstNumberController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter a number",
                  hintText: "eg. 23",
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  RegExp regex = RegExp(r'\d$');
                  if (!regex.hasMatch(value!)) {
                    return 'Only numbers are allowed';
                  }
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: secondNumberController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Enter another number",
                  hintText: "eg. 30",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  int num1 = int.parse(firstNumberController.text);
                  int num2 = int.parse(secondNumberController.text);
                  setState(() {
                    sum = num1 + num2;
                  });
                },
                child: Text("Add"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  int num1 = int.parse(firstNumberController.text);
                  int num2 = int.parse(secondNumberController.text);
                  setState(() {
                    sum = num1 / num2;
                  });
                },
                child: Text("Divide"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  firstNumberController.clear();
                  secondNumberController.clear();
                },
                child: Text("Clear"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
