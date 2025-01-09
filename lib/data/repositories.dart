// lib/data/repositories/user_repository.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:rune/core/models/auth_data_model.dart';
import 'package:rune/core/models/user_model.dart';
import 'package:rune/imports.dart';
import 'package:toastification/toastification.dart';

import '../core/models/username_model.dart';

class UserRepository {
  final dio = Dio();
  final String API = 'https://rune-dzt8.onrender.com';

  void configureDio(String? token) {
    if (token == null || token.isEmpty) return;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        var signalHeaders = {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json'
        };
        options.headers.addAll(signalHeaders);
        options.extra['withCredentials'] = true;
        return handler.next(options);
      },
    ));
  }

  Future getUser({required String token}) async {
    configureDio(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiODQ4ZDZiMGYtYTQ0Zi00OGJkLTg5MDEtNDg0YTQwNTA1M2Q4IiwidXNlcm5hbWUiOiJSYW9fMDEiLCJpc3MiOiI4NDhkNmIwZi1hNDRmLTQ4YmQtODkwMS00ODRhNDA1MDUzZDgiLCJzdWIiOiJSYW9fMDEiLCJleHAiOjE3Mzg4NjA0MDcsImlhdCI6MTczNjI2ODQwNywianRpIjoiODQ4ZDZiMGYtYTQ0Zi00OGJkLTg5MDEtNDg0YTQwNTA1M2Q4In0.OpiIK2juMuODnxtIJ5E6Pq_XvLYD_gG1SMvUxheNCEE");

    try {
      var response = await dio.get('$API/accounts/me');
      print(response.data);
      UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      if (e is DioException) {
        print({"DIOException": e});
      } else {
        print({"Exception": e});
      }
    }
  }

  Future<AuthData?> RegisterUser(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      // Convert the body map to FormData
      FormData formData = FormData.fromMap(body);
      print({"imafe": body['image']});
      // Add the file to FormData if a file path is provided
      if (body['image'] != null) {
        String? mimeType = lookupMimeType(body['image']);
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(
            body['image'],
            filename: body['image'].split('/').last,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        ));
      }

      // Make the POST request with multipart data
      var response = await dio.post(
        '$API/auth/register',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      print(response.data);
      // Parse the response data into AuthData
      AuthData authData = AuthData.fromJson(response.data['data']);

      return authData;
    } catch (e) {
      if (e is DioException) {
        print({"DIOException": e.response?.data});
        toastification.show(
            context: context,
            title: e.response?.data['message'],
            animationDuration: Duration(seconds: 2),
            type: ToastificationType.error);
      } else {
        print(e);
      }
      return null;
    }
  }

  Future AuthenticateUser(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      var response = await dio.post('$API/auth/login', data: body);
      // print(response.data);
      AuthData authData = AuthData.fromJson(response.data['data']);

      return authData;
    } catch (e) {
      if (e is DioException) {
        print({"DIOException": e.response?.data});
        toastification.show(
            context: context,
            title: e.response?.data['message'],
            type: ToastificationType.error);
      } else {
        print(e);
      }
    }
  }

  Future CheckUserName({required String username}) async {
    try {
      var response = await dio.post('$API/check-username/$username');
      UsernameResponse usernameResponse =
          UsernameResponse.fromJson(response.data);
      print(response.data);
      return usernameResponse;
    } catch (e) {
      if (e is DioException) {
        print({"DIOException": e.response?.data});

        UsernameResponse usernameResponse =
            UsernameResponse.fromJson(e.response?.data);

        return usernameResponse;
      } else {
        print(e);
      }
    }
  }
}
