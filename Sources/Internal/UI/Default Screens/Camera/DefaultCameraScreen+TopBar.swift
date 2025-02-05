import SwiftUI

extension DefaultCameraScreen { struct TopBar: View {
    let parent: DefaultCameraScreen


    var body: some View { if isTopBarActive {
        ZStack {
            createCloseButton()
            createCentralView()
            createRightSideView()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, topPadding)
        .padding(.bottom, 8)
        .padding(.horizontal, 20)
        .background(Color(.backgroundPrimary80))
        .transition(.move(edge: .top))
    }}
}}
private extension DefaultCameraScreen.TopBar {
    @ViewBuilder func createCloseButton() -> some View { if isCloseButtonActive {
        CloseButton(action: parent.closeMCameraAction)
            .frame(maxWidth: .infinity, alignment: .leading)
    }}
    @ViewBuilder func createCentralView() -> some View { if isCentralViewActive {
        Text(parent.recordingTime.toString())
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.init(.textPrimary))
    }}
    @ViewBuilder func createRightSideView() -> some View { if isRightSideViewActive {
        HStack(spacing: 12) {
            createGridButton()
            createFlipOutputButton()
            createFlashButton()
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }}
}
private extension DefaultCameraScreen.TopBar {
    @ViewBuilder func createGridButton() -> some View { if isGridButtonActive {
        DefaultCameraScreen.TopButton(
            icon: gridButtonIcon,
            iconRotationAngle: parent.iconAngle,
            action: changeGridVisibility
        )
    }}
    @ViewBuilder func createFlipOutputButton() -> some View { if isFlipOutputButtonActive {
        DefaultCameraScreen.TopButton(
            icon: flipButtonIcon,
            iconRotationAngle: parent.iconAngle,
            action: changeMirrorOutput
        )
    }}
    @ViewBuilder func createFlashButton() -> some View { if isFlashButtonActive {
        DefaultCameraScreen.TopButton(
            icon: flashButtonIcon,
            iconRotationAngle: parent.iconAngle,
            action: changeFlashMode
        )
    }}
}

private extension DefaultCameraScreen.TopBar {
    func changeGridVisibility() {
        parent.setGridVisibility(!parent.isGridVisible)
    }
    func changeMirrorOutput() {
        parent.setMirrorOutput(!parent.isOutputMirrored)
    }
    func changeFlashMode() {
        parent.setFlashMode(parent.flashMode.next())
    }
}

private extension DefaultCameraScreen.TopBar {
    var topPadding: CGFloat { switch parent.deviceOrientation {
        case .portrait, .portraitUpsideDown: return 40
        default: return 20
    }}
}
private extension DefaultCameraScreen.TopBar {
    var gridButtonIcon: ImageResource { switch parent.isGridVisible {
        case true: .iconGridOn
        case false: .iconGridOff
    }}
    var flipButtonIcon: ImageResource { switch parent.isOutputMirrored {
        case true: .iconFlipOn
        case false: .iconFlipOff
    }}
    var flashButtonIcon: ImageResource { switch parent.flashMode {
        case .off: .iconFlashOff
        case .on: .iconFlashOn
        case .auto: .iconFlashAuto
    }}
}
private extension DefaultCameraScreen.TopBar {
    var isTopBarActive: Bool { parent.cameraManager.captureSession.isRunning }
    var isCloseButtonActive: Bool { parent.config.closeButtonAllowed && !parent.isRecording }
    var isCentralViewActive: Bool { parent.isRecording }
    var isRightSideViewActive: Bool { !parent.isRecording }
    var isGridButtonActive: Bool { parent.config.gridButtonAllowed }
    var isFlipOutputButtonActive: Bool { parent.config.flipButtonAllowed && parent.cameraPosition == .front }
    var isFlashButtonActive: Bool { parent.config.flashButtonAllowed && parent.hasFlash && parent.cameraOutputType == .photo }
}
