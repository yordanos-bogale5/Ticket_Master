import 'dart:async';
import 'package:flutter/material.dart';



class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Automatic page change every second
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Slider Card'),
      ),
      body: Center(
        child: Card(
          child: SizedBox(
            height: 200,
            width: 300,
            child: PageView(
              controller: _pageController,
              children: [
                Image.network(
                  'https://i.pinimg.com/736x/ea/7d/3a/ea7d3a93e84fb7877ee6c3ceacd28f22.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.DgQNGEl3lZ_rP_wkXBdUiQHaFj?rs=1&pid=ImgDetMain',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://i.ytimg.com/vi/HUUWiVkFtMU/maxresdefault.jpg',
                  fit: BoxFit.cover,
                ),
              ],
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
