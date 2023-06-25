import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/src/core/utils/datetimes.dart';
import 'package:pet_app/src/feature/home/data/model/publication_model.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({
    super.key,
    required this.publication,
  });

  final PublicationModel publication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: AppTheme.shortShadow),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox.square(
                  dimension: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      publication.user!.username!,
                      style: AppTextStyle().profilePublication,
                    ),
                    Text(
                      AppDateFormats.localizeMD(publication.createdAt, context),
                      style: AppTextStyle()
                          .profilePublication
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ]),
              const SizedBox.square(
                dimension: 10,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox.square(
                dimension: 10,
              ),
              const _SocialSection()
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAsset.heart),
        const SizedBox.square(
          dimension: 2,
        ),
        Text('15k', style: AppTextStyle().likesAndChat),
        const SizedBox.square(
          dimension: 10,
        ),
        SvgPicture.asset(AppAsset.chat),
        const SizedBox.square(
          dimension: 2,
        ),
        Text('20k', style: AppTextStyle().likesAndChat),
      ],
    );
  }
}
