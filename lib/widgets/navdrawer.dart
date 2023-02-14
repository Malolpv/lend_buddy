import 'package:flutter/material.dart';
import 'package:lend_buddy/main.dart';
import 'package:lend_buddy/screens/home_screen.dart';

class NavDrawer extends StatelessWidget {
  
  //TODO LA CONNEXION DOIT SET L ID USER
  final idUser = 1;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('../assets/images/logo.png'))),
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(userId: idUser)))},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()))},
          ),
        ],
      ),
    );
  }
}
