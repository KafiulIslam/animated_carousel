import 'package:flutter/material.dart';
import 'package:flutter_animation/components/common_classes.dart';
import 'package:flutter_animation/constant/constant_page.dart';
import 'package:flutter_animation/constant/number_ratio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    List<Widget> cardList = const [

      CardSlider(),
      CardSlider(),
      CardSlider(),
      CardSlider(),
      CardSlider(),
      CardSlider(),

    ];


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    final PageController controller = PageController();


    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding:   EdgeInsets.only(top: height/sixtyFourPixelRatioH  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    Text(
                      'Total Balance',
                      style: GoogleFonts.montserrat(textStyle: fourteenAssTextStyle),
                    ),
                    SizedBox(height: height/eightPixelRatioH,),
                    RichText(
                      text: TextSpan(
                        // style: TextStyle(color: Colors.black, fontSize: 200),
                        children: <TextSpan>[
                          TextSpan(text: '7896.00',   style: GoogleFonts.montserrat(textStyle: const  TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: blackColor)),),
                          TextSpan(text: ' JOD',   style: GoogleFonts.montserrat(textStyle: const  TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: assColor)),),

                        ],
                      ),
                      textScaleFactor: 0.5,
                    ),
                    SizedBox(height: height/thirtyTwoPixelRatioH,),
                    Container(
                      height: height/1.6,
                      width: double.infinity,
                      child: PageView(
                        controller: controller,
                        children:  const <Widget>[
                          CardSlider(),
                          CardSlider(),
                          CardSlider(),
                          CardSlider(),
                          CardSlider(),
                          CardSlider(),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height/thirtyTwoPixelRatioH),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Container(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 6,
                      effect: const WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: assColor,
                        activeDotColor: blackColor,
                      ),
                      onDotClicked: (index) =>
                          controller.animateToPage(index,
                              duration:
                              const Duration(microseconds: 200),
                              curve: Curves.bounceOut),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}