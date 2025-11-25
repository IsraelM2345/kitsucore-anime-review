class MangaData {
  static final List<Map<String, String>> mangaList = [
    {
      'title': 'One Piece',
      'subtitle': 'Adventure • 1000+ chapters',
      'image': 'assets/images/one_piece_manga.jpg',
      'rating': '9.0',
      'chapters': '1070+',
      'author': 'Eiichiro Oda',
      'status': 'Ongoing',
      'genres': 'Adventure, Fantasy, Comedy',
      'description': 'Monkey D. Luffy and his pirate crew explore the Grand Line in search of the world\'s ultimate treasure, the One Piece, to become the next Pirate King.',
    },
    {
      'title': 'Attack on Titan',
      'subtitle': 'Action • 139 chapters',
      'image': 'assets/images/aot_manga.jpg',
      'rating': '9.1',
      'chapters': '139',
      'author': 'Hajime Isayama',
      'status': 'Completed',
      'genres': 'Action, Dark Fantasy, Drama',
      'description': 'In a world where humanity lives inside cities surrounded by enormous walls due to the Titans, giant humanoid creatures who devour humans, Eren Yeager vows to eradicate the Titans after they destroy his hometown.',
    },
    {
      'title': 'Demon Slayer',
      'subtitle': 'Action • 205 chapters',
      'image': 'assets/images/demon_slayer_manga.jpg',
      'rating': '8.8',
      'chapters': '205',
      'author': 'Koyoharu Gotouge',
      'status': 'Completed',
      'genres': 'Action, Fantasy, Martial Arts',
      'description': 'After his family is slaughtered by demons, Tanjiro Kamado becomes a demon slayer to avenge his family and cure his sister Nezuko, who was turned into a demon.',
    },
    {
      'title': 'My Hero Academia',
      'subtitle': 'Superhero • 400+ chapters',
      'image': 'assets/images/mha_manga.jpg',
      'rating': '8.5',
      'chapters': '400+',
      'author': 'Kohei Horikoshi',
      'status': 'Ongoing',
      'genres': 'Action, Superhero, Comedy',
      'description': 'In a world where people with superpowers known as "Quirks" are the norm, Izuku Midoriya dreams of becoming a hero despite being born without a Quirk.',
    },
    {
      'title': 'Chainsaw Man',
      'subtitle': 'Action • 130+ chapters',
      'image': 'assets/images/chainsaw_man_manga.jpg',
      'rating': '9.2',
      'chapters': '130+',
      'author': 'Tatsuki Fujimoto',
      'status': 'Ongoing',
      'genres': 'Action, Dark Fantasy, Horror',
      'description': 'Denji is a young man trapped in poverty who merges with his pet devil Pochita to become Chainsaw Man, a being with the power to transform parts of his body into chainsaws.',
    },
    {
      'title': 'Jujutsu Kaisen',
      'subtitle': 'Supernatural • 240+ chapters',
      'image': 'assets/images/jujutsu_kaisen.jpg',
      'rating': '8.9',
      'chapters': '240+',
      'author': 'Gege Akutami',
      'status': 'Ongoing',
      'genres': 'Action, Supernatural, Horror',
      'description': 'Yuji Itadori swallows a cursed finger to save his friends and becomes the host of Ryomen Sukuna, a powerful curse. He then enrolls in Tokyo Jujutsu High to master his new abilities.',
    },
    {
      'title': 'Dr. Stone',
      'subtitle': 'Sci-Fi • 232 chapters',
      'image': 'assets/images/dr_stone_manga.jpg',
      'rating': '8.6',
      'chapters': '232',
      'author': 'Riichiro Inagaki',
      'status': 'Completed',
      'genres': 'Sci-Fi, Adventure, Comedy',
      'description': 'After humanity is turned to stone, scientific genius Senku Ishigami awakens and aims to rebuild civilization using the power of science.',
    },
    {
      'title': 'Naruto',
      'subtitle': 'Action • 700 chapters',
      'image': 'assets/images/naruto_manga.jpg',
      'rating': '8.7',
      'chapters': '700',
      'author': 'Masashi Kishimoto',
      'status': 'Completed',
      'genres': 'Action, Adventure, Martial Arts',
      'description': 'Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.',
    },
    {
      'title': 'Tokyo Revengers',
      'subtitle': 'Action • 278 chapters',
      'image': 'assets/images/tokyo_revengers_manga.jpg',
      'rating': '8.7',
      'chapters': '278',
      'author': 'Ken Wakui',
      'status': 'Completed',
      'genres': 'Action, Drama, Delinquents',
      'description': 'Takemichi Hanagaki discovers he can travel back in time and uses this ability to save his ex-girlfriend and change the future of the Tokyo Manji Gang.',
    },
    {
      'title': 'Berserk',
      'subtitle': 'Dark Fantasy • 370+ chapters',
      'image': 'assets/images/berserk_manga.jpg',
      'rating': '9.5',
      'chapters': '370+',
      'author': 'Kentaro Miura',
      'status': 'Ongoing',
      'genres': 'Dark Fantasy, Horror, Epic',
      'description': 'Guts, a lone mercenary, embarks on a journey for revenge in a dark medieval world filled with demons, apostles, and the God Hand.',
    },
  ];

  // Method to get manga by index
  static Map<String, String> getManga(int index) {
    return mangaList[index];
  }

  // Method to get all manga titles
  static List<String> getAllTitles() {
    return mangaList.map((manga) => manga['title']!).toList();
  }

  // Method to search manga by title
  static List<Map<String, String>> searchManga(String query) {
    return mangaList.where((manga) => 
      manga['title']!.toLowerCase().contains(query.toLowerCase()) ||
      manga['author']!.toLowerCase().contains(query.toLowerCase()) ||
      manga['genres']!.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Method to get manga by status
  static List<Map<String, String>> getMangaByStatus(String status) {
    return mangaList.where((manga) => manga['status'] == status).toList();
  }

  // Method to get ongoing manga
  static List<Map<String, String>> getOngoingManga() {
    return getMangaByStatus('Ongoing');
  }

  // Method to get completed manga
  static List<Map<String, String>> getCompletedManga() {
    return getMangaByStatus('Completed');
  }
}