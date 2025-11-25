import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/home_page.dart';
import 'pages/anime_browse.dart';

class MyListManager {
  final Set<int> _animeList = {};
  final Set<int> _mangaList = {};

  Set<int> get animeList => _animeList;
  Set<int> get mangaList => _mangaList;

  void addToAnimeList(int index) {
    _animeList.add(index);
  }

  void removeFromAnimeList(int index) {
    _animeList.remove(index);
  }

  bool isInAnimeList(int index) => _animeList.contains(index);

  void addToMangaList(int index) {
    _mangaList.add(index);
  }

  void removeFromMangaList(int index) {
    _mangaList.remove(index);
  }

  bool isInMangaList(int index) => _mangaList.contains(index);

  int get totalItems => _animeList.length + _mangaList.length;
}

// Global instance
final myListManager = MyListManager();

void main() {
  runApp(const MyAnimeListApp());
}

class MyAnimeListApp extends StatelessWidget {
  const MyAnimeListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Review App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.grey[800]!,
          surface: Colors.grey[900]!,
        ),
        fontFamily: 'Orbitron',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
          bodySmall: TextStyle(fontSize: 12, color: Colors.grey),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIconColor: Colors.orange,
          suffixIconColor: Colors.grey,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[800]!),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/browse': (context) => AnimeBrowsePage(),
      },
    );
  }
}
