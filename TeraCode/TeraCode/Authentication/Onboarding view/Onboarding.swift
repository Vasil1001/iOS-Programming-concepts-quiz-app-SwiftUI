//
//  Onboarding.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 17/04/2022.
//

import Foundation
import SwiftUI
//https://www.youtube.com/watch?v=cpg7f4pVzFw
//https://www.youtube.com/watch?v=HVAMShhJOUo kavsoft also for .ignore
struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        ZStack {
            TabView {
                PageViewTab2(step: "Step 1", title: "TeraCode \n\nIntroduction to Swift",
                             message: "Start learning Swift programming concepts in form of a game!",
                             imageName: "3d-flame-285",
                             bgColor: Color(red: 0.934, green: 0.9, blue: 0.5),
                             shouldShowOnboarding: $shouldShowOnboarding,
                             showDismissButton: false,
                             firstPage: true
                )
                
                PageViewTab2(step: "Step 2", title: "Practice questions",
                             message: "Practice Swift concepts through interactive questions and quizzes!",
                             imageName: "3d-flame-303",
                             bgColor: Color(red: 0.4, green: 0.81, blue: 0.81),
                             shouldShowOnboarding: $shouldShowOnboarding,
                             showDismissButton: false,
                             firstPage: false
                )
                
                PageViewTab2(step: "Step 3", title: "Test with quizes",
                             message: "Learn with various questions and test your knowledge with quizes at the end!",
                             imageName: "3d-flame-man-with-laptop-1",
                             bgColor: Color(red: 0.3, green: 0.85, blue: 0.61),
                             shouldShowOnboarding: $shouldShowOnboarding,
                             showDismissButton: true,
                             firstPage: false
                )
            }
            .tabViewStyle(PageTabViewStyle()).ignoresSafeArea()
        }
    }
}

struct PageViewTab2: View {
    var step: String
    var title: String
    var message: String
    var imageName: String
    var bgColor:  Color
    
    @Binding var shouldShowOnboarding: Bool
    let showDismissButton: Bool
    let firstPage: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing:20) {
                
                Text(title)
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .kerning(1.3)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                Spacer()
                //3d-flame-303
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(step)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top)
                
                Text(message)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .foregroundColor(.black)

                    .kerning(1.3)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 0)
               
                if showDismissButton {
                    Button(action: {
                        shouldShowOnboarding.toggle()
                    }, label: {
                        HStack{
                            Text("Get Started now")
                                .font(.title2.weight(.heavy))
                                .foregroundColor(.white)
                                //.kerning(2)
                            
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 24, weight: .heavy))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 17)
                        .padding(.horizontal, 30)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(12)
                        .padding(.horizontal, 50)
                        }
                    )
                }
            }
        }.background(bgColor)
    }
}
