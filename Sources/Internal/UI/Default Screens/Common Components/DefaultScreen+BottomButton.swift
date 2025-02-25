import SwiftUI

struct BottomButton: View {
    let icon: ImageResource
    let iconColor: Color
    let backgroundColor: Color
    let rotationAngle: Angle
    let action: () -> ()


    var body: some View {
        Button(action: action, label: createButtonLabel).buttonStyle(ButtonScaleStyle())
    }
}
private extension BottomButton {
    func createButtonLabel() -> some View {
        Image(icon)
            .resizable()
            .frame(width: 26, height: 26)
            .foregroundColor(iconColor)
            .rotationEffect(rotationAngle)
            .frame(width: 52, height: 52)
            .background(backgroundColor)
            .mask(Circle())
    }
}
