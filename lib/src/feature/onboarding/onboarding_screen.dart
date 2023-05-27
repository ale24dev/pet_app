import 'package:flutter/material.dart';
import 'package:app_theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:pet_app/src/core/keys.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/widgets/generic_button.dart';
import 'package:pet_app/src/core/services/providers.dart';
import 'package:pet_app/src/core/services/shared_preferences_storage_service.dart';

const _kDefaultAnimationDuration = Duration(milliseconds: 25);

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: K.onboardScreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  OnboardingPage(
                      image: AppAsset.onboardingScreen1,
                      title: context.l10n.onboardingScreenFirstPageTitle,
                      text: context.l10n.onboardingScreenFirstPageText),
                  OnboardingPage(
                      image: AppAsset.onboardingScreen4,
                      title: context.l10n.onboardingScreenSecondPageTitle,
                      text: context.l10n.onboardingScreenSecondPageText),
                  OnboardingPage(
                      image: AppAsset.onboardingScreen2,
                      title: context.l10n.onboardingScreenThirdPageTitle,
                      text: context.l10n.onboardingScreenThirdPageText),
                  OnboardingPage(
                      image: AppAsset.onboardingScreen3,
                      title: context.l10n.onboardingScreenFourPageTitle,
                      text: context.l10n.onboardingScreenFourPageText),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: pageController,
              builder: (BuildContext context, Widget? child) {
                final isLastPage = (pageController.page ?? 0) > 2.5;

                return AnimatedCrossFade(
                  sizeCurve: Curves.easeInOut,
                  crossFadeState: isLastPage
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: _kDefaultAnimationDuration * 6,
                  firstChild: _OnboardingPageIndicator(
                      pages: 4, controller: pageController),
                  secondChild: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GenericButton(
                              widget: Text(context
                                  .l10n.onboardingScreenGetStartedButton),
                              function: () async {
                                await ref.read(preferencesProvider).setBool(
                                    LocalStorageKey.isFirstOpen.key, false);
                                if (mounted) {
                                  context.goNamed(AppRoute.layout.name);
                                }
                              }),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String image;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const SizedBox.square(dimension: 40),
        SizedBox.square(
          dimension: 318,
          child: Image.asset(
            image,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox.square(dimension: 40),
        Text(title, style: AppTextStyle().onboardTitle),
        const SizedBox.square(dimension: 20),
        Center(child: Text(text)),
        const SizedBox.square(dimension: 150),
      ],
    );
  }

  /// A dotted indicator for a PageView.
}

class _OnboardingPageIndicator extends StatelessWidget {
  final int pages;
  final PageController controller;

  const _OnboardingPageIndicator(
      {required this.pages, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: pages,
      effect: ExpandingDotsEffect(
        activeDotColor: Theme.of(context).primaryColor,
        dotColor: const Color.fromARGB(94, 55, 55, 226),
        dotHeight: 8,
        dotWidth: 8,
        spacing: 3,
        expansionFactor: 2.625,
      ),
    );
  }
}
