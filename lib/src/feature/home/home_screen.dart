import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/data/repositories/cat_repository.dart';
import 'package:flutter_skeleton/src/feature/cat/cat_screen.dart';
import 'package:flutter_skeleton/src/feature/cat/cubit/cat_cubit.dart';

class HomeScreen extends StatelessWidget {
  final int initialPage;

  const HomeScreen({Key? key, required this.initialPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavLayout(
      pageStack: ReorderToFrontPageStack(initialPage: initialPage),
      pages: [
        (navKey) => Navigator(
              key: navKey,
              initialRoute: '/',
              onGenerateRoute: (routeSettings) => MaterialPageRoute(
                builder: (context) {
                  switch (routeSettings.name) {
                    case '/':
                    default:
                      return BlocProvider<CatCubit>(
                        create: (context) =>
                            CatCubit(context.read<CatRepository>())..loadCats(),
                        child: const CatScreen(),
                      );
                  }
                },
              ),
            ),
        (navKey) => Navigator(
              key: navKey,
              initialRoute: '/',
              onGenerateRoute: (routeSettings) => MaterialPageRoute(
                builder: (context) {
                  switch (routeSettings.name) {
                    case '/':
                    default:
                      return Container(color: Colors.lightBlueAccent);
                  }
                },
              ),
            ),
        (navKey) => Navigator(
              key: navKey,
              initialRoute: '/',
              onGenerateRoute: (routeSettings) => MaterialPageRoute(
                builder: (context) {
                  switch (routeSettings.name) {
                    case '/':
                    default:
                      return Container(color: Colors.yellowAccent);
                  }
                },
              ),
            ),
      ],
      bottomNavigationBar: (currentIndex, onTap) => NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => onTap(index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.star),
            label: 'Katzen',
          ),
          NavigationDestination(
            icon: Icon(Icons.palette),
            label: 'Kunst',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
