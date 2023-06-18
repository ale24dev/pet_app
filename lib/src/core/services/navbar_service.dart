import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navbar_service.g.dart';

class Navbar {
  final int index;
  final NavbarItem navbarItem;

  const Navbar({this.index = 0, this.navbarItem = NavbarItem.home});

  Navbar copyWith({int? index, NavbarItem? navbarItem}) => Navbar(
      index: index ?? this.index, navbarItem: navbarItem ?? this.navbarItem);
}

enum NavbarItem { home, pet, shop }

@riverpod
class NavbarController extends _$NavbarController {
  @override
  Navbar build() {
    return const Navbar();
  }

  void selectBottomNavItem(int index) {
    state =
        state.copyWith(index: index, navbarItem: getNavbarItemByIndex(index));
  }

  NavbarItem getNavbarItemByIndex(int index) {
    switch (index) {
      case 0:
        return NavbarItem.home;
      case 1:
        return NavbarItem.pet;
      default:
        return NavbarItem.shop;
    }
  }
}
