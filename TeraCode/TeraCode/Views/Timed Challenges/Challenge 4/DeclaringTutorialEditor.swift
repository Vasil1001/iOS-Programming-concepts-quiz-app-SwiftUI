//
//  DeclaringTutorialEditor.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 29/04/2022.
//
import SwiftUI
import CodeEditor
//https://github.com/ZeeZide/CodeEditor
struct DeclaringTutorialEditor: View {
    
    @State private var source = "\nimport SwiftUI\n\n\n//declare a mutable interger and name it myNumber\n\n\n\n\n//declare a mutable double and name it valueDouble\n\n\n\n\n//declare a mutable string and name it stringValue\n\n\n\n\n//declare constants hourlyRate = 19.5 and hoursWorked = 10\n\n\n\n\n//declare an integer totalCost equal to hourly rate multiplied by hoursWorked\n\n\n\n\n//declare a boolean flagRaised as false, another boolean isOver65 as true\n//and boolean stillWorking as true\n\n\n\n\n//declare a variable that checks whether someone is eligible for disposable income if they are over 65 and still working\n\n\n\n\n//create another variable that checks whether someone might be eligible for disposable income, not over 65 or working. \n\n\n\n\n//declare a number range 1 to 9\n\n\n\n\n//check the output of the range using .contains(10) at the end - is this true or false?"
    
    @State private var language = CodeEditor.Language.swift
    @State private var theme    = CodeEditor.ThemeName.pojoaque
    @State private var showAnswer = false
    
    var body: some View {
        ZStack {
            
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("Follow the instructions in the editor to practice Swift data types")
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
                .navigationBarTitle("Challenge")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
                
                
                Spacer()
                Divider()

                CodeEditor(source: $source, language: language, theme: theme)
                    .background(.black)
            }
            .popup(isPresented: $showAnswer, type: .toast, position: .top) {
                ZStack {
                    Color(red: 0.12, green: 0.2417, blue: 0.34)
                        .ignoresSafeArea()
                    VStack {
                        Text("Swift Data Types tutorial solution")
                            .padding(.top, 30)
                            .font(.title)
                        .foregroundColor(.white)
                        
                        Image("SwiftDataTypes")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .shadow(radius: 10)
                        Spacer()
                    }
                    .padding(.top, 60)

                }
                .shadow(color: .black, radius: 10)

                .navigationBarTitle("")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct DeclaringTutorialEditor_Previews: PreviewProvider {
    static var previews: some View {
        DeclaringTutorialEditor()
    }
}
