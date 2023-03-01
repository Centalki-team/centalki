import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/avatar.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../topics/domain/entities/topic_item_entity.dart';
import '../../blocs/student_profile_bloc/student_profile_bloc.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({Key? key}) : super(key: key);

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {
  final _fullNameController = TextEditingController();
  final _englishNameController = TextEditingController();
  final _bioController = TextEditingController();

  var avatarUrl = '';
  var fullName = '';
  var selectedTopics = <bool>[];
  var topics = <TopicItemEntity>[];

  void _validateStudentProfile(String value) {
    context.read<StudentProfileBloc>().add(const StudentProfileChangeEvent());
  }

  double _getTopicsAspectRatio(double widthView) => widthView < 400
      ? 1.6
      : widthView < 500
          ? 2
          : widthView < 1000
              ? 5
              : 10;

  @override
  Widget build(BuildContext context) => BlocListener<StudentProfileBloc, StudentProfileState>(
        listener: (context, state) {
          if (state is StudentProfileSavingState || state is StudentProfileLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is StudentProfileLoadDoneState) {
              _fullNameController.text = state.fullName;
              _englishNameController.text = state.englishName;
              _bioController.text = state.bio;
              avatarUrl = state.avatarUrl;
              fullName = state.fullName;
              selectedTopics = state.selectedInterestedTopicIds.toList();
              topics = state.topics;
            } else if (state is StudentProfileLoadFailedState) {
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
                ),
              );
            } else if (state is StudentProfileSaveFailureState) {
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
                ),
              );
            } else if (state is StudentProfileSaveDoneState) {
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
                ),
              );
            }
          }
        },
        child: LayoutBuilder(
          builder: (context, constraint) {
            final widthView = constraint.maxWidth;

            return Scaffold(
              backgroundColor: AppColor.white,
              body: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverAppBar.medium(
                        title: const Text(
                          TextDoc.txtStudentProfile,
                          style: TextStyle(
                            fontSize: headlineSmallSize,
                            fontWeight: headlineSmallWeight,
                            color: AppColor.defaultFont,
                          ),
                        ),
                        centerTitle: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (_, index) => Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: BlocBuilder<StudentProfileBloc, StudentProfileState>(
                                      builder: (context, state) => Avatar(
                                        avatarUrl: avatarUrl,
                                        maxRadius: 80,
                                        fullName: fullName,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: spaceBetweenLine16),
                                  const Text(
                                    TextDoc.txtFullNameTitle,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  AppOutlinedTextField(
                                    controller: _fullNameController,
                                    onChanged: _validateStudentProfile,
                                  ),
                                  const SizedBox(height: spaceBetweenLine16),
                                  const Text(
                                    TextDoc.txtEnglishNameTitle,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  AppOutlinedTextField(
                                    controller: _englishNameController,
                                    onChanged: _validateStudentProfile,
                                  ),
                                  const SizedBox(height: spaceBetweenLine16),
                                  const Text(
                                    TextDoc.txtBioTitle,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  AppOutlinedTextField(
                                    controller: _bioController,
                                    maxLines: 3,
                                    onChanged: _validateStudentProfile,
                                  ),
                                  const SizedBox(height: spaceBetweenLine16),
                                  const Text(
                                    TextDoc.txtInterestedTopics,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  BlocBuilder<StudentProfileBloc, StudentProfileState>(
                                    builder: (context, state) => GridView.builder(
                                      padding: const EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: _getTopicsAspectRatio(widthView),
                                      ),
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: topics.length,
                                      itemBuilder: (_, index) => CheckboxListTile(
                                        value: selectedTopics[index],
                                        activeColor: AppColor.mainColor2,
                                        onChanged: (value) {
                                          selectedTopics[index] = value ?? false;
                                          context.read<StudentProfileBloc>().add(const StudentProfileChangeEvent());
                                        },
                                        title: Text(
                                          '${index + 1}. ${topics[index].topicName}',
                                          style: const TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<StudentProfileBloc, StudentProfileState>(
                    builder: (context, state) => Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 24.0,
                        ),
                        color: AppColor.white,
                        child: AppElevatedButton(
                          onPressed: state is StudentProfileChangedState
                              ? () {
                                  context.read<StudentProfileBloc>().add(
                                        StudentProfileSaveChangesEvent(
                                          avatarUrl,
                                          _fullNameController.text,
                                          _englishNameController.text,
                                          _bioController.text,
                                          selectedTopics,
                                        ),
                                      );
                                }
                              : null,
                          minimumSize: const Size.fromHeight(48),
                          text: TextDoc.txtSaveChanges,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
