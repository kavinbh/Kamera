import SwiftUI

extension DefaultCameraScreen { struct CaptureButton: View {
    let outputType: CameraOutputType
    let isRecording: Bool
    let action: () -> ()


    var body: some View {
        Button(action: action, label: createButtonLabel).buttonStyle(ButtonScaleStyle())
    }
}}
private extension DefaultCameraScreen.CaptureButton {
    func createButtonLabel() -> some View {
        ZStack {
            createBackground()
            createBorders()
        }.frame(width: 72, height: 72)
    }
}
private extension DefaultCameraScreen.CaptureButton {
    func createBackground() -> some View {
        RoundedRectangle(cornerRadius: backgroundCornerRadius, style: .continuous)
            .fill(backgroundColor)
            .padding(backgroundPadding)
    }
    func createBorders() -> some View {
        Circle().stroke(Color(.backgroundInverted), lineWidth: 2.5)
    }
}
private extension DefaultCameraScreen.CaptureButton {
    var backgroundColor: Color { switch outputType {
        case .photo: .init(.backgroundInverted)
        case .video: .init(.backgroundRed)
    }}
    var backgroundCornerRadius: CGFloat { switch isRecording {
        case true: 6
        case false: 36
    }}
    var backgroundPadding: CGFloat { switch isRecording {
        case true: 20
        case false: 4
    }}
}
