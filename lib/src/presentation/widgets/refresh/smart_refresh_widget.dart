import 'package:base_app/src/blocs/users/users_bloc.dart';
import 'package:base_app/src/helpers/helper.dart';
import 'package:base_app/src/models/errors/error_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefreshWidget extends StatefulWidget {
  @override
  _SmartRefreshWidgetState createState() => _SmartRefreshWidgetState();
}

class _SmartRefreshWidgetState extends State<SmartRefreshWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // ignore: close_sinks
  UsersBloc usersBloc;

  @override
  void initState() {
    usersBloc = BlocProvider.of<UsersBloc>(context);
    usersBloc.add(GetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state.refreshStatus == RefreshStatus.canRefresh) {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted(resetFooterState: true);
        }
        if (state.refreshStatus == RefreshStatus.completed) {
          _refreshController.loadNoData();
        }

        if (state.error == ErrorType.noInternet) {
          Fluttertoast.showToast(msg: "Error al conectar con el servidor");
        }

        if (state.error == ErrorType.sessionExpired) {
          Helpers.of(context).sessionExpired();
        }

        if (state.error == ErrorType.noData) {
          _refreshController.loadComplete();
        }
      },
      builder: (BuildContext context, UsersState state) {
        if (!state.loading || state.userExampleList.isNotEmpty) {
          return SmartRefresher(
              header: WaterDropMaterialHeader(
                backgroundColor: Theme.of(context).appBarTheme.color,
              ),
              footer: ClassicFooter(
                canLoadingText: "Suelte para cargar más",
                loadingText: "Cargando más",
                noDataText: "No hay más datos",
                idleText: "Tire hacia arriba para cargar más",
              ),
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: () => usersBloc.add(RefreshUsersEvent()),
              onLoading: () => usersBloc.add(LoadMoreUsersEvent()),
              child: SingleChildScrollView(
                child: Column(
                  children: state.userExampleList
                      .map((w) => ListTile(
                          leading: Icon(Icons.home),
                          title: Text("Este es un elemento")))
                      .toList(),
                ),
              ));
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 15,
              ),
              Text(state.loadingText)
            ],
          ),
        );
      },
    );
  }
}
