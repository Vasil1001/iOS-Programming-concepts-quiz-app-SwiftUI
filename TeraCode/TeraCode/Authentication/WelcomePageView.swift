//
//  WelcomePageView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 29/11/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

struct WelcomePageView: View {
    //@AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @State var shouldShowOnboarding: Bool = true
    @State var title: String
    @State var message: String
    @State var imageName: String

    var body: some View {
        //fixing back btn navigation views https://developer.apple.com/forums/thread/682125
        NavigationView {
            ZStack {
                Color(.sRGB, red: 0.4, green: 0.7, blue: 0.9, opacity: 0.3)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        
                        //https://2.flexiple.com/illustrations/exam link for images
                        
                        Text("TeraCode")
                            .font(.system(size:42, weight: .bold))
                        Text("Ready to learn Swift?")
                            .font(.system(size:21, weight: .light))
                        
                        Spacer()
                        
                        Image("Exam")
                            .resizable()
                            .scaledToFill()
                        
                        Spacer()
                        Text("Log in to start practicing")
                            .font(.system(size:17, weight: .light))
                            .padding()
                    }
                    
                    Spacer()
                    
                    VStack {
                        NavigationLink(destination: LoginView()) {
                            Text("Sign in")
                                .foregroundColor(.white)
                                .frame(maxWidth:270, maxHeight: 15)
                                .font(.system(size: 24, weight: .bold))
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(14)
                        }
                        
                        HStack {
                            Text("Don't have an account?")
                            
                            NavigationLink(destination: SignUpView()) {
                                Text("Register")
                                    .frame(minWidth: 0, maxWidth: 70)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.top, 5)
                        .font(.system(size: 16))
                        
                    }
                    Spacer()
                }
                .padding(.bottom, 40)
            }
        }
        .navigationViewStyle(.stack)
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
    
    struct WelcomePageView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomePageView(title: "Welcome to TeraCode!", message: "Join to start practicing with questions and quizzes for an introduction to Swift!", imageName: "business-3d-bamboo-board-with-statistic-notes")
                .background(Color.green)
            WelcomePageView(title: "Welcome to TeraCode!", message: "Join to start practicing with questions and quizzes for an introduction to Swift!", imageName: "business-3d-bamboo-board-with-statistic-notes")
                .background(Color.green)
                .preferredColorScheme(.dark)
        }
    }
}
