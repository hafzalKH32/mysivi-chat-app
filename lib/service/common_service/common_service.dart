import 'package:mysivi/core/model/wordmodel/Word_model.dart';

import '../../core/model/common_model/commonmodel.dart';

abstract class ChatService {
  Future<List<CommentModel>> chatFetching(String url);

  Future<WordModel?> dictionarySearch(String word);
}
