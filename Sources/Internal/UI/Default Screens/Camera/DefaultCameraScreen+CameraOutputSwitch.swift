import SwiftUI

extension DefaultCameraScreen { struct CameraOutputSwitch: View {
    let parent: DefaultCameraScreen


    var body: some View {
        HStack(spacing: 4) {
            createOutputTypeButton(.video)
            createOutputTypeButton(.photo)
        }
        .padding(8)
        .background(Color(.backgroundPrimary50))
        .mask(Capsule())
    }
}}
private extension DefaultCameraScreen.CameraOutputSwitch {
    func createOutputTypeButton(_ outputType: CameraOutputType) -> some View {
        Button(icon: getOutputTypeButtonIcon(outputType), active: isOutputTypeButtonActive(outputType)) {
            parent.setOutputType(outputType)
        }
        .rotationEffect(parent.iconAngle)
    }
}

private extension DefaultCameraScreen.CameraOutputSwitch {
    func getOutputTypeButtonIcon(_ outputType: CameraOutputType) -> ImageResource { switch outputType {
        case .photo: return .iconPhoto
        case .video: return .iconVideo
    }}
    func isOutputTypeButtonActive(_ outputType: CameraOutputType) -> Bool {
        outputType == parent.cameraOutputType
    }
}


// MARK: Button
fileprivate struct Button: View {
    let icon: ImageResource
    let active: Bool
    let action: () -> ()


    var body: some View {
        SwiftUI.Button(action: action, label: createButtonLabel).buttonStyle(ButtonScaleStyle())
    }
}
private extension Button {
    func createButtonLabel() -> some View {
        Image(icon)
            .resizable()
            .frame(width: iconSize, height: iconSize)
            .foregroundColor(iconColor)
            .padding(8)
            .background(Color(.backgroundSecondary))
            .mask(Circle())
    }
}
private extension Button {
    var iconSize: CGFloat { switch active {
        case true: 28
        case false: 20
    }}
    var iconColor: Color { switch active {
        case true: .init(.backgroundYellow)
        case false: .init(.textTertiary)
    }}
}
