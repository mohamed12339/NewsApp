import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:project_news/data/api_manager.dart';
import 'package:project_news/data/mappers/source_mapper.dart';
import 'package:project_news/data/repositories/data_sources/local_datasource/new_local_datasource.dart';
import 'package:project_news/data/repositories/data_sources/local_datasource/new_local_datasource_impl.dart';
import 'package:project_news/data/repositories/data_sources/remote_datasource/news_remote_datasource.dart';
import 'package:project_news/data/repositories/data_sources/remote_datasource/news_remote_datasource_impl.dart';
import 'package:project_news/data/repositories/news_repository_impl.dart';
import 'package:project_news/domain/repositories/news_repository_domain.dart';
import 'package:project_news/domain/usecases/get_sources_usecase.dart';
import 'package:project_news/ui/screens/news/news_view_model.dart';

var getIt = GetIt.instance ; /// انا كريت variable  لل app كلو عشان اشتغل بية

void configureDependencies(){  /// انا لازم بقا هنا اعرفها كل الحاجات الي موجودة في ال viewModel ولازم اعرفها الفانكشن دية في ال التطبيق روح عرفها في ال main

  getIt.registerSingleton(Connectivity()); ///انا كدا بقولها عرفلي ال object دا بس وقولت singleton عشان يعمل object واحد بس

  getIt.registerSingleton(SourceMapper()); ///انا كدا بقولها عرفلي ال object دا بس وقولت singleton عشان يعمل object واحد بس

  getIt.registerSingleton<NewsLocalDataSource>(NewsLocalDataSourceImpl()); /// انا بعتلوا NewsLocalDataSource وبقولوا ابعتلي مكانو NewsLocalDataSourceImpl عشان ميضربش ايرور لازم اقولوا كدا

  getIt.registerSingleton(ApiManager.instance); ///انا كدا بقولها عرفلي ال object دا بس وقولت singleton عشان يعمل object واحد بس

  getIt.registerSingleton<NewsRemoteDataSource>(NewsRemoteDataSourceImpl(getIt())); /// انا بعتلوا NewsRemoteDataSource وبقولوا ابعتلي مكانو NewsRemoteDataSourceImpl عشان ميضربش ايرور لازم اقولوا كدا وكمان كان عايز api manager فا قولت ل getit هاتية

  getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl( /// انا بعتلوا NewsRepository وبقولوا ابعتلي مكانو NewsRepositoryImpl عشان ميضربش ايرور لازم اقولوا كدا وكمان كان عايز كل دا  فا قولت ل getit هاتية
    remoteDataSource: getIt(),
    localDataSource: getIt(),
    connectivity: getIt(),
    sourceMapper: getIt(),
  ));

  getIt.registerSingleton(GetSourcesByCategoryAndLanguageUseCase(getIt())); /// انا بعتلوا GetSourcesByCategoryAndLanguageUseCase عشان ميضربش ايرور لازم اقولوا كدا وكمان كان عايز newreposotiry فا قولت ل getit هاتية

  getIt.registerSingleton(NewsViewModel(getIt())); /// انا بعتلوا NewsViewModel عشان ميضربش ايرور لازم اقولوا كدا وكمان كان عايز GetSourcesByCategoryAndLanguageUseCase فا قولت ل getit هاتية
}