import 'package:bus_tracking_application/core/constants/color_constants.dart';
import 'package:bus_tracking_application/presentation/bus_users/bus_tracking_screen/view/bus_tracking_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenBussesCard extends StatelessWidget {
  const HomeScreenBussesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BusTrackingScreen(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.mainWhite,
              boxShadow: [
                BoxShadow(
                    offset: Offset(6, 6),
                    blurRadius: 8,
                    color: ColorConstants.mainBlack.withOpacity(.6))
              ]),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bus name"),
                  SizedBox(height: 3),
                  Text("Ac/non Ac"),
                  SizedBox(height: 3),
                  Text("1 stop away"),
                ],
              ),
              Spacer(),
              Icon(
                Icons.call_split_rounded,
                color: ColorConstants.mainBlue,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
