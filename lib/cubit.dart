import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_screen.dart';
import 'package:news_app/cache_helper.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/sports_screen.dart';
import 'package:news_app/states.dart';
import 'package:news_app/top_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Top',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: 'Busniss',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];

  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarIndexState());
  }

  List<Widget> screens = [
    const TopScreen(),
    const BusinessScreen(),
    const SportsScreen(),
  ];

  List screensTitles = [
    'Top News',
    'Business News',
    'Sports News',
  ];

  List<dynamic> topList = [];
  void getTopNews() {
    emit(GetTopNewsLoadingState());
    DioHelper.getData(
      url: 'news',
      query: {
        'country': 'eg',
        'category': 'top',
        'apikey': 'pub_5542718f4bcdc2d5e79aac54a13b643e001c1',
      },
    ).then((onValue) {
      topList = onValue!.data['results'];
      emit(GetTopNewsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetTopNewsFailState(error: onError.toString()));
    });
  }

  List<dynamic> businessList = [];
  void getBusinessNews() {
    emit(GetBusinessNewsLoadingState());
    DioHelper.getData(
      url: 'news',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': 'pub_5542718f4bcdc2d5e79aac54a13b643e001c1',
      },
    ).then((onValue) {
      businessList = onValue!.data['results'];
      emit(GetBusinessNewsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetBusinessNewsFailState(error: onError.toString()));
    });
  }

  List<dynamic> sportsList = [];
  void getSportssNews() {
    emit(GetSportsNewsLoadingState());
    DioHelper.getData(
      url: 'news',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': 'pub_5542718f4bcdc2d5e79aac54a13b643e001c1',
      },
    ).then((onValue) {
      sportsList = onValue!.data['results'];
      emit(GetSportsNewsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSportsNewsFailState(error: onError.toString()));
    });
  }

  List<dynamic> searchList = [];
  String searchText = '';
  void getSearch(String value) {
    searchText = value;
    emit(GetSearchLoadingState());
    DioHelper.getData(
      url: 'news',
      query: {
        'country': 'eg',
        'q': value,
        'apikey': 'pub_5542718f4bcdc2d5e79aac54a13b643e001c1',
      },
    ).then((onValue) {
      searchList = onValue!.data['results'];
      emit(GetSearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSearchFailState(error: onError.toString()));
    });
  }

  bool isDark = false;

  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setBool(key: 'isDark', value: isDark).then((onValue) {
        emit(ChangeThemeModeState());
      });
    }
  }
}


//https://newsdata.io/api/1/news?apikey=pub_5542718f4bcdc2d5e79aac54a13b643e001c1&country=eg 