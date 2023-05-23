import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../di/di_module.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../../application/presentation/blocs/application_bloc/application_bloc.dart';
import '../widgets/setting_switch_row.dart';

class SettingsAppearance extends StatelessWidget {
  const SettingsAppearance({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocListener<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          MyApp.setTheme(context, isDark: state.isDarkMode);
        },
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) => Scaffold(
            //backgroundColor: Colors.white,
            appBar: AppBar(
              //backgroundColor: const Color(0xFFFDFCFF),
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Icon(
                  Icons.arrow_back,
                  color: colorsByTheme(context).defaultFont,
                ),
              ),
              title: Row(
                children: [
                  Text(
                    S.current.txtAppearance,
                    style: TextStyle(
                      fontSize: headlineSmallSize,
                      fontWeight: headlineSmallWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: spacing4,
                    ),
                    Text(
                      S.current.txtApplicationTheme,
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: colorsByTheme(context).defaultFont,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 16.0,
                      ),
                      child: SettingSwitchRow(
                        initialValue: state.isDarkMode,
                        title: S.current.txtDarkMode,
                        onChanged: (value) => context
                            .read<ApplicationBloc>()
                            .add(ApplicationDarkModeChanged(enable: value)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
