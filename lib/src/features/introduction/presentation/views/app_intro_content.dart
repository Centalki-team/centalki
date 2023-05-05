import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../gen/assets.gen.dart';
import '../blocs/app_intro_bloc/app_intro_bloc.dart';

class AppIntroContent extends StatefulWidget {
  const AppIntroContent({super.key});

  @override
  State<AppIntroContent> createState() => _AppIntroContentState();
}

class _AppIntroContentState extends State<AppIntroContent> {
  final CarouselController _carouselController = CarouselController();
  final int introsLength = 3;
  String? swipeDirection;
  late bool allowPop;

  @override
  void initState() {
    allowPop = false;
    super.initState();
    context.read<AppIntroBloc>().add(const AppIntroLoadEvent());
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(allowPop),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.white,
            centerTitle: false,
            automaticallyImplyLeading: false,
            titleSpacing: 16.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _navigateToHomeScreen,
                  child: const Text(
                    'Skip >>',
                    style: TextStyle(
                      fontSize: titleMediumSize,
                      fontWeight: titleMediumWeight,
                      color: AppColor.mainColor1,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (details) {
              swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
            },
            onPanEnd: (details) {
              if (swipeDirection == null) {
                return;
              }
              if (swipeDirection == 'left') {
                _carouselController.nextPage();
              }
              if (swipeDirection == 'right') {
                _carouselController.previousPage();
              }
            },
            child: Container(
              color: AppColor.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BlocBuilder<AppIntroBloc, AppIntroState>(
                      buildWhen: (previous, current) =>
                          current != previous && current is AppIntroLoadedState,
                      builder: (context, state) {
                        if (state is AppIntroLoadedState) {
                          final intros = state.appIntros;
                          return CarouselSlider.builder(
                            itemCount: intros.length,
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              enlargeCenterPage: false,
                              clipBehavior: Clip.antiAlias,
                              scrollPhysics: const ClampingScrollPhysics(),
                              viewportFraction: 1,
                              initialPage: 0,
                              reverse: false,
                              enableInfiniteScroll: false,
                              aspectRatio: 320 / 500,
                              onPageChanged: (index, _) {
                                context
                                    .read<AppIntroBloc>()
                                    .add(AppIntroScrollEvent(index: index));
                              },
                            ),
                            itemBuilder: (context, i, id) => Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: SizedBox(
                                    height: 320.0,
                                    child: SvgGenImage(intros[i].img).svg(
                                      height: 320.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    intros[i].title,
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: intros[i].content,
                                ),
                                const Spacer(),
                                if (i == intros.length - 1)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: AppFilledButton(
                                      text: AppText.txtGetStarted,
                                      minimumSize: const Size.fromHeight(40),
                                      onPressed: _navigateToHomeScreen,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  BlocBuilder<AppIntroBloc, AppIntroState>(
                    buildWhen: (previous, current) =>
                        current != previous &&
                        current is AppIntroPageIndexChangeState,
                    builder: (context, state) {
                      var currentIndex = 0;
                      if (state is AppIntroPageIndexChangeState) {
                        currentIndex = state.currentIndex;
                      }
                      return SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: padding40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              introsLength,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: index == currentIndex
                                        ? AppColor.mainColor2
                                        : AppColor.background,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: const SizedBox(
                                    height: 6.0,
                                    width: 32.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  _navigateToHomeScreen() {
    context.read<AppIntroBloc>().add(const AppIntroConfirmEvent());
    allowPop = true;
    Navigator.of(context).pop();
  }
}
