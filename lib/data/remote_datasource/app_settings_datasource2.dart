

import 'package:dio/dio.dart';
import 'package:utilities/data/dto/app_settings.dart';
import 'package:utilities/data/dto/app_settings2.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/location.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class AppSettingsDataSource2 {
  final String baseUrl;

  AppSettingsDataSource2({required this.baseUrl});

  Future<void> readAppSettings({
    required final String url,
    required final Function(GenericResponse<AppSettingsDto2>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response<dynamic> response) => onResponse(GenericResponse<AppSettingsDto2>.fromJson(response.data, fromMap: AppSettingsDto2.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
      );
  Future<void> readAppSettings2({
    required final String url,
    required final Function(GenericResponse<AppSettingsDto2>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response response) => onResponse(GenericResponse<AppSettingsDto2>.fromJson(response.data, fromMap: AppSettingsDto2.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDto2.fromMap)),
      );

  Future<void> readLocation({
    required final String url,
    required final Function(GenericResponse<LocationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadLocation",
        action: (Response response) => onResponse(GenericResponse<LocationReadDto>.fromJson(response.data, fromMap: LocationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDto2.fromMap)),
      );
}
