import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/gridviewpage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final valuemController = TextEditingController();
  final valuenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter the Value of m & n for the Grid ",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: valuemController,
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                decoration: InputDecoration(
                  labelText: 'Enter M Value',
                  hintText: 'Enter the value of m',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: valuenController,
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                decoration: InputDecoration(
                  labelText: 'Enter M Value',
                  hintText: 'Enter the value of n',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GridScreen(
                                valueM: int.parse(valuemController.text),
                                valueN: int.parse(valuenController.text))));
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
