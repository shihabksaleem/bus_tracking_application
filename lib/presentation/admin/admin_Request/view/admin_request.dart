import 'package:bus_tracking_application/presentation/admin/admin_busview/view/admin_busview.dart';
import 'package:flutter/material.dart';

class AdminRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the AdminBusView page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminBusView()),
              );
            },
            child: Card(
              child: ListTile(
                title: Text("owner username"),
                subtitle: Text("owner Email"),
              ),
            ),
          );
        },
      ),
    );
  }
}
