import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = 'main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int counter = 1;
  int type = 1;
  int status = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
        ),
        child: PlusButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              CreatingPage.routeName,
            );
          },
        ),
      ),
      body: Container(
        decoration: AppThemes.backgrounDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
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
                    //   final completer = Completer();
                    setState(() {
                      ApiServices().getTasks();
                    });
                    
                    // return Future.delayed(
                    //    const Duration(seconds: 3),
                    // () =>
                    //   );
                  },
                  child: FutureBuilder<List<Tasks>>(
                    future: ApiServices().getTasks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return TasksView(
                          tasks: snapshot.data!,
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}