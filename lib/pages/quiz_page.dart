import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/quiz_mind.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  QuizMind quizMind = QuizMind();
  int questionNumber = 0;
  bool ?correctAnswer = true;
  List<Widget> scoreKeeper =  [];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            body:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration:  BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(14.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("assets/images/question_mark.jpg",),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 20,),
                      Text("${quizMind.questionBank[0].questionText} ?",
                        style: GoogleFonts.lato(
                        fontSize: 25,
                      ),),
                      const SizedBox(height: 30,),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.redAccent ,
                            borderRadius: BorderRadius.circular(14.0)
                          ),
                          child: Text("True",style: GoogleFonts.lato(
                            fontSize: 25,
                          ),),
                        ),
                        onTap: (){
                          setState(() {
                            correctAnswer = quizMind.questionBank[questionNumber].questionAnswer;
                            scoreKeeper.add(const Icon(Icons.check));
                            if (correctAnswer == true){
                              debugPrint("Correct");
                            }
                            else{
                              debugPrint("InCorrect");
                            }
                            questionNumber = (questionNumber + 1) % quizMind.questionBank.length;
                          });
                        },
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color:Colors.redAccent ,
                              borderRadius: BorderRadius.circular(14.0)
                          ),
                          child: Text("False",style: GoogleFonts.lato(
                            fontSize: 25,
                          ),),
                        ),
                        onTap: (){
                          setState(() {
                            correctAnswer = quizMind.questionBank[questionNumber].questionAnswer;
                            scoreKeeper.add(const Icon(Icons.close));
                            if (correctAnswer == false){
                              debugPrint("Correct");
                            }
                            else{
                              debugPrint("InCorrect");
                            }
                            questionNumber = (questionNumber + 1) % quizMind.questionBank.length;
                          });
                        },
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children:scoreKeeper
                      )
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
