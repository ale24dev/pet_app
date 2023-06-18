import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/services/navbar_service.dart';
import 'package:pet_app/src/core/widgets/generic_bottom_navbar.dart';

class LayoutScreen extends ConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarController = ref.watch(navbarControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
      ),
      body: const Column(
        children: [Text('Home Screen')],
      ),
      bottomNavigationBar: const GenericBottomNavbar(),
    );
  }
}

