import 'dart:ui';

import 'package:flutter/material.dart';

class PageWithBlurExamples extends StatefulWidget {
  const PageWithBlurExamples({Key? key}) : super(key: key);

  @override
  State<PageWithBlurExamples> createState() => _PageWithBlurExamplesState();
}

class _PageWithBlurExamplesState extends State<PageWithBlurExamples> {
  bool isBlurEnabled = true;
  bool isTextBlurEnabled = false;
  bool isIconBlurEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Background image
                _backgroundImage(),
                // Text overlay
                _textOverlayToBlur(),
                // Image overlay with transparency
                _transparencyImageOverlayWithBlurAction(),
              ],
            ),
          ),
          //Simple Container without blur
          _middleSection(),
          //Container with text and Icon that dilutes itself
          _bottomSection(),
          //Simple Container with blurred text
          _lowestSection(),
          //Container with text that get blur on Icon press
          _mostLowestBottomSection(),
        ],
      ),
    );
  }

  Image _backgroundImage() {
    return Image.network(
      'https://cdn3.vectorstock.com/i/1000x1000/74/32/blank-gift-card-template-with-blue-bow-and-ribbon-vector-20407432.jpg',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Center _textOverlayToBlur() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.all(16),
        child: const Text(
          'This is just an example to blur!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  GestureDetector _transparencyImageOverlayWithBlurAction() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBlurEnabled = !isBlurEnabled;
        });
      },
      child: BackdropFilter(
        filter: isBlurEnabled
            ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: Image.network(
              'https://images.tcdn.com.br/img/img_prod/684274/cadeado_latao_pado_tamanhos_1423_1_20190905145800.jpg',
              height: 200,
              width: 200,
              color: Colors.white.withOpacity(0.5),
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
        ),
      ),
    );
  }

  Container _middleSection() {
    return Container(
      height: 100,
      color: Colors.blue,
      child: const Center(
        child: Text(
          "This shouldn't be blured",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Row _bottomSection() {
    return Row(
      children: [
        Container(
          height: 100,
          width: 300,
          color: Colors.black,
          child: const Center(
            child: Text(
              "This Icon might be dilated and glitched",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ImageFiltered(
            imageFilter: //isIconBlurEnabled
                /*?*/ ImageFilter.blur(sigmaX: 5, sigmaY: 2),
            //: ImageFilter.dilate(radiusX: 0, radiusY: 0),
            child: IconButton(
              color: Colors.pink,
              onPressed: () {
                setState(() {
                  isIconBlurEnabled = !isIconBlurEnabled;
                });
              },
              icon: const Icon(Icons.blinds_closed),
            ))
      ],
    );
  }

  Container _lowestSection() {
    return Container(
      height: 100,
      color: Colors.green,
      child: Center(
        child: Text(
          "This is blured",
          style: _aplyBlurToText(),
        ),
      ),
    );
  }

  TextStyle _aplyBlurToText() {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.amber
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3));
  }

  Row _mostLowestBottomSection() {
    return Row(
      children: [
        Container(
          height: 100,
          width: 300,
          color: const Color.fromARGB(255, 122, 25, 25),
          child: Center(
            child: Text(
              "This Text might be blured",
              style: isTextBlurEnabled
                  ? _aplyBlurToText()
                  : const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            setState(() {
              isTextBlurEnabled = !isTextBlurEnabled;
            });
          },
          icon: const Icon(Icons.admin_panel_settings),
        )
      ],
    );
  }
}
