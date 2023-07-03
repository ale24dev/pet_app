import 'package:app_theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/utils/datetimes.dart';
import 'package:pet_app/src/core/widgets/generic_profile_image.dart';
import 'package:pet_app/src/feature/home/data/publication.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({
    super.key,
    required this.publication,
  });

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: AppTheme.shortShadow),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                GenericProfileImage(image: publication.user.avatarUrl, imageRadius: 20,),
                const SizedBox.square(
                  dimension: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      publication.user.username,
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
            ),
            const SizedBox.square(
              dimension: 10,
            ),
            if (publication.hasImage())
              CachedNetworkImage(
                height: 400,
                imageUrl: publication.images![0],
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Image.asset(AppAsset.noImage),
              ),
            const SizedBox.square(
              dimension: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 40,
                      child: Text(
                        publication.text,
                        style: AppTextStyle().textPublication,
                      )),
                  Text(context.l10n.publicationScreenSeeMore,
                      style: AppTextStyle()
                          .textPublication
                          .copyWith(fontWeight: FontWeight.w600))
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 10,
            ),
            const _SocialSection()
          ],
        ),
      ),
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
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
      ),
    );
  }
}
