import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideShow extends StatefulWidget {
  const SlideShow(
      {Key? key,
      this.showIndicator = true,
      required this.aspectRatio,
        this.slideGap = 5,
      required this.items})
      : super(key: key);

  final bool showIndicator;
  final double aspectRatio;
  final double slideGap;
  final List<Widget> items;

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            viewportFraction: 0.7,
            aspectRatio: widget.aspectRatio,
            autoPlay: true,
            onPageChanged: (index, reason) {
              if (widget.showIndicator){
                setState(() {
                  _current = index;
                });
              }
            },
          ),
          items: widget.items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: widget.slideGap),
                    child: i);
              },
            );
          }).toList(),
        ),
        if(widget.showIndicator) Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.items.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(widget.items.indexOf(entry),
                  duration: const Duration(milliseconds: 450), curve: Curves.ease),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            _current == widget.items.indexOf(entry) ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
