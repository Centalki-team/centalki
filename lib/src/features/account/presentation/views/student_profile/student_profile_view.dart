import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/avatar.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../topics/domain/entities/topic_item_entity.dart';
import '../../blocs/student_profile_bloc/student_profile_bloc.dart';
import '../../widgets/custom_checkbox_tile_item.dart';

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
  var selectedTopics = <String>[];
  var topics = <TopicItemEntity>[];

  void _validateStudentProfile(String value) {
    context.read<StudentProfileBloc>().add(StudentProfileChangeEvent(
          _fullNameController.text,
          _englishNameController.text,
          _bioController.text,
        ));
  }

  double _getTopicsAspectRatio(double widthView) => widthView < 400
      ? 1.6
      : widthView < 500
          ? 2
          : widthView < 1000
              ? 5
              : 10;

  @override
  Widget build(BuildContext context) =>
      BlocListener<StudentProfileBloc, StudentProfileState>(
        listener: (context, state) {
          if (state is StudentProfileSavingState ||
              state is StudentProfileLoadingState) {
            if (state is StudentProfileLoadingState) {
              LoadingManager.setLoading(context, loading: false);
            }
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is StudentProfileLoadDoneState) {
              _fullNameController.text = state.fullName;
              _englishNameController.text = state.englishName;
              _bioController.text = state.bio;
              avatarUrl = state.avatarUrl;
              fullName = state.fullName;
              selectedTopics.clear();
              selectedTopics = state.selectedInterestedTopicIds.toList();
              topics = state.topics;
            } else if (state is StudentProfileLoadFailedState) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: S.current.txtLoadFailed,
                  content: state.message,
                ),
              );
            } else if (state is StudentProfileSaveFailureState) {
              showDialog(
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: S.current.txtProfileUpdateFailed,
                  content: state.message,
                ),
              );
            } else if (state is StudentProfileSaveDoneState) {
              showDialog(
                context: context,
                builder: (context) => SuccessDialogContent(
                  title: S.current.txtProfileUpdateSuccess,
                ),
              );
            } else if (state is StudentProfileChangedState) {
              if (state.avatarUrl != null &&
                  (state.avatarUrl?.isNotEmpty ?? false)) {
                avatarUrl = state.avatarUrl!;
              }
            }
          }
        },
        child: LayoutBuilder(
          builder: (context, constraint) {
            final widthView = constraint.maxWidth;

            return Scaffold(
              //backgroundColor: AppColor.white,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
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
                            S.current.txtStudentProfile,
                            style: TextStyle(
                              fontSize: headlineSmallSize,
                              fontWeight: headlineSmallWeight,
                              color: colorsByTheme(context).defaultFont,
                              height: 1,
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
                                child: BlocBuilder<StudentProfileBloc,
                                    StudentProfileState>(
                                  builder: (context, state) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BlocBuilder<StudentProfileBloc,
                                          StudentProfileState>(
                                        buildWhen: (previous, current) =>
                                            current
                                                is StudentProfileChangedState,
                                        builder: (context, state) => Center(
                                          child: Avatar(
                                            avatarUrl: avatarUrl,
                                            maxRadius: 80,
                                            fullName: fullName,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: spacing8),
                                      BlocBuilder<StudentProfileBloc,
                                              StudentProfileState>(
                                          buildWhen: (previous, current) =>
                                              current
                                                  is StudentProfileChangedState,
                                          builder: (context, state) {
                                            if (state
                                                is StudentProfileChangedState) {
                                              if (state
                                                  .avatarException.isEmpty) {
                                                return Container();
                                              }
                                              return Center(
                                                child: Text(
                                                  state.avatarException,
                                                  style: const TextStyle(
                                                    fontSize: bodyLargeSize,
                                                    fontWeight: bodyLargeWeight,
                                                    color: AppColor.error,
                                                    height: 1,
                                                  ),
                                                ),
                                              );
                                            }
                                            return Container();
                                          }),
                                      Center(
                                        child: AppTextButton(
                                          text: S.current.txtChangeAvatar,
                                          onPressed: () {
                                            context.read<StudentProfileBloc>().add(
                                                const StudentProfileChangeAvatarEvent());
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: spacing16),
                                      Text(
                                        S.current.txtFullNameTitle,
                                        style: TextStyle(
                                          fontSize: titleMediumSize,
                                          fontWeight: titleMediumWeight,
                                          color: colorsByTheme(context)
                                              .defaultFont,
                                        ),
                                      ),
                                      AppOutlinedTextField(
                                        controller: _fullNameController,
                                        onChanged: _validateStudentProfile,
                                        errorText:
                                            state is StudentProfileChangedState &&
                                                    state.fullNameError
                                                        .isNotEmpty
                                                ? state.fullNameError
                                                : null,
                                      ),
                                      const SizedBox(height: spacing16),
                                      Text(
                                        S.current.txtEnglishNameTitle,
                                        style: TextStyle(
                                          fontSize: titleMediumSize,
                                          fontWeight: titleMediumWeight,
                                          color: colorsByTheme(context)
                                              .defaultFont,
                                        ),
                                      ),
                                      AppOutlinedTextField(
                                        controller: _englishNameController,
                                        onChanged: _validateStudentProfile,
                                        errorText:
                                            state is StudentProfileChangedState &&
                                                    state.englishNameError
                                                        .isNotEmpty
                                                ? state.englishNameError
                                                : null,
                                      ),
                                      const SizedBox(height: spacing16),
                                      Text(
                                        S.current.txtBioTitle,
                                        style: TextStyle(
                                          fontSize: titleMediumSize,
                                          fontWeight: titleMediumWeight,
                                          color: colorsByTheme(context)
                                              .defaultFont,
                                        ),
                                      ),
                                      AppOutlinedTextField(
                                        controller: _bioController,
                                        maxLines: 3,
                                        onChanged: _validateStudentProfile,
                                        errorText:
                                            state is StudentProfileChangedState &&
                                                    state.bioError.isNotEmpty
                                                ? state.bioError
                                                : null,
                                      ),
                                      const SizedBox(height: spacing16),
                                      Text(
                                        S.current.txtInterestedTopics,
                                        style: TextStyle(
                                          fontSize: titleMediumSize,
                                          fontWeight: titleMediumWeight,
                                          color: colorsByTheme(context)
                                              .defaultFont,
                                        ),
                                      ),
                                      BlocBuilder<StudentProfileBloc,
                                          StudentProfileState>(
                                        builder: (context, state) =>
                                            GridView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 16.0,
                                            crossAxisSpacing: 16.0,
                                            crossAxisCount: 2,
                                            childAspectRatio:
                                                _getTopicsAspectRatio(
                                                    widthView),
                                          ),
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: topics.length,
                                          itemBuilder: (_, index) =>
                                              CustomCheckboxTile(
                                            title:
                                                topics[index].topicName ?? '',
                                            value: selectedTopics.contains(
                                                topics[index].topicId),
                                            onChanged: (value) {
                                              value
                                                  ? selectedTopics.add(
                                                      topics[index].topicId!)
                                                  : selectedTopics.remove(
                                                      topics[index].topicId!);
                                              _validateStudentProfile('');
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 32.0,
                                      ),
                                    ],
                                  ),
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
                          color: Colors.transparent,
                          child: AppElevatedButton(
                            onPressed: state is StudentProfileChangedState &&
                                    state.forceDisabled == false
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
                            text: S.current.txtSaveChanges,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
