import 'package:dio/dio.dart';
import 'package:mysivi/core/model/common_model/commonmodel.dart';
import 'package:mysivi/service/common_service/common_service.dart';

import '../../../core/interceptor_exception/dio_exception/dio_interceptor.dart';
import '../../../core/model/wordmodel/Word_model.dart';

class ChatRepository extends ChatService {
  @override
  Future<List<CommentModel>> chatFetching(String url) async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
      ),
    )..interceptors.add(AppLogInterceptor());

    final Response response = await dio.get(url);

    // response.data is a MAP, not a LIST
    final Map<String, dynamic> json = response.data;

    // extract comments list
    final List<dynamic> data = json['comments'];

    return data.map((item) => CommentModel.fromJson(item)).toList();
  }

  @override
  Future<WordModel?> dictionarySearch(String word) async {
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          responseType: ResponseType.json,
        ),
      )..interceptors.add(AppLogInterceptor());

      final Response response = await dio.get(
        'https://dictionary.khoister.io/api/words/$word',
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> jsonMap = response.data;
        return WordModel.fromJson(jsonMap);
      }
    } on DioError catch (e) {
      print("Dio error: ${e.message}");
      if (e.response?.statusCode == 404) {
        return null; // Word not found
      }
    } catch (e) {
      print("Unknown error: $e");
    }

    return null;
  }
}
