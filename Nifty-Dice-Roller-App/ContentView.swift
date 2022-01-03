//
//  ContentView.swift
//  Nifty-Dice-Roller-App
//
//  Created by Iiro Alhonen on 11.06.21.
//

import SwiftUI

struct ContentView: View {
    @State private var rolledAmount: Int = 0
    @State private var showDetails: Bool = false
    @State private var diceRolls: [DiceRoll] = []
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showDetails = true
                } label: {
                    Image(systemName: "info.circle")
                        .font(.title3)
                }.padding()

            }
            RollResultView(rolledAmount: $rolledAmount)
            DiceGridView(rolledAmount: $rolledAmount, diceRolls: $diceRolls)
        }
        .sheet(isPresented: $showDetails) {
            DiceRollsView(diceRolls: $diceRolls, showDetails: $showDetails)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
