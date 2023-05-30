import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:trip/cubit/app_cubit_state.dart';
import 'package:trip/model/data_model.dart';
import 'package:trip/services/data_service.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData() async{
    try{
      emit(LoadingState());
      places=await data.getInfo();
      emit(LoadedState(places));
    }catch(e){}
  }

  getStart(){ 
    emit(GetStartState());
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }
}