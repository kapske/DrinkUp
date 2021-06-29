//
//  Game.swift
//  Drink Up
//
//  Created by Nick Andrisin on 4/14/21.
//

import SwiftUI

struct GameView: View {
    var body: some View {

        ZStack{
            
            Image("Card")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle(degrees: 270))
                .frame(width: 700, height: 400)

            Text("Prompt goes here!")
                .rotationEffect(Angle(degrees: 270))
                .font(.largeTitle)
            
            

        }
        // Background Color
        .padding(.all, 250)
        .background(Color(red: 0.3, green: 0.8, blue: 0.8, opacity: 0.75))
        .ignoresSafeArea()
        
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
