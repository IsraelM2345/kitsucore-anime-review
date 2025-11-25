import 'package:flutter/material.dart';
import 'anime_browse.dart';
import 'card_poster_ratings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToAnimeBrowseWithTab(BuildContext context, int tabIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimeBrowsePage(initialTabIndex: tabIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "KitsuCore",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              _navigateToAnimeBrowseWithTab(context, 0);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          // Add browse button
          IconButton(
            icon: const Icon(Icons.explore, color: Colors.white),
            onPressed: () => _navigateToAnimeBrowseWithTab(context, 1),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 20, color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Summer 2025 Seasonal",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontFamily: 'Orbitron',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailsPage(
                            title: "Demon Slayer",
                            imagePath: "assets/images/demon_slayer.jpg",
                            rating: "8.8",
                            episodes: "12",
                            genre: "Action",
                            duration: "12h 4m",
                            upvotes: "5.6k",
                            synopsis: "A boy fights demons to save his sister.",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 200,
                              width: 140,
                              color: Colors.grey[800],
                              child: Image.asset(
                                'assets/images/demon_slayer.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Demon Slayer",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Action • 12 eps",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // JUJUTSU KAISEN CARD
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailsPage(
                            title: "Jujutsu Kaisen",
                            imagePath: "assets/images/jujutsu_kaisen.jpg",
                            rating: "9.1",
                            episodes: "24",
                            genre: "Fantasy",
                            duration: "24h 30m",
                            upvotes: "6.2k",
                            synopsis: "Students fight curses with sorcery.",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 200,
                              width: 140,
                              color: Colors.grey[800],
                              child: Image.asset(
                                'assets/images/jujutsu_kaisen.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Jujutsu Kaisen",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Action • 24 eps",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ONE PIECE CARD
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailsPage(
                            title: "One Piece",
                            imagePath: "assets/images/one_piece.jpg",
                            rating: "9.5",
                            episodes: "1000+",
                            genre: "Shonen",
                            duration: "500h+",
                            upvotes: "10k",
                            synopsis:
                                "Pirates search for the ultimate treasure.",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 200,
                              width: 140,
                              color: Colors.grey[800],
                              child: Image.asset(
                                'assets/images/one_piece.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "One Piece",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Adv • 1000+ eps",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Text(
                "Top Airing Anime",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimeDetailsPage(
                      title: "Fullmetal Alchemist",
                      imagePath: "assets/images/fullmetal_alchemist.jpg",
                      rating: "9.10",
                      episodes: "64",
                      genre: "Action, Adventure, Drama",
                      duration: "24h 30m",
                      upvotes: "3.1M members",
                      synopsis:
                          "Two brothers search for the Philosopher's Stone after an attempt to revive their deceased mother goes awry and leaves them in damaged physical forms.",
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: Text(
                        "#1",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 50,
                        height: 70,
                        color: Colors.grey[800],
                        child: Image.asset(
                          'assets/images/fullmetal_alchemist.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fullmetal Alchemist",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "9.10",
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "3.1M members",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimeDetailsPage(
                      title: "Steins Gate",
                      imagePath: "assets/images/stains_gate.jpg",
                      rating: "9.07",
                      episodes: "24",
                      genre: "Sci-Fi, Thriller",
                      duration: "9h 36m",
                      upvotes: "2.4M members",
                      synopsis:
                          "A group of friends discover they can send messages to the past, leading to devastating consequences as they alter the flow of history.",
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: Text(
                        "#2",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 50,
                        height: 70,
                        color: Colors.grey[800],
                        child: Image.asset(
                          'assets/images/stains_gate.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Steins Gate",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "9.07",
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "2.4M members",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimeDetailsPage(
                      title: "Gintama",
                      imagePath: "assets/images/gintama.jpg",
                      rating: "9.03",
                      episodes: "367",
                      genre: "Action, Comedy, Sci-Fi",
                      duration: "146h 48m",
                      upvotes: "900k members",
                      synopsis:
                          "In an era where aliens have invaded and taken over feudal Tokyo, an unemployed samurai finds work however he can.",
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      child: Text(
                        "#3",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 50,
                        height: 70,
                        color: Colors.grey[800],
                        child: Image.asset(
                          'assets/images/gintama.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gintama",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "9.03",
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "900k members",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontFamily: 'Orbitron'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Orbitron'),
        onTap: (index) {
          switch (index) {
            case 1:
              _navigateToAnimeBrowseWithTab(context, 1);
              break;
            case 2:
              _navigateToAnimeBrowseWithTab(context, 2);
              break;
            case 3:
              _navigateToAnimeBrowseWithTab(context, 3);
              break;
            case 4:
              _navigateToAnimeBrowseWithTab(context, 4);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My List'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Manga'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
