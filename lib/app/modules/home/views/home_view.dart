import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (context) {
        return Scaffold(
          body: ListView(
            children: [
              Container(
                color: ,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ArrowSpeed",),
                          Text("Book you bus!"),
                        ],
                      ),
                      Icon(Icons.notifications)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
