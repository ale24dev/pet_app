import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_bar_service.g.dart';

enum NavigationBarItem { home, pets, settings }

class NavBar {
  final int indexSelected;

  const NavBar({
    this.indexSelected = 0,
  });

  NavBar copyWith(
          {int? indexSelected, NavigationBarItem? navigationBarItemSelected}) =>
      NavBar(
        indexSelected: indexSelected ?? this.indexSelected,
      );
}

@riverpod
class NavigationBarService extends _$NavigationBarService {
  @override
  NavBar build() {
    return const NavBar();
  }

  changeSelection(int indexSelected) {
    state = state.copyWith(indexSelected: indexSelected);
  }
}
