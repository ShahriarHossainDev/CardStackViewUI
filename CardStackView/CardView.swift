//
//  CardView.swift
//  CardStackView
//
//  Created by Shahriar Hossain on 20/12/24.
//

import SwiftUI

struct CardView: View {
    let cardHolderName, bankName, cardNumber, expiryDate, cvv, cardType: String
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(bankName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.white)
                Spacer()
                Text(cardType)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.white)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // card chip
            HStack {
                Image("chip")
                    .resizable()
                    .frame(width: 40, height: 32)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    .padding(.leading, 20)
                Spacer()
            }
            .padding(.top, 10)
            
            Text(cardNumber)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(Color.white)
                .padding([.top, .bottom], 10)
            
            // Expiry Date and cvv
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text("VALID THROUGH")
                        .font(.system(size: 10))
                        .foregroundStyle(Color.white.opacity(0.8))
                    Text(expiryDate)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(Color.white)
                }
                Spacer()
                VStack() {
                    Text("CVV")
                        .font(.system(size: 10))
                        .foregroundStyle(Color.white.opacity(0.8))
                    Text(cvv)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(Color.white)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            // Card Holder Name
            HStack {
                Text(cardHolderName)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.white)
                    .padding(.leading, 20)
                Spacer()
            }
            .padding(.bottom, 10)
            
        }
        .frame(width: 300, height: 200)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("CardTopColor"), Color("CardBottomColor")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
        }
        .shadow(color: Color.black.opacity(0.4), radius: 15, x: 0, y: 10)
    }
}

#Preview {
    CardView(cardHolderName: "Shahriar", bankName: "Bank One", cardNumber: "1234 5678 9123 4567", expiryDate: "12/25", cvv: "123", cardType: "Visa")
}

