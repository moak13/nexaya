import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nexaya/app/app.logger.dart';
import 'package:nexaya/data_model/error_model.dart';
import 'package:nexaya/exception/nexaya_exception.dart';

class DioService {
  final log = getLogger('DioService');

  late final Dio _dioClient;

  DioService() {
    _dioClient = Dio(
      BaseOptions(
        baseUrl:
            'https://api.mockfly.dev/mocks/61e24c65-a503-46e2-98ac-9d8c7e724133',
      ),
    );
    if (kDebugMode) {
      _dioClient.interceptors.add(
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
      );
    }
  }

  Future<Response> _sendRequest({
    required String path,
  }) async {
    final response = await _dioClient.get(
      path,
    );

    return response;
  }

  Future<Response> makeHttpRequest({
    required String path,
  }) async {
    try {
      final response = await _sendRequest(
        path: path,
      );

      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        throw NexayaException(
          message: 'No Internet',
        );
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        log.e(
          'This seems to be a network issue. Please check your network and try again.',
        );
        throw NexayaException(
          message: 'No Internet',
        );
      }

      if (e.response?.statusCode == 500) {
        throw NexayaException(message: 'Service Unavailable');
      }

      log.e(
        'A response error occurred. ${e.response?.statusCode}\nERROR: ${e.message}',
      );
      log.wtf(e.response?.data);
      throw NexayaException(
        message: ErrorModel.fromJson(e.response?.data).error ?? 'Unknown Error',
      );
    } catch (e) {
      log.e('Request to $path failed. Error details: $e');
      rethrow;
    }
  }
}
