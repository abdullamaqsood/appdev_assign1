import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appdev_assign1/widgets/comments.dart';
import 'package:appdev_assign1/widgets/appbar.dart';
import 'package:appdev_assign1/widgets/events.dart';
import 'package:appdev_assign1/widgets/stats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Map<String, String>> events = [
    {
      'eventName': 'Tech Conference',
      'eventDate': '30 November 2025, 9:00 AM',
      'eventAddress': '13th Street, Park Avenue',
      'eventPerson': 'John Doe',
      'imagePath': 'assets/images/event.jpg',
    },
    {
      'eventName': 'Leadership Seminar',
      'eventDate': '28 Jan 2025, 2:00 PM',
      'eventAddress': '13th Street, Park Avenue',
      'eventPerson': 'John Doe',
      'imagePath': 'assets/images/event.jpg',
    },
    {
      'eventName': 'Entrepreneurship Summit',
      'eventDate': '15 March 2025, 10:00 AM',
      'eventAddress': '13th Street, Park Avenue',
      'eventPerson': 'John Doe',
      'imagePath': 'assets/images/event.jpg',
    },
  ];

  final List<Map<String, String>> comments = [
    {
      'eventName': 'Flutter Flash',
      'comment': 'Looks like an amazing event!',
      'eventDate': '30 November 2024, 11:00 PM',
    },
    {
      'eventName': 'Bob Annual BBQ',
      'comment': 'Wish I could have been there :(',
      'eventDate': '2 August 2024, 10:31 PM',
    },
    {
      'eventName': 'Networking Lounge',
      'comment': 'Will the event be starting on time?',
      'eventDate': '25 June 2023, 12:00 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            shape: CustomAppBar(),
          ),
          const SizedBox(height: 35),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "John Doe",
            style: TextStyle(
              color: Color(0xFFD62828),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              'John Doe exists. John Doe builds. John Doe innovates. What’s next? Only time will tell...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF929292),
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildTabSection(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: selectedIndex == 2
                  ? 1
                  : (selectedIndex == 1 ? comments.length : events.length),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: selectedIndex == 0
                      ? _buildEventTile(events[index])
                      : selectedIndex == 1
                          ? _buildCommentTile(comments[index])
                          : const MyStats(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTabButton("Posts", 0),
            _buildTabButton("Comments", 1),
            _buildTabButton("Stats", 2),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 1,
          width: 400,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildEventTile(Map<String, String> event) {
    return MyEvent(
      eventName: event['eventName']!,
      eventDate: event['eventDate']!,
      eventAddress: event['eventAddress']!,
      eventPerson: event['eventPerson']!,
      imagePath: event['imagePath']!,
    );
  }

  Widget _buildCommentTile(Map<String, String> comment) {
    return MyComments(
      eventName: comment['eventName']!,
      comment: comment['comment']!,
      eventDate: comment['eventDate']!,
    );
  }
}
