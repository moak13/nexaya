import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/data_model/user_model.dart';
import 'package:nexaya/services/user_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<UserModel?> {
  final _userService = locator<UserService>();

  @override
  Future<UserModel?> futureToRun() async {
    return await _userService.getUser();
  }
}
