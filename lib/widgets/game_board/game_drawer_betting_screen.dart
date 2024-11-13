import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rune/imports.dart';

class TradingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // 1. Tab Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab("Spot", true),
                  _buildTab("Futures", false),
                  _buildTab("Options", false),
                  _buildTab("Margin", false),
                  _buildTab("Explore", false),
                ],
              ),

              // 2. Trading Panel and Order Book
              SizedBox(
                width: 100,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side: Trading Panel
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: _buildTradingPanel(),
                    ),
                    // Right Side: Order Book
                    SizedBox(width: 8),
                    Container(
                      width: 120, // Fixed width for the order book
                      child: _buildOrderBook(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool selected) {
    return Text(
      title,
      style: TextStyle(
        color: selected ? Colors.white : Colors.grey,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildTradingPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buy/Sell Toggle
        Row(
          children: [
            Flexible(child: _buildBuySellButton("Buy", true)),
            Flexible(child: _buildBuySellButton("Sell", false)),
          ],
        ),
        SizedBox(height: 8),
        Text("Available", style: TextStyle(color: Colors.grey)),
        Text("0.00002792 USDT", style: TextStyle(color: Colors.white)),
        SizedBox(height: 16),

        // Limit/Market Dropdown
        _buildDropdown("Limit"),
        SizedBox(height: 8),

        // Price Input Field
        _buildInputField("86645.69"),
        SizedBox(height: 8),

        // Quantity Input Field
        _buildInputField("Qty"),
        SizedBox(height: 8),

        // Leverage Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            5,
            (index) => CircleAvatar(
              radius: 6,
              backgroundColor: index == 0 ? Colors.orange : Colors.grey,
            ),
          ),
        ),
        SizedBox(height: 8),

        // Order Value
        _buildInputField("Order Value", enabled: false),
        SizedBox(height: 16),

        // TP/SL Button
        Button(text: 'TP/SL'),
        SizedBox(height: 8),

        // Post-Only Checkbox
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
              activeColor: Colors.orange,
            ),
            Text("Post-Only", style: TextStyle(color: Colors.white)),
            Spacer(),
            _buildDropdown("GTC"),
          ],
        ),
        SizedBox(height: 16),

        // Buy Button
        Button(text: 'Stake'),
      ],
    );
  }

  Widget _buildBuySellButton(String text, bool selected) {
    return Container(
      height: 40,
      color: selected ? Colors.green : Colors.grey[900],
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildInputField(String placeholder, {bool enabled = true}) {
    return TextField(
      enabled: enabled,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        hintText: placeholder,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildOrderBook() {
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Order Book", style: TextStyle(color: Colors.white)),
          SizedBox(
            width: 300,
            height: 300,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("87,120.45", style: TextStyle(color: Colors.red)),
                    Text("0.0029", style: TextStyle(color: Colors.white)),
                  ],
                );
              },
            ),
          ),
          Divider(color: Colors.grey),
          Text("87,115.91", style: TextStyle(color: Colors.red, fontSize: 18)),
          Text("≈87,115.91 USD", style: TextStyle(color: Colors.white)),
          Divider(color: Colors.grey),
          SizedBox(
            width: 300,
            height: 300,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("87,117.61", style: TextStyle(color: Colors.green)),
                    Text("0.1938", style: TextStyle(color: Colors.white)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
