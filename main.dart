import 'package:flutter/material.dart';
import 'package:quiz/Questions.dart';
void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: QuizApp(),
      ),
    ),
  )
  );}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  int questionNumber = 0;
  int currentScore =0;
  Questions questions = Questions();

  void updateQuestionNumber(){
    setState(() {
      questionNumber = questionNumber+1;
      print('$questionNumber');
    });
  }

  void updateCurrentScore(bool choice , int question_number){
    if(questions.questionBank.length==question_number){
      print("end of questions");
    }
    else{
      if(questions.questionBank[question_number].answer==choice){
        setState(() {
          currentScore++;
        });
      }
    }
  }
  bool checkQuestionNumber(int questionNumber){
    return questionNumber< questions.questionBank.length? true:false;
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(checkQuestionNumber(questionNumber)?questions.questionBank[questionNumber].questionText.toString():"end",
          style: TextStyle(fontSize: 40),),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(onPressed: (){
          setState(() {
            print('true pressed');
            if(questionNumber==questions.questionBank.length){
              print("end of questions");
    }
            else{
              updateCurrentScore(true, questionNumber);
              updateQuestionNumber();
    }
          });
    }, child: Text("True"),

        ),
        SizedBox(height: 20.0),
        ElevatedButton(onPressed: (){
          setState(() {
            print('false pressed');
            if(questionNumber==questions.questionBank.length){
              print("end of questions");
            }
            else{
              updateCurrentScore(false, questionNumber);
              updateQuestionNumber();
            }
          });
        }, child: Text("False"),

        ),
        SizedBox(height: 100.0),
        SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Text("you scored: ", style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child:
            Text(
              '${currentScore}',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),


      ],
    );
  }
}
