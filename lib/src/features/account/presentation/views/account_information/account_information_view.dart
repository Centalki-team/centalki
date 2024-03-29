import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../generated/l10n.dart';
import '../../../domain/entities/user_account_entity.dart';
import '../../blocs/account_information_bloc/account_information_bloc.dart';
import '../../widgets/gender_radio_button_group.dart';

class AccountInformationView extends StatefulWidget {
  const AccountInformationView({Key? key}) : super(key: key);

  @override
  State<AccountInformationView> createState() => _AccountInformationViewState();
}

class _AccountInformationViewState extends State<AccountInformationView> {
  final emailController = TextEditingController();

  final dateOfBirthController = TextEditingController();
  final nameConnections = [
    S.current.txtFacebook,
    S.current.txtGoogle,
    S.current.txtApple
  ];
  var gender = Gender.male;
  var connections = [false, true, false];

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AccountInformationBloc, AccountInformationState>(
        listener: (context, state) {
          if (state is AccountInformationSavingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is AccountInformationLoadDoneState) {
              emailController.text = state.email;
              dateOfBirthController.text =
                  DateFormat('yyyy-MM-dd').format(state.dateOfBirth);
              gender = state.gender;
            } else if (state is AccountInformationLoadFailureState) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: S.current.txtLoadFailed,
                  content: state.message,
                ),
              );
            } else if (state is AccountInformationSaveFailureState) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: S.current.txtProfileUpdateFailed,
                  content: state.message,
                ),
              );
            } else if (state is AccountInformationSaveDoneState) {
              showDialog(
                context: context,
                builder: (context) => SuccessDialogContent(
                  title: S.current.txtProfileUpdateSuccess,
                ),
              );
            }
          }
        },
        builder: (context, state) => state is AccountInformationLoadingState
            ? Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                //backgroundColor: AppColor.white,
                body: Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverAppBar.medium(
                          expandedHeight: sliverAppBarHeight,
                          leading: IconButton(
                            onPressed: Navigator.of(context).pop,
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          title: Text(
                            S.current.txtAccountInformation,
                            style: TextStyle(
                              fontSize: headlineSmallSize,
                              fontWeight: headlineSmallWeight,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          centerTitle: true,
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: 1,
                            (_, index) => Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 80),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.current.txtEmail,
                                      style: TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                    TextField(
                                      controller: emailController,
                                      enabled: false,
                                      style: TextStyle(
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          borderSide: BorderSide(
                                            color: AppColor.background,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: spacing16),
                                    Text(
                                      S.current.txtDateOfBirthTitle,
                                      style: TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                    TextField(
                                      controller: dateOfBirthController,
                                      readOnly: true,
                                      style: TextStyle(
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(radius8)),
                                          borderSide: BorderSide(
                                            color: AppColor.container,
                                            width: enabledOutlineWidthTextField,
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(radius8)),
                                          borderSide: BorderSide(
                                            color: AppColor.container,
                                            width: enabledOutlineWidthTextField,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () async {
                                            final datePicked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.parse(
                                                  dateOfBirthController.text),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now(),
                                              initialEntryMode:
                                                  DatePickerEntryMode
                                                      .calendarOnly,
                                              builder: (context, child) =>
                                                  Theme(
                                                data:
                                                    Theme.of(context).copyWith(
                                                  colorScheme: ColorScheme.dark(
                                                    primary: AppColor
                                                        .mainColor1Container,
                                                    surface: colorsByTheme(
                                                                context)
                                                            .backgroundCardHistoryWallet ??
                                                        AppColor.white,
                                                    onSurface:
                                                        colorsByTheme(context)
                                                                .defaultFont ??
                                                            AppColor.white,
                                                    tertiary: AppColor
                                                        .mainColor1Container,
                                                  ),
                                                  dialogBackgroundColor:
                                                      colorsByTheme(context)
                                                          .backgroundTheme,
                                                  textTheme: const TextTheme(
                                                    headline5: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ),
                                                    // Selected Date landscape
                                                    headline6: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ),
                                                    // Selected Date portrait
                                                    overline: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ),
                                                    // Title - SELECT DATE
                                                    bodyText1: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ),
                                                    // Year gridview picker
                                                    subtitle1: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ),
                                                    // Date input
                                                    subtitle2: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ),
                                                    // Month/Year picker
                                                    caption: TextStyle(
                                                      fontFamily: 'NotoSans',
                                                    ), // days
                                                  ),
                                                ),
                                                child: child!,
                                              ),
                                            );
                                            if (datePicked != null) {
                                              if (mounted) {
                                                context
                                                    .read<
                                                        AccountInformationBloc>()
                                                    .add(
                                                      const AccountInformationChangeEvent(),
                                                    );
                                                dateOfBirthController.text =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(datePicked);
                                              }
                                            }
                                          },
                                          icon: Icon(
                                            Icons.calendar_today_outlined,
                                            color: colorsByTheme(context)
                                                .defaultFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: spacing16),
                                    Text(
                                      S.current.txtGenderTitle,
                                      style: TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                    GenderRadioButtonGroup(
                                      gender: gender,
                                      genderCallback: (selectedValue) {
                                        gender = selectedValue;
                                        context.read<AccountInformationBloc>().add(
                                            const AccountInformationChangeEvent());
                                      },
                                    ),
                                    const SizedBox(height: spacing16),
                                    /*const Text(
                                TextDoc.txtConnectionsTitle,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: nameConnections.length,
                                  itemBuilder: (_, index) => Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(nameConnections[index]),
                                      TextButton(
                                        onPressed: () {
                                          context.read<AccountInformationBloc>().add(
                                              const AccountInformationConnectEvent());
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              connections[index] ? mainColor1 : support,
                                        ),
                                        child: Text(connections[index]
                                            ? S.current.txtConnected
                                            : S.current.txtConnect),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: spaceBetweenLine12,
                                ),*/
                                    /*const Text(
                                TextDoc.txtPaymentMethodTitle,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: spaceBetweenLine20,
                              ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 24.0,
                        ),
                        color: colorsByTheme(context).backgroundTheme,
                        child: AppElevatedButton(
                          text: S.current.txtSaveChanges,
                          minimumSize: const Size.fromHeight(48),
                          onPressed: state is AccountInformationChangingState
                              ? () =>
                                  context.read<AccountInformationBloc>().add(
                                        AccountInformationSaveEvent(
                                          DateTime.parse(
                                              dateOfBirthController.text),
                                          gender,
                                        ),
                                      )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
}
