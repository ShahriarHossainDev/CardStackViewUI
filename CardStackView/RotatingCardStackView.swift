//
//  RotatingCardStackView.swift
//  CardStackView
//
//  Created by Shahriar Hossain on 20/12/24.
//

import SwiftUI

struct RotatingCardStackView: View {
    let cards = [
        ["cardHolderName": "Shahriar", "bankName": "Bank One", "cardNumber": "1234 5678 9123 4567", "expiryDate": "12/25", "cvv": "123", "cardType": "Visa"],
        ["cardHolderName": "Ail Hossain", "bankName": "Bank Two", "cardNumber": "9876 5678 9123 4567", "expiryDate": "12/25", "cvv": "654", "cardType": "MasterCard"],
        ["cardHolderName": "Shishir Hossain", "bankName": "Bank Three", "cardNumber": "8523 7412 9123 4567", "expiryDate": "12/25", "cvv": "456", "cardType": "Visa"],
        ["cardHolderName": "Atik Hossain", "bankName": "Bank Four", "cardNumber": "1234 5678 9852 4567", "expiryDate": "12/25", "cvv": "789", "cardType": "MasterCard"]
    ]
    
    @State private var cardOffSets: [CGSize] = Array(repeating: CGSize.zero, count: 5)
    @State private var cardRotation: Double = 0.0
    @State private var currentCardIndex: Int = 0
    @State private var cardScale: CGFloat = 1.0
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            ForEach(0..<cards.count, id: \.self) { index in
                if index >= currentCardIndex {
                    let card = cards[index]
                    
                    CardView(
                        cardHolderName: card["cardHolderName"] ?? "",
                        bankName: card["bankName"] ?? "",
                        cardNumber: card["cardNumber"] ?? "",
                        expiryDate: card["expiryDate"] ?? "",
                        cvv: card["cvv"] ?? "",
                        cardType: card["cardType"] ?? ""
                    )
                    .offset(self.cardOffSets[index])
                    .rotationEffect(.degrees(self.cardRotation))
                    .scaleEffect(index == currentCardIndex ? self.cardScale : 1.0)
                    .zIndex(Double(cards.count - index))
                    .gesture(
                        DragGesture()
                            .updating(self.$dragOffset) { value, offset, _ in
                                offset = value.translation
                            }
                            .onChanged { value in
                                self.cardOffSets[index] = value.translation
                                self.cardRotation = Double(value.translation.width / 10)
                                self.cardScale = 1.0 - abs(value.translation.width) / 1000
                            }
                            .onEnded { value in
                                let swipeThreshold: CGFloat = 100
                                if abs(value.translation.width) > swipeThreshold {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                        self.cardOffSets[index] = CGSize(
                                            width: value.translation.width > 0 ? 1000 : -1000,
                                            height: 0
                                        )
                                        self.currentCardIndex += 1
                                        self.cardScale = 1.0
                                        self.cardRotation = 0
                                    }
                                } else {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                        self.cardOffSets[index] = .zero
                                        self.cardScale = 1.0
                                        self.cardRotation = 0
                                    }
                                }
                            }
                    )
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: cardOffSets[index])
                }
            }
        }
        .frame(width: 350, height: 350)
    }
}

#Preview {
    RotatingCardStackView()
}
