
import Foundation

extension CaseIterable where Self: Equatable {
    func next() -> Self {
        guard let index = Self.allCases.firstIndex(of: self) else { return self }
        
        let nextIndex = Self.allCases.index(after: index)
        return Self.allCases[nextIndex == Self.allCases.endIndex ? Self.allCases.startIndex : nextIndex]
    }
}
