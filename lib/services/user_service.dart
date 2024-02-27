import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.logger.dart';
import 'package:nexaya/data_model/user_model.dart';
import 'package:nexaya/exception/nexaya_exception.dart';
import 'package:nexaya/services/dio_service.dart';

class UserService {
  final _dioService = locator<DioService>();
  final _logger = getLogger('UserService');

  Future<UserModel?> getUser() async {
    try {
      final response = await _dioService.makeHttpRequest(
        path: '/user',
      );

      return UserModel.fromJson(response.data);
    } on NexayaException catch (e) {
      _logger.e('State Error while trying to get account', e.message);
      rethrow;
    } catch (e, s) {
      _logger.e('Error while trying to get account', e, s);
      rethrow;
    }
  }
}
