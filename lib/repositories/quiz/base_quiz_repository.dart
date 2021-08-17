import 'package:chatapp/enums/difficulty.dart';
import 'package:chatapp/models/question_model.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    required int numQuestions,
    required int categoryId,
    required Difficulty difficulty,
  });
}
