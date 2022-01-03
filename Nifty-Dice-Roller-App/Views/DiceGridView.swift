//
//  DiceGridView.swift
//  Nifty-Dice-Roller-App
//
//  Created by Iiro Alhonen on 11.06.21.
//

import NiftyDiceRoller
import SwiftUI

struct Dice {
    let name: String
    let diceType: NiftyDiceRoller.Dice
}

struct DiceRoll: Identifiable {
    let id = UUID()
    let diceUsed: String
    let roll: Int
}

struct DiceGridView: View {
    @Binding var rolledAmount: Int
    @Binding var diceRolls: [DiceRoll]
    
    let diceTypes: [Dice] = [
        Dice(name: "d4", diceType: .d4),
        Dice(name: "d6", diceType: .d6),
        Dice(name: "d8", diceType: .d8),
        Dice(name: "d10", diceType: .d10),
        Dice(name: "d12", diceType: .d12),
        Dice(name: "d20", diceType: .d20),
        Dice(name: "d100", diceType: .d100)
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 5, alignment: .center),
        GridItem(.flexible(), spacing: 5, alignment: .center),
        GridItem(.flexible(), spacing: 5, alignment: .center),
        GridItem(.flexible(), spacing: 5, alignment: .center)
    ]
    
    var body: some View {
        Spacer()
        LazyVGrid(columns: columns, alignment: .center) {
            ForEach(diceTypes, id: \.name) { dice in
                Button {
                    let roll = diceRoll(dice: dice.diceType)
                    diceRolls.append(DiceRoll(diceUsed: dice.name, roll: roll))
                    rolledAmount += roll
                } label: {
                    Text(dice.name)
                        .foregroundColor(.black)
                }
                .buttonStyle(IAButton())
            }
            Button {
                rolledAmount = 0
                diceRolls = []
            } label: {
                Image(systemName: "trash")
            }
            .buttonStyle(IAButton())
        }.padding()
    }
}

struct IAButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(3)
            .frame(minWidth: 60, minHeight: 40)
            .background(Color.blue)
            .foregroundColor(.black)
            .clipShape(Capsule())
    }
}
