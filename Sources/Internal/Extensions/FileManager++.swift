import SwiftUI

extension FileManager {
    static func prepareURLForVideoOutput() -> URL? {
        guard let fileUrl = getFileUrl() else { return nil }

        clearPlaceIfTaken(fileUrl)
        return fileUrl
    }
}
private extension FileManager {
    static func getFileUrl() -> URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(videoPath)
    }
    static func clearPlaceIfTaken(_ url: URL) {
        try? FileManager.default.removeItem(at: url)
    }
}
private extension FileManager {
    static var videoPath: String { "mijick-camera-video-output.mp4" }
}
