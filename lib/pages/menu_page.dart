import 'package:flutter/material.dart';

const Color _kPrimaryBlack = Color(0xFF1A1A1A);
const Color _kAccentYellow = Color(0xFFFFCC00);
const Color _kAccentWhite = Colors.white;
const Color _kTextColor = Colors.white;

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    IconData? icon,
    required Color color,
  }) {
    final bool isNavigable = title == 'Anime' || title == 'Manga' || title == 'Community' || title == 'Industry';

    return ListTile(
      tileColor: _kPrimaryBlack, 
      leading: icon != null
          ? Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(icon, color: color),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: isNavigable 
          ? const Icon(Icons.chevron_right, color: Colors.white54)
          : null,
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    );
  }

  Widget _buildInfoLink(
    BuildContext context, {
    required String text,
    required Color color,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) {
    return Padding(
      padding: padding,
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        dense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kPrimaryBlack, 
      appBar: AppBar(
        backgroundColor: _kPrimaryBlack, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: _kAccentYellow,
                foregroundColor: _kPrimaryBlack,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Hide Ads',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Sign Up',
                style: TextStyle(color: _kTextColor),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: _kTextColor),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.close, color: _kTextColor),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMenuItem(
              context,
              icon: Icons.login,
              title: 'Login',
              color: _kTextColor,
            ),
            _buildMenuItem(
              context,
              icon: Icons.person_add,
              title: 'Sign Up',
              color: _kTextColor,
            ),
            const Divider(height: 1, thickness: 1, color: Colors.white12),
            _buildInfoLink(
              context,
              text: 'Become a MAL Supporter / Gift MAL Supporter',
              color: _kAccentWhite, 
            ),
            _buildMenuItem(
              context,
              icon: null,
              title: 'Anime',
              color: _kTextColor,
            ),
            _buildInfoLink(
              context,
              text: 'Top Anime',
              color: _kAccentWhite, 
              padding: const EdgeInsets.only(left: 32.0),
            ),
            _buildInfoLink(
              context,
              text: 'Seasonal Anime',
              color: _kAccentWhite,
              padding: const EdgeInsets.only(left: 32.0),
            ),
            _buildMenuItem(
              context,
              icon: null,
              title: 'Manga',
              color: _kTextColor,
            ),
            _buildMenuItem(
              context,
              icon: null,
              title: 'Community',
              color: _kTextColor,
            ),
            _buildMenuItem(
              context,
              icon: null,
              title: 'Industry',
              color: _kTextColor,
            ),
            const Divider(height: 1, thickness: 1, color: Colors.white12),
            _buildMenuItem(
              context,
              icon: Icons.desktop_windows,
              title: 'Request Desktop Site',
              color: _kTextColor,
            ),
          ],
        ),
      ),
    );
  }
}