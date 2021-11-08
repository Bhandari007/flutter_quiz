import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> questions = [
    "All man are mortal",
    "Muskan is a man",
    "Hence, Muskan is mortal"
  ];
  int questionNumber = 0;
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
                      Text("${questions[questionNumber]} ?",
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
                            questionNumber = (questionNumber + 1) % questions.length;
                            scoreKeeper.add(const Icon(Icons.check));
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
                            scoreKeeper.add(const Icon(Icons.close));
                            questionNumber = (questionNumber + 1) % questions.length;
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
