import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../search_screen/search.dart';

class TicketMasterHome extends StatefulWidget {
  const TicketMasterHome({Key? key}) : super(key: key);

  @override
  State<TicketMasterHome> createState() => _TicketMasterHomeState();
}

class _TicketMasterHomeState extends State<TicketMasterHome> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _appBarAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _appBarAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'TicketMaster',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: TicketMasterSearchScreen());
              },
              icon: const Icon(Icons.search, color: Colors.black),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications, color: Colors.black)),
          ],
        ),
      ),
      body: Column(
        children: [
          AnimatedBuilder(
            animation: _appBarAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -30 * (1 - _appBarAnimation.value)),
                child: child,
              );
            },
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    width: 50,
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage('https://th.bing.com/th/id/OIP.qy5mV6iLODFcnzErZl6ZyQHaEK?rs=1&pid=ImgDetMain'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: 11,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.event, size: 50),
                        const SizedBox(height: 10),
                        Text('Event $index'),
                      ],
                    ),
                  );
                } else if (index == 1) {
                  return const Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.event, size: 30),
                        SizedBox(height: 5),
                        Text('Small Event'),
                      ],
                    ),
                  );
                } else {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.event, size: 50),
                        const SizedBox(height: 10),
                        Text('Event $index'),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.pink[900],
        elevation: 0,
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.library_books, title: 'Sell'),
          TabItem(icon: Icons.settings, title: 'Tickets'),
          TabItem(icon: Icons.person, title: 'Account'),
          TabItem(icon: Icons.settings, title: 'My Events'),
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
