import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/presentation/modules/about/about_screen.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';
import 'package:recog_plantify/presentation/modules/camera/camera_screen.dart';
import 'package:recog_plantify/presentation/modules/historial/historial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CameraScreen(),
    HistorialScreen(),
    AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = (context.read<AuthCubit>().state as Authenticated).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: Row(children: [
          const Spacer(),
          Text(user.name),
          const SizedBox(width: 10),
          Image.asset(
            "assets/images/logo.png",
            height: 40,
          ),
        ]),
      ),
      drawer: Drawer(
        //Profile picture and options
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.lightGreen,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: Image.asset('assets/images/logo.png').image,
              ),
              accountName: Text(
                "${user.name} ${user.lastName}",
                style: const TextStyle(fontSize: 24),
              ),
              accountEmail: Text(user.email),
            ),
            _DrawerItem(
              icon: Icons.camera_alt,
              text: "Analizar plantas",
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            _DrawerItem(
              icon: Icons.history,
              text: "Historial de búsquedas",
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
              
            ),
            _DrawerItem(
              icon: Icons.info,
              text: "Acerca de",              
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            _DrawerItem(
              icon: Icons.logout,
              text: "Cerrar sesión",
              onTap: () {
                context.read<AuthCubit>().logout();
                Navigator.of(context).pushReplacementNamed("login");
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 18, 44, 0),
        backgroundColor: AppColors.primaryGreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Cámara",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Historial",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Acerca de",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const _DrawerItem({required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(icon),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
