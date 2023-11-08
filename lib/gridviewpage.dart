// Implement an application which works as follows

// 1. Splash Screen
// 2. enter numbers m & n which indirectly indicates m rows and n column of a 2D grid.
// 3. the user should enter alphabets such that one alphabet occupies one position in the grid. Here we will need m*n number of alphabets.
// 4. grid creation done
// 5. Display the grid. Now The user can provide a text which needs to be searched in the grid.
// 6. If the text is available in the grid, then those alphabets should be highlighted if the text in the grid is readable in left to right direction (east), or top to bottom direction (south) or diagonal (south-east).
// 7. User can change the text provided in step 5 and check for the occurance of the word in the grid.

// Note -
// 1. At anytime, the user should be able to reset the setup and the application starts again from step 2.
// 2. APK and the Source code should be shared via dropbox, google drive etc... to hr@mobigic.com

import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  final int valueM;
  final int valueN;

  const GridScreen({super.key, required this.valueM, required this.valueN});

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  late int m = widget.valueM; // Number of rows
  late int n = widget.valueN; // Number of columns

  List<String> letters = [];
  List<bool> shouldHighlight = [];

  splittext(String letter) {
    letters = letter.trim().split("");
    shouldHighlight = List.filled(letters.length, false);
  }

  final fieldText = TextEditingController();
  final searchtext = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  bool isAlreadyShown = false;

  String resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interview App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              controller: fieldText,
              decoration: InputDecoration(
                labelText: 'Enter Text',
                hintText: 'Type something here',
                prefixIcon: Icon(Icons.text_fields),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    clearText();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                int product = m * n;
                String enteredText = fieldText.text;

                if (enteredText.length == product) {
                  setState(() {
                    splittext(fieldText.text);
                    isAlreadyShown = true;
                    resultMessage = 'Correct! $m x $n equals $product.';
                  });
                } else {
                  setState(() {
                    resultMessage = 'Enter $product alphabets only';
                  });
                }
              },
              child: const Text("Submit Button"),
            ),
            Text(resultMessage),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: searchtext,
              decoration: InputDecoration(
                labelText: 'Enter Text to Search',
                hintText: 'Type something here',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    clearText();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  shouldHighlight = List.filled(letters.length, false);

                  String searchText = searchtext.text.toLowerCase();
                  for (int i = 0; i < letters.length; i++) {
                    if (letters[i].toLowerCase() == searchText) {
                      shouldHighlight[i] = true;
                    }
                  }
                });
              },
              child: const Text(
                "Search",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
                child: isAlreadyShown == true
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: n,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color:
                                  shouldHighlight[index] ? Colors.yellow : null,
                            ),
                            child: Center(
                              child: Text(letters[index]),
                            ),
                          );
                        },
                        itemCount: m * n,
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}
