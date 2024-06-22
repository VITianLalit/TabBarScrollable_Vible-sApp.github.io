import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vible_wallet_assignment/controller/wallet_screen_provider.dart';
import 'package:vible_wallet_assignment/views/home_screen.dart';
import 'package:vible_wallet_assignment/views/profile.dart';
import 'package:vible_wallet_assignment/views/vible.dart';
import 'package:vible_wallet_assignment/views/wallet.dart';

void main() {
  runApp(WalletApp());
}

class WalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WalletScreenProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WalletScreen(),
      ),
    );
  }
}

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Vible(),
    Wallet(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<WalletScreenProvider>(context);
    return Scaffold(
      body: _widgetOptions.elementAt(controller.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.orange,
        currentIndex: controller.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.vpn_key,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 35,
            ),
            label: '',
          ),
        ],
        onTap: (val) {
          controller.setIndex(val);
        },
      ),
    );
  }
}
