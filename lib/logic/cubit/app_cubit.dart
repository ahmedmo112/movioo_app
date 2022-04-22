import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movioo/logic/network/dio_helper.dart';
import 'package:movioo/logic/network/end_point.dart';
import 'package:movioo/logic/network/key.dart';
import 'package:movioo/model/detail_model.dart';
import 'package:movioo/model/movie_model.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  MovieModel? movieModel;
  List<Results>? popularMovieList=[];
  List<Results>? topRatedMovieList=[];
  List<Results>? upcomingMovieList=[];
  List<String>? slider=[];
  List<String>? text=[];

  void getMovieData(){
    getPopularData();
    getTopRatedData();
    getUpcomingData();
  }

  void getPopularData(){
    emit(GetPopularMovieLoadingState());
    DioHelper.getData(url: POPULAR,
    query: {'api_key':APIKEY}
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      popularMovieList = movieModel!.results!;
      movieModel!.results!.forEach((element) {
        slider!.add(element.backdropPath!);
        text!.add(element.originalTitle!);
      });
    emit(GetPopularMovieSuccessState());

    }).catchError((e){
      print("Error at popular");
    emit(GetPopularMovieErrorState());

    });
  }

  void getTopRatedData(){
    emit(GetTopRatedMovieLoadingState());
    DioHelper.getData(url: TOPRATED,
    query: {'api_key':APIKEY}
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      topRatedMovieList = movieModel!.results!;
      
    emit(GetTopRatedMovieSuccessState());

    }).catchError((e){
      print("Error at Toprate");
    emit(GetTopRatedMovieErrorState());

    });
  }

  void getUpcomingData(){
    emit(GetUpcomingMovieLoadingState());
    DioHelper.getData(url: UPCOMING,
    query: {'api_key':APIKEY}
    ).then((value) {
      movieModel = MovieModel.fromJson(value.data);
      upcomingMovieList = movieModel!.results!;
    emit(GetUpcomingMovieSuccessState());

    }).catchError((e){
      print("Error at upcoming");
    emit(GetUpcomingMovieErrorState());

    });
  }
  DetailModel? detailModel;

  void getmovie(int id){
   
    emit(GetMovieLoadingState());
    DioHelper.getData(url: "$id",
    query: {'api_key':APIKEY}
    ).then((value) {
      // print(value.data);
      detailModel = DetailModel.fromJson(value.data);
      print("!!!!!!!");
      
    emit(GetMovieSuccessState());

    }).catchError((e){
      print(e);
    emit(GetMovieErrorState());

    });
  }
}
