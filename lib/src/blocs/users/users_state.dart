part of 'users_bloc.dart';

class UsersState extends Equatable implements RefreshState {
  final bool loading;
  final String loadingText;
  final int currentPage;
  final int totalPage;
  final ErrorType error;
  final RefreshStatus refreshStatus;
  final BuiltList<UserExampleModel> userExampleList;

  UsersState(
      {@required this.loading,
      @required this.loadingText,
      @required this.currentPage,
      @required this.totalPage,
      @required this.error,
      @required this.refreshStatus,
      @required this.userExampleList});

  factory UsersState.initial() {
    return UsersState(
        loading: false,
        loadingText: "",
        currentPage: 1,
        totalPage: 1,
        error: ErrorType.noError,
        refreshStatus: RefreshStatus.canRefresh,
        userExampleList: BuiltList<UserExampleModel>());
  }

  UsersState copyWith({
    bool loading,
    String loadingText,
    int currentPage,
    int totalPage,
    ErrorType error,
    RefreshStatus refreshStatus,
    BuiltList<UserExampleModel> userExampleList,
  }) {
    return UsersState(
        loading: loading ?? this.loading,
        loadingText: loadingText ?? this.loadingText,
        currentPage: currentPage ?? this.currentPage,
        totalPage: totalPage ?? this.totalPage,
        error: error ?? this.error,
        refreshStatus: refreshStatus ?? this.refreshStatus,
        userExampleList: userExampleList ?? this.userExampleList);
  }

  @override
  List<Object> get props => [
        loading,
        loadingText,
        currentPage,
        totalPage,
        error,
        refreshStatus,
        userExampleList
      ];
}
