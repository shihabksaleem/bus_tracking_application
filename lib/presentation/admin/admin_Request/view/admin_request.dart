import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("owner username"),
                subtitle: Text("owner Email"),
                trailing: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
