import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      ),
      home: ExploreScreen(),
    );
  }
}

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.remove_red_eye),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Events'),
            Tab(text: 'News'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          EventsTab(),
          NewsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension), label: 'Puzzles'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

class EventsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.emoji_events, color: Colors.amber),
            title: Text('Events Today',
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          EventCard(
            title: 'Titled Cup 2024',
            dateRange: '2 Jan 2024 - 31 Dec 2024',
            icon: Icons.sports_esports,
          ),
          EventCard(
            title: 'European Chess Championship 2024',
            dateRange: '8 Nov 2024 - 20 Nov 2024',
            icon: Icons.public,
          ),
        ],
      ),
    );
  }
}

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.article, color: Colors.redAccent),
          title: Text('News', style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        NewsCard(
          title:
              'Brewington Hardaway Earns Grandmaster Title, 2nd African American GM In History',
          imageUrl:
              'https://via.placeholder.com/150', // Replace with actual image URL
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final IconData icon;

  EventCard({
    required this.title,
    required this.dateRange,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(dateRange),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  NewsCard({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
