import 'package:utilities/utilities.dart';

class CommentDataSource {
  final String baseUrl;

  CommentDataSource({required this.baseUrl});

  Future<void> create({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, CommentReadDto.fromMap)),
      );

  Future<void> update({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, CommentReadDto.fromMap)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, CommentReadDto.fromMap)),
      );
  Future<void> readByProductId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Comment/ReadByProductId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, CommentReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.body, CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, CommentReadDto.fromMap)),
      );
}
