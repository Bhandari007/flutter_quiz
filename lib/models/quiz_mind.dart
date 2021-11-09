import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question_bank.dart';

class QuizMind {
  int _questionNumber = 0;
  final List <QuestionBank> _questionBank = [
    QuestionBank(q: "All man are mortal.",a:true),
    QuestionBank(q:"Brad Pitt is a man.",a:true),
    QuestionBank(q:"Brad Pitt is not mortal.",a:false),
    QuestionBank(q:"Brad Pitt is mortal.",a:true),
  ];

  void nextQuestionNumber(){
    if (_questionNumber < _questionBank.length-1){
      _questionNumber ++;
    }
    else{
      debugPrint("Question Finished");
    }
  }
  String? getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool? getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
}