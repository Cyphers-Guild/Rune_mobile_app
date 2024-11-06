import 'package:flutter/material.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image

                // Profile Info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daniel Johnson',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          'Rank 12',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '1500',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/images/boy.png'), // Replace with actual image path
                )
              ],
            ),
            24.0.sbH,

            // My Collections section
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.grey.shade400)),
              child: const Text(
                'My collections',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            10.0.sbH,
            Column(
              children: [
                Row(
                  children: [
                    // Collection images
                    _buildCollectionImage(
                        'assets/images/nfts/queen.png', context),
                    const SizedBox(width: 8),
                    _buildCollectionImage(
                        'assets/images/nfts/king.png', context),
                    const SizedBox(width: 8),
                    _buildCollectionImage(null, context),
                    const Spacer(),
                  ],
                ),
                5.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View more',
                      style: TextStyle(fontSize: 12, color: bgColor),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Highlights section
            const Text(
              'Match History',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            10.0.sbH,
            _buildHighlightCard(
                'assets/images/user1.png', 'Blitz', 'Checkmate'),
            const SizedBox(height: 16),
            _buildHighlightCard(
                'assets/images/user1.png', 'Blitz', 'Checkmate'),
            const SizedBox(height: 24),

            // Match history title
            const Text(
              'Match history',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build collection images
  Widget _buildCollectionImage(String? imagePath, BuildContext context) {
    return Container(
      width: mediaQuery(context).width * 0.28,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        image: imagePath != null
            ? DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imagePath == null
          ? const Center(
              child: Icon(
                Icons.add,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }

  // Helper to build highlight cards
  Widget _buildHighlightCard(String avatarPath, String title, String status) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatarPath),
            radius: 24,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.flash_on, color: Colors.black),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
