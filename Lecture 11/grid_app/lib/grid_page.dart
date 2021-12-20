import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class GridPage extends StatefulWidget {
  GridPage({Key? key}) : super(key: key);

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  List<String> list = [
    'AC',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '^',
    '0',
    '.',
    '='
  ];

  String exp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Grid Page',
          style: GoogleFonts.raleway(
            color: Colors.green,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black,
                  content: Text(
                    'Developed by Ikramul Hasan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Pulse(
                child: Text(
                  exp,
                  style: GoogleFonts.orbitron(
                    fontSize: 32,
                  ),
                ),
              ),
              Divider(),
              GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return FadeInLeft(
                    delay: Duration(milliseconds: index * 100),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        setState(() {
                          if (list[index] == 'AC') {
                            exp = '';
                          } else if (list[index] == 'DEL') {
                            exp = exp.substring(0, exp.length - 1);
                          } else if (list[index] == '=') {
                            try {
                              Parser p = Parser();
                              Expression parsedExp = p.parse(exp);
                              ContextModel cm = ContextModel();
                              double eval =
                                  parsedExp.evaluate(EvaluationType.REAL, cm);
                              exp = eval.toString();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    'Invalid math expression. Resetting...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                              exp = '';
                            }
                          } else if (exp.length != 0 &&
                              exp[exp.length - 1] == '.' &&
                              list[index] == '.') {
                            //
                          } else {
                            exp = exp + list[index];
                          }
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            list[index].toString(),
                            style: GoogleFonts.orbitron(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 16 / 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
