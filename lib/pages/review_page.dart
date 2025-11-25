import 'package:flutter/material.dart';

void main() {
  runApp(const AnimeReviewApp());
}

class AnimeReviewApp extends StatelessWidget {
  const AnimeReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime Review',
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Orbitron'),
        scaffoldBackgroundColor: const Color(0xFF212121),
        colorScheme: const ColorScheme.dark(primary: Color(0xFFE58E44)),
      ),
      home: const ReviewPage(),
    );
  }
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  // Variable for the rating input
  int selectedStars = 0;

  // --- COLORS ---
  final Color themeColor = const Color(0xFFE58E44); // Orange for Borders/Labels
  final Color starColor = const Color(0xFFFFD700); // Yellow for Stars

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            // Handle back navigation here
          },
        ),
        title: const Text(
          "Reviews",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
        ],
      ),

      // Main Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECTION 1: Poster & Info Buttons ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Side: Huge Poster Image
                Expanded(
                  flex: 6, // Takes up 60% of width
                  child: Container(
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      color: Colors.grey[800], // Fallback color
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://imgs.search.brave.com/qlqiJiKdkYB8mV_2VOPsZPcUnzxV-lcs8jd2_6xyhXE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMud2lraWEubm9j/b29raWUubmV0L29i/bHVkYS9pbWFnZXMv/Yy9jMi9Nb25zdGVy/LWFuaW1lLXBvc3Rl/ci5qcGcvcmV2aXNp/b24vbGF0ZXN0L3Nj/YWxlLXRvLXdpZHRo/LWRvd24vMjY4P2Ni/PTIwMjQwMjE2MDAx/OTEx',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // Right Side: Info Column (Genre, Duration, etc.)
                Expanded(
                  flex: 3, // Takes up remaining space
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoCard(
                        Icons.camera_alt_outlined,
                        "Genre",
                        "Psychological",
                      ),
                      const SizedBox(height: 10),
                      _buildInfoCard(Icons.access_time, "Duration", "29h 36m"),
                      const SizedBox(height: 10),
                      _buildInfoCard(
                        Icons.thumb_up_outlined,
                        "Upvotes",
                        "5.6k",
                      ),
                      const SizedBox(height: 10),
                      // isStar: true makes the ICON yellow
                      _buildInfoCard(Icons.star, "Rating", "4.5", isStar: true),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --- SECTION 2: Title & Prompt ---
            const Text(
              "Monster",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Tell others what you think",
              style: TextStyle(fontSize: 14, color: Colors.grey[400]),
            ),

            const SizedBox(height: 15),

            // --- SECTION 3: Star Rating (Interactive) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                5,
                (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        selectedStars = index + 1;
                      });
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      index < selectedStars ? Icons.star : Icons.star_border,
                      // UPDATED: Use starColor (Yellow) when active
                      color: index < selectedStars
                          ? starColor
                          : Colors.grey[500],
                      size: 30,
                    ),
                  );
                },
              ).expand((widget) => [widget, const SizedBox(width: 5)]).toList(),
            ),

            const SizedBox(height: 20),

            // --- SECTION 4: Text Input Field ---
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: themeColor,
                  width: 1,
                ), // Orange Border
              ),
              child: const TextField(
                maxLines: null, // Allows multiple lines
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Here",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // --- SECTION 5: Submit Button ---
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Add submit logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF8D5B35,
                  ), // Brownish/Orange gradient look
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Submit Review",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGET ---
  Widget _buildInfoCard(
    IconData icon,
    String label,
    String value, {
    bool isStar = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: themeColor, width: 1), // Orange Border
      ),
      child: Column(
        children: [
          Icon(
            icon,
            // If isStar is true, use starColor (Yellow), else grey
            color: isStar ? starColor : Colors.grey[400],
            size: 20,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: themeColor, // Label stays Orange
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
