import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mediaprobe/constant/view_constants.dart';

class DrawerMenu extends StatefulHookConsumerWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Volkan Demir"),
            accountEmail: Text("test@test.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.blue.shade200,
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  trailing: drawerTrailingIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.blue.shade200,
                child: ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourite'),
                  trailing: drawerTrailingIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.blue.shade200,
                child: ListTile(
                  leading: const Icon(Icons.circle_outlined),
                  title: const Text('Random'),
                  trailing: drawerTrailingIcon,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
