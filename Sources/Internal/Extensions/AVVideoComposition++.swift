
import AVKit

extension AVVideoComposition {
    static func applyFilters(to asset: AVAsset, applyFiltersAction: @Sendable @escaping (AVAsynchronousCIImageFilteringRequest) -> ()) async throws -> AVVideoComposition {
        if #available(iOS 16.0, *) { return try await AVVideoComposition.videoComposition(with: asset, applyingCIFiltersWithHandler: applyFiltersAction) }
        return AVVideoComposition(asset: asset, applyingCIFiltersWithHandler: applyFiltersAction)
    }
}
