//
//  CountdownTimer.swift
//  TeraCode
//
//  Created by Vasil Dzhakov on 20/04/2022.
//
// https://www.youtube.com/watch?v=HCozQjzh_PIstruct

import SwiftUI

struct CountdownTimer: View {
    @State var counter: Int = 0
    @State var startCount = false
    @State var show = false
    @State var showCodeEditor = false

    @State var countTo: Int = 0
    
    
    var body: some View {
        ZStack {
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            VStack{
                VStack {
                    Text("Challenge")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 0)
                        .padding(.top, 15)
                    
                    Divider()
                    Text("Instructions")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 0)
                        .padding(.top, 15)
                    
                    Text("Write code that prints numbers from 1 to 100.\n\nFor every number divisible by 3, print 'Fizz' \nFor every number divisible by 5, print 'Buzz'\nIf number is divisible by 3 and 5, print 'FizzBuzz'")
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)

                    
                    HStack {
                        Button(action: {
                            show.toggle()
                        }, label: {
                            HStack{
                                Text("Code Editor")
                                    .font(.title2.weight(.heavy))
                                    .foregroundColor(.white)

                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 24, weight: .heavy))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 1)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(12)
                            }
                        )
                        
                    Button(action: {
                        show.toggle()
                    }, label: {
                        HStack{
                            Text("Answer")
                                .font(.body.weight(.bold))
                                .foregroundColor(.white)
                        }
                        .frame(height: 30)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                        .background(Color(red: 0.12, green: 0.2417, blue: 0.34))
                        .cornerRadius(12)
                        }
                    )
                    }
                    .padding(.bottom, 15)

                }
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                .padding(2)
                .overlay(RoundedRectangle(cornerRadius:23).stroke(.black, lineWidth: 9))
                .background(Color.white)
                .cornerRadius(23)
                .frame(width: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .shadow(radius: 30, y: 15)
                
                Spacer()
                
                Button(action: {
                    startCount = true
                    countTo = 300 //change this to change challenge time
                }, label: {
                    Text("Start 5 min timer when ready!")
                        .foregroundColor(.white)
                })
                
                ZStack{
                    ProgressTrack()
                    TimerProgressBar(counter: counter, countTo: countTo)
                    Clock(counter: counter, countTo: countTo)
                }
            }.onReceive(timer) { time in
                if (self.counter < self.countTo) {
                    self.counter += 1
                }
            }
        }
        .sheet(isPresented: $show, content: {
            Text("FizzBuzz solution")
                .font(.title)
                .foregroundColor(.black)
            Image("FizzBuzz")
                .resizable()
                .scaledToFit()
        })
    }
}


let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom("Avenir Next", size: 45))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 200, height: 200)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 15)
            )
    }
}

struct TimerProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 200, height: 200)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(
                        (completed() ? Color.green : Color.orange)
                    ).animation(
                        .easeInOut(duration: 0.2)
                    )
            )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer()
    }
}
