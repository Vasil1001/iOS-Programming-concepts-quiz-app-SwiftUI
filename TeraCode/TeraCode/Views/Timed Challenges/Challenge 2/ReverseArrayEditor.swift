//
//  ReverseArrayEditor.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 29/04/2022.
//

import SwiftUI
import CodeEditor
//https://github.com/ZeeZide/CodeEditor
struct ReverseArrayEditor: View {
    
    @State private var source = "\nimport SwiftUI\n\n\n//Create a mutable array with numbers 1 to 5\n\n\n\n\n//Create a function that takes an array as a parameter\n\n\n\n\n\n\n//print the array reversed to get 5 to 1"
    @State private var language = CodeEditor.Language.swift
    @State private var theme    = CodeEditor.ThemeName.pojoaque
    @State private var showAnswer = false
    
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("Given an array let numbers = [1,2,3,4,5]\nReverse it so the output is [5,4,3,2,1]")
                    .foregroundColor(.white)
                
                HStack(){
                    Text("Language")
                    Spacer()
                    Button(action: {
                        showAnswer.toggle()
                    }, label: {
                            Text("See Answer")
                        
                    })
                    .padding(.trailing)
                    
                    Spacer()
                    
                    Text("Theme")
                }
                .padding([.leading, .trailing])
                .foregroundColor(.white)
                .padding(.top, 10)

                HStack(alignment: .center) {
                    Picker("Language", selection: $language) {
                        ForEach(CodeEditor.availableLanguages) { language in
                            Text("\(language.rawValue.capitalized)")
                                .foregroundColor(.white)
                                .tag(language)
                        }
                    }
                    
                    Spacer()
                    
                    Picker("Theme", selection: $theme) {
                        ForEach(CodeEditor.availableThemes) { theme in
                            Text("\(theme.rawValue.capitalized)")
                                .tag(theme)
                        }
                    }
                }
                .padding(.horizontal)
                
                
                Spacer()
                Divider()

                CodeEditor(source: $source, language: language, theme: theme)
                    .background(.black)
            }
        }
        .popup(isPresented: $showAnswer, type: .toast, position: .top) {
            ZStack {
                Color(red: 0.12, green: 0.2417, blue: 0.34)
                    .ignoresSafeArea()
                VStack {
                    Text("Reverse Array solution")
                        .padding(.top, 30)
                        .font(.title)
                    .foregroundColor(.white)
                    
                    Image("ChallengeReverseArray")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .shadow(radius: 10)
                    Spacer()
                }
                .padding(.top, 60)

            }
            .navigationBarTitle("")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ReverseArrayEditor_Previews: PreviewProvider {
    static var previews: some View {
        ReverseArrayEditor()
    }
}
