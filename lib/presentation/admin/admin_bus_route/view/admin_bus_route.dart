import 'package:bus_tracking_application/presentation/admin/admin_bus_stop/view/admin_bus_Stop.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_textfield_widget.dart';
import 'package:flutter/material.dart';

class AdminBusRoute extends StatelessWidget {
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bus Route Adding",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    "Name: Kakknad to Aluva",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("From: Kakknad"),
                      Text("To: Aluva"),
                    ],
                  ),
                  trailing: Wrap(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 130, 175, 212),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminBusStop()));
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 186, 103, 97),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  void _showBottomSheet(BuildContext context) {
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
                  name: "Name",
                  keyboardType: TextInputType.text,
                  controller: sourceController,
                ),
                ReusableTextFieldWidget(
                  name: "From",
                  keyboardType: TextInputType.text,
                  controller: destinationController,
                ),
                ReusableTextFieldWidget(
                  name: "To",
                  keyboardType: TextInputType.text,
                  controller: destinationController,
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
                        sourceController.text = "";
                        destinationController.text = "";
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
        });
  }
}
