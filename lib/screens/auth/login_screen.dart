
import 'package:e_commerce/route/route.dart';
import 'package:e_commerce/screens/utils/my_color.dart';
import 'package:e_commerce/screens/utils/my_size.dart';
import 'package:e_commerce/screens/utils/my_string.dart';
import 'package:e_commerce/widgets/forget_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      floatingActionButton: floatingActionBottom,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 240,
            bottom: 520,
            child: Container(
              height: 250,
              child: ClipPolygon(
                sides: 6,
                borderRadius: 10.0, // Default 0.0 degrees
                rotate: 0, // Default 0.0 degrees
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          MyColor.primary_color,
                          MyColor.secondary_color,
                        ],
                      )),
                ),
              ),
            ),
          ),
          LinearGradientMask(
            child: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                height: double.infinity,
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 300, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      MyString.login.toUpperCase(),
                      style: TextStyle(
                        color: MyColor.white,
                        fontSize: MySize.dynamicSp(80),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        _textField(MyString.email, false),
                        _textField(MyString.password, true),
                        ForgetPasswordButton(
                          color: MyColor.white,
                          rightPadding: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textField(String text, bool obscure) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 40, 10),
    child: TextField(
      style: TextStyle(color: MyColor.white),
      textAlign: TextAlign.left,
      obscureText: obscure,
      autocorrect: false,
      cursorColor: MyColor.white,
      maxLines: 1,
      decoration: InputDecoration(
        border: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.white)),
        hintText: text,
        hintStyle: TextStyle(color: Colors.white),
      ),
    ),
  );

  Widget get floatingActionBottom => FloatingActionButton(
    backgroundColor: MyColor.white,
    shape: PolygonBorder(
      sides: 5,
      borderRadius: 5.0, // Default 0.0 degrees
      border: BorderSide.none, // Default BorderSide.none
    ),
    child: Icon(
      Icons.arrow_forward,
      color: Colors.pink,
      size: 20,
    ),
    onPressed: () {
      print('click');
      Navigator.of(context).pushReplacementNamed(ROUTE.home);
    },
  );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = MyColor.secondary_color;
    // create a path
    var path = Path();
    path.moveTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.23, size.height * 0.14,
        size.width * 0.45, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.39, size.width, size.height * 0.53);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DrawPoligon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            MyColor.primary_color,
            MyColor.secondary_color,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
