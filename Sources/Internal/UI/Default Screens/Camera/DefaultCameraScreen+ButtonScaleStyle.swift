import SwiftUI

struct ButtonScaleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View { configuration
        .label
        .scaleEffect(configuration.isPressed ? 0.96 : 1)
    }
}
