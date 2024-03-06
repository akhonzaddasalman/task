import '../Imports/imports.dart';

ElevatedButton buildButton(onPressed, title, {TextStyle? textStyle, ButtonStyle? style}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: style ??
        ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
    child: Text(
      title,
      style: textStyle ?? const TextStyle(fontSize: 18, color: Colors.black),
    ),
  );
}

class CardButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Widget child;
  final double? radius;

  const CardButton({super.key, required this.onPressed, required this.child, required this.height, required this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 29)),
        boxShadow: [
          BoxShadow(
            color: kWhiteColor.withOpacity(0.5), // Semi-transparent gray
            blurRadius: 8.0,
            spreadRadius: 1.0, // Spread the shadow outwards
            offset: const Offset(0.0, 0.0), // Move the shadow right and down
          ),
        ],
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 25),
          side: const BorderSide(
            color: kWhiteColor, // Border color
            width: 2.0, // Border width
          ),
        ),
        color: Colors.white, // Change the color as desired
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(radius ?? 25),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class CardTabBarButton extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const CardTabBarButton({super.key, required this.child, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: kWhiteColor.withOpacity(0.6),
            blurRadius: 8.0,
            spreadRadius: 3.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            color: kWhiteColor, // Border color
            width: 1.0, // Border width
          ),
        ),
        color: Colors.white,
        child: Center(child: child),
      ),
    );
  }
}
