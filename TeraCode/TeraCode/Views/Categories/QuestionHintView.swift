//
//  QuestionHintView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 12/02/2022.
//

import SwiftUI

struct QuestionHintView: View {

    var body: some View {
        VStack {
            ScrollView {

                Text("To identify user defined items in Swift, use var for mutating items, or let for constants followed by the item. \n\nConstants 'let' cannot be mutated, remember to delcare an element as var to change its value later.\n\nFunctions in Swift, e.g. func Hello(){ code }, perform a task. Functions can return a specific type by indicating '-> Int' after naming. \n\nTo call a function, write Hello(), and for functions with parameters, XCode fills in and asks for required parameters, such as add(numberA: _ , numberB: _)\n\nSwift does not require a character to terminate a line! \n\nCode can be commented in Swift using // or /*...*/ for multiline commenting")
                    .font(.title2)
                    .padding(10)
                Spacer()
                Spacer()
            }
        }
        
    }
}

struct ArrayHintView: View {

    var body: some View {
        VStack {
            ScrollView {

                Text("Positioning in an array begins with 0 for the first element, calling for array[1] in an array with only 1 element would return an error!\n\nText views can use elements after text to display all text in small characters or capital, using .uppercased() at the end.\n\nFirst and last elements in an array can be retrieved using array.first or array.last\n\nString elements can be appended at the end of an array using array.append('MyString'), or for number examples using +=[3]")
                    .padding(10)
                    .font(.title2)

                Spacer()
                Spacer()
            }
        }
        
    }
}

struct UIHintView: View {

    var body: some View {
            VStack {
                ScrollView {
                Text("Swift UI utilizes building blocks called views to build interactive layouts. Views are considered to be Text elements, buttons, stacks and many more in Swift UI\n\nTo modify a view in Swift UI, type the modifier '.' after a view to see a choices of modifications that can be made to the selected element. The attributes inspector found top right in XCode also allows to add modifiers and view the list of all available modifiers.\n\nTo watch for changes on variables and save the state of them in Swift UI, use @State var instead of plain var or let. This allows for a view to be observed and updated upon change, saving the latest state of that element in @State.\n\nA way to navigate from view to another in Swift is by using NavigationViews, and wrapping the element that needs to be clickable in a NavigationLink, and specifying the destination view we want to navigate to.\n\nSwiftUI utilizes the use of Stacks to place content on the screen. VStacks place elements vertically, and HStack horizonntaly. ZStacks allow for views to be placed on top of others, such as adding a background color to a view behind everything!\n\n")
                    .padding(10)
                    .font(.title3)

                Spacer()
                Spacer()
            }
        }
        
    }
}
