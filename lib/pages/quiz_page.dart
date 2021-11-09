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
  bool ?correctAnswer = true;
  List<Widget> scoreKeeper =  [];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white38,
            body:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10,right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration:  BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue,
                          Colors.grey
                        ]
                    ),
                    borderRadius: BorderRadius.circular(14.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Expanded(child: Container()),
                      Text("Quiz",
                        style: GoogleFonts.lato(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      const SizedBox(height: 30,),
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("assets/images/question_mark.jpg",),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        margin: const EdgeInsets.only(left: 20,right: 20),
                        alignment: Alignment.center,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(12.0, 12.0)
                            )
                          ]
                        ),
                        child: Text("\"${quizMind.getQuestionText()}\"",
                          style: GoogleFonts.lato(
                          fontSize: 25,
                            fontStyle: FontStyle.italic
                        ),),
                      ),
                      const SizedBox(height: 50,),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 100,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Colors.deepOrange,
                              Colors.white
                            ]) ,
                            borderRadius: BorderRadius.circular(14.0)
                          ),
                          child: Text("True",style: GoogleFonts.lato(
                            fontSize: 25,
                          ),),
                        ),
                        onTap: (){
                          setState(() {
                            correctAnswer = quizMind.getCorrectAnswer();
                            scoreKeeper.add(const Icon(Icons.check));
                            if (correctAnswer == true){
                              debugPrint("Correct");
                            }
                            else{
                              debugPrint("InCorrect");
                            }
                            quizMind.nextQuestionNumber();
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
                              gradient: const LinearGradient(colors: [
                                Colors.deepOrange,
                                Colors.white,
                              ]),
                              borderRadius: BorderRadius.circular(14.0)
                          ),
                          child: Text("False",style: GoogleFonts.lato(
                            fontSize: 25,
                          ),),
                        ),
                        onTap: (){
                          setState(() {
                            correctAnswer = quizMind.getCorrectAnswer();
                            scoreKeeper.add(const Icon(Icons.close));
                            if (correctAnswer == false){
                              debugPrint("Correct");
                            }
                            else{
                              debugPrint("InCorrect");
                            }
                            quizMind.nextQuestionNumber();
                          });
                        },
                      ),
                      Expanded(child: Container()),
                      const SizedBox(height: 20,),
                      Row(
                        children:scoreKeeper
                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
