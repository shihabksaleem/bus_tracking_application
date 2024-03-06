import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: AdminBusStop(),
  ));
}

class AdminBusStop extends StatelessWidget {
  final busstopcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kakknad - Aluva",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Bus Stop Adding",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      "Stop Name: Kakknad",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time Taken: 2min"),
                        Text("Approximate Cost: Rs 20"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet_AddBustop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet_AddBustop(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///first textfield for source input
              ReusableTextFieldWidget(
                name: "Stop Name:",
                keyboardType: TextInputType.text,
                // controller: sourceController,
              ),
              ReusableTextFieldWidget(
                name: "Time Taken:",
                keyboardType: TextInputType.text,
                // controller: destinationController,
              ),
              ReusableTextFieldWidget(
                name: "Approximate Cost:",
                keyboardType: TextInputType.text,
                // controller: destinationController,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    shape: StadiumBorder(),
                    color: Colors.green,
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      // sourceController.text = "";
                      // destinationController.text = "";
                      Navigator.pop(context);
                    },
                    shape: StadiumBorder(),
                    color: Colors.red,
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
