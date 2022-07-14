//
//  RoomCaptureModel.swift
//  Roomscanner
//
//  Created by Mikael Deurell on 2022-07-14.
//

import Foundation
import RoomPlan

class RoomCaptureController : ObservableObject, RoomCaptureViewDelegate
{
  static var instance = RoomCaptureController()
  
  @Published var roomCaptureView: RoomCaptureView
  var sessionConfig: RoomCaptureSession.Configuration
  var finalResult: CapturedRoom?
  
  init() {
    roomCaptureView = RoomCaptureView(frame: CGRect(x: 0, y: 0, width: 42, height: 42))
    sessionConfig = RoomCaptureSession.Configuration()
  }
  
  func startSession() {
    roomCaptureView.captureSession.run(configuration: sessionConfig)
  }
  
  func stopSession() {
    roomCaptureView.captureSession.stop()
  }
  
  func captureView(shouldPresent roomDataForProcessing: CapturedRoomData, error: Error?) -> Bool {
    return true
  }
  
  func captureView(didPresent processedResult: CapturedRoom, error: Error?) {
    finalResult = processedResult
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("Not needed.")
  }
  
  func encode(with coder: NSCoder) {
    fatalError("Not needed.")
  }
}
