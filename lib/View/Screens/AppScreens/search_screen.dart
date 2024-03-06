import 'package:suitability/Controller/Provider/dayAndTimePicker_provider.dart';
import 'package:suitability/Controller/Provider/home_screen_provider.dart';
import 'package:suitability/View/Utils/snack_bar.dart';
import 'package:suitability/View/Widgets/custom_buttons.dart';
import 'package:suitability/View/Widgets/custom_text.dart';
import 'package:suitability/View/Widgets/custome_container.dart';

import '../../Imports/imports.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                          Provider.of<HomeScreenProvider>(context, listen: false).changeTab(0);
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
                    "How is your garden watered?",
                    style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 18)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardButton(
                      height: 65,
                      width: 153,
                      onPressed: () {},
                      radius: 10,
                      child: customText(
                          align: TextAlign.center,
                          "Rainfall only",
                          style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w500, fontSize: 14, color: kButtonTextColor)),
                    ),
                    CardButton(
                      height: 65,
                      width: 153,
                      onPressed: () {},
                      radius: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: customText(
                            align: TextAlign.center,
                            "I water as much as it needs",
                            style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w500, fontSize: 14, color: kButtonTextColor)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                customText(align: TextAlign.center, "or", style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 24)),
                const SizedBox(
                  height: 40,
                ),
                customText(
                    align: TextAlign.center,
                    "I want to water this much:",
                    style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 22)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(
                            align: TextAlign.center, "Days per week", style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 16)),
                        Stack(
                          children: [
                            CustomContainer(
                                height: 55,
                                width: 159,
                                radius: 15,
                                child: Consumer<SelectedDayAndTimeProvider>(
                                  builder: (context, selectedDayProvider, _) {
                                    return ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                        30,
                                        (index) {
                                          final day = index + 1;
                                          return GestureDetector(
                                            onTap: () {
                                              selectedDayProvider.setSelectedDay(day);
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                openSnackBar(context, "$day day of the month selected", Colors.green);
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                margin: EdgeInsets.symmetric(horizontal: 2),
                                                child: Center(
                                                  child: Text(
                                                    '$day',
                                                    style: TextStyle(
                                                      color: kButtonTextColor,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )),
                            Positioned(
                                top: 8,
                                left: 80,
                                child: Image.asset(
                                  'assets/images/pointer.png',
                                  scale: 2,
                                )),
                          ],
                        ),
                      ],
                    )),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customText(
                              align: TextAlign.center,
                              "Minutes each time",
                              style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w400, fontSize: 16)),
                          Stack(
                            children: [
                              CustomContainer(
                                height: 182,
                                width: 142,
                                radius: 15,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Consumer<SelectedDayAndTimeProvider>(
                                      builder: (context, hourProvider, _) {
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount: 24,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  hourProvider.setSelectedHour(index);
                                                  openSnackBar(context, "$index Hour of the day selected", Colors.green);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    index.toString().padLeft(2, '0'),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: kButtonTextColor,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 16,
                                      height: 182,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: kButtonTextColor,
                                              width: 2,
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/timedots.png',
                                            scale: 2,
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: kButtonTextColor,
                                              width: 2,
                                              //height: 80,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Consumer<SelectedDayAndTimeProvider>(
                                      builder: (context, minuteProvider, _) {
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount: 12,
                                            itemBuilder: (context, index) {
                                              final minute = (index + 1) * 5;
                                              return GestureDetector(
                                                onTap: () {
                                                  minuteProvider.setSelectedMinute(index);
                                                  openSnackBar(context, "$minute Minutes of an Hour selected", Colors.green);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    minute.toString().padLeft(2, '0'),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: kButtonTextColor,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 90,
                                  left: 8,
                                  child: Image.asset(
                                    'assets/images/pointerhorizental.png',
                                    scale: 2,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: buildButton(
                    () {
                      Provider.of<HomeScreenProvider>(context, listen: false).changeTab(0);
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
