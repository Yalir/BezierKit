//
//  BezierCurveTests.swift
//  BezierKit
//
//  Created by Holmes Futrell on 12/31/17.
//  Copyright © 2017 Holmes Futrell. All rights reserved.
//

import XCTest
import BezierKit

class BezierCurveTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScaleDistance() {
        // line segment
        let epsilon: BKFloat = 1.0e-9
        let l = LineSegment(p0: BKPoint(x: 1.0, y: 2.0), p1: BKPoint(x: 5.0, y: 6.0))
        let ls = l.scale(distance: sqrt(2)) // (moves line up and left by 1,1)
        XCTAssertEqual(ls, LineSegment(p0: BKPoint(x: 0.0, y: 3.0), p1: BKPoint(x: 4.0, y: 7.0)))
        
        // quadratic
        let q = QuadraticBezierCurve(p0: BKPoint(x: 1.0, y: 1.0),
                                     p1: BKPoint(x: 2.0, y: 2.0),
                                     p2: BKPoint(x: 3.0, y: 1.0))
        let qs = q.scale(distance: sqrt(2))
        let expectedQuadratic = QuadraticBezierCurve(p0: BKPoint(x: 0.0, y: 2.0),
                                                p1: BKPoint(x: 2.0, y: 4.0),
                                                p2: BKPoint(x: 4.0, y: 2.0))
        XCTAssert(BezierKitTests.curveControlPointsEqual(curve1: qs, curve2: expectedQuadratic, accuracy: epsilon))
        // cubic
        let c = CubicBezierCurve(p0: BKPoint(x: -4.0, y: +0.0),
                                 p1: BKPoint(x: -2.0, y: +2.0),
                                 p2: BKPoint(x: +2.0, y: +2.0),
                                 p3: BKPoint(x: +4.0, y: +0.0))
        let cs = c.scale(distance: 2.0 * sqrt(2))
        let expectedCubic = CubicBezierCurve(p0: BKPoint(x: -6.0, y: +2.0),
                                p1: BKPoint(x: -3.0, y: +5.0),
                                p2: BKPoint(x: +3.0, y: +5.0),
                                p3: BKPoint(x: +6.0, y: +2.0))
        XCTAssert(BezierKitTests.curveControlPointsEqual(curve1: cs, curve2: expectedCubic, accuracy: epsilon))

    }
    
    func testScaleDistanceDegenerate() {
        // todo: test when normals are parallel for quadratic and cubic
    }

}
