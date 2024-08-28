import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rwad_two/dummy_projects/ecommerce/helpers/dio_helpers.dart';
import 'package:rwad_two/dummy_projects/ecommerce/helpers/kapi.dart';
import 'package:rwad_two/dummy_projects/ecommerce/home/model/BannerModel.dart';

import '../model/ProductModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  BannerModel bannerModel = BannerModel();
  ProductModel productModel = ProductModel();

  void getBanners() async {
    emit(HomeBannerLoading());
    try {
      final response = await DioHelpers.getData(path: KApi.banners);
      bannerModel = BannerModel.fromJson(response.data);
      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError());
      }
    } catch (e) {
      emit(HomeBannerError());
    }
  }

  void getProducts() async {
    emit(HomeProductLoading());
    try {
      final response = await DioHelpers.getData(path: KApi.products);
      productModel = ProductModel.fromJson(response.data);
      if (productModel.status == true) {
        emit(HomeProductSuccess());
      } else {
        emit(HomeProductError());
      }
    } catch (e) {
      emit(HomeProductError());
    }
  }
}
