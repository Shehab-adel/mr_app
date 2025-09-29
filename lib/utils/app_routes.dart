import 'package:flutter/material.dart';
import 'package:mister_app/screens/SelectGradeScreen.dart';
import 'package:mister_app/screens/dashboard/chat_screen.dart';
import 'package:mister_app/screens/forget_screen.dart';
import 'package:mister_app/screens/dashboard/home_screen.dart';
import 'package:mister_app/screens/dashboard/profile_screen.dart';
import 'package:mister_app/screens/signin_screen.dart';
import 'package:mister_app/screens/payment_screen.dart';
import 'package:mister_app/screens/register_screen.dart';
import 'package:mister_app/screens/splash_screen.dart';
import 'package:mister_app/screens/summeries/summaries_screen.dart';
import 'package:mister_app/screens/videos/player_videos_screen.dart';
import 'package:mister_app/screens/videos/playlists_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String signin = '/Signin';
  static const String register = '/register';
  static const String forget = '/forget';
  static const String payment = '/payment';
  static const String home = '/home';
  static const String plylist = '/videos';
  static const String plylitPlayer = '/videos_player';
  static const String selectGrade = '/select_grade';
  static const String summaries = '/summaries';
  static const String profile = '/profile';
  static const String chat = "/chat";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _fadeSlideRoute(const SplashScreen(), settings);
      case signin:
        return _fadeSlideRoute(const SigninScreen(), settings);
      case register:
        return _fadeSlideRoute(const RegisterScreen(), settings);
      case forget:
        return _fadeSlideRoute(const ForgetScreen(), settings);
      case payment:
        return _fadeSlideRoute(const PaymentScreen(), settings);
      case selectGrade:
        return _fadeSlideRoute(const SelectGradeScreen(), settings);
      case home:
        return _fadeSlideRoute(const HomeScreen(), settings);
      case plylist:
        return _fadeSlideRoute(PlaylistsScreen(), settings);
      case summaries:
        return _fadeSlideRoute(const SummariesScreen(), settings);
      case profile:
        return _fadeSlideRoute(const ProfileScreen(), settings);
      case chat:
        return _fadeSlideRoute(const ChatScreen(), settings);
      case plylitPlayer:
        return _fadeSlideRoute(
            const PlayerVideosScreen(
              playlistId: 'UC_x5XG1OV2P6uZZ5FSM9Ttw',
              title: '',
            ),
            settings);

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No route defined")),
          ),
        );
    }
  }

  // هنا عملنا الفيد + سلايد
  static PageRouteBuilder _fadeSlideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.1), // ينزل من تحت شوية
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        );

        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
