// stf
import 'package:firstapp/pages/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          MyBox(
            "What is a computer?",
            "A computer is a machine that can be programmed to automatically.",
            "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExemZxem9sd2R5ZTBrd2w0N2c3b3ptcmc3ZWY0cnNpNHkybnZwOWt3aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/iLqpYAbKGOrqU/giphy.gif",
          ),
          SizedBox(height: 20),
          MyBox(
            "What is a Flutter? ?",
            "An open-source UI framework by Google.",
            "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExbzJ1ZDM1NHluajZ2eGh4NmxzMWhrb2lzMzZ6YTZidmQ4bXl5cXBjNCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/gZEBpuOkPuydi/giphy.gif",
          ),
          SizedBox(height: 20),
          MyBox(
            "What is a dart?",
            "A a language that tells computers what to do, step by step.)",
            "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExNzJ5YW5leHdjOWJ3ZDR0NGp5ZWloNTd2cHh4eG9jMmdhOTBydDhteSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/14bE3hB1gBejxm/giphy.gif",
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String img_url) {
    return Container(
      padding: EdgeInsets.all(24),
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 195, 210, 210),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(img_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(255, 182, 179, 179),
            ),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              print("next page >>");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            child: Text("red more"),
          ),
        ],
      ),
    );
  }
}
