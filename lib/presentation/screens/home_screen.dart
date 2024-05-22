import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/menu_items/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('data'),),
      body: const _HomeView(
        menuItems: appMenuItems,
      ),
    )

        // Scaffold(

        // body: ListView(
        //   children: [
        //     ListTile(
        //       title: const Text('Cubits'),
        //       subtitle: const Text('Gestor de estado simple'),
        //       trailing: const Icon(Icons.arrow_forward_ios_outlined),
        //       onTap: () => {
        //         context.push('/cubits')
        //       },
        //     ),
        //     ListTile(
        //       title: const Text('Bloc'),
        //       subtitle: const Text('Gestor de estado Bloc'),
        //       trailing: const Icon(Icons.arrow_forward_ios_outlined),
        //       onTap: () => {
        //         context.push('/bloc')
        //       },
        //     ),

        //   ],
        // ),

        // )
        ;
  }
}

class _HomeView extends StatelessWidget {
  final List<MenuItems> menuItems;
  const _HomeView({
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            child: Column(
              children: [
                ...menuItems.map(
                  (e) => ListTile(
                    title: Text(e.title),
                    subtitle: Text(e.subtitle),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () => context.push(e.route),
                  ),
                )
              ],
            )
            // ListView.builder(
            //   itemCount: menuItems.length,
            //   itemBuilder: (context, index) {
            //     final listItem = menuItems[index];
            //     return ListTile(
            //       title: Text(listItem.title),
            //       subtitle: Text(listItem.subtitle),
            //       trailing: const Icon(Icons.arrow_forward_ios_outlined),
            //       onTap: () => context.push(listItem.route),
            //     );
            //   },
            // ),
            ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        ),
        ListTile(
          title: const Text('Nuevo Usuario'),
          subtitle: const Text('Manejo de formularios'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => context.push('/new-user'),
        )
      ],
    );
  }
}
