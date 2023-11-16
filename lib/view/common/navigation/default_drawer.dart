import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration:
              BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Text(
                "ToDo App",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () => FirebaseAuth.instance.signOut(),
            leading: const Icon(Icons.exit_to_app,),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
