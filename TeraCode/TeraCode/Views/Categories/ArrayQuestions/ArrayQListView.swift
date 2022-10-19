//
//  ArrayQuestionsView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 20/04/2022.
//

import SwiftUI

struct ArrayQListView: View {
    @State var progressValue: Float = 0.0
    @State var circularProgress: Float = 0.0
    
    //https://developer.apple.com/documentation/swiftui/binding
    @State var q1Score: Int
    @State var q2Score: Int
    @State var q3Score: Int
    @State var q4Score: Int
    @State var q5Score: Int
    @State var q6Score: Int
    @State var q7Score: Int
    @State var quiz1Score: Int
    
    init(q1Score: Int, q2Score: Int, q3Score: Int, q4Score: Int, q5Score: Int, q6Score: Int,q7Score: Int, quiz1Score: Int) {
        self.q1Score = q1Score
        self.q2Score = q2Score
        self.q3Score = q3Score
        self.q4Score = q4Score
        self.q5Score = q5Score
        self.q6Score = q6Score
        self.q7Score = q7Score
        self.quiz1Score = quiz1Score
    }
    
    init() {
        self.q1Score = UserDefaults.standard.integer(forKey: "Unit2Q1")
        self.q2Score = UserDefaults.standard.integer(forKey: "Unit2Q2")
        self.q3Score = UserDefaults.standard.integer(forKey: "Unit2Q3")
        self.q4Score = UserDefaults.standard.integer(forKey: "Unit2Q4")
        self.q5Score = UserDefaults.standard.integer(forKey: "Unit2Q5")
        self.q6Score = UserDefaults.standard.integer(forKey: "Unit2Q6")
        self.q7Score = UserDefaults.standard.integer(forKey: "Unit2Q7")
        
        self.quiz1Score = UserDefaults.standard.integer(forKey: "Unit2Quiz1")
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    Group {
                        VStack {
                            VStack {
                                HStack { //PROGRESS BAR
                                    VStack {
                                        Text("Arrays")
                                            .font(.title)
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color.black)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .padding(.bottom,25)
                                        
                                        Text("UNIT 2")
                                            .font(.headline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.black)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .padding(.bottom,-19)
                                            .offset(y: -30)
                                        
                                        Text("Total Category Progress")
                                            .font(.headline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.black)
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .padding(.bottom,-19)
                                            .offset(y: -20)
                                    }
                                    CircularProgressPie(value: $circularProgress)
                                }// HStack END
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .padding(.top, 7)
                                .padding(.horizontal, 18)
                                
                                ProgressBar(value: $circularProgress)
                                    .padding(.horizontal, 18)
                                    .padding(.bottom, 5)
                                
                                
                            }
                        }
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                        .background(Color(red: 0.16, green: 0.3417, blue: 0.42))
                        .cornerRadius(23)
                        .frame(width: .infinity, alignment: .center)
                        .padding(.horizontal, 20)
                        .shadow(radius: 6)
                    }
                    
                    Divider()
                    
                    HStack { //PROGRESS BAR
                        Text("Pick Question".uppercased())
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                        
                        Text("Progress".uppercased())
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(.white)
                    } // HStack END
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 30)
                    .padding(.top)
                    
                    Group {
                        
                        QuestionFrame(questionName: "Question 1", status: String("\(q1Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[0], score: $q1Score)))
                            .padding(.bottom, 17)
                        
                        QuestionFrame(questionName: "Question 2", status: String("\(q2Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[1], score: $q2Score)))
                            .padding(.bottom, 17)
                        
                        QuestionFrame(questionName: "Question 3", status: String("\(q3Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[2], score: $q3Score)))
                            .padding(.bottom, 17)
                        
                        QuestionFrame(questionName: "Question 4", status: String("\(q4Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[3], score: $q4Score)))
                            .padding(.bottom, 17)
                        
                        QuestionFrame(questionName: "Question 5", status: String("\(q5Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[4], score: $q5Score)))
                            .padding(.bottom, 17)
                        
                        QuestionFrame(questionName: "Question 6", status: String("\(q6Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[5], score: $q6Score)))
                            .padding(.bottom, 17)
                        
                        QuestionFrame(questionName: "Question 7", status: String("\(q7Score)%"), view: AnyView(ArraysSingleQView(question: Question.ArrayQuestions[6], score: $q7Score)))
                            .padding(.bottom, 17)
                        
                        Divider()
                    }
                    
                    HStack { //PROGRESS BAR
                        Text("Practice Test")
                            .font(.title2)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                            .padding(.horizontal)
                    } // HStack END
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                    
                    ProgressBar(value: $progressValue)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    
                    QuizFrame(questionName: "Quiz", status: String("\(quiz1Score*100/7)%"), lastScoreText: "Last score", view: AnyView(ArraysQuizView(score: $quiz1Score)))
                        .padding(.bottom, 17)
                    
                    Spacer() //bring all to top
                } //VStack
                .onAppear {
                    let database = UserDefaults.standard
                    let sync = database.synchronize() // SYNC THE INFO
                    checkCirclePercent()
                    // SYNC THE INFO
                    if sync {
                        print("userdefaults - sync done")
                    } else {
                        print("userdefaults - failed to sync")
                    }
                    
                    // SAVE necessory information using UserDefaults
                    database.set(q1Score, forKey: "Unit2Q1")
                    database.set(q2Score, forKey: "Unit2Q2")
                    database.set(q3Score, forKey: "Unit2Q3")
                    database.set(q4Score, forKey: "Unit2Q4")
                    database.set(q5Score, forKey: "Unit2Q5")
                    database.set(q6Score, forKey: "Unit2Q6")
                    database.set(q7Score, forKey: "Unit2Q7")
                    
                    database.set(quiz1Score, forKey: "Unit2Quiz1")
                    
                    database.set(circularProgress, forKey: "Progress%")
                }
                .navigationBarTitle("Questions")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func checkCirclePercent(){
        let arrayTest = [q1Score, q2Score, q3Score, q4Score, q5Score, q6Score, q7Score]
        self.circularProgress = Float(arrayTest.reduce(0,+)*10/1000)/7.0 //add all elements in array
        print(circularProgress)
    }
}

struct ArrayQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayQListView()
    }
}
