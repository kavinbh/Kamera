import SwiftUI

struct CloseButton: View {
    let action: () -> ()


    var body: some View {
        Button(action: action, label: createButtonLabel)
    }
}
private extension CloseButton {
    func createButtonLabel() -> some View {
        Image(.iconCancel)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(Color(.backgroundInverted))
    }
}
