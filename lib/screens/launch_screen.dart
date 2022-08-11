import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:concentric_transition/concentric_transition.dart';



class LaunchScreen extends StatefulWidget {
  LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late PageController _pageController;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  final data = [
    ItemData(
      title: "Welcome",
      subtitle:
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
      image: const AssetImage('assets/images/spac2.jpeg'),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor:  Colors.black,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "Welcome",
      subtitle:
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
      image: const AssetImage('assets/images/download.jpeg'),
      backgroundColor:  Color(0xffFF8236),
      titleColor: Colors.teal,
      subtitleColor: Colors.white,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
    ItemData(
      title: "Welcome",
      subtitle:
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
      image: const AssetImage('assets/images/space1.jpeg'),
      backgroundColor: Colors.white,
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.black,
      background: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_bq485nmk.json'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          ConcentricPageView(
            onChange: (value) {
              setState(() {
                _currentPageIndex = value;
              });
            },
            pageController: _pageController,
            radius: 50,
            colors: data.map((e) => e.backgroundColor).toList(),
            itemCount: data.length,
            itemBuilder: (index,) {
              return ItemWidget(data: data[index]);
            },
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 50, end: 10),
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPageIndex >1,
              replacement: TextButton(
                onPressed: () {
                  _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut);
                },
                child: const Text(
                  'SKIP',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/bottom_bar_screen');
                },
                child: const Text(
                  'START',
                  style: TextStyle(fontSize: 18),
                ),
                style:
                TextButton.styleFrom(padding: EdgeInsetsDirectional.zero),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: _currentPageIndex != 0,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(microseconds: 150000),
                            curve: Curves.easeIn);
                      },
                      color: _currentPageIndex == 0 ? Colors.grey : Colors.black,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Visibility(
                    visible: _currentPageIndex != 2,
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    child: IconButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(microseconds: 150000),
                            curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: _currentPageIndex == 2 ? Colors.grey : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30, top: 20),
                child: Visibility(
                  visible: _currentPageIndex == 2,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/bottom_bar_screen'),
                    child:  Text('START'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFF8236),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
class ItemData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}
class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: Image(image: data.image),
              ),
              const Spacer(flex: 1),
              Text(
                data.title,
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(
                  color: data.subtitleColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ],
    );
  }
}