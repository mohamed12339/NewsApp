
import 'package:project_news/domain/model/source.dart';
import 'package:project_news/domain/repositories/news_repository_domain.dart';

class GetSourcesByCategoryAndLanguageUseCase {
  NewsRepository newsRepository;   ///  دا عشان احمل الداتا الي هيا فيها بقا كل ال source  الانا هاستخدمها بس بتاعة ال domain

  GetSourcesByCategoryAndLanguageUseCase(this.newsRepository);

  Future<List<Source>?> execute(String category, String language) =>
      newsRepository.loadSources(category, language);
}
