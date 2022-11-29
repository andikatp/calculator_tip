import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    required this.text,
    required this.fun,
  }) : super(key: key);
  final String text;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
         return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.purple.shade100,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            highlightColor: Colors.purple,
            onTap: fun,
            child: SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 17, color: Colors.purple),
                  ),
                )),
          ),
        ),
      );
   
  }
}
