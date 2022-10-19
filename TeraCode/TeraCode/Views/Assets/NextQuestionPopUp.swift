//
//  NextQuestionPopUp.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 10/02/2022.
//

import SwiftUI

struct NextQuestionPopUp: View {
   
    let popUpText: String
    let onClick: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                print("Next question button")
                onClick()
            }, label: {
                Text(popUpText)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            })
            
            Spacer()
        }
        .background(Color.blue.opacity(0.8))
    }
}

struct NextQuestionPopUp_Previews: PreviewProvider {
    static var previews: some View {
        NextQuestionPopUp(popUpText: "Test text here") {}
        NextQuestionPopUp(popUpText: "Test text here") {}
            .preferredColorScheme(.dark)
    }
}
