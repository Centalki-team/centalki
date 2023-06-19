import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/filled_error_button.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: height,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              padding16,
              MediaQuery.of(context).padding.top + kToolbarHeight,
              padding16,
              padding48,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.illustration.verifyEmailIllustration.path,
                  height: height / 4,
                ),
                const SizedBox(
                  height: spacing16,
                ),
                Text(
                  S.current.txtVerifyEmailTitle,
                  style: TextStyle(
                    fontSize: headlineLargeSize,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                Text(
                  S.current.txtVerifyEmailContent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: bodySmallSize,
                    fontWeight: bodySmallWeight,
                    height: 1.05,
                    color: AppColor.shadow,
                  ),
                ),
                const Spacer(),
                Text(
                  S.current.txtVerifyEmailContent2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: bodySmallSize,
                    fontWeight: bodySmallWeight,
                    height: 1.05,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(
                  height: spacing16,
                ),
                AppFilledErrorButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  text: S.current.txtSignOut,
                  minimumSize: const Size(400, 48),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
