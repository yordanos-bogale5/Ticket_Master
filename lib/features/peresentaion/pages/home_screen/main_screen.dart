
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/services.dart';

class MyCustomIcons {
  static const IconData busticket =
      IconData(0xe800, fontFamily: 'MyCustomFont');
  static const IconData concert = IconData(0xe801, fontFamily: 'MyCustomFont');
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> topCatNames = ["Bus Tickets", "Flights", "Concert", "Hotels"];
  final List<String> bottomCatNames = [
    "Events",
    "Tour Tickets",
    "zemen bus",
    "Abay Bus",
    "Selam Bus",
    "Rophinan",
    "Destination"
  ];

  final List<Icon> topCatIcons = [
    const Icon(Icons.car_rental, color: Colors.white, size: 30),
    const Icon(Icons.airplane_ticket, color: Colors.white, size: 30),
    const Icon(Icons.tour, color: Colors.white, size: 30),
    const Icon(Icons.hotel, color: Colors.white, size: 30),
  ];

  final List<Icon> bottomCatIcons = [
    const Icon(Icons.event, color: Colors.amber, size: 25),
    const Icon(Icons.tour, color: Colors.amber, size: 25),
    const Icon(Icons.location_on, color: Colors.amber, size: 25),
    const Icon(Icons.hotel, color: Colors.amber, size: 25),
    const Icon(Icons.location_on, color: Colors.amber, size: 25),
    const Icon(Icons.airplane_ticket, color: Colors.amber, size: 25),
    const Icon(Icons.tour, color: Colors.amber, size: 25),
  ];

  final List<Color> topCatColors = [
    const Color.fromRGBO(41, 98, 255, 1),
    const Color.fromRGBO(41, 98, 255, 1),
    const Color.fromRGBO(41, 98, 255, 1),
    const Color.fromRGBO(41, 98, 255, 1),
    
  ];

  final List<String> imageUrls = [
    "https://i.pinimg.com/736x/ea/7d/3a/ea7d3a93e84fb7877ee6c3ceacd28f22.jpg",
    "https://i.pinimg.com/736x/ea/7d/3a/ea7d3a93e84fb7877ee6c3ceacd28f22.jpg",
    "https://i.ytimg.com/vi/HUUWiVkFtMU/maxresdefault.jpg",
    "https://i.ytimg.com/vi/HUUWiVkFtMU/maxresdefault.jpg",
    "https://i.ytimg.com/vi/HUUWiVkFtMU/maxresdefault.jpg",
  ];

  final List<String> horizontalTexts = [
    "zemen bus",
    "selam bus",
    "habesha bus ",
    "yegna bus",
    "concert",
    "swap",
    "tcket"
  ];

  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.page! < imageUrls.length - 1) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut);
      } else {
        _pageController.jumpToPage(0);
      }
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
     SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(41, 98, 255, 1), // Set the color you want for the status bar
      ),
    );
    return Scaffold(
  
      appBar:AppBar(
        backgroundColor:const Color.fromRGBO(41, 98, 255, 1), 
        
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(40.0),
    child: Column(
      children: [
        SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(41, 98, 255, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Search Input Field
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 3, bottom: 4),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here...",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Amber Messaging Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.message,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Amber Profile Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.account_circle,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // White Transactions Icon
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.monetization_on,
                        size: 20,
                        color: Color.fromRGBO(41, 98, 255, 1), 
                      ),
                    ),
                  ],
                ),
               Container(
  height: 40,
  padding: const EdgeInsets.only(
    right: 20, // Adjust the horizontal padding as needed
  ), 
  child: ListView.builder(
scrollDirection: Axis.horizontal,
    itemCount: horizontalTexts.length,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.only(
          right: 10, // Adjust the right margin as needed
          bottom: 10, // Adjust the bottom margin as needed
          top: 5, 
          left:0, // Set the height between the search box and the horizontal box
        ), 
        width: 100, // Adjust the width of the Container as needed
        padding: const EdgeInsets.only(left: 10), // Add padding to the left of the text
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), // Adjust the border radius as needed
          border: Border.all(
            color: Colors.amber,
          ),
        ),
        child: Text(
          horizontalTexts[index],
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    },
  ),
),


              ],
            ),
          ),
        ),
      ],
    ),
  ),
),
body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Categories
            Row(
              children: topCatNames.asMap().entries.map((entry) {
                final index = entry.key;
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: topCatColors[index],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: topCatIcons[index],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        topCatNames[index],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 25),
            // Bottom Categories
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bottomCatNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 35),
                    child: Column(
                      children: [
                        Icon(
                          bottomCatIcons[index].icon,
                          color: Colors.amber,
                          size: 25,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          bottomCatNames[index],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Display alternating small and big cards with sliding images
      for (int i = 0; i < 5; i++) ...[
        Padding(
          padding: const EdgeInsets.only(top: 1,bottom:5),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 270,
                    width: i.isEven ? 180 : 270,
                   child: PageView(
controller: _pageController,
  children: imageUrls.map((url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }).toList(),
),

                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    height: 270,
                    width: i.isEven ? 270 : 470,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/aa/f9/05/aaf90564-680f-3246-da81-23cd49204471/cover.jpg/1200x630cw.png',
                            height: 100,
                            width: i.isEven ? 270 : 470,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Rophinan Concert',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Vip 1000',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ],
  ),
),



      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromRGBO(41, 98, 255, 1), 
        elevation: 0,
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.library_books, title: 'Sell'),
          TabItem(icon: Icons.car_rental, title: 'Tickets'),
          TabItem(icon: Icons.person, title: 'Account'),
          TabItem(icon: Icons.airplane_ticket, title: 'My Events'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}