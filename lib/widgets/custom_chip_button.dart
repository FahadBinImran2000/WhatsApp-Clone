import 'package:flutter/material.dart';

ChoiceChip customChipButton(int index, String text, int? selectedChipIndex,
    Function(int?) onSelectedIndex) {
  return ChoiceChip(
    label: Text(
      text,
      style: TextStyle(
        color: selectedChipIndex == index
            ? const Color(0xFF448762)
            : const Color(0xFF8C8F92),
      ),
    ),
    selected: selectedChipIndex == index,
    selectedColor: const Color(0xFFd7fed2),
    backgroundColor: const Color(0xFFF6F5F3),
    onSelected: (bool selected) {
      onSelectedIndex(selected ? index : null);
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: selectedChipIndex == index
          ? const BorderSide(color: Colors.transparent)
          : const BorderSide(color: Colors.transparent),
    ),
    showCheckmark: false,
  );
}
