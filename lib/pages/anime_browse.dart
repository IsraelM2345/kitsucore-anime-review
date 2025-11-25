import 'package:flutter/material.dart';
import '../models/anime_data.dart';
import '../models/manga_data.dart';
import 'package:anime/main.dart';

class AnimeBrowsePage extends StatefulWidget {
  final int initialTabIndex;

  const AnimeBrowsePage({super.key, this.initialTabIndex = 0});

  @override
  State<AnimeBrowsePage> createState() => _AnimeBrowsePageState();
}

class _AnimeBrowsePageState extends State<AnimeBrowsePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set the initial tab index from the parameter
    _selectedIndex = widget.initialTabIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Add this method for navigation back to home
  void _navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => _navigateToHome(context),
          child: Text('KitsuCore'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: theme.colorScheme.primary,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: theme.colorScheme.primary,
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: theme.colorScheme.background,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // FIXED HEADER (no overflow)
              Container(
                padding: const EdgeInsets.all(16),
                color: theme.primaryColor.withOpacity(0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: theme.colorScheme.primary,
                      child: const Icon(Icons.movie, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Anime Hub',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Discover & save favorites',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'My List: ${myListManager.totalItems} items',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // MENU ITEMS
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white70),
                title: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToHome(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Colors.white70),
                title: const Text(
                  'Favorites',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white70),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(theme),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: theme.colorScheme.background,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onDoubleTap: () => _navigateToHome(context),
              child: const Icon(Icons.home),
            ),
            label: 'Home',
            tooltip: 'Double tap to return to home page',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'My List',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Manga',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody(ThemeData theme) {
    switch (_selectedIndex) {
      case 0: // Home
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Anime',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: AnimeData.animeList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.80,
                  ),
                  itemBuilder: (context, index) {
                    final item = AnimeData.animeList[index];
                    return _AnimeTile(
                      index: index,
                      title: item['title']!,
                      subtitle: item['subtitle']!,
                      imageUrl: item['image']!,
                      isAdded: myListManager.isInAnimeList(index),
                      onToggle: (i) {
                        setState(() {
                          if (myListManager.isInAnimeList(i)) {
                            myListManager.removeFromAnimeList(i);
                          } else {
                            myListManager.addToAnimeList(i);
                          }
                        });
                      },
                      onTapHome: () => _navigateToHome(context),
                    );
                  },
                ),
              ),
            ],
          ),
        );

      case 1: // My List
        return _buildMyList();

      case 2: // Add
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_box, size: 64, color: theme.colorScheme.primary),
              const SizedBox(height: 12),
              const Text(
                'Add new anime to your collection',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        );

      case 3: // Manga
        return _buildMangaSection(theme);

      case 4: // Profile
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 36),
              ),
              const SizedBox(height: 12),
              const Text(
                'User Profile',
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Text(
                'My List: ${myListManager.totalItems} items',
                style: TextStyle(color: theme.colorScheme.primary),
              ),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildMangaSection(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Manga',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Discover the latest and greatest manga series',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: MangaData.mangaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.80,
              ),
              itemBuilder: (context, index) {
                final manga = MangaData.mangaList[index];
                return _MangaTile(
                  index: index,
                  title: manga['title']!,
                  subtitle: manga['subtitle']!,
                  imageUrl: manga['image']!,
                  rating: manga['rating']!,
                  chapters: manga['chapters']!,
                  author: manga['author']!,
                  status: manga['status']!,
                  genres: manga['genres']!,
                  description: manga['description']!,
                  isAdded: myListManager.isInMangaList(index),
                  onToggle: (i) {
                    setState(() {
                      if (myListManager.isInMangaList(i)) {
                        myListManager.removeFromMangaList(i);
                      } else {
                        myListManager.addToMangaList(i);
                      }
                    });
                  },
                  onTapHome: () => _navigateToHome(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyList() {
    if (myListManager.totalItems == 0) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.list, size: 64, color: Colors.white30),
            SizedBox(height: 12),
            Text('Your list is empty', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            Text(
              'Browse anime and manga to add them to your list!',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: 'Anime'),
              Tab(text: 'Manga'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Anime Tab
                _buildAnimeList(),
                // Manga Tab
                _buildMangaList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimeList() {
    if (myListManager.animeList.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.movie, size: 64, color: Colors.white30),
            SizedBox(height: 12),
            Text(
              'No anime in your list',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }

    final List<int> indices = myListManager.animeList.toList()..sort();
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: indices.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final idx = indices[i];
        final item = AnimeData.animeList[idx];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                item['image']!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) =>
                    Container(color: Colors.grey[800], width: 56, height: 56),
              ),
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              item['subtitle']!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.white70,
              ),
              onPressed: () {
                setState(() {
                  myListManager.removeFromAnimeList(idx);
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildMangaList() {
    if (myListManager.mangaList.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.menu_book, size: 64, color: Colors.white30),
            SizedBox(height: 12),
            Text(
              'No manga in your list',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }

    final List<int> indices = myListManager.mangaList.toList()..sort();
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: indices.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final idx = indices[i];
        final item = MangaData.mangaList[idx];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                item['image']!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) =>
                    Container(color: Colors.grey[800], width: 56, height: 56),
              ),
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              item['subtitle']!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.white70,
              ),
              onPressed: () {
                setState(() {
                  myListManager.removeFromMangaList(idx);
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _AnimeTile extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isAdded;
  final ValueChanged<int> onToggle;
  final VoidCallback onTapHome;

  const _AnimeTile({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.isAdded,
    required this.onToggle,
    required this.onTapHome,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: theme.colorScheme.background,
            title: Text(
              title,
              style: TextStyle(color: theme.colorScheme.primary),
            ),
            content: Text(
              subtitle,
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onTapHome();
                },
                child: const Text('Go Home'),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Container(
                  height: 160,
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white54),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text('4.8', style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: theme.colorScheme.primary,
                        ),
                        icon: Icon(
                          isAdded ? Icons.check : Icons.playlist_add,
                          color: theme.colorScheme.primary,
                        ),
                        label: Text(
                          isAdded ? 'Added' : 'Add to my list',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        onPressed: () => onToggle(index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MangaTile extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String rating;
  final String chapters;
  final String author;
  final String status;
  final String genres;
  final String description;
  final bool isAdded;
  final ValueChanged<int> onToggle;
  final VoidCallback onTapHome;

  const _MangaTile({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
    required this.chapters,
    required this.author,
    required this.status,
    required this.genres,
    required this.description,
    required this.isAdded,
    required this.onToggle,
    required this.onTapHome,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: theme.colorScheme.background,
            title: Text(
              title,
              style: TextStyle(color: theme.colorScheme.primary),
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow('Author:', author),
                  _buildDetailRow('Status:', status),
                  _buildDetailRow('Genres:', genres),
                  _buildDetailRow('Chapters:', chapters),
                  _buildDetailRow('Rating:', '$rating/10'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onTapHome();
                },
                child: const Text('Go Home'),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) => Container(
                  height: 160,
                  color: Colors.grey[800],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book, color: Colors.white54, size: 40),
                        SizedBox(height: 8),
                        Text('Manga', style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '$chapters ch',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        backgroundColor: theme.colorScheme.primary.withOpacity(
                          0.1,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                      ),
                      icon: Icon(
                        isAdded ? Icons.check : Icons.playlist_add,
                        size: 16,
                      ),
                      label: Text(
                        isAdded ? 'Added' : 'Add to my list',
                        style: const TextStyle(fontSize: 12),
                      ),
                      onPressed: () => onToggle(index),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
