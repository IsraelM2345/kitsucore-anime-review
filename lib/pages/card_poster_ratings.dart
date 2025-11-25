import 'dart:io';
import 'package:flutter/material.dart';

class AnimeDetailsPage extends StatefulWidget {
  final String title;
  final String imagePath;
  final String synopsis;
  final String rating;
  final String episodes;
  final String genre;
  final String duration;
  final String upvotes;

  const AnimeDetailsPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.synopsis,
    required this.rating,
    required this.episodes,
    required this.genre,
    required this.duration,
    required this.upvotes,
  });

  @override
  State<AnimeDetailsPage> createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {
  double userRating = 0;
  final TextEditingController commentController = TextEditingController();

  final String fallbackImage =
      '/mnt/data/cb2eec48-ee68-4a6f-9164-c8386940cd3a.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Reviews",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- POSTER + INFO BOXES --------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // POSTER
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 360,
                      color: Colors.grey[900],
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) =>
                            Image.file(File(fallbackImage), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _infoBadge(Icons.category, "Genre", widget.genre),
                      const SizedBox(height: 12),
                      _infoBadge(Icons.schedule, "Duration", widget.duration),
                      const SizedBox(height: 12),
                      _infoBadge(
                        Icons.thumb_up_alt_outlined,
                        "Upvotes",
                        widget.upvotes,
                      ),
                      const SizedBox(height: 12),
                      _ratingBadge(widget.rating),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Orbitron',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // -------- SYNOPSIS --------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff2A2A2A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Synopsis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.synopsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Tell others what you think",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 14),

            // -------- STAR RATING --------
            Row(
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      userRating = index + 1.0;
                    });
                  },
                  child: Icon(
                    index < userRating ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 32,
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // -------- TEXT FIELD --------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xff2A2A2A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange, width: 0.6),
              ),
              child: TextField(
                controller: commentController,
                maxLines: 5,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Here...",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // -------- SUBMIT BUTTON --------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.orange.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Submit Review",
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------- WIDGETS --------------------

  Widget _infoBadge(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white70, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 11),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _ratingBadge(String rating) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange.shade600,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Icon(Icons.star, color: Colors.black, size: 24),
          const SizedBox(height: 4),
          const Text(
            "Rating",
            style: TextStyle(
              fontFamily: 'Orbitron',
              color: Colors.black,
              fontSize: 11,
            ),
          ),
          Text(
            rating,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------- SUBMIT FUNCTION --------------------
  void _submitReview() {
    if (commentController.text.isEmpty && userRating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please provide a rating or comment.")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Review submitted!\nRating: $userRating, Comment: ${commentController.text}",
        ),
      ),
    );

    //clear input fields
    setState(() {
      userRating = 0;
      commentController.clear();
    });
  }
}