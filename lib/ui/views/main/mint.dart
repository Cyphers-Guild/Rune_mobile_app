import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';

class Mint extends StatefulWidget {
  @override
  _MintState createState() => _MintState();
}

class _MintState extends State<Mint> {
  int _selectedIndex = 2; // Adjust initial selected index as needed

  // List of sample NFT data
  final List<Map<String, String>> nftItems = [
    {
      'title': 'Kings Crown',
      'description':
          'To keep track of your data and rewards please connect app to a wallet of your choice',
      'price': '3ETH',
      'image': 'assets/images/nfts/king.png',
    },
    {
      'title': 'Queens Gambit',
      'description':
          'To keep track of your data and rewards please connect app to a wallet of your choice',
      'price': '3ETH',
      'image': 'assets/images/nfts/queen.png', // Replace with your image assets
    },
    {
      'title': 'Company Of Knights',
      'description':
          'To keep track of your data and rewards please connect app to a wallet of your choice',
      'price': '3ETH',
      'image': 'assets/images/nfts/knight.png',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              'Rank #10',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: kGrayAccent,
                child: SvgPicture.asset(
                  'assets/svgs/menu.svg',
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Player vs player block

            20.0.sbH,

            Expanded(
              child: ListView.builder(
                itemCount: nftItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'NFT Store',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    );
                  } else {
                    final item = nftItems[index - 1];
                    return NftCard(
                      title: item['title']!,
                      description: item['description']!,
                      price: item['price']!,
                      imageUrl: item['image']!,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        color: _selectedIndex == index ? Colors.white : Colors.grey,
        size: 30,
      ),
    );
  }
}

// NFT card widget
class NftCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  NftCard({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 0,
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(
                          width: 50,
                          height: 50,
                          child: Button(
                            text: 'Buy',
                          )),
                      const SizedBox(width: 8),
                      Text(
                        'Price: $price',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
