import 'package:flutter/material.dart';

class MyEvent extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventAddress;
  final String eventPerson;
  final String imagePath;

  const MyEvent({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventAddress,
    required this.eventPerson,
    this.imagePath = 'assets/images/event.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imagePath,
                  width: 89,
                  height: 77,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(eventDate,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF929292),
                        )),
                    Text(eventAddress,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF929292),
                        )),
                    Text(eventPerson,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF929292),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
