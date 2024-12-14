//
//  BarCalc_Watch_AppTests.swift
//  BarCalc Watch AppTests
//
//  Created by Tanya Landsman on 10/17/24.
//

import Testing
@testable import BarMath_Watch_App

struct AppStateTests {

    @Test func test_initialState_hasCorrectDefaults() {
        let subject = AppState()
        #expect(subject.sidePlateWeight == 0)
        #expect(subject.bar == .medium)
        #expect(subject.plateArray == PlateStateFactory.createPlateStates())
    }
    
    @Test func test_whenWeightTapped_TotalIncrementedCorrectly() {
        var subject = AppState()
        reducer(state: &subject, action: .weightTapped(15))
        let expectedTotal = 65
        #expect(subject.total == expectedTotal)
    }
    
    @Test func test_whenResetTapped_TotalResetsToBarWeight() {
        var subject = AppState()
        reducer(state: &subject, action: .weightTapped(5))
        #expect(subject.total == 45)
        #expect(subject.plateArray[1].count == 1)
        reducer(state: &subject, action: .clearTapped)
        #expect(subject.total == subject.bar.rawValue)
        #expect(subject.plateArray[1].count == 0)
    }
    
   
    
    @Test func test_whenSetBarTapped_BarChanged() {
        var subject = AppState(bar: .medium)
        reducer(state: &subject, action: .setBar(.large))
        #expect(subject.bar == Bar.large)
    }

}
