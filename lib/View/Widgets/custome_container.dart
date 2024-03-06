import '../Imports/imports.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final double? radius;

  const CustomContainer({super.key, required this.child, required this.height, required this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 29)),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 25),
          side: const BorderSide(
            color: kWhiteColor, // Border color
            width: 4.0, // Border width
          ),
        ),
        color: Colors.white, // Change the color as desired
        child: Center(child: child),
      ),
    );
  }
}
