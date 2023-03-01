import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/text.dart';
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
  //final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final nameConnections = [
    TextDoc.txtFacebook,
    TextDoc.txtGoogle,
    TextDoc.txtApple
  ];
  var gender = Gender.male;
  var connections = [false, true, false];

  @override
  Widget build(BuildContext context) => BlocListener<AccountInformationBloc,
          AccountInformationState>(
      listener: (context, state) {
        if (state is AccountInformationSavingState) {
          LoadingManager.setLoading(context, loading: true);
        } else {
          LoadingManager.setLoading(context);
          if (state is AccountInformationLoadDoneState) {
            emailController.text = state.email;
            //phoneController.text = state.phoneNumber;
            dateOfBirthController.text =
                DateFormat('yyyy-MM-dd').format(state.dateOfBirth);
            gender = state.gender;
          } else if (state is AccountInformationLoadFailureState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text(TextDoc.txtLoadFailed),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(TextDoc.txtOk),
                        )
                      ],
                    ));
          } else if (state is AccountInformationSaveFailureState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text(TextDoc.txtProfileUpdateFailed),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(TextDoc.txtOk),
                        )
                      ],
                    ));
          } else if (state is AccountInformationSaveDoneState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text(TextDoc.txtProfileUpdateSuccess),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(TextDoc.txtOk),
                        )
                      ],
                    ));
          }
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: const Text(TextDoc.txtAccountInformation),
              centerTitle: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: screenAutoPadding16, vertical: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          TextDoc.txtEmail,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: emailController,
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: spaceBetweenLine12,
                        ),
                        /*const Text(
                          TextDoc.txtPhoneNumberTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: phoneController,
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: spaceBetweenLine12,
                        ),*/
                        const Text(
                          TextDoc.txtDateOfBirthTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: dateOfBirthController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final datePicked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.parse(
                                        dateOfBirthController.text),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now());
                                if (datePicked != null) {
                                  if (mounted) {
                                    context.read<AccountInformationBloc>().add(
                                        const AccountInformationChangeEvent());
                                    dateOfBirthController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(datePicked);
                                  }
                                }
                              },
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: spaceBetweenLine12,
                        ),
                        const Text(
                          TextDoc.txtGenderTitle,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<AccountInformationBloc,
                            AccountInformationState>(
                          builder: (context, state) {
                            if (state is AccountInformationLoadingState) {
                              return Container();
                            }
                            return GenderRadioButtonGroup(
                              gender: gender,
                              genderCallback: (selectedValue) {
                                gender = selectedValue;
                                context
                                    .read<AccountInformationBloc>()
                                    .add(const AccountInformationChangeEvent());
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: spaceBetweenLine12,
                        ),
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
                                    ? TextDoc.txtConnected
                                    : TextDoc.txtConnect),
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
                        BlocBuilder<AccountInformationBloc,
                                AccountInformationState>(
                            builder: (context, state) => (state
                                    is AccountInformationChangingState)
                                ? ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<AccountInformationBloc>()
                                          .add(AccountInformationSaveEvent(
                                              DateTime.parse(dateOfBirthController.text),
                                              gender));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.secondary,
                                      foregroundColor: AppColor.defaultFont,
                                      minimumSize: const Size.fromHeight(48),
                                    ),
                                    child: const Text(TextDoc.txtSaveChanges))
                                : Container()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
