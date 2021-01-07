part of 'refresh_bloc.dart';

abstract class RefreshState {
  final bool loading;
  final String loadingText;
  final int currentPage;
  final int totalPage;
  final ErrorType error;
  final RefreshStatus refreshStatus;

  RefreshState(
      {this.loading,
      this.loadingText,
      this.currentPage,
      this.totalPage,
      this.error,
      this.refreshStatus});
}
