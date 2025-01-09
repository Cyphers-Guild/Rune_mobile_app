import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/views/wallet/wallet_screen.dart';
import 'package:rune/widgets/shared/backgroundWidget.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin {
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

  List wallets = [
    {
      'image': 'assets/images/rune.png',
      'name': 'Rune',
      'value': 'Rune',
      'balance': '0.002232',
      'balance_in_usd': "0.07 USD"
    },
    {
      'image': 'assets/images/sol.png',
      'name': 'Sol',
      'value': 'Solana',
      'balance': '0.002232',
      'balance_in_usd': "0.07"
    },
    {
      'image': 'assets/images/algo.png',
      'name': 'Algo',
      'value': 'Algorand',
      'balance': '0.00000',
      'balance_in_usd': "0.00 USD"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  padding: const EdgeInsets.all(0),
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  tabs: [
                    Text(
                      'Overview',
                      style: GoogleFonts.chakraPetch(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'History',
                      style: GoogleFonts.chakraPetch(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                  // No indicator
                ),
              ),
              CircleAvatar(
                radius: 16,
                backgroundColor: AppConstant.buttonGreen,
                child: SvgPicture.asset(
                  'assets/svgs/receipt.svg',
                  width: 16,
                ),
              )
            ],
          ),
          // Ensure TabBarView has constrained height
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Overview Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Balance Card
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(10, 21, 76, 56),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Balance',
                                  style: GoogleFonts.chakraPetch(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                5.0.sbH,
                                Row(
                                  children: [
                                    Text(
                                      '100.2345',
                                      style: GoogleFonts.chakraPetch(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ' USD',
                                      style: GoogleFonts.chakraPetch(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '~0.00009854 RUNE',
                                  style: GoogleFonts.chakraPetch(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/half_rook.png',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Rune and Avalanch Cards
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppConstant.buttonGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rune',
                                    style: GoogleFonts.chakraPetch(
                                      color: AppConstant.accentWhite,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '0.00009854',
                                    style: GoogleFonts.chakraPetch(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '~9.58 USD',
                                    style: GoogleFonts.chakraPetch(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppConstant.buttonGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Avalanche',
                                    style: GoogleFonts.chakraPetch(
                                      color: AppConstant.accentWhite,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '0.00009854',
                                    style: GoogleFonts.chakraPetch(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '~9.58 USD',
                                    style: GoogleFonts.chakraPetch(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.0.sbH,
                      const Text(
                        'crypto',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.grey.shade900,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                                tristate: true,
                              ),
                              const Text('Hide zero balances')
                            ],
                          )
                        ],
                      ),
                      10.0.sbH,
                      ...wallets.map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WalletScreen()));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppConstant.accentWhite,
                                    backgroundImage: AssetImage(e['image']),
                                  ),
                                  10.0.sbW,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        e['value'],
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['balance'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '~ ${e['balance_in_usd']}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                // History Tab
                Center(
                  child: Text(
                    'History Content Here',
                    style: GoogleFonts.chakraPetch(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
