//
//  PracticeView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 09/02/2022.
//

import SwiftUI

struct IntroQuizView: View {
    
    @StateObject var quizViewModel = QuizViewModel() //StateObject - viewModel will change and redraw the view
    
    //https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject
    @State var userPressedBtnIndex: Int? = nil //Use index to find the answer in the array answerChoices[index]
    
    //https://www.simpleswiftguide.com/how-to-build-linear-progress-bar-in-swiftui/
    @State var progressValue: Float = 0.0 //progress bar tracking
    @State var lastQuestion = false//
    @State var finished = false
    @State private var activeCheck = false
    @State var submitText = "Submit answer"
    
    @State var alert = false
    @State var error = ""
    @State var title = ""
    
    @Binding var score: Int
    
    var body: some View {
        
        ZStack {
            Color(.sRGB, red: 0.4, green: 0.7, blue: 0.9, opacity: 0.3)
                .ignoresSafeArea()
            
            if !finished {
                quizContent
            } else {
                resultScreen
            }
        } //zStackEnd
    }
    
    var resultScreen: some View {
        VStack{
            
            Text("Quiz finished!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding([.leading, .bottom, .trailing])
            
            //let percentScore = ((score * 100) / (score + (quizViewModel.quiz.questionCount - score)))
            VStack {
                Text("Your score: \(((score * 100) / (score + (quizViewModel.quiz.questionCount - score))))%")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Text("Overall: \(score)/\(quizViewModel.quiz.questionCount)")
                    .font(.title2)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Divider()
                
                Text("Correct answers: \(score)  ✅ ")
                    .font(.title2)
                    .foregroundColor(.black)
                
                Text("Wrong answers: \(quizViewModel.quiz.questionCount - score)  ❌")
                    .font(.title2)
                    .foregroundColor(.black)
                
                if score == 10 {
                    ScoreText(text: "Excellent! You got all questions right!", message: "Try another quiz!")
                    
                }
                else if score == 6 {
                    ScoreText(text: "Well done!", message: "Try another quiz!")
                    
                } else {
                    ScoreText(text: "", message: "Suggestion: \nAttempt quiz again to practice your mistakes!")
                }
            }
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
            .background(Color(.white))
            .cornerRadius(23)
            .frame(width: .infinity, alignment: .center)
            .padding(.horizontal, 15)
            .shadow(radius: 6)
            Image("3d-flame-285")
                .resizable()
                .aspectRatio(contentMode:.fit)
            Spacer()
        }
    }
    
    var quizContent: some View { //MAIN CONTENT ON PAGE
        VStack {
            HStack {
                Text("Basics Quiz") // category name at the top
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding([.leading, .bottom, .trailing])
   
                Text(quizViewModel.currentQuizQuestionNumber) // track current question
                    .font(.title2)
                    .padding([.leading, .bottom, .trailing])
            }
            HStack {
                ProgressBar(value: $progressValue).frame(height: 20)
                
                Spacer()
                
                Text(" \(Image(systemName: "checkmark"))\(score)")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 3)
                    .background(Color.green)
                    .cornerRadius(50)
            }
            .padding(.horizontal, 50)

            Divider()
            Spacer()
            
            VStack {
                Text(quizViewModel.questionText) // Question text in the middle of the screen
                
                if quizViewModel.questionImage != "" {
                    Image(quizViewModel.questionImage)
                        .resizable()
                        .scaledToFit()
                }
            }
            .padding(.horizontal)
            .font(.title2)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 360.0, minHeight: 200.0)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(15)
            .padding(.all)
            
            Group {
                Spacer()
                Spacer()
                Divider()
            }
            
            ScrollView (.vertical, showsIndicators: false) {
                VStack { //stack for the answers at the bottom
                    //For each answer index in array answerChoices - start at 0 go to max size
                    ForEach(quizViewModel.answerNumberRange) { index in
                        //make a new button for all the different answers to each button ranging from answer 0 to last answer in array ..<array count
                        AnswerButton(text:quizViewModel.answerButtonText(for: index)){
                            userPressedBtnIndex = index //action when clicked - the user selection = to the index it selected
                        }.background(colorOnAnswer(at: index))
                            .cornerRadius(7)
                        //.overlay(RoundedRectangle(cornerRadius:7).stroke(.black, lineWidth: 0))
                    }
                } .padding(.bottom)//HStackEnd
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 19)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 19)
            
            HStack {
                NextQuestionPopUp(popUpText: submitText) {
                    if quizViewModel.quiz.onCurrentQuestionIndex == 0 {
                        score = 0
                    }

                    if quizViewModel.quiz.quizOver == true {
                        finished = true
                    }
                    
                    if quizViewModel.checkAnswer(for: userPressedBtnIndex) == true {
                        if !finished {
                            score += 1
                            userPressedBtnIndex = nil
                        } else {
                            score += 0
                            userPressedBtnIndex = nil
                        }
                    }
                    
                    if lastQuestion {
                        submitText = "Finish quiz"
                    }
                    
                    self.progressValue += 0.1
                    quizViewModel.moveToNextQuestion()
                    
                    if quizViewModel.lastQuizQuestion == true {
                        lastQuestion = true
                    }
                } //display the next question button
                .cornerRadius(15)
                .padding(.leading)
                .padding(.trailing, 4)
            }.padding(.trailing, 15)
        }
    }
    
    func colorOnAnswer(at buttonIndex: Int) -> Color{
        guard  let userTapBtnIndex = userPressedBtnIndex, userTapBtnIndex == buttonIndex else { //unless there is a user tap on btn and unless the user tap is at a buttonIndex[0..<answerChoice.count] - stay the same color
            
            return .white
        }
        
        if userTapBtnIndex  == quizViewModel.correctAnswerIndex {
            return .blue //can be made to green for immediate result
        }
        else {
            return .blue
        }
    }
}





//struct SampleQuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroQuizView(score: score)
//    }
//}
