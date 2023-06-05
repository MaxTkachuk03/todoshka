import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/models/tasks_model.dart';
import 'package:todoshka/models/tasks_view.dart';
import 'package:todoshka/pages/edit_page.dart';
import 'package:todoshka/repository/services/api_services.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/widgets/buttons/appbar_buttons.dart';
import 'package:todoshka/widgets/buttons/plus_buton.dart';

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
  void initState() {
    super.initState();
    ApiServices().getTasks();
  }

  List<Tasks> tasks = [];

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
              EditPage.routeName,
              //CreatingPage.routeName,
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
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
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return TasksView(
                      date: '',
                      status: status,
                      text: '',
                      type: type,
                      onPressed: () {
                        while (true) {
                          setState(() {
                            if (status == 1) {
                              status = 2;
                            } else if (status == 2) {
                              status = 1;
                            }
                          });
                        }
                      },
                    );
                  },
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
