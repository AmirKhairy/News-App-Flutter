abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class ChangeBottomNavBarIndexState extends NewsStates {}

class GetTopNewsLoadingState extends NewsStates {}

class GetTopNewsSuccessState extends NewsStates {}

class GetTopNewsFailState extends NewsStates {
  final String error;
  GetTopNewsFailState({required this.error});
}

class GetBusinessNewsLoadingState extends NewsStates {}

class GetBusinessNewsSuccessState extends NewsStates {}

class GetBusinessNewsFailState extends NewsStates {
  final String error;
  GetBusinessNewsFailState({required this.error});
}

class GetSportsNewsLoadingState extends NewsStates {}

class GetSportsNewsSuccessState extends NewsStates {}

class GetSportsNewsFailState extends NewsStates {
  final String error;
  GetSportsNewsFailState({required this.error});
}

class GetSearchLoadingState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchFailState extends NewsStates {
  final String error;
  GetSearchFailState({required this.error});
}

class ChangeThemeModeState extends NewsStates {}
