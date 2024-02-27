import 'package:flutter/widgets.dart';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void moveToForgotPassword() {}

  void moveToSignUp() {}

  Future<void> actionSignIn() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replaceWithHomeView();
    setBusy(false);
  }

  void actionTriggerInstagram() {}

  void actionTriggerFacebook() {}

  void actionTriggerTwitter() {}

  void actionTriggerGmail() {}
}
