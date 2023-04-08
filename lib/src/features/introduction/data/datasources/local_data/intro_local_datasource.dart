import 'package:flutter/material.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/storage/storage_gateway.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/constants.dart';
import '../../../domain/entities/app_intro_entity.dart';

class IntroLocalDatasource {
  IntroLocalDatasource({
    required this.storageGateway,
  });

  final StorageGateway storageGateway;

  Future<List<AppIntroEntity>> getAppIntroduction() async => [
        AppIntroEntity(
          img: Assets.images.introFirst.path,
          title: 'Improve English speaking skills',
          content: const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Participate in '),
                TextSpan(
                  text: '1-1 video call',
                  style: TextStyle(
                    fontSize: bodyLargeSize,
                    fontWeight: bodyLargeWeight,
                    color: AppColor.secondary,
                  ),
                ),
                TextSpan(text: ' sessions with '),
                TextSpan(
                  text: 'foreign teachers',
                  style: TextStyle(
                    fontSize: bodyLargeSize,
                    fontWeight: bodyLargeWeight,
                    color: AppColor.secondary,
                  ),
                ),
                TextSpan(
                    text:
                        ' to practice speaking English and improve your skills.'),
              ],
              style: TextStyle(
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
                color: AppColor.defaultFont,
              ),
            ),
          ),
        ),
        AppIntroEntity(
          img: Assets.images.introSecond.path,
          title: 'Expand your vocabulary',
          content: const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'With provided and diverse '),
                TextSpan(
                  text: 'topics',
                  style: TextStyle(
                    fontSize: bodyLargeSize,
                    fontWeight: bodyLargeWeight,
                    color: AppColor.secondary,
                  ),
                ),
                TextSpan(
                    text:
                        ', you can easily learn new words, phrases, and will never run out of ideas to continue your speaking sessions.'),
              ],
              style: TextStyle(
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
                color: AppColor.defaultFont,
              ),
            ),
          ),
        ),
        AppIntroEntity(
          img: Assets.images.introThird.path,
          title: 'Anytime, anywhere',
          content: const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Sessions are limited to '),
                TextSpan(
                  text: '30 minutes',
                  style: TextStyle(
                    fontSize: bodyLargeSize,
                    fontWeight: bodyLargeWeight,
                    color: AppColor.secondary,
                  ),
                ),
                TextSpan(
                    text:
                        ' each, meaning you can start practicing English at any time that fits your schedules.'),
              ],
              style: TextStyle(
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
                color: AppColor.defaultFont,
              ),
            ),
          ),
        ),
      ];

  Future<bool> getStatusAppIntroFirstTime() async {
    final res = await storageGateway.getInt(StorageConstants.introReadKey);
    return res == 1;
  }

  Future<void> saveStatusAppIntroFirstTime() async {
    await storageGateway.putInt(StorageConstants.introReadKey, 1);
  }
}
