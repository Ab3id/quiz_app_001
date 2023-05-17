import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizApp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const QuizHome(),
    );
  }
}

class QuizHome extends StatefulWidget {
  const QuizHome({super.key});

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  var questions = [
    {
      'qn': 'Is magufuli dead ?',
      'answer': true,
    },
    {
      'qn': 'Is smart watch necessary ?',
      'answer': false,
    },
    {
      'qn': 'Is google a search engine ?',
      'answer': true,
    },
  ];

  Color answerBorderColor = Colors.white;

  bool isCorrect = false;
  bool start = false;

  int score = 0;

  int currentQn = 0;

  void _answer(bool isTrue, int qnIndex) {
    start = true;
    var theQn = questions[qnIndex];

    isCorrect = theQn['answer'] == isTrue;

    if (isCorrect) {
      score += 10;
    }

    _nextQn();
  }

  void _nextQn() {
    print(
        'test ${questions.length} --- $currentQn --- ${currentQn < questions.length}');

    if (currentQn < questions.length - 1) {
      currentQn++;
    }

    print('test ${questions.length} --- $currentQn');

    setState(() {
      //answerBorderColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizApp'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white54),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Your Score: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      '${score}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text('${start ? isCorrect : ''}'),
              const SizedBox(
                height: 200,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: answerBorderColor)),
                child: Text(
                  '${questions.elementAt(currentQn)['qn']}',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 50,
                      onPressed: () {
                        _answer(false, currentQn);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      )),
                  IconButton(
                      iconSize: 50,
                      onPressed: () {
                        _answer(true, currentQn);
                      },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
