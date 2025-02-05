

import SwiftUI

// MARK: Getters
public extension MCameraMedia {
    /**
     Gets the image from the media object.
     */
    func getImage() -> UIImage? { image }

    /**
     Gets the video URL from the media object.
     */
    func getVideo() -> URL? { video }
}
