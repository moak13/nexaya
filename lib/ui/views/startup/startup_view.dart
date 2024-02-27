import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:nexaya/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: getResponsiveFontSize(
                  context,
                  fontSize: 45,
                ),
                fontWeight: FontWeight.w400,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 5.0),
                  ),
                ],
              ),
            ),
            Text(
              'to',
              style: TextStyle(
                fontSize: getResponsiveFontSize(
                  context,
                  fontSize: 40,
                ),
                fontWeight: FontWeight.w400,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            Text(
              'our shop',
              style: TextStyle(
                fontSize: getResponsiveFontSize(
                  context,
                  fontSize: 40,
                ),
                fontWeight: FontWeight.w400,
                color: Colors.white,
                shadows: const [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: Builder(builder: (context) {
                if (viewModel.switchState == false) {
                  return const SizedBox.shrink();
                }

                return Column(
                  children: [
                    verticalSpaceSmall,
                    Image.asset(
                      'assets/png/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ],
                );
              }),
            ),
            verticalSpaceMedium,
            RichText(
              text: TextSpan(
                text: 'The',
                style: TextStyle(
                  color: const Color(0xff8E1CFF),
                  fontSize: getResponsiveFontSize(
                    context,
                    fontSize: 45,
                  ),
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: 'Kurti',
                    style: TextStyle(
                      color: const Color(0xff2BF2FF),
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 42,
                      ),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: 'Palette',
                    style: TextStyle(
                      color: const Color(0xff8E1CFF),
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 41,
                      ),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
