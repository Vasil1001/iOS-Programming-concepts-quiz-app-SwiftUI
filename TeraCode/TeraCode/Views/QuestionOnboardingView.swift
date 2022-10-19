//
//  IntroBasicsView.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 14/04/2022.
//

import SwiftUI

struct QuestionOnboardingView: View {
    //@State var quizOneScore: Int
    var body: some View {
            content //.preferredColorScheme(.dark)   }
    }
    var content: some View {
        ZStack {

            Color(red: 0.1215, green: 0.2117, blue: 0.27)
                .ignoresSafeArea()
            VStack {
                
                Text("Tera Code")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    .padding(.top, 20)
                    .shadow(radius:25)
                
                Text("Introduction")
                    .font(.system(size: 29))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .shadow(radius: 25)
                Spacer()
                
                Image("3d-flame-249")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                Spacer()
                
                NavigationLink(destination: CategoriesView()) {
                    HStack{
                        Text("Start".uppercased())
                            .font(.title2.weight(.heavy))
                            .foregroundColor(.white)
                            .kerning(2)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 24, weight: .heavy))

                    }
                    .padding(10)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal,35)
                    //.padding(.bottom, 30)
                    .background(Color.black)
                    .cornerRadius(12)
                    
                }
                Spacer()
                    //.padding(.bottom, 50)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct QuestionOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionOnboardingView()
            //.preferredColorScheme(.dark)
    }
}
