import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:ingn/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[AppColors.dark, AppColors.dark],
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 1),
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: buildHeader(context),
                ),
                buildMenuBar(context),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        //child: GamesPage(),
                      ),
                      // ConstrainedBox(
                      //   constraints: BoxConstraints.expand(),
                      //   //child: TagsPage(),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildMenuBar(BuildContext context) {
  return Container(
    width: 150,
    height: 45,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.orange, width: 2.0),
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
    ),
    child: CustomPaint(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: onGamePress,
              child: Text(
                'Games',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: onTagPress,
              child: const Text(
                'Tags',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildHeader(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'INGN',
              style: TextStyle(
                color: AppColors.orange,
                fontSize: 24.0,
              ),
            ),
            SizedBox(width: 10, height: 5.0),
            Text(
              'Find your next favorite game',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
