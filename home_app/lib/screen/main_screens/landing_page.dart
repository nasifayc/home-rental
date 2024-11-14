import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_app/core/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:home_app/core/theme/app_theme.dart';
import 'package:home_app/screen/main_screens/chat_screen.dart';
import 'package:home_app/screen/main_screens/home_screen.dart';
import 'package:home_app/screen/main_screens/post_screen.dart';
import 'package:home_app/widget/landing/left_nav_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme.of(context);

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        String getTitle(BottomNavState state) {
          switch (state) {
            case BottomNavState.home:
              return 'Home';
            case BottomNavState.post:
              return 'Cost';
            case BottomNavState.chat:
              return 'Chat';
            default:
              return 'Home';
          }
        }

        Widget getCurrentScreen(BottomNavState state) {
          switch (state) {
            case BottomNavState.home:
              return const HomeScreen();
            case BottomNavState.post:
              return const PostScreen();
            case BottomNavState.chat:
              return const ChatScreen();
            default:
              return const HomeScreen();
          }
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: Text(
              getTitle(state),
              style: appTheme.typography.headlineSmall,
            ),
            centerTitle: true,
            actions: [
              Icon(
                Icons.search,
                color: appTheme.primary,
              )
            ],
          ),
          drawer: const LeftNavBar(),
          body: getCurrentScreen(state),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: BottomNavState.values.indexOf(state),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: appTheme.primary,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.upload_rounded),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Chat',
              ),
            ],
            onTap: (index) {
              context
                  .read<BottomNavCubit>()
                  .selectItem(BottomNavState.values[index]);
            },
          ),
        );
      },
    );
  }
}
