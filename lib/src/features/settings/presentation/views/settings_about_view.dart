import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';

class SettingsAboutView extends StatelessWidget {
  const SettingsAboutView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.defaultFont,
            ),
          ),
          title: Row(
            children: [
              Text(
                S.current.txtAbout,
                style: const TextStyle(
                  fontSize: headlineSmallSize,
                  fontWeight: headlineSmallWeight,
                  color: AppColor.defaultFont,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 48,
            vertical: padding24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Assets.logo.centalki.image(
                height: 160,
                width: 160,
              ),
              const SizedBox(height: spacing24),
              Text(
                S.current.txtCentalkiTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.defaultFont,
                  fontSize: displayLargeSize,
                  letterSpacing: -0.25,
                ),
              ),
              Text(
                S.current.txtCentalkiDescription,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  letterSpacing: 0.5,
                  height: 24 / 16,
                  color: AppColor.defaultFont,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 160.0,
              ),
              Text(
                S.current.txtCentalkiSource,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.25,
                  letterSpacing: 0.5,
                  fontSize: bodySmallSize,
                  fontWeight: bodySmallWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              const SizedBox(
                height: spacing32,
              ),
              Text(
                S.current.txtCentalkiVersion,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.0,
                  letterSpacing: 0.5,
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                  color: AppColor.defaultFont,
                ),
              ),
              Text(
                S.current.txtLastUpdated,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.0,
                  letterSpacing: 0.5,
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                  color: AppColor.defaultFont,
                ),
              ),
            ],
          ),
        ),
      );
}
