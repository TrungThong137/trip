

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/cubit/app_cubit_state.dart';
import 'package:trip/page/detail_page.dart';
import 'package:trip/page/navpages/home_page.dart';
import 'package:trip/page/page_header.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is DetailState){
            return const DetailPage();
          }if(state is WelcomeState){
            return const PageHeader();
          }if(state is LoadedState){
            return const HomePage();
          }if(state is LoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}