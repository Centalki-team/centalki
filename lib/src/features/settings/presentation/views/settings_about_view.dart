import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../gen/assets.gen.dart';

class SettingsAboutView extends StatelessWidget {
  const SettingsAboutView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFDFCFF),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF43474E),
            ),
          ),
          title: Row(
            children: const [
              Text(
                AppText.txtAbout,
                style: TextStyle(
                  fontSize: 22.0,
                  height: 28.0,
                  color: Color(0xFF1A1C1E),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 24.0,
                  width: double.infinity,
                ),
                Assets.logo.centalki.image(
                  height: 184.0,
                  width: 184.0,
                ),
                const SizedBox(
                  height: 16.0,
                  width: double.infinity,
                ),
                const Text(
                  AppText.txtCentalkiTitle,
                  style: TextStyle(
                    color: Color(0xFF1A1C1E),
                    fontSize: 57.0,
                    letterSpacing: -0.25,
                    height: 64 / 57,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  AppText.txtCentalkiDescription,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    letterSpacing: 0.5,
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 160.0,
                ),
                const Text(
                  AppText.txtCentalkiSource,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    letterSpacing: 0.5,
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  AppText.txtCentalkiVersion,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    letterSpacing: 0.5,
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  AppText.txtLastUpdated,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    letterSpacing: 0.4,
                    height: 24 / 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
}
