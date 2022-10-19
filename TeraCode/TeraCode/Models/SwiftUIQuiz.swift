//
//  SwiftUIQuiz.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 25/04/2022.
//


import Foundation

struct SwiftUIQuiz {
    
    private(set) var questions = Question.UIQuestions.shuffled()
    //https://stackoverflow.com/questions/37264824/how-does-public-privateset-access-modifiers-work
    //to read the current question Globally/Public, but only set it here
    private(set) var onCurrentQuestionIndex = 0 //currently at [0] at start of array
    
    private(set) var quizOver: Bool = false
    
    var questionCount: Int {
        questions.count
    }
    
    //computed property - run code between {} to find currentQuestion e.g. question {findQuestionAnswer}
    var currentQuestion: Question {
        get {
            questions[onCurrentQuestionIndex] // current question is on index [onCur..] from above
        }
    }
    
    var lastQuestion: Question {
        get {
            questions[questions.count - 1]
        }
    }
    
    mutating func checkLastQuestion() {
        let nextQuestionIndex = onCurrentQuestionIndex + 1
            if !questions.indices.contains(nextQuestionIndex) {
                print("Quiz over")
                quizOver = true
            }
        quizOver = false
    }
    
    mutating func goToNextQuestionState(){
        if onCurrentQuestionIndex + 1 < questions.count{
            onCurrentQuestionIndex += 1
        } else {
            print("Quiz over")
            quizOver = true
        }
    }
    
//    mutating func nextQuestion(){
//            if questionNumber + 1 < quiz.count{
//               questionNumber += 1
//            }else {
//                questionNumber = 0
//                score = 0
//            }
//        }
}

