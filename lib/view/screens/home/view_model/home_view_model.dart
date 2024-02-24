import 'package:ecommerce_app/model/base_model.dart';

import '../../../../base_view_model/base_view_model.dart';
import '../../../../data_source/remote_data/repository/sappay_recharge_repository.dart';

class HomeViewModel extends BaseViewModel {
  EcommerceRepository repository;

  HomeViewModel({required this.repository}) {
    _onLoad();
  }

  String? _error = '';

  String? get error => _error;

  //**** Base Model ****//
  BaseModel? _baseModel;

  BaseModel? get baseModel => _baseModel;

  Future<void> _onLoad() async {
    _getHome();
  }

  Future<void> _getHome() async {
    try {
      dispatch(NotifierState.loading);
      _baseModel = await repository.getApiData();
      dispatch(NotifierState.loaded);
    } catch (e) {
      dispatch(NotifierState.error);
      _error = e.toString();
    }
  }
}
