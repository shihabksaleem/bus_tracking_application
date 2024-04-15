import 'package:flutter/material.dart';

class AdminBusView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bus View",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  title: Text(
                    "Bus owner name: Najeeb",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bus Name: Krishna",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Bus Number:KL07BP773",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Engin Number:Bp372835497"),
                    ],
                  ),
                  trailing: Wrap(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 130, 175, 212),
                        child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => _busimage(),
                            //   ),
                            // );
                          },
                          icon: Icon(
                            Icons.bus_alert_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 186, 103, 97),
                        child: IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => _rcbookimage(),
                            //   ),
                            // );
                          },
                          icon: Icon(
                            Icons.book,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Accept action
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        // Decline action
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        'Decline',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
