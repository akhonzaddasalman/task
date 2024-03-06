import 'package:suitability/Controller/Provider/home_screen_provider.dart';
import 'package:suitability/View/Widgets/custom_buttons.dart';
import 'package:suitability/View/Widgets/custom_text.dart';
import 'package:suitability/View/Widgets/tabBar_widget.dart';

import '../../Imports/imports.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Provider.of<HomeScreenProvider>(context, listen: false).changeTab(1);
                        },
                        child: Icon(
                          Icons.close,
                          size: 25,
                          color: kButtonTextColor,
                        ),
                      ),
                    ),
                    Expanded(flex: 3, child: Text('Tell us More', style: GoogleFonts.aboreto(fontWeight: FontWeight.w500, fontSize: 30)))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                customText(
                    align: TextAlign.center,
                    "Besides rainfall, how much irrigated water can you use for this crop?",
                    style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 18)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardButton(
                      height: 50,
                      width: 110,
                      onPressed: () {},
                      child: customText(
                          align: TextAlign.center,
                          "Unlimited",
                          style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w500, fontSize: 14, color: kButtonTextColor)),
                    ),
                    CardButton(
                      height: 50,
                      width: 110,
                      onPressed: () {},
                      child: customText(
                          align: TextAlign.center,
                          "None",
                          style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w500, fontSize: 14, color: kButtonTextColor)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                customText(
                    align: TextAlign.center,
                    "or select an amount using the dial",
                    style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 18)),
                const CustomTabBar(
                  height: 70,
                  width: double.infinity,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: buildButton(
                    () {
                      Provider.of<HomeScreenProvider>(context, listen: false).changeTab(1);
                    },
                    "Next",
                    textStyle: GoogleFonts.poppins(color: kWhiteColor, fontSize: 16),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(kButtonColor)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
