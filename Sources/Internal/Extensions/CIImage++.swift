import SwiftUI

extension CIImage {
    func applyingFilters(_ filters: [CIFilter]) -> CIImage {
        var ciImage = self
        filters.forEach {
            $0.setValue(ciImage, forKey: kCIInputImageKey)
            ciImage = $0.outputImage ?? ciImage
        }
        return ciImage
    }
}
