import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';

void showWalletDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  'Select Wallet',
                  style: GoogleFonts.raleway(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              3.0.sbH,
              Text(
                'Please connect app to a wellet of your choice ',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(),
              ),
              10.0.sbH,
              // Wallet options
              WalletOption(
                icon: 'assets/images/metamask.png',
                title: 'MetaMask',
                onTap: () {
                  // Handle MetaMask selection
                },
              ),
              WalletOption(
                icon: 'assets/images/phantom.png',
                title: 'Phantom',
                onTap: () {
                  // Handle Phantom selection
                },
              ),

              WalletOption(
                icon: 'assets/images/coinbase.png',
                title: 'Coinbase Wallet',
                onTap: () {
                  // Handle Coinbase Wallet selection
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

class WalletOption extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const WalletOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Image.asset(
          icon,
          width: 25.0,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        onTap: () => Navigator.pushNamed(context, 'userName'),
      ),
    );
  }
}
