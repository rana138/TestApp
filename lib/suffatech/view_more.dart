import 'package:flutter/material.dart';

class ViewMore extends StatefulWidget {
  const ViewMore({super.key});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Our Services"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "At Suffa Tech, we specialize in crafting exceptional websites and mobile applications that empower businesses to thrive in the digital age. Our team of highly skilled developers, designers, and strategists work collaboratively to bring your ideas to life. We understand that every project is unique, and we tailor our solutions to meet your specific needs, ensuring user-friendly experiences and seamless functionality.\n\nWhether it's building a robust e-commerce platform, a captivating mobile app, or a sleek corporate website, Suffa Tech delivers excellence at every step of the development process.\n\nWe offer comprehensive training programs, workshops, and mentorship opportunities, providing aspiring developers and designers with the skills they need to excel in the digital world. Additionally, Suffa Tech proudly offers internship programs, enabling students and graduates to gain real-world experience and kick-start their careers.",
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
