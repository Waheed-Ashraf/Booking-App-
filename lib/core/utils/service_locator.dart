// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  // cubit

// EX =>   getIt.registerFactory<MedicalRecordSectionsCubit>(
  //    () => MedicalRecordSectionsCubit(getIt()));

  //Repo
// EX =>   getIt.registerLazySingleton<SectionRepository>(() => SectionRepositoryImpl());

  // webServices
// EX =>  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
