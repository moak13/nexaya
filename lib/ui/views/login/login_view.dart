import 'package:flutter/material.dart';
import 'package:nexaya/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';
import 'login_view.form.dart';
import 'widgets/primary_button.dart';
import 'widgets/social_button.dart';
import 'widgets/overlay_loader.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: OverlayLoader(
          isLoading: viewModel.isBusy,
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  verticalSpaceLarge,
                  Center(
                    child: Image.asset(
                      'assets/png/logo.png',
                      height: 120,
                      width: 120,
                    ),
                  ),
                  verticalSpaceSmall,
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
                  verticalSpaceMedium,
                  Text(
                    'sign in',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 40,
                      ),
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffF8FC3A),
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Hi there! Nice to see you again.',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 35,
                      ),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB8A8B7),
                    ),
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 34,
                          ),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffECECEC),
                        ),
                        hintText: 'example@gmail.com',
                        hintStyle: TextStyle(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 32,
                          ),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff765959),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 34,
                          ),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffECECEC),
                        ),
                        hintText: '********************',
                        hintStyle: TextStyle(
                          fontSize: getResponsiveFontSize(
                            context,
                            fontSize: 32,
                          ),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff765959),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                  PrimaryButton(
                    onTap: () {
                      if (viewModel.formKey.currentState?.validate() ?? false) {
                        viewModel.actionSignIn();
                      }
                    },
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Or',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 26,
                      ),
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: 'assets/png/instagram.png',
                        onTap: viewModel.actionTriggerInstagram,
                      ),
                      horizontalSpaceMedium,
                      SocialButton(
                        icon: 'assets/png/facebook.png',
                        onTap: viewModel.actionTriggerFacebook,
                      ),
                      horizontalSpaceMedium,
                      SocialButton(
                        icon: 'assets/png/twitter.png',
                        onTap: viewModel.actionTriggerTwitter,
                      ),
                      horizontalSpaceMedium,
                      SocialButton(
                        icon: 'assets/png/gmail.png',
                        onTap: viewModel.actionTriggerGmail,
                      ),
                    ],
                  ),
                  verticalSpaceMassive,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: viewModel.moveToForgotPassword,
                        child: Text(
                          'forgot password ?',
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 26,
                            ),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff948CEF),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: viewModel.moveToSignUp,
                        child: Text(
                          'sign up',
                          style: TextStyle(
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 26,
                            ),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffF3F804),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
