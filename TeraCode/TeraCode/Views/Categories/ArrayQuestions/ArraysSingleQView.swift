//
//  ArraysSingleQView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 19/04/2022.
//

import SwiftUI

struct ArraysSingleQView: View {
    
    @State var resultAlert = false
    @State var message = ""
    @State var title = ""
    
    @State var show = false
    @State var progressValue: Float = 0.1
    
    let question: Question
    
    @State var userPressedBtnIndex: Int? = nil
    
    //https://developer.apple.com/documentation/swiftui/binding
    @Binding var score: Int

    var body: some View {
        
        ZStack {
            Color(.sRGB, red: 0.4, green: 0.7, blue: 0.9, opacity: 0.3)
                .ignoresSafeArea()
            
            questionContent //call the main page content
                .padding(.bottom) //vStackEnd
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Hint") {
                        show.toggle()
                    }
                }
            
            if resultAlert { //if true, display the message view with $error text
                QuestionResultView(resultAlert: $resultAlert, message: $message, title:title)
            }
        }
        //https://github.com/exyte/PopupView
        .popup(isPresented: $show, type: .toast) {
            ArrayHintView()
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.6, green: 0.8, blue: 0.95))
                .cornerRadius(15)
        }
        //        .sheet(isPresented: $show, content: {
        //            QuestionSheetView()
        //        })
        //zStackEnd
    }
    
    var questionContent: some View {
        VStack {
            Group {
                Text("Arrays") // category name at the top
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding([.leading, .bottom, .trailing])

                Spacer()
                Spacer()
                
                VStack {
                    Text(question.qText)
                        .font(.title3)
                        .padding()
                    
                    if question.codeSnippetImage != "" {
                        Image(question.codeSnippetImage!)
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
                .font(.title2)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 360.0, minHeight: 200.0)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(15)
                .padding(.all)
  
                Spacer()
            }
            Group {
                ScrollView (.horizontal, showsIndicators: true){
                    let gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 59), count: 2)
                    
                    //                    let rows = [GridItem(.fixed(60)),
                    //                                GridItem(.fixed(56))]
                    
                    // https://www.youtube.com/watch?v=IrK7xV-sDlo
                    Divider()
                    Spacer()
                    
                    LazyHGrid(rows:gridItemLayout, alignment:.center){
                        
                        //https://www.hackingwithswift.com/articles/76/how-to-loop-over-arrays - for .count or .indices
                        //https://stackoverflow.com/questions/57244713/get-index-in-foreach-in-swiftui
                        
                        //shorturl.at/aewJX TutorialKart array examples
                        //https://developer.apple.com/forums/thread/118361 .count and .indices
                        //ForEach(question.answerChoices.indices) SAME AS
                        //For each answer index in array answerChoices - start at 0 go to max size
                    //https://www.hackingwithswift.com/books/ios-swiftui/showing-the-players-score-with-an-alert
                        ForEach(0..<question.answerChoices.count) { index in
                            //make a new button for all the different answers to each button ranging from answer 0 to last answer in array ..<array count
                            
                            AnswerButton(text: question.answerChoices[index])
                            {//action when clicked - the user selection = to the index it selected
                                userPressedBtnIndex = index
                                    
                            }
                            .background(colorOnAnswer(at: index))
                            .cornerRadius(7)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 55)
                }
                Divider()
            }

            NextQuestionPopUp(popUpText: "Submit answer") { print("Next question")
                if userPressedBtnIndex == question.correctAnswerIndex {
                    title = "Correct"
                    message = "You got the right answer!"
                    score = 100
                    //questionDone = true
                    resultAlert.toggle()
                } else {
                    title = "Wrong"
                    message = "You selected the wrong answer"
                    score = 0
                    resultAlert.toggle()
                }
            }
            .cornerRadius(15)
            .padding(.all)
            .disabled(userPressedBtnIndex == nil)
        }
    }
    
    func colorOnAnswer(at buttonIndex: Int) -> Color {
        //https://www.appypie.com/swift-guard-let-statement-how-to
        guard  let userTappedButton = userPressedBtnIndex, userTappedButton == buttonIndex else {
            return .white
        } //unless there is a user tap and unless the tap is at a buttonIndex stay the same color
        
        if (userTappedButton == userPressedBtnIndex) { //if userGuess is equal to correct answer
            return .blue
        }
        return .red
    }
}


//struct ArrayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArraysSingleQView(question: Question.ArrayQuestions[0], score: 5)
//    }
//}
