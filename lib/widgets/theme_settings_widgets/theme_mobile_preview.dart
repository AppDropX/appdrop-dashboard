import 'package:flutter/material.dart';

import '../../core/enums/theme_settings.dart';

class MobilePreview extends StatelessWidget {
  final ThemeSection section;

  const MobilePreview({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Live Preview",
            style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 20)),
        const SizedBox(height: 12),
        Container(
          width: 260,
          height: 520,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36),
            border: Border.all(width: 5),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 11),
              Container(
                height: 20,
                width: 90,
                decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.circular(15)),),
              Spacer(),
               Center(
                child: Text(
                  "${section.name}",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const Spacer(),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home, color: Colors.orange),
                    Icon(Icons.grid_view),
                    Icon(Icons.favorite_border),
                    Icon(Icons.shopping_cart_outlined),
                    Icon(Icons.person_outline),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}







/*import 'package:flutter/material.dart';

class MobilePreview extends StatelessWidget {
  const MobilePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Live Preview",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          Container(
            width: 260,
            height: 520,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 10))
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text("Store",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.home, color: Colors.orange),
                      Icon(Icons.grid_view),
                      Icon(Icons.favorite_border),
                      Icon(Icons.shopping_cart_outlined),
                      Icon(Icons.person_outline),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
