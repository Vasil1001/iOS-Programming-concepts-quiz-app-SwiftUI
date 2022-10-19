//
//  CategoriesView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 10/02/2022.
//

import SwiftUI

struct CategoriesView: View {
    //declare variables for unit 1 scores
    @State var Unit1q1: Int = 0
    @State var Unit1q2: Int = 0
    @State var Unit1q3: Int = 0
    @State var Unit1q4: Int = 0
    @State var Unit1q5: Int = 0
    @State var Unit1q6: Int = 0
    @State var Unit1q7: Int = 0
    @State var Unit1q8: Int = 0
    @State var Unit1q9: Int = 0
    @State var Unit1q10: Int = 0
    @State var Unit1quiz1: Int = 0

    //declare variables for unit 2 scores
    @State var Unit2q1: Int = 0
    @State var Unit2q2: Int = 0
    @State var Unit2q3: Int = 0
    @State var Unit2q4: Int = 0
    @State var Unit2q5: Int = 0
    @State var Unit2q6: Int = 0
    @State var Unit2q7: Int = 0
    @State var Unit2quiz1: Int = 0
    
    //declare variables for unit 3 scores
    @State var SwiftUI1q1: Int = 0
    @State var SwiftUI1q2: Int = 0
    @State var SwiftUI1q3: Int = 0
    @State var SwiftUI1q4: Int = 0
    @State var SwiftUI1q5: Int = 0
    @State var SwiftUI1q6: Int = 0
    @State var SwiftUI1q7: Int = 0
    @State var SwiftUI1q8: Int = 0
    @State var SwiftUIquiz1: Int = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack {
                        VStack {
                            HStack { //PROGRESS BAR
                                VStack {
                                    Text("Categories")
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.black)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                        .padding(.bottom,25)
                                    
                                    Text("3 UNITS AVAILABLE")
                                        .font(.headline)
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.black)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                        .padding(.bottom,-19)
                                        .offset(y: -30)

                                }
                            } // HStack END
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                            .padding(.top, 7)
                            .padding(.horizontal, 18)
                        
                        }
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                        .background(Color(red: 0.16, green: 0.3417, blue: 0.42))
                        .cornerRadius(23)
                        .frame(width: .infinity, alignment: .center)
                        .padding(.horizontal, 20)
                        .shadow(radius: 6)
                    
                    Divider()
                    
                    HStack { //PROGRESS BAR
                        Text("Pick category".uppercased())
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)

                    } // HStack END
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 32)

                    CategoryFrame(title: "Unit 1", categoryName: "Swift Basics", progress: "", color: Color(red: 0.12, green: 0.2417, blue: 0.34), view: AnyView(IntroQListView(q1Score: Unit1q1, q2Score: Unit1q2, q3Score: Unit1q3, q4Score: Unit1q4, q5Score: Unit1q5, q6Score: Unit1q6, q7Score: Unit1q7, q8Score: Unit1q8, q9Score: Unit1q9, q10Score: Unit1q10, quiz1Score: Unit1quiz1)))
                        .padding(.bottom, 17)
                        .shadow(radius: 12)
                    
                    CategoryFrame(title: "Unit 2", categoryName: "Arrays", progress: "", color: Color(red: 0.12, green: 0.2417, blue: 0.34), view: AnyView(ArrayQListView(q1Score: Unit2q1, q2Score: Unit2q2, q3Score: Unit2q3, q4Score: Unit2q4, q5Score: Unit2q5, q6Score: Unit2q6, q7Score: Unit2q7, quiz1Score: Unit2quiz1)))
                        .padding(.bottom, 17)
                        .shadow(radius: 12)
                
                    Divider()
                    
                    HStack { //PROGRESS BAR
                        VStack {
                            Text("Swift UI")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.bottom,25)
                            
                            Text("1 UNIT AVAILABLE")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.bottom,-19)
                                .offset(y: -30)

                        }
                    } // HStack END
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    .padding(.top, 7)
                    .padding(.horizontal, 30)
                    
                    CategoryFrame(title: "SwiftUI", categoryName: "General Intro", progress: "", color: Color(red: 0.12, green: 0.2417, blue: 0.34), view: AnyView(SwiftUIQListView(q1Score: SwiftUI1q1, q2Score: SwiftUI1q2, q3Score: SwiftUI1q3, q4Score: SwiftUI1q4, q5Score: SwiftUI1q5, q6Score: SwiftUI1q6, q7Score: SwiftUI1q7, q8Score: SwiftUI1q8, quiz1Score: SwiftUIquiz1)))
                        .padding(.top, 10)
                        .padding(.bottom, 17)
                        .shadow(radius: 12)
                    
                    Spacer() // bring all to top
                } // VStack
                .navigationBarTitle("Categories")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear() {
                    //load user defaults data for user progress
                    getIntroQuestionStorage()
                    getUnit2ArrayQuestionStorage()
                    getSwiftUIQuestionStorage()
                }
            }
        }
    } // body
    func getIntroQuestionStorage() {
        Unit1q1 = UserDefaults.standard.integer(forKey: "Unit1Q1")
        Unit1q2 = UserDefaults.standard.integer(forKey: "Unit1Q2")
        Unit1q3 = UserDefaults.standard.integer(forKey: "Unit1Q3")
        Unit1q4 = UserDefaults.standard.integer(forKey: "Unit1Q4")
        Unit1q5 = UserDefaults.standard.integer(forKey: "Unit1Q5")
        Unit1q6 = UserDefaults.standard.integer(forKey: "Unit1Q6")
        Unit1q7 = UserDefaults.standard.integer(forKey: "Unit1Q7")
        Unit1q8 = UserDefaults.standard.integer(forKey: "Unit1Q8")
        Unit1q9 = UserDefaults.standard.integer(forKey: "Unit1Q9")
        Unit1q10 = UserDefaults.standard.integer(forKey: "Unit1Q10")
        
        Unit1quiz1 = UserDefaults.standard.integer(forKey: "Unit1Quiz1")
    }
    
    func getUnit2ArrayQuestionStorage() {
        Unit2q1 = UserDefaults.standard.integer(forKey: "Unit2Q1")
        Unit2q2 = UserDefaults.standard.integer(forKey: "Unit2Q2")
        Unit2q3 = UserDefaults.standard.integer(forKey: "Unit2Q3")
        Unit2q4 = UserDefaults.standard.integer(forKey: "Unit2Q4")
        Unit2q5 = UserDefaults.standard.integer(forKey: "Unit2Q5")
        Unit2q6 = UserDefaults.standard.integer(forKey: "Unit2Q6")
        Unit2q7 = UserDefaults.standard.integer(forKey: "Unit2Q7")
        Unit2quiz1 = UserDefaults.standard.integer(forKey: "Unit2Quiz1")
        
    }
    func getSwiftUIQuestionStorage() {
        SwiftUI1q1 = UserDefaults.standard.integer(forKey: "UI1Q1")
        SwiftUI1q2 = UserDefaults.standard.integer(forKey: "UI1Q2")
        SwiftUI1q3 = UserDefaults.standard.integer(forKey: "UI1Q3")
        SwiftUI1q4 = UserDefaults.standard.integer(forKey: "UI1Q4")
        SwiftUI1q5 = UserDefaults.standard.integer(forKey: "UI1Q5")
        SwiftUI1q6 = UserDefaults.standard.integer(forKey: "UI1Q6")
        SwiftUI1q7 = UserDefaults.standard.integer(forKey: "UI1Q7")
        SwiftUI1q8 = UserDefaults.standard.integer(forKey: "UI1Q8")
        SwiftUIquiz1 = UserDefaults.standard.integer(forKey: "UI1Quiz1")
        
    }
}

// https://developer.apple.com/forums/thread/122440 info on passing a view parameter for the struct
struct CategoryFrame: View {
    let title: String
    let categoryName: String
    let progress: String
    let color: Color
    var view: AnyView //allows to navigate to a view
    var body: some View {
        
        NavigationLink(destination: (view)) {
            HStack {
                VStack {
                    Text(title.uppercased())
                        .font(.headline.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(categoryName.uppercased())
                        .font(.title2.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Text(progress)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.white)
        .padding(.horizontal)
        .background(color)
        .cornerRadius(25)
        .padding(.horizontal,20)
    }
}

//https://www.simpleswiftguide.com/how-to-build-linear-progress-bar-in-swiftui/

//https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-progress-on-a-task-using-progressview



struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()

    }
}

