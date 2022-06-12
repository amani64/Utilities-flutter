import 'package:utilities/utilities.dart';

class AppSettingsDataSource {
  final String baseUrl;

  AppSettingsDataSource({required this.baseUrl});

  Future<void> readAppSettings({
    required final String url,
    required final Function(GenericResponse<AppSettingsDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readLocation({
    required final String url,
    required final Function(GenericResponse<LocationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadLocation",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
