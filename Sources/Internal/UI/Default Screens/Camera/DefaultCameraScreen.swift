
import SwiftUI

public struct DefaultCameraScreen: MCameraScreen {
    @ObservedObject public var cameraManager: CameraManager
    public let namespace: Namespace.ID
    public let closeMCameraAction: () -> ()
    var config: Config = .init()


    public var body: some View {
        ZStack {
            createContentView()
            createTopBar()
            createBottomBar()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.backgroundPrimary).ignoresSafeArea())
        .statusBarHidden()
        .animation(.mSpring)
    }
}
private extension DefaultCameraScreen {
    func createTopBar() -> some View {
        DefaultCameraScreen.TopBar(parent: self)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    func createContentView() -> some View {
        createCameraOutputView()
            .ignoresSafeArea()
    }
    func createBottomBar() -> some View {
        DefaultCameraScreen.BottomBar(parent: self)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

extension DefaultCameraScreen {
    var iconAngle: Angle { switch isOrientationLocked {
        case true: deviceOrientation.getAngle()
        case false: .zero
    }}
}
