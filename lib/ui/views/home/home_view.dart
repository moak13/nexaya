import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:nexaya/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';
import 'widgets/info_widget.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              if (viewModel.isBusy) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }

              if (viewModel.hasError) {
                return Center(
                  child: Text(viewModel.modelMessage ?? ''),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 50,
                      ),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffF8FC3A),
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: InfoWidget(
                      title: 'Name:',
                      data: viewModel.data?.name ?? '--',
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: InfoWidget(
                      title: 'Age:',
                      data: viewModel.data?.age?.toString() ?? '--',
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: InfoWidget(
                      title: 'Gender:',
                      data: viewModel.data?.gender ?? '--',
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: InfoWidget(
                      title: 'Occupation:',
                      data: viewModel.data?.occupation ?? '--',
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
