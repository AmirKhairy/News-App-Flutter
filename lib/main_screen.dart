import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/search_screen.dart';

import 'package:news_app/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (NewsCubit.get(context).topList.isEmpty) {
          NewsCubit.get(context).getTopNews();
        }
        if (NewsCubit.get(context).sportsList.isEmpty) {
          NewsCubit.get(context).getSportssNews();
        }
        if (NewsCubit.get(context).businessList.isEmpty) {
          NewsCubit.get(context).getBusinessNews();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(NewsCubit.get(context)
                .screensTitles[NewsCubit.get(context).currentIndex]),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.brightness_4_rounded,
                  size: 30,
                ),
                onPressed: () {
                  NewsCubit.get(context).changeThemeMode();
                },
              ),
            ],
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: NewsCubit.get(context).bottomNavBarItems,
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (value) {
              NewsCubit.get(context).changeBottomNavBarIndex(value);
              if (value == 0) {
                NewsCubit.get(context).getTopNews();
              } else if (value == 1) {
                NewsCubit.get(context).getBusinessNews();
              } else {
                NewsCubit.get(context).getSportssNews();
              }
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
    );
  }
}
