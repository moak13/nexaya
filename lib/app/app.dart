import 'package:nexaya/ui/views/home/home_view.dart';
import 'package:nexaya/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:nexaya/ui/views/login/login_view.dart';
import 'package:nexaya/services/dio_service.dart';
import 'package:nexaya/services/user_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: StartupView,
      initial: true,
    ),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: HomeView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: UserService),
// @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
