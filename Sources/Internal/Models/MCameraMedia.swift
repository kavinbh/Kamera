import SwiftUI

public struct MCameraMedia: Sendable {
    let image: UIImage?
    let video: URL?

    init?(data: Any?) {
        if let image = data as? UIImage { self.image = image; self.video = nil }
        else if let video = data as? URL { self.video = video; self.image = nil }
        else { return nil }
    }
}

extension MCameraMedia: Equatable {
    public static func == (lhs: MCameraMedia, rhs: MCameraMedia) -> Bool { lhs.image == rhs.image && lhs.video == rhs.video }
}
