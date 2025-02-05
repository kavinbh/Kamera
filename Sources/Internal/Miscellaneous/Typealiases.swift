import SwiftUI

public typealias CameraScreenBuilder = (CameraManager, Namespace.ID, _ closeMCameraAction: @escaping () -> ()) -> any MCameraScreen
public typealias CapturedMediaScreenBuilder = (MCameraMedia, Namespace.ID, _ retakeAction: @escaping () -> (), _ acceptMediaAction: @escaping () -> ()) -> any MCapturedMediaScreen
public typealias ErrorScreenBuilder = (MCameraError, _ closeMCameraAction: @escaping () -> ()) -> any MCameraErrorScreen
