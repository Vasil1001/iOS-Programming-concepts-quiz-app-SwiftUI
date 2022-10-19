//
//  SwiftUIViewModel.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 25/04/2022.
//

import Foundation

//  The ViewModel's job is to contain the logic for the view - make the actual practiceView page cleaner instead of piling everything in 1 view page. To display something on the view, the values have to be fetched from here

//  This viewmodel will allow to have multiple pages from the current static one question page

//  move the logic from View HERE.

//  replace the logic in IntroQuizView with var, let and functions here

//https://www.swiftbysundell.com/tips/a-first-look-at-swiftui-stateobject/
class SwiftUIViewModel: ObservableObject { //States that it can change - needed to move to next question
    
    //https://www.hackingwithswift.com/quick-start/Swiftui/how-to-use-observedobject-to-manage-state-from-external-objects
    @Published var quiz = SwiftUIQuiz() // Allow to Publish/update StateObjects that depend on this
    // instance of practice model, gives access to info for current question

    var questionText: String { // the current question text from Question model
        quiz.currentQuestion.qText
    }
    
    var questionImage: String {
        quiz.currentQuestion.codeSnippetImage!
    }
    var currentQuizQuestionNumber: String {
        "Question \(quiz.onCurrentQuestionIndex + 1) / \(quiz.questionCount)"
    }
    
    var lastQuizQuestion: Bool {
        if quiz.onCurrentQuestionIndex + 1 == quiz.questionCount {
            return true
        }
        return false
    }
    
    //https://www.hackingwithswift.com/articles/76/how-to-loop-over-arrays - for .count or .indices
    
    //https://stackoverflow.com/questions/57244713/get-index-in-foreach-in-swiftui

    //https://developer.apple.com/forums/thread/118361 .count and .indices
    
    var answerNumberRange: Range<Int> {
        0..<quiz.currentQuestion.answerChoices.count
    }
    
    func answerButtonText(for index: Int) -> String {
        //get the array of answers for the current question
        //current question is the [0] from allQuestions array in model
         quiz.currentQuestion.answerChoices[index]
    }
    
    var correctAnswerIndex: Int {
        quiz.currentQuestion.correctAnswerIndex
    }
    
    func moveToNextQuestion() { //var throws error here - ended up using func
        quiz.goToNextQuestionState()
    }
    
    func checkAnswer(for userAnswer: Int?) -> Bool? {
        if userAnswer == quiz.currentQuestion.correctAnswerIndex {
                return true
            } else {
                return false
            }
        }
}
