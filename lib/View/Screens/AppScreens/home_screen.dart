import 'package:suitability/Controller/Provider/home_screen_provider.dart';
import 'package:suitability/View/Screens/AppScreens/main_screen.dart';
import 'package:suitability/View/Screens/AppScreens/search_screen.dart';

import '../../Imports/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, model, _) {
        return Stack(
          children: [
            Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0),
              body: _buildPage(model.currentTab),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8, left: 8),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent.withOpacity(0),
                  elevation: 0,
                  currentIndex: model.currentTab,
                  onTap: (index) => model.changeTab(index),
                  items: [
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Image.asset(
                        "assets/icons/home.png",
                        scale: 5,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Image.asset(
                        "assets/icons/search.png",
                        scale: 5,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Image.asset(
                        "assets/icons/people.png",
                        scale: 5,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Image.asset(
                        "assets/icons/gear.png",
                        scale: 5,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Image.asset(
                        "assets/icons/cart.png",
                        scale: 5,
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const MainScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const SearchScreen(); // Adjust these as needed
      case 3:
        return const SearchScreen();
      case 4:
        return const SearchScreen();
      default:
        return const MainScreen();
    }
  }
}
