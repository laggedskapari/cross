import 'package:flutter/material.dart';

class UtilityBelt extends StatefulWidget {

  const UtilityBelt({super.key, required this.toggleNewTask, required this.isNewTaskVisible});

  final void Function() toggleNewTask;
  final bool isNewTaskVisible;

  @override
  State<UtilityBelt> createState() => _UtilityBeltState();
}

class _UtilityBeltState extends State<UtilityBelt> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '//32.879 % SUCCESS RATE',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '12',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '//COMPLETED',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '15',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 202, 71, 84),
                            fontFamily: 'JetBrainsMono',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '//ABANDONED',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: widget.toggleNewTask,
            icon: Icon(
              widget.isNewTaskVisible ? Icons.close : Icons.add,
              size: 25,
              color: const Color.fromARGB(255, 100, 102, 105),
            ),
          ),
        ],
      ),
    );
  }
}
