import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'package:mediaprobe/general_providers.dart';
import 'package:mediaprobe/widget/home_page/drawer_menu.dart';
import 'package:mediaprobe/widget/home_page/home_page_body.dart';

//import 'package:html/dom.dart' hide Text;

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        title: Text(ref.watch(titleProvider)),
      ),
      body: const HomePageBody(),
    );
  }
}
