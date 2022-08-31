//
//  Tutorial.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 30/08/22.
//

import Foundation

public struct TutorialStep: Identifiable {
    public var id:UUID = UUID()
    public var sequenceNumber: Int = -1
    public var title: String = ""
    public var mediaSource: String = ""
    public var description: String = ""
    public var mediaType: String = "video" // or "image"
    public var showActionButton: Bool = false
}
