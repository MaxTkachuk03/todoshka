import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/blocs/tasks_list_bloc/task_list_bloc_bloc.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/router/router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int counter = 1;
  int type = 1;
  int status = 1;
  final key = UniqueKey();

  final _tasksListBloc = TaskListBloc();

  @override
  void initState() {
    _tasksListBloc.add(GetTasksListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: PlusButton(
          onPressed: () {
            AutoRouter.of(context).push(const CreatingRoute());
          },
        ),
      ),
      body: Container(
        decoration: AppThemes.backgrounDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(
                    isEnabled: counter == 1 ? true : false,
                    label: S.of(context).all,
                    onPressed: () {
                      setState(
                        () {
                          counter = 1;
                        },
                      );
                    },
                    heroTag: S.of(context).all,
                  ),
                  AppBarButton(
                    isEnabled: counter == 2 ? true : false,
                    label: S.of(context).works,
                    onPressed: () {
                      setState(
                        () {
                          counter = 2;
                        },
                      );
                    },
                    heroTag: S.of(context).works,
                  ),
                  AppBarButton(
                    isEnabled: counter == 3 ? true : false,
                    label: S.of(context).personal,
                    onPressed: () {
                      setState(
                        () {
                          counter = 3;
                        },
                      );
                    },
                    heroTag: S.of(context).personal,
                  ),
                ],
              ),
              Expanded(
                flex: 16,
                child: RefreshIndicator(
                  onRefresh: () async {
                    final completer = Completer();
                    _tasksListBloc.add(GetTasksListEvent(completer: completer));
                    return completer.future;
                  },
                  child: BlocBuilder<TaskListBloc, TaskListBlocState>(
                    bloc: _tasksListBloc,
                    builder: (context, state) {
                      if (state is TasksListLoadedState) {
                        return ListView.builder(
                          itemCount: state.tasksList.length,
                          itemBuilder: (context, index) {
                            final listInfo = state.tasksList[index];
                            return TasksView(tasks: listInfo);
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
