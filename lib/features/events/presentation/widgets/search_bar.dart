import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.controller,
    required this.focusNode,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 8,
              ),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      controller: controller,
                      focusNode: focusNode,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: Colors.white,
                      decoration: null,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.clear,
                    child: const Icon(
                      CupertinoIcons.clear_thick_circled,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
      ],
    );
  }
}
