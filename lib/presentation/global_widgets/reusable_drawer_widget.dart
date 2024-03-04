import 'package:flutter/material.dart';

class ReusableDrawerWidget extends StatelessWidget{
  final List<DrawerItem> drawerItems;
  final String name;
  final String email;
  ReusableDrawerWidget({required this.drawerItems,required this.name,required this.email});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          ///todo:name and email
          accountName: Text("name",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),),
            accountEmail: Text("email",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),),
          ///todo : account picture
          currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),),
          currentAccountPictureSize: Size(60, 70),
        ),
          ///for loop for List tile items
          for (var item in drawerItems)buildListTile(item),
        ],
      ),
    );
  }
  Widget buildListTile(DrawerItem item) {
    return InkWell(
      onTap: item.onTap,
      child: ListTile(

        leading: Icon(item.icon, color: Colors.blue),
        title: Text(
          item.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }


}

class DrawerItem {
  final IconData icon;
  final String title;

  final VoidCallback onTap;

  DrawerItem({required this.icon, required this.title, required this.onTap,});
}