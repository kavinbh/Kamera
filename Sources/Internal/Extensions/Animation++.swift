import SwiftUI
extension Animation {
    static var mSpring: Animation { .spring(duration: duration, bounce: 0, blendDuration: 0) }
}
extension Animation {
    static var duration: CGFloat { 0.3 }
}
