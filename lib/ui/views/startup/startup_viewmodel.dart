import 'package:stacked/stacked.dart';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool switchState = false;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 300), _triggerState),
      Future.delayed(const Duration(seconds: 3)),
    ]);

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithLoginView();
  }

  void _triggerState() {
    switchState = !switchState;
    rebuildUi();
  }
}
