//
//  TutorialViewModel.swift
//  Fineminton
//
//  Created by Yoppy Yunhasnawa on 30/08/22.
//

import Foundation

@MainActor public class TutorialViewModel : ObservableObject {
    
    private var tutorialModel: TutorialModel = TutorialModel.getInstance()
    
    @Published public var tutorialSteps: Array<TutorialStep> = Array()
    
    public init() {
        self.tutorialSteps = self.tutorialModel.getStepList()
    }
    
}
