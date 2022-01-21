abstract class AppState{}

class InitialAppState extends AppState{}

class LoadingAppState extends AppState{}

class ErrorAppState extends AppState{
  final String error;

  ErrorAppState({required this.error});
}

class SuccessAppState extends AppState{}


//home states
class LoadingHomeState extends AppState{}

class ErrorHomeState extends AppState{
  final String error;

  ErrorHomeState({required this.error});
}

class SuccessHomeState extends AppState{}
//Home categories states
class LoadingCategoriesState extends AppState{}

class ErrorCategoriesState extends AppState{
  final String error;

  ErrorCategoriesState({required this.error});
}

class SuccessCategoriesState extends AppState{}
//single product states
class LoadingProductState extends AppState{}

class ErrorProductState extends AppState{
  final String error;

  ErrorProductState({required this.error});
}

class SuccessProductState extends AppState{}