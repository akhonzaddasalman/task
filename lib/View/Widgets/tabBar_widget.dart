import 'package:suitability/View/Widgets/custom_buttons.dart';
import 'package:suitability/View/Widgets/custom_text.dart';

import '../Imports/imports.dart';

class CustomTabBar extends StatefulWidget {
  final double height;
  final double width;
  const CustomTabBar({super.key, required this.height, required this.width});
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool tabBar = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: kWhiteColor, // Border color
                  width: 2.0, // Border width
                ),
              ),
              color: kWhiteColor,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kWhiteColor.withOpacity(0.6),
                      blurRadius: 8.0,
                      spreadRadius: 4.0,
                      offset: const Offset(9.0, 0.0),
                    ),
                  ],
                ),
                indicatorColor: Colors.transparent,
                labelColor: kButtonTextColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.black,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                labelStyle: GoogleFonts.libreFranklin(fontSize: 14, color: kButtonTextColor, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    child: customText(
                        align: TextAlign.center, "Cubic Meters", style: GoogleFonts.libreFranklin(fontWeight: FontWeight.w500, fontSize: 16)),
                  ),
                  Tab(
                    height: 80,
                    child: CardTabBarButton(
                      height: 80,
                      width: double.infinity,
                      child: Image.asset('assets/images/handle.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              Image.asset(
                "assets/images/button.png",
                scale: 5,
              ),
              Center(
                child: Text(
                  _tabController!.length.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
