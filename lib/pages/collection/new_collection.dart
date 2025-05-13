import 'package:boardgame_collector/components/inputs/my_textinput.dart';
import 'package:flutter/material.dart';

class NewCollection extends StatefulWidget {
  const NewCollection({super.key});

  @override
  State<NewCollection> createState() => _NewCollectionState();
}

class _NewCollectionState extends State<NewCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Collection')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 21, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            spacing: 21,
            children: [
              MyTextInput(
                label: 'Title',
                textEditingController: TextEditingController(),
              ),
              MyTextInput(
                label: 'Description',
                textBox: true,
                textEditingController: TextEditingController(),
              ),
              Row(
                children: [
                  Text(
                    'Board Games',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              /*
                Add card with a auto-complete form field that fetches the board
                game information
              */
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Placeholder(fallbackHeight: 120),
                    ),
              ),

              /*
                Miniatures will come in a future implementation
              */
              // Row(
              //   children: [
              //     Text(
              //       'Miniatures',
              //       style: Theme.of(context).textTheme.bodyLarge,
              //     ),
              //   ],
              // ),
              // ListView.builder(
              //   itemCount: 2,
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemBuilder:
              //       (context, index) => Padding(
              //         padding: EdgeInsets.symmetric(vertical: 6),
              //         child: Placeholder(fallbackHeight: 120),
              //       ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
