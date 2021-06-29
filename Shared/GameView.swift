//
//  Game.swift
//  Drink Up
//
//  Created by Nick Andrisin and Mark Kapuscinski on 4/14/21.
//

import SwiftUI

func getRando() -> String{
    var randomNoRepeat = ""
    if !tempPrompts.isEmpty {
        randomNoRepeat = tempPrompts.removeLast()
    }
    else {
        tempPrompts = cleanPrompts
        tempPrompts.shuffle()
        randomNoRepeat = tempPrompts.removeLast()
    }
    return randomNoRepeat
}

func getName() -> String{
    return cleanNames.randomElement()!
}

func isNamePrompt(name: String) -> Bool{
    if(name.contains("*")){
        return true
    }
    return false
}

func replaceStar(prompt: String) -> String{
    let tempString = prompt.split(separator: "*")
    var newString = ""
    if (tempString.count == 1){
         newString = getName() + String(tempString[0])
    }
    else{
         newString = String(tempString[0]) + getName() + String(tempString[1])
    }
    
    return newString
}

func getPrompt() -> String{
    var finalPrompt = ""
    let nextPrompt = getRando()
    if (isNamePrompt(name: nextPrompt)){
        finalPrompt = replaceStar(prompt: nextPrompt)
    }
    else{
        finalPrompt = nextPrompt
    }
    return finalPrompt
}

struct GameView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var currPrompt = getPrompt()
    
    var body: some View {

        ZStack{

            Button(action: {
                
                self.currPrompt = getPrompt()
            }, label: {
                        
                        ZStack{
                            
                            // Card Background Image
                            Image("NewCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .rotationEffect(Angle(degrees: 270))
                                .frame(width: 620, height: 625)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            
                            // Card Prompt Text
                            Text(currPrompt)
                                .font(.largeTitle)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40.0)
                                .rotationEffect(Angle(degrees:270))
                                .foregroundColor(.black)
                        }
                
            })
            
        
        // Background Color
        .padding(.all, 210)
        .background(Color(red: 0.67, green: 0.85, blue: 0.90, opacity: 1.0))
        .ignoresSafeArea()
        
        //Back to Homescreen Button
            Button(action: {
              withAnimation {
            viewRouter.currentPage = .page1
              }
        }) {
              Image(systemName: "multiply")
                .font(Font.system( size: 40)
                .bold())
                .foregroundColor(.white)                
            }
            .offset(x:-160, y:-360)


        }
        
    }
    
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(ViewRouter())
    }
}
