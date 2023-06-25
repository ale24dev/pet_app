import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/services/navbar_service.dart';
import 'package:pet_app/src/core/utils.dart';
import 'package:pet_app/src/core/widgets/generic_bottom_navbar.dart';

class LayoutScreen extends ConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarController = ref.watch(navbarControllerProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: const [
          _ActionIconButtons(icon: Icon(Icons.search)),
          _ActionIconButtons(icon: Icon(Icons.notifications_outlined)),
          SizedBox.square(
            dimension: 10,
          )
        ],
      ),
      body: Utils.getLayoutFromNavbarItem(navbarController.navbarItem),
      bottomNavigationBar: const GenericBottomNavbar(),
    );
  }
}

class _ActionIconButtons extends StatelessWidget {
  const _ActionIconButtons({
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(11, 0, 0, 0),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: icon,
          )),
    );
  }
}
