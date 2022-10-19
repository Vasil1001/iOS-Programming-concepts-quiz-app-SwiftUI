//
//  QListFrames.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 24/04/2022.
//

import SwiftUI

// https://developer.apple.com/forums/thread/122440 info on passing a view parameter for the struct
struct QuestionFrame: View {
    let questionName: String
    let status: String
    
    var view: AnyView //allows to navigate to a view
    
    var body: some View {
        
        NavigationLink(destination: (view)) {
            
            HStack {
                Text(questionName)
                
                Text(self.status)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.white)
        .padding(.horizontal)
        .background(Color.blue)
        .cornerRadius(25)
        .padding(.horizontal,20)
    }
}

// https://developer.apple.com/forums/thread/122440 info on passing a view parameter for the struct
struct QuizFrame: View {
    let questionName: String
    let status: String
    let lastScoreText: String
    
    var view: AnyView //allows to navigate to a view
    
    var body: some View {
        
        NavigationLink(destination: (view)) {
            HStack {
                Text(questionName)
                VStack {
                    Text(lastScoreText.uppercased())
                    
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text(status)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.white)
        .padding(.horizontal)
        .background(Color.blue)
        .cornerRadius(25)
        .padding(.horizontal,20)
    }
}

//https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
struct CircularProgressPie: View {
    @Binding var value: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 7.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
                .frame(width: 60.0, height: 60.0)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.value, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 7.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .frame(width: 60.0, height: 60.0)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(String(format: "%.0f %%", min(self.value, 1.0)*100.0))
                .font(.body)
                .foregroundColor(.black)
                .bold()
        }
    }
}


