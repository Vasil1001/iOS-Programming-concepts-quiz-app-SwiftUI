//
//  test.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 17/04/2022.
//

import SwiftUI

//struct test: View {
//    var body: some View {
//        PageView1()
//    }
//}
//
//struct PageView1: View {
////    let title: String
////    let message: String
////    let imageName: String
////    let showDismissButton: Bool
////    @Binding var shouldShowOnboarding: Bool
//    
//    var body: some View {
//        ZStack {
//            
//            PageViewTab(step: "Step 1", title: "Introduction to Swift programming concepts", message: "Get started with Swift fundamentals practice through interactive quizes", imageName: "3d-flame-285", bgColor: Color(red: 0.934, green: 0.9, blue: 0.5))
//            
//            PageViewTab(step: "Step 2", title: "Practice", message: "Get started with Swift fundamentals practice through interactive quizes", imageName: "3d-flame-303", bgColor: Color(red: 0.4, green: 0.81, blue: 0.81))
//            
//            PageViewTab(step: "Step 3", title: "Start now", message: "Get started with Swift fundamentals practice through interactive quizes", imageName: "3d-flame-285", bgColor: Color(red: 0.934, green: 0.9, blue: 0.5))
//            
//        }
//        .overlay(
//            Button(action: {
//            }, label: {
//                Image(systemName: "chevron.right")
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundColor(.black)
//                    .frame(width: 60, height: 60)
//                    .background(Color.white)
//                    .clipShape(Circle())
//                    .overlay {
//                        ZStack {
//                            Circle()
//                                .stroke(Color.black.opacity(0.06),lineWidth: 4)
//                                .padding(-12)
//                            
//                            Circle()
//                                .trim(from: 0, to: 0.3)
//                                .stroke(Color.white,lineWidth: 4)
//                                .rotationEffect(.init(degrees: -90))
//                                .padding(-12)
//                        }
//                    }
//            })
//            .padding(.bottom, 20)
//            ,alignment:.bottom
//        )
//    }
//}
//
//struct PageViewTab: View {
//    var step: String
//    var title: String
//    var message: String
//    var imageName: String
//    var bgColor:  Color
//    
//    @AppStorage("currentPage") var currentPage = 1
////    let showDismissButton: Bool
////
////    @Binding var shouldShowOnboarding: Bool
//    
//    var body: some View {
//        VStack(spacing:20) {
//            
//            HStack{
//                
//                if currentPage == 1 {
//                    Text("TeraCode")
//                        .font(.title)
//                    .fontWeight(.bold)
//                } else {
//                    Button(action: {
//                        
//                    }, label: {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.white)
//                            .padding(.all)
//                            .background(Color.black.opacity(0.4))
//                            .cornerRadius(10)
//                    })
//                }
//                
//                Spacer()
//                
//                Button(action: {
//                    
//                }, label: {
//                    Text("Skip")
//                        .fontWeight(.semibold)
//                })
//            }
//            .foregroundColor(.black)
//            .padding()
//            
//            Text(title)
//                .fontWeight(.semibold)
//                .font(.system(size: 18))
//                .kerning(1.3)
//                .multilineTextAlignment(.center)
//            
//            Spacer()
//            //3d-flame-303
//            Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//            
//            Text(step)
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .padding(.top)
//            
//            Text(message)
//                .fontWeight(.semibold)
//                .font(.system(size: 18))
//                .kerning(1.3)
//                .multilineTextAlignment(.center)
//            //.padding(.bottom, 80)
//            
//            Spacer(minLength: 100)
//        }
//        .background(bgColor)
//    }
//}
//
//
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView1()
//    }
//}
