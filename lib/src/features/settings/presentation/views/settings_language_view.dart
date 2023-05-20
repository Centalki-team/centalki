import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';
import '../../../application/presentation/blocs/application_bloc/application_bloc.dart';
import '../../domain/entities/language_entity.dart';
import '../widgets/vertical_radio_group.dart';

class SettingsLanguage extends StatefulWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

  @override
  State<SettingsLanguage> createState() => _SettingsLanguageState();
}

class _SettingsLanguageState extends State<SettingsLanguage> {
  late String currentLocale;

  @override
  void initState() {
    currentLocale = BlocProvider.of<ApplicationBloc>(context).state.locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          if (state.locale != currentLocale) {
            MyApp.setLocale(context, Locale(state.locale));
            setState(() {
              currentLocale = state.locale;
            });
          }
        },
        child: Scaffold(
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
                  S.current.txtLanguage,
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
            child: VerticalRadioGroup(
              key: UniqueKey(),
              onChanged: (value) {
                context
                    .read<ApplicationBloc>()
                    .add(ApplicationLocaleChanged(locale: value.locale));
              },
              initValue: currentLocale,
              dataList: [
                LanguageEntity(
                  name: S.current.txtEnglish,
                  locale: 'en',
                ),
                LanguageEntity(
                  name: S.current.txtVietnamese,
                  locale: 'vi',
                ),
              ],
            ),
          ),
        ),
      );
}
