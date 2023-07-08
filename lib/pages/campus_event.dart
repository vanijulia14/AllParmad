import 'package:allparmad/data/assets_list.dart';
import 'package:allparmad/pages/create_event.dart';
import 'package:flutter/material.dart';

import 'history_view.dart';

class CampusEventFeature extends StatefulWidget {
  const CampusEventFeature({super.key});

  @override
  State<CampusEventFeature> createState() => CampusEventFeatureState();
}

class CampusEventFeatureState extends State<CampusEventFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 30,
            ),
            const Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bookmark'),
                  duration: Duration(milliseconds: 600),
                ),
              );
            },
            icon: const Icon(Icons.bookmark),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryView()
                ),
              );
            },
            icon: const Icon(Icons.history),
            iconSize: 30,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari "Belajar Bareng"',
                  filled: true,
                  fillColor: const Color(0xFFD9D9D9),
                  hintStyle: const TextStyle(
                    color: Color(0xFF6B6B6B),
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Highlights Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(50),
                        onTap: () {},
                        child: SizedBox(
                          width: 300,
                        )
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: iconList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xFF2178FA),
                      child: InkWell(
                        splashColor: Colors.white.withAlpha(50),
                        onTap: () {},
                        child: SizedBox(
                          width: 120,
                          child: Container(
                            margin: const EdgeInsets.all(25),
                            child: Image.asset(
                              iconList[index]
                            ),
                          )
                        )
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Nearest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(50),
                        onTap: () {},
                        child: const SizedBox(
                          width: 300,
                        )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text('Create Event'),
          backgroundColor: const Color(0xFF2178FA),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateEvent()
              ),
            );
          },
        ),
      )
    );
  }
}