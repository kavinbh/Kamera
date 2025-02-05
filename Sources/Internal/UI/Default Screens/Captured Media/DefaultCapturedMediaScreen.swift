import SwiftUI
import AVKit

struct DefaultCapturedMediaScreen: MCapturedMediaScreen {
    let capturedMedia: MCameraMedia
    let namespace: Namespace.ID
    let retakeAction: () -> ()
    let acceptMediaAction: () -> ()
    @State private var player: AVPlayer = .init()
    @State private var isInitialized: Bool = false


    var body: some View {
        ZStack {
            createContentView()
            createButtons()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.backgroundPrimary).ignoresSafeArea())
        .animation(.mSpring, value: isInitialized)
        .onAppear { isInitialized = true }
    }
}
private extension DefaultCapturedMediaScreen {
    @ViewBuilder func createContentView() -> some View { if isInitialized {
        if let image = capturedMedia.getImage() { createImageView(image) }
        else if let video = capturedMedia.getVideo() { createVideoView(video) }
    }}
    func createButtons() -> some View {
        HStack(spacing: 32) {
            createRetakeButton()
            createSaveButton()
        }
        .padding(.top, 12)
        .padding(.bottom, 4)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 8)
    }
}
private extension DefaultCapturedMediaScreen {
    func createImageView(_ image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea()
            .transition(.scale(scale: 1.1))
    }
    func createVideoView(_ video: URL) -> some View {
        VideoPlayer(player: player)
            .onAppear { onVideoAppear(video) }
    }
    @ViewBuilder func createRetakeButton() -> some View { if isInitialized {
        BottomButton(
            icon: .iconCancel,
            iconColor: .init(.backgroundInverted),
            backgroundColor: .init(.backgroundSecondary),
            rotationAngle: .zero,
            action: retakeAction
        )
        .transition(.scale)
    }}
    @ViewBuilder func createSaveButton() -> some View { if isInitialized {
        BottomButton(
            icon: .iconCheck,
            iconColor: .init(.backgroundPrimary),
            backgroundColor: .init(.backgroundInverted),
            rotationAngle: .zero,
            action: acceptMediaAction
        )
        .transition(.scale)
    }}
}

private extension DefaultCapturedMediaScreen {
    func onVideoAppear(_ url: URL) {
        player = .init(url: url)
        player.play()
    }
}
