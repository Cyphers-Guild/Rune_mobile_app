import 'package:flutter_svg/flutter_svg.dart';
import 'package:rune/imports.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.bgColor,
      appBar: AppBar(
        leading: AppConstant.backIcon(context: context),
        backgroundColor: AppConstant.bgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // Profile section

            Stack(
              children: [
                // Profile Image
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(
                        'assets/images/boy.png'), // Replace with actual image path
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daniel',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.accentWhite,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4.0,
                            color:
                                Colors.black.withOpacity(0.7), // Shadow color
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Johnson',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          leadingDistribution: TextLeadingDistribution.even,
                          color: AppConstant.accentWhite,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4.0,
                              color:
                                  Colors.black.withOpacity(0.7), // Shadow color
                            ),
                          ],
                        ),
                      ),
                    ),
                    50.0.sbH,
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/medal.svg',
                          color: AppConstant.accentWhite,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Rank 12',
                          style: TextStyle(
                              color: AppConstant.accentWhite, fontSize: 13),
                        ),
                      ],
                    ),
                    5.0.sbH,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppConstant.accentWhite),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '1500',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.accentWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            25.0.sbH,

            // My Collections section
            const Text(
              'My collections',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppConstant.accentWhite,
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppConstant.accentWhite,
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
                color: AppConstant.accentWhite,
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
        border: Border.all(color: AppConstant.accentWhite),
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
        border: Border.all(color: Colors.grey.shade500),
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
                  const Icon(Icons.flash_on, color: AppConstant.accentWhite),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppConstant.accentWhite,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
