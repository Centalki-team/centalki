import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
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
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          //backgroundColor: AppColor.white,
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
                S.current.txtLanguage,
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
          child: BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) => VerticalRadioGroup(
              key: UniqueKey(),
              onChanged: (value) {
                context
                    .read<ApplicationBloc>()
                    .add(ApplicationLocaleChanged(locale: value.locale));
              },
              initValue: state.locale,
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
