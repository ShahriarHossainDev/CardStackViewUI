# 📱 **Custom Bank Card UI with Swipe & Animations in SwiftUI**

Create a sleek and interactive **Bank Card UI** in **SwiftUI** with **swipe, drag, and rotation animations**. This project demonstrates how to build a **swipable card stack UI** with realistic credit card designs, animations, and smooth transitions.

---

## 🚀 **Features**
- **Custom Bank Card Design**: Gradient background, chip, card number, and cardholder name.  
- **Interactive Gestures**: Swipe left or right to remove cards with smooth drag animations.  
- **Rotation & Scale Effects**: Cards rotate and scale dynamically while swiping.  
- **Reusable Components**: Reuse the card component for payment apps, wallets, or dashboards.  

---

## 📸 **Screenshots**
![Demo](GF1.gif)
---

## 📂 **Project Structure**
```
📁 CustomBankCardUI
├── 📄 RotatingCardStackView.swift  // Main View for Card Stack UI
├── 📄 CardView.swift               // Custom Card Design 
└── 📄 ContentView.swift           // Entry Point of the App
```

---

## ✍️ **How It Works**
1. **Card Swipe Animation**:  
   - Uses `DragGesture` to track user swipe direction.  
   - Applies rotation and scale to the card while swiping.  
   - Once the swipe passes a threshold, the card animates out of view.  

2. **Card Design**:  
   - Custom-designed card UI with gradient backgrounds, chip, bank logo, and card details.  
   - Uses `VStack`, `HStack`, and `Spacer()` to create a layout similar to real credit/debit cards.  

---

## 🚀 **Getting Started**

### **1️⃣ Prerequisites**
- Xcode 14 or later  
- iOS 15+ Target  

### **2️⃣ Installation**
1. **Clone the repo**  
   ```bash
   git clone https://github.com/your-username/CustomBankCardUI.git
   cd CustomBankCardUI
   ```

2. **Open the project in Xcode**  
   ```bash
   open CustomBankCardUI.xcodeproj
   ```

3. **Run the app on a simulator or iOS device**  
   - Select a simulator (like iPhone 14)  
   - Press `Cmd + R` to run the project  

---

## ⚙️ **Usage**
1. **View the interactive card stack**.  
2. **Swipe left or right** on the card to animate it off the screen.  
3. **Drag the card** to see live rotation and scale effects.  

> This UI can be reused in apps like **wallets, banking apps, and payment dashboards**.  

---

## 🎉 **Customizations**
- **Card Colors**: Change card gradient colors in `CardView.swift`.  
- **Number of Cards**: Add more card data in the `cards` array in `RotatingCardStackView.swift`.  
- **Card Details**: Customize cardholder name, bank name, and expiry date.  

---

## 🔥 **Code Snippets**
### **Card Swipe Gesture**
```swift
DragGesture()
    .updating($dragOffset) { value, state, _ in
        state = value.translation
    }
    .onChanged { value in
        self.cardOffsets[index] = value.translation
        self.cardRotation = Double(value.translation.width / 10)
    }
    .onEnded { value in
        let swipeThreshold: CGFloat = 100
        if abs(value.translation.width) > swipeThreshold {
            withAnimation(.spring()) {
                self.currentCardIndex += 1
            }
        } else {
            withAnimation {
                self.cardOffsets[index] = .zero
            }
        }
    }
```

### **Custom Bank Card View**
```swift
struct CardView: View {
    var cardNumber: String
    var cardHolderName: String
    var bankName: String
    var expiryDate: String

    var body: some View {
        VStack {
            HStack {
                Text(bankName)
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Text("VISA")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()

            Spacer()

            Text(cardNumber)
                .font(.system(size: 24, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .padding()

            Spacer()

            HStack {
                VStack(alignment: .leading) {
                    Text("CARDHOLDER")
                    Text(cardHolderName)
                        .font(.headline)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("VALID THRU")
                    Text(expiryDate)
                        .font(.headline)
                }
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(width: 320, height: 200)
        .background(
            LinearGradient(
                colors: [Color(hex: "1D2B64"), Color(hex: "2A4365")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}
```

---

## 📘 **Documentation**
Check the full documentation in the [Wiki](https://github.com/your-username/CustomBankCardUI/wiki).  

---

## 🐛 **Bugs & Issues**
If you encounter any **bugs** or have **feature requests**, feel free to [open an issue](https://github.com/your-username/CustomBankCardUI/issues).  

---

## 🤝 **Contributing**
Contributions are welcome! Please follow these steps:  
1. Fork the repository.  
2. Create a feature branch (`git checkout -b feature/YourFeature`).  
3. Commit your changes (`git commit -m 'Add new feature'`).  
4. Push to the branch (`git push origin feature/YourFeature`).  
5. Open a Pull Request.  

---

## ❤️ **Support**
If you found this project useful, please **star this repository ⭐️** and **share it with your developer friends!**  

---

## 📝 **License**
This project is licensed under the **MIT License**. See the [LICENSE](./LICENSE) file for details.  

---

## 🔗 **Connect with Me**
- **LinkedIn**: [Shahriar Hossainb](https://www.linkedin.com/in/shahriar-hossain-dev/)  

---

Let me know if you'd like any edits, additions, or personal branding adjustments to this README! 😊
