import 'package:flutter/material.dart';

class BusesAssignedScreen extends StatefulWidget {
  const BusesAssignedScreen({super.key});

  @override
  State<BusesAssignedScreen> createState() => _BusesAssignedScreenState();
}

class _BusesAssignedScreenState extends State<BusesAssignedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Buses Assigned",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Card(
                  color: Color(0xff628e91),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("source to destination:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("Bus name:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Driver name:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Starting time:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("Ending time:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
