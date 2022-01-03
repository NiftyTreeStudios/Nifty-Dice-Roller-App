//
//  DiceRolls.swift
//  Nifty-Dice-Roller-App
//
//  Created by Iiro Alhonen on 03.01.22.
//

import SwiftUI

struct DiceRollsView: View {
    @Binding var diceRolls: [DiceRoll]
    @Binding var showDetails: Bool
    
    var body: some View {
            ScrollView {
                ZStack {
                    Capsule().frame(width: 75, height: 5, alignment: .center)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .offset(y: -5)
                    HStack {
                        Spacer()
                        Button {
                            self.showDetails = false
                        } label: {
                            Image(systemName: "x.circle")
                        }
                        .frame(width: 50, height: 50)
                        .font(.title3)
                    }
                }
                Text("Dice rolled:")
                    .font(.title)
                VStack(alignment: .leading) {
                    ForEach(diceRolls) { roll in
                        Text("\(roll.diceUsed) - \(roll.roll)")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding()
            .clearModalBackground()
            .background(.thinMaterial)
        }
    }

struct DiceRollsView_Previews: PreviewProvider {
    static var previews: some View {
        DiceRollsView(diceRolls: .constant([]), showDetails: .constant(true))
    }
}
