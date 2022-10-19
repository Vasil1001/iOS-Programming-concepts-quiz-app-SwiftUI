//
//  QuestionModel.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 09/02/2022.
//

import Foundation

struct Question { //Question struct that has text, answers on screen, and the correct answer
    
    let qText: String // Question text
    let answerChoices: [String] // An array of answers
    let correctAnswerIndex: Int // The index the correct answer is on
    var codeSnippetImage: String? = ""
    
    init(qText: String, answerChoices: [String],correctAnswerIndex: Int) {
        self.qText = qText
        self.answerChoices = answerChoices
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    init(qText: String, answerChoices: [String],correctAnswerIndex: Int, codeSnippetImage: String) {
        self.qText = qText
        self.answerChoices = answerChoices
        self.correctAnswerIndex = correctAnswerIndex
        self.codeSnippetImage = codeSnippetImage
    }

    static let allQuestions: [Question] = [ //array of multiple questions
        Question(
            qText: "What is the standart way to write a constant in Swift?\n\n__ phoneNumber = 555",
            answerChoices: [
                "constant",
                "const",
                "var",
                "let",
            ],
            correctAnswerIndex: 3),
        
        Question(
            qText: "Swift is an open source language built on top of C and __?",
            answerChoices: [
                "Objective-C",
                "Python",
                "Java",
                "C++",
            ],
            correctAnswerIndex: 0),
           
        Question(
            qText: "How would you change the snippet below to compile?",
            answerChoices: [
                "let value = 0.2",
                "var value = 0.1",
                "no change",
                "value = 0.1",
            ],
            correctAnswerIndex: 1,
            codeSnippetImage:("Intro3")),
        
        Question(
            qText: "What is the result of r below?",
            answerChoices: [
                "Error",
                "5",
                "10",
                "55",
            ],
            correctAnswerIndex: 3,
            codeSnippetImage:("Intro4")),
        
        Question(
            qText: "What needs to be changed to correct the following snippet?",
            answerChoices: [
                "struct save",
                "func save() -> Bool",
                "return false",
                "func save(Bool)",
            ],
            correctAnswerIndex: 1,
            codeSnippetImage:("Intro5")),
        
        Question(
            qText: "What is the correct way to call the below function?",
            answerChoices: [
                "func = addNumbers",
                "addNumbers()",
                "var addNumbers(a: 5, b: 5)",
                "addNumbers(a: 5, b: 5)",
            ],
            correctAnswerIndex: 3,
            codeSnippetImage:("Intro6")),
        
        Question(
            qText: "What character is used to terminate a line in Swift? \n\n e.g. var student: String_",
            answerChoices: [
                ";",
                ":",
                "Nothing",
                ",",
            ],
            correctAnswerIndex: 2),
        
        Question(
            qText: "let number: Int = 10. \nnumber = 0  \n\n What is the output of number?",
            answerChoices: [
                "0",
                "10",
                "Error",
                "2",
            ],
            correctAnswerIndex: 2),
        
        Question(
            qText: "Which symbol is used to comment out a line in Swift?",
            answerChoices: [
                ";",
                "//",
                "/**",
                "#",
            ],
            correctAnswerIndex: 1),
        
        Question(
            qText: "How would you print Hello Swift in the console?",
            answerChoices: [
                "System.out.println('Hello Swift')",
                "print(''Hello Swift'')",
                "print('Hello Swift');",
                "println('Hello Swift');",
            ],
            correctAnswerIndex: 1)
    ]//allQ Array End
    
    static let ArrayQuestions: [Question] = [ //array of multiple questions
        
        Question(
            qText: "What is the output of the following snippet?",
            answerChoices: [
                "Error",
                "Blue",
                "Red, Green, Blue",
                "Blue, Red"
            ],
            correctAnswerIndex: 0,
            codeSnippetImage:("Array1")),
        
        Question(
            qText: "How many names are added to the following array?",
            answerChoices: [
                "3",
                "4",
                "0",
                "Runtime error",
            ],
            correctAnswerIndex: 0,
            codeSnippetImage:("Array2")),
        
        Question(
            qText: "What is the output of the following snippet?",
            answerChoices: [
                "HELLO,",
                "Error",
                "HELLO AMY, HELLO RORY",
                "HELLO Amy, HELLO Rory",
            ],
            correctAnswerIndex: 2,
        codeSnippetImage:("Array3")),
        
        Question(
            qText: "Which team will be displayed below?",
            answerChoices: [
                "Chelsea",
                "Leeds",
                "No team",
                "Error",
            ],
            correctAnswerIndex: 1,
        codeSnippetImage:("Array4")),
        
        Question(
            qText: "Which is the output from the snippet below?",
            answerChoices: [
                "All teams,",
                "Leeds",
                "Liverpool, Leeds",
                "Arsenal, Liverpool",
            ],
            correctAnswerIndex: 2,
        codeSnippetImage:("Array5")),
        
        Question(
            qText: "Which is the output from the snippet below?",
            answerChoices: [
                "A B",
                "Error",
                "A B C D",
                "A B C"
            ],
            correctAnswerIndex: 2,
        codeSnippetImage:("Array6")),
        
        Question(
            qText: "How will the numbers array look like?",
            answerChoices: [
                "1, 2, 3, 4",
                "1, 2, 34",
                "1, 2, 3, 7",
                "Error",
            ],
            correctAnswerIndex: 0,
        codeSnippetImage:("Array7")),
    ]//allQ Array End
    
    static let UIQuestions: [Question] = [ //array of multiple questions
        
        Question(
            qText: "What is a view in SwiftUI?",
            answerChoices: [
                "Building blocks that display graphically",
                "A page",
                "A modification for Text components",
                "Views allow buttons to be displayed"
            ],
            correctAnswerIndex: 0),
        
        Question(
            qText: "What is used to change to another view in SwiftUI?",
            answerChoices: [
                "goTo(desstination: newView())",
                "Button(action: newView())",
                "NavigationLink(action: newView())",
                "NavigationLink(destination: newView())"
            ],
            correctAnswerIndex: 3),
        
        Question(
            qText: "How do you set views to be layed out horizontally in SwiftUI?",
            answerChoices: [
                "Content is horizontal by default",
                "By typing .horizontal after a view Text('')",
                "Wrapping the views in HStack{ views }",
                "Wrapping the views in VStack{ views }"
            ],
            correctAnswerIndex: 2,
            codeSnippetImage:("UI3")),
        
        Question(
            qText: "Add padding to the Text view below:",
            answerChoices: [
                "Text('Testing.padding')",
                "Text('Testing').padding()",
                "Text('Testing').padding",
                "Text('Testing') == padding(all)"
            ],
            correctAnswerIndex: 1,
            codeSnippetImage:("UI1")),
        
        Question(
            qText: "How are views modified in SwiftUI? \n",
            answerChoices: [
                "Adding style='' after view",
                "using the '.' modifier",
                "In a separate file",
                "using the add modifier"
            ],
            correctAnswerIndex: 1,
            codeSnippetImage:("UI1")),
        
        Question(
            qText: "Change the color of the Text view below",
            answerChoices: [
                "style='color()'",
                ".add(color=red)",
                "Text('Hi').foregroundColor(.red)",
                "Text('Hi'.foregroundColor:red)",
            ],
            correctAnswerIndex: 2,
            codeSnippetImage:("UI2")),
        
        Question(
            qText: "What is a @Binding in SwiftUI",
            answerChoices: [
                "A binding changes modifiers quickly",
                "It is used to navigate to another view",
                "A connection between a value and an object that changes it",
                "A property that stores a value",
            ],
            correctAnswerIndex: 2),
        
        Question(
            qText: "When is a @State var used?",
            answerChoices: [
                "To store a value and rebuild on change",
                "For a constant value that doesn't change state",
                "To change the state of existing var",
                "To get the current value of an item",
            ],
            correctAnswerIndex: 0),
    ]//allQ Array End
}
