import 'package:get_it/get_it.dart';
import '../data_source/remote_data/repository/sappay_recharge_repository.dart';
import '../utils/app_routes/app_routes.dart';
import '../utils/app_snackbars/app_snackbar.dart';
import 'connectivity_service.dart';

GetIt getIt = GetIt.instance;

void setupDI() {

  //register routes
  getIt.registerLazySingleton<AppRoutes>(() => AppRoutes());

  //register repository
  getIt.registerLazySingleton<EcommerceRepository>(
      () => EcommerceRepository());

  //register connectivity service
  _injectConnectivityService();


  //register view models
  _injectViewModels();

  //give new instance everytime it call form validation
  _injectUtilities();
}

//------------Utils------------
void _injectUtilities() {
  getIt.registerFactory<FlushBarMessage>(() => FlushBarMessage());
}

//------------view models------------
void _injectViewModels() {

  // getIt.registerFactory<HomeViewModel>(
  //     () => HomeViewModel(repository: getIt.get()));

  // getIt.registerLazySingleton<GroupInternetPackViewModel>(
  //     () => GroupInternetPackViewModel(repository: getIt.get()));
}


//------------inject Connectivity Service-----------
void _injectConnectivityService() {
  getIt.registerSingleton<ConnectivityService>(ConnectivityService());
}
