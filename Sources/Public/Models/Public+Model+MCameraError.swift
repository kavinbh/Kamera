
import Foundation

public enum MCameraError: Error {
    case microphonePermissionsNotGranted, cameraPermissionsNotGranted
    case cannotSetupInput, cannotSetupOutput, cannotSetupMetalDevice
}
