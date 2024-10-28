import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/chat_data.dart';
import 'package:whatsapp_clone/widgets/custom_bottom_navigation_bar.dart';
import 'package:whatsapp_clone/widgets/custom_chip_button.dart';

class WhatsappChatsScreen extends StatefulWidget {
  const WhatsappChatsScreen({super.key});

  @override
  State<WhatsappChatsScreen> createState() => _WhatsappChatsScreenState();
}

class _WhatsappChatsScreenState extends State<WhatsappChatsScreen> {
  int selectedChipIndex = 0;
  int selectedIndex = 0;
  final List<String> chipLabels = [
    'All',
    'Unread',
    'Favorites',
    'Groups',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            const Text(
              "WhatsApp",
              style: TextStyle(
                  color: Color(0xff39AC70),
                  fontFamily: "Inter SemiBold",
                  fontSize: 23),
            ),
            const Spacer(flex: 10), // Dynamically fills space
            Icon(
              Icons.camera_alt_outlined,
              size: screenWidth * 0.08,
            ),
            const Spacer(), // Dynamically fills space
            Icon(
              Icons.more_vert,
              size: screenWidth * 0.08,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenHeight * 0.015),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F5F3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.025,
                            right: screenWidth *
                                0.025), // Adjust padding as needed
                        child: Image.asset(
                          'assets/meta.png',
                          height: screenHeight * 0.03,
                          width: screenHeight * 0.03,
                        ),
                      ),
                      hintText: "Ask Meta AI or Search",
                      hintStyle: const TextStyle(color: Color(0xff8C8F92)),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20), // Padding inside the TextField
                    ),
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(chipLabels.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left:
                          index == 0 ? screenWidth * 0.04 : screenWidth * 0.015,
                    ),
                    child: customChipButton(
                        index, chipLabels[index], selectedChipIndex,
                        (onSelectedIndex) {
                      setState(() {
                        selectedChipIndex = onSelectedIndex!;
                      });
                    }),
                  );
                }),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04), // Add horizontal padding
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(chats[index]['avatar']!),
                        radius: 25,
                      ),
                      title: Text(
                        chats[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(chats[index]['message']!),
                      trailing: Text(chats[index]['time']!),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 100,
            right: 12,
            child: SizedBox(
              width: 45,
              height: 45,
              child: FloatingActionButton(
                backgroundColor: const Color(0xfff6f5f3),
                onPressed: () {},
                child: Image.asset(
                  'assets/meta.png',
                  height: screenHeight * 0.03,
                  width: screenHeight * 0.03,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 5,
            child: SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                backgroundColor: const Color(0xff1dab61),
                onPressed: () {},
                child: Image.asset(
                  'assets/new_chat.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: customBottomNavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
