import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/custom_textField.dart';
import 'game_drawer_betting_screen.dart';

class GameBoardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Stake'),
                Tab(text: 'Game'),
                Tab(text: 'Chat'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Stake Tab
              TradingScreen(),
              // Game Tab
              const Center(child: Text('Game')),
              // Chat Tab
              const Center(child: Text('Chat')),
            ],
          ),
        ),
      ),
    );
  }
}

class TradingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Tab Bar
              15.0.sbH,
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelStyle:
                    GoogleFonts.raleway(color: Colors.white, fontSize: 12),
                indicator: const BoxDecoration(
                  color: Colors.black,
                ),
                tabs: const [
                  Tab(
                    text: 'RA',
                  ),
                  Tab(text: 'BAZ'),
                ],
              ),
              10.0.sbH,
              SizedBox(
                height: mediaQuery(context)
                    .height, // Set a height for TabBarView to avoid unbounded height
                child: TabBarView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderBook(),
                      // Left Side: Trading Panel

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300, // Set height to prevent unbounded error
                        child: _buildTradingPanel(),
                      ),

                      // Right Side: Order Book
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Side: Trading Panel
                      _buildTradingPanel(),
                      const SizedBox(width: 8),
                      // Right Side: Order Book
                      _buildOrderBook(),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTradingPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buy/Sell Toggl
        const SizedBox(height: 8),
        const Text("Available", style: TextStyle(color: Colors.grey)),
        const Text("0.00002792 USDT", style: TextStyle()),
        const SizedBox(height: 16),
        // Price Input Field
        _buildInputField("86645.69"),
        const SizedBox(height: 8),

        // Quantity Input Field
        _buildInputField("Qty"),
        const SizedBox(height: 8),

        // TP/SL Button
        const Row(
          children: [
            Text("Potential win: 100000", style: TextStyle()),
            Spacer(),
          ],
        ),
        const SizedBox(height: 20),

        // Buy Button
        const Button(text: 'Stake'),
      ],
    );
  }

  Widget _buildInputField(String placeholder, {bool enabled = true}) {
    return TextField(
      enabled: enabled,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildOrderBook() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Last 4 games'),
                5.0.sbH,
                const Text(
                  '2360 points',
                  style: TextStyle(fontSize: 12),
                ),
                const Text(
                  '2360 points',
                  style: TextStyle(fontSize: 12),
                ),
                const Text(
                  '2360 points',
                  style: TextStyle(fontSize: 12),
                ),
                const Text(
                  '2360 points',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 20),
            color: const Color.fromARGB(255, 240, 240, 240),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            height: 100,
            width: mediaQuery(context).width * 0.4,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("87,120.45",
                        style: TextStyle(color: Colors.red)),
                    Text("0.0029", style: TextStyle(color: green1)),
                  ],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
