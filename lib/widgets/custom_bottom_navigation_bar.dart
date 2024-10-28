import 'package:flutter/material.dart';

Widget customBottomNavigationBar({
  required int selectedIndex,
  required ValueChanged<int> onDestinationSelected,
}) {
  return NavigationBarTheme(
    data: NavigationBarThemeData(
      indicatorColor: const Color(0xffd8fed2),
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
                color: Colors.black,
                fontFamily: "Inter SemiBold",
                fontSize: 14,
                fontWeight: FontWeight.bold);
          }
          return const TextStyle(
            color: Color(0xff343A3E),
            fontFamily: "Inter SemiBold",
            fontSize: 14,
          );
        },
      ),
    ),
    child: NavigationBar(
      backgroundColor: Colors.white,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Image(
            image:
                AssetImage('assets/chats.png'), // Replace with your asset path
            width: 24,
            height: 24,
          ),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: Image(
            image: AssetImage(
                'assets/updates.png'), // Replace with your asset path for updates
            width: 24,
            height: 24,
          ),
          label: 'Updates',
        ),
        NavigationDestination(
          icon: Image(
            image: AssetImage(
                'assets/communities.png'), // Replace with your asset path for communities
            width: 30,
            height: 30,
          ),
          label: 'Communities',
        ),
        NavigationDestination(
          icon: Image(
            image: AssetImage(
                'assets/calls.png'), // Replace with your asset path for calls
            width: 24,
            height: 24,
          ),
          label: 'Calls',
        ),
      ],
    ),
  );
}
