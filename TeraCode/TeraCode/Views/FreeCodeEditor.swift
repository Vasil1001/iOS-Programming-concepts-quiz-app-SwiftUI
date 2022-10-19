//
//  FreeCodeEditor.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 27/04/2022.
//

import SwiftUI
import CodeEditor
//https://github.com/ZeeZide/CodeEditor
struct FreeCodeEditorView: View {
    
#if os(macOS)
    @AppStorage("fontsize") var fontSize = Int(NSFont.systemFontSize)
#endif
    @State private var source = "\n//Type anything here\n\n\n let greeting = 'hello'"
    @State private var language = CodeEditor.Language.swift
    @State private var theme   = CodeEditor.ThemeName.pojoaque
    @State private var showAnswer = false
    
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Text("Open code editor")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                
                Text("Select any language you want to type in")
                    .foregroundColor(.white)
                    .padding(.top)
                
                HStack(){
                    Text("Language")
                    
                    Spacer()
                    
                    Text("Theme")
                }
                .padding([.top, .leading, .trailing])
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
                
                //call code editor library
                CodeEditor(source: $source, language: language, theme: theme)
                    .background(.black)
            }
        } .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }
        
}

struct FreeCodeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FreeCodeEditorView()
    }
}
