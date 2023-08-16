import SwiftUI

struct NeonToggleSwitch: View {
    @Binding var isOn: Bool
    var neonColor: Color = Color.green

    var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(NeonToggleStyle(neonColor: neonColor))
    }
}

struct NeonToggleStyle: ToggleStyle {
    var neonColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            NeonSwitch(isOn: configuration.$isOn, neonColor: neonColor)
        }
    }
}

struct NeonSwitch: View {
    @Binding var isOn: Bool
    var neonColor: Color
    
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 60, height: 30)
                .foregroundColor(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(neonColor, lineWidth: 2)
                        .shadow(color: neonColor.opacity(0.8), radius: 10, x: 0, y: 0)
                )
                .glowEffect(isOn: isOn, neonColor: neonColor, radius: 100) // Enhanced glow effect
//                .animation(Animation.linear(duration: 1).repeatCount(1, autoreverses: false))
            Circle()
                .frame(width: 26, height: 26)
                .foregroundColor(neonColor)
                .overlay(
                    Circle()
                        .frame(width: 34, height: 34)
                        .foregroundColor(neonColor.opacity(0.3))
                )
                .colorMultiply(isOn ? .white : .gray)
                .saturation(isOn ? 1.0 : 0.5)
                .offset(x: isOn ? 15 : -15)
        }
        .onTapGesture {
            withAnimation {
                isOn.toggle()
                isAnimating.toggle()
            }
        }
    }
}

struct ContentView: View {
    @State private var isToggleOn = false

    var body: some View {
        VStack {
            HStack {
                NeonToggleSwitch(isOn: $isToggleOn, neonColor: .blue)
                    .padding()
                Text("Toggle State: \(isToggleOn ? "On" : "Off")")
                    .padding()
            }
            GradientToggle()
            IconToggle()
            SliderWithLabel()
            AppleStyleSlider()
            TransparentSlider()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func glowEffect(isOn: Bool, neonColor: Color, radius: CGFloat) -> some View {
        self
            .shadow(color: neonColor.opacity(0.9), radius: isOn ? radius : 0) // Adjusted opacity
    }
}
