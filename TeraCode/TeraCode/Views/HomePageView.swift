//
//  HomePageView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 10/02/2022.
//

import SwiftUI
import FirebaseAuth

struct HomePageView: View {
    @State var darkMode : Bool =  false
    @State var swiftProgressValue: Float = 0.25
    @State var swiftUIProgressValue: Float = 0.75
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .offset(y: 190)
            
            Image("3d-flame-businesswoman-standing-on-phone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(x: 160, y: -449)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("TeraCode")
                            .font(.system(size: 39))
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                            .kerning(1.9)
                        
                        Text("Ready to practice Swift?")
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 25)
                    
                    //sign out button top right
                NavigationLink(destination: LoginView()) {
                        Text("Sign Out")
                        .foregroundColor(.gray)
                        .padding(.trailing, 15)
                        .padding(.bottom, 28)
                }.navigationBarBackButtonHidden(true)
                }
                
                Image("3d-flame-210")
                    .resizable()
                    .scaledToFit()
                    .offset(x: -40,y: 30)
                
                Spacer()
                Spacer()
                Text("Select a category to practice".uppercased())
                    .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                    .font(.system(size: 18, weight: .bold))
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .background(Color(red: 0.12, green: 0.2417, blue: 0.36))
                    .cornerRadius(15)
                    .padding(.top, 0)
                    .padding(.trailing, 15)
                    .padding(.leading,15)
                    
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        //rectangle blue frames with content
                        SwiftRectangle()
                        SwiftUIRectangle()
                        TimedChallenges()
                        CodeEditorFrame()
                        //OverviewRectangle()
                    }// HStack
                    
                    .padding(.vertical,10)
                    .padding(.bottom, 20)
                    
                    .ignoresSafeArea()
                }
                .shadow(radius: 10)
            }

            .navigationBarHidden(true)
        }
    }
}

//firebase sign out function
func signout(){
    let firebaseAuth = Auth.auth()
    do {
        try firebaseAuth.signOut()
    } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

struct SwiftRectangle: View {
    
    var body: some View {
        
        NavigationLink(destination: QuestionOnboardingView()) {

            ZStack(alignment: .topTrailing) {
                Image("Swift")
                    .resizable()
                    .scaledToFit()
                    .frame(width:115, height: 115)
                    .offset(x: 28,y: -17)
                
                VStack {
                    HStack {
                        Text("Swift")
                            .font(.title2.weight(.bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 7)
                    }
                    
                    Text("2 Categories".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("17 Questions".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("2 Quizes".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Learn Swift Fundamentals")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 15)
                    
                    Text("Questions and tests available")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                        

                    Text("Complete questions, learn therory and")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 3)
                    Text("expand your Swift knowledge")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 260, alignment: .topLeading)
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .background(Color(red: 0.12, green: 0.2417, blue: 0.36))
        .cornerRadius(25)
        .padding(.leading, 15)
    }
}

struct SwiftUIRectangle: View {
    var body: some View {
        NavigationLink(destination: QuestionOnboardingView()) {
            ZStack(alignment: .topTrailing) {
                Image("SwiftUI")
                    .resizable()
                    .scaledToFit()
                    .frame(width:106, height: 106)
                    .offset(x: 28,y: -17)
                
                VStack {
                    HStack {
                        Text("SwiftUI")
                            .font(.title2.weight(.bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 7)
                    }
                    
                    Text("1 Category".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("8 Questions".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("1 Test".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Introduction to SwiftUI")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                    
                    Text("Main concepts layouts practice")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                                  
                    Text("Get to know the basics of SwiftUI")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                    
                    Text("Learn key concepts in this framework")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                }
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 260, alignment: .topLeading)
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .background(Color(red: 0.12, green: 0.2417, blue: 0.36))
        .cornerRadius(25)
        .padding(.horizontal, 15)
    }
}


struct TimedChallenges: View {
    
    var body: some View {
        
        NavigationLink(destination: SelectChallenge()) {

            ZStack(alignment: .topTrailing) {
                Image("3d-flame-red-clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width:115, height: 115)
                    .offset(x: 15,y: 10)
                
                VStack {
                    HStack {
                        Text("Timed Challenges")
                            .font(.title2.weight(.bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 7)
                    }
                    
                    Text("Countdown tests".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 3)
                    
                    Text("Various challenges".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Work timer".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Set a timer and solve a task")
                        .font(.body.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 50)
                    
                    Text("Time yourself to solve challenges")
                        .font(.subheadline.weight(.regular))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Coding timer to keep you focused!")
                        .font(.body.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 5)
                    
                    Text("Set a timer for no interruptions")
                        .font(.subheadline.weight(.regular))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                }
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 260, alignment: .topLeading)
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .background(Color(red: 0.12, green: 0.2417, blue: 0.36))
        .cornerRadius(25)
        .padding(.trailing, 15)
    }
}

struct CodeEditorFrame: View {
    var body: some View {
        
        NavigationLink(destination: FreeCodeEditorView()) {

            ZStack(alignment: .topTrailing) {
                Image("3d-flame-255")
                    .resizable()
                    .scaledToFit()
                    .frame(width:115, height: 115)
                    .offset(x: 15,y: 10)
                
                VStack {
                    HStack {
                        Text("Code Editor")
                            .font(.title2.weight(.bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 7)
                    }
                    
                    Text("Highlighted code view".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 3)
                    
                    Text("Multiple languages".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Pie charts".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Practice freely in an open editor")
                        .font(.body.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 35)
                    
                    Text("Type in a programming language of choice")
                        .font(.subheadline.weight(.regular))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                }
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 260, alignment: .topLeading)
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .background(Color(red: 0.12, green: 0.2417, blue: 0.36))
        .cornerRadius(25)
        .padding(.trailing, 15)
    }
}


struct OverviewRectangle: View {
    var body: some View {
        
        NavigationLink(destination: QuestionOnboardingView()) {

            ZStack(alignment: .topTrailing) {
                Image("3d-flame-pie-chart-to-the-right")
                    .resizable()
                    .scaledToFit()
                    .frame(width:115, height: 115)
                    .offset(x: 15,y: 10)
                
                VStack {
                    HStack {
                        Text("Overview")
                            .font(.title2.weight(.bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 7)
                    }
                    
                    Text("Account info".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 3)
                    
                    Text("Prorgress bars".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Pie charts".uppercased())
                        .font(.footnote.weight(.semibold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                    
                    Text("Track your practice progress")
                        .font(.body.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 35)
                    
                    Text("Personal account and progress info")
                        .font(.body.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 0)
                }
            }
        }
        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 260, alignment: .topLeading)
        .foregroundColor(.white)
        .padding(.horizontal, 12)
        .background(Color(red: 0.12, green: 0.2417, blue: 0.36))
        .cornerRadius(25)
        .padding(.trailing, 15)
    }
}
