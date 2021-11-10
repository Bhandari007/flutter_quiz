import 'package:flutter_quiz_app/models/question_bank.dart';
import 'package:flutter/material.dart';

class QuizMind {
  int _questionNumber = 0;
  final List <QuestionBank> _questionBank = [
    QuestionBank(q: "All man are mortal.",a:true),
    QuestionBank(q:"Brad Pitt is a woman.",a:false),
    QuestionBank(q:"Brad Pitt is mortal.",a:true),
    QuestionBank(q:"Brad Pitt is not mortal.",a:false),
  ];
  int questionLength(){
    return _questionBank.length;
  }
  bool isQuestionFinished(){
    if(_questionNumber < _questionBank.length-1){
      debugPrint(_questionNumber.toString());
      return false ;
    }
    else{
      return true;
    }
  }

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