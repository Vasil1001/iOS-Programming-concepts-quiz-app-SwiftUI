//
//  CodeEditor.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 27/04/2022.
//

import SwiftUI
import CodeEditor
//https://github.com/ZeeZide/CodeEditor
struct CodeEditorView: View {
    
    @State private var source = "\nimport SwiftUI\n\n\nfunc fizzBuzz(){\n\n\n\n\n}\n\nfizzBuzz()"
    @State private var language = CodeEditor.Language.swift
    @State private var theme    = CodeEditor.ThemeName.pojoaque
    @State private var showAnswer = false
    
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {

                Text("Print numbers 1 to 100. For every number divisible by 3, print Fizz, for numbers divisible by 5 print Buzz and if divisible by both - print FizzBuzz.")
                    .padding(.horizontal, 10)
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
                .padding(.top, 10)
                .padding(.horizontal)
                .foregroundColor(.white)

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
                    Text("FizzBuzz solution")
                        .padding(.top, 50)
                        .font(.title)
                    .foregroundColor(.white)
                    
                    Image("FizzBuzz")
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

struct CodeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CodeEditorView()
    }
}
