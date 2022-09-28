import 'package:dio/dio.dart';
import 'package:utilities/data/dto/comment.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class CommentDataSource2 {
  final String baseUrl;

  CommentDataSource2({required this.baseUrl});

  Future<void> create({
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Comment",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.data, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> toggleLike({
    required final String commentId,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Comment/ToggleLikeComment/$commentId",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.data, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> update({
    required final String id,
    required final CommentCreateUpdateDto dto,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut3(
        url: "$baseUrl/Comment?id=$id",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.data, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Comment/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.data, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readByProductId({
    required final String id,
    required final Function(GenericResponse<CommentReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Comment/ReadByProductId/$id",
        action: (Response response) => onResponse(GenericResponse<CommentReadDto>.fromJson(response.data, fromMap: CommentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final Function(String) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/Comment?id=$id",
        action: (Response response) => onResponse(response.statusCode.toString()),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
