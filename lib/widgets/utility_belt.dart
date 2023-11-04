import 'package:flutter/material.dart';

class UtilityBelt extends StatefulWidget {
  const UtilityBelt({super.key});

  @override
  State<UtilityBelt> createState() => _UtilityBeltState();
}

class _UtilityBeltState extends State<UtilityBelt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('//32 % SUCCESS RATE', style: Theme.of(context).textTheme.labelLarge,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('12', style: Theme.of(context).textTheme.bodyLarge,),
                      Text('//COMPLETED', style: Theme.of(context).textTheme.labelLarge,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('15', style: Theme.of(context).textTheme.bodyLarge,),
                      Text('//ABANDONED', style: Theme.of(context).textTheme.labelLarge,),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
