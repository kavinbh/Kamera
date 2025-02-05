import SwiftUI

extension DefaultCameraScreen { struct TopButton: View {
    let icon: ImageResource
    let iconRotationAngle: Angle
    let action: () -> ()


    var body: some View {
        Button(action: action, label: createButtonLabel)
    }
}}
private extension DefaultCameraScreen.TopButton {
    func createButtonLabel() -> some View {
        Image(icon)
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(Color(.backgroundInverted))
            .rotationEffect(iconRotationAngle)
            .frame(width: 32, height: 32)
            .background(Color(.backgroundSecondary))
            .mask(Circle())
    }
}
