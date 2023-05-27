import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/services/navigation_bar_service.dart';
import 'package:pet_app/src/core/widgets/pet_navigation_bar.dart';
import 'package:pet_app/src/feature/home/home_screen.dart';

class LayoutScreen extends ConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navigationBarService = ref.watch(navigationBarServiceProvider);
    switch (navigationBarService.indexSelected) {
      case 0:
        return LayoutWidget(
            navigationBarService: navigationBarService,
            widget: const HomeScreen(),
            ref: ref);
      case 1:
        return LayoutWidget(
            navigationBarService: navigationBarService,
            widget: const Center(child: Text('Mis mascotas')),
            ref: ref);
      case 2:
        return LayoutWidget(
            navigationBarService: navigationBarService,
            widget: const Center(child: Text('Configuración')),
            ref: ref);

      default:
    }

    return LayoutWidget(
      navigationBarService: navigationBarService,
      widget: const Text('Unimplemented layout'),
      ref: ref,
    );
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget(
      {super.key,
      required this.navigationBarService,
      required this.widget,
      required this.ref});

  final NavBar navigationBarService;
  final Widget widget;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget,
        bottomNavigationBar: navigationBar(
            context: context,
            ref: ref,
            indexSelected: navigationBarService.indexSelected));
  }
}
