import 'package:bus_tracking_application/core/app_utils/app_utils.dart';
import 'package:bus_tracking_application/presentation/admin/admin_busview/view/admin_busview.dart';
import 'package:bus_tracking_application/presentation/admin/admin_owners_bottom_tab/controller/admin_owners_bottom_tab_controller.dart';
import 'package:bus_tracking_application/presentation/global_widgets/reusable_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminOwnersBottomTab extends StatefulWidget {
  @override
  State<AdminOwnersBottomTab> createState() => _AdminOwnersBottomTabState();
}

class _AdminOwnersBottomTabState extends State<AdminOwnersBottomTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<AdminOwnersBottomTabController>().getOwners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdminOwnersBottomTabController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Owners",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: provider.isLoading
          ? Center(
              child: ReusableLoadingWidget(),
            )
          : ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: provider.ownersResModel?.owners?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the AdminBusView page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AdminBusView()),
                    // );
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(provider.ownersResModel?.owners?[index].name
                              .toString() ??
                          ""),
                      subtitle: Text(provider
                              .ownersResModel?.owners?[index].address
                              .toString() ??
                          ""),
                      trailing: provider
                                  .ownersResModel?.owners?[index].isApproved ==
                              true
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Verified",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    // Accept action
                                    await context
                                        .read<AdminOwnersBottomTabController>()
                                        .approveOwners(
                                            ownerId: provider.ownersResModel
                                                    ?.owners?[index].id
                                                    .toString() ??
                                                "")
                                        .then((value) {
                                      if (value) {
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(SnackBar(
                                        //         content: Text(
                                        //   "${provider.ownersResModel?.owners?[index].name} Request Approved",
                                        // )));
                                        AppUtils.oneTimeSnackBar(
                                            bgColor: Colors.green,
                                            "${provider.ownersResModel?.owners?[index].name} Request Approved",
                                            context: context);
                                      } else {
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(SnackBar(
                                        //         content: Text(
                                        //   "Failed to  Approved ${provider.ownersResModel?.owners?[index].name} Request",
                                        // )));
                                        AppUtils.oneTimeSnackBar(
                                            "Failed to  Approved ${provider.ownersResModel?.owners?[index].name} Request",
                                            context: context);
                                      }
                                    });
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5)),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                  child: Text(
                                    'Accept Now',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                // SizedBox(width: 10),
                                // ElevatedButton(
                                //     onPressed: () {
                                //       // Decline action
                                //     },
                                //     style: ButtonStyle(
                                //       padding: MaterialStateProperty.all(
                                //           EdgeInsets.symmetric(
                                //               horizontal: 8, vertical: 5)),
                                //       backgroundColor:
                                //           MaterialStateProperty.all(Colors.red),
                                //     ),
                                //     child: Text(
                                //       'Decline',
                                //       style: TextStyle(
                                //           color: Colors.white, fontSize: 12),
                                //     )),
                              ],
                            ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
