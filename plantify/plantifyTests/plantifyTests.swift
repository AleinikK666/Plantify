//
//  plantifyTests.swift
//  plantifyTests
//
//  Created by Екатерина Алейник on 18.05.25.
//

import XCTest
@testable import plantify

class GalleryCollectionViewCellTests: XCTestCase {
    
    var cell: GalleryCollectionViewCell!
    
    override func setUp() {
        super.setUp()
        cell = GalleryCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
    }
    
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    // MARK: - Initialization Tests
    func testCellHasImageView() {
        XCTAssertNotNil(cell.mainImageView)
        XCTAssertTrue(cell.mainImageView.isDescendant(of: cell))
    }
    
    func testCellHasLabel() {
        XCTAssertNotNil(cell.nameLabel)
        XCTAssertTrue(cell.nameLabel.isDescendant(of: cell))
    }
    
    // MARK: - Layout Tests
    func testImageViewConstraints() {
        cell.layoutIfNeeded() // Активируем констрейнты
        
        // Проверяем размеры imageView
        XCTAssertEqual(cell.mainImageView.frame.width, cell.frame.width * 0.2, accuracy: 0.1)
        XCTAssertEqual(cell.mainImageView.frame.height, cell.frame.height, accuracy: 0.1)
        
        // Проверяем позиционирование
        XCTAssertEqual(cell.mainImageView.frame.maxX, cell.frame.width - 10, accuracy: 0.1)
    }
    
    func testNameLabelConstraints() {
        cell.layoutIfNeeded()
        
        // Проверяем отступ слева
        XCTAssertEqual(cell.nameLabel.frame.minX, 20, accuracy: 0.1)
        
        // Проверяем высоту
        XCTAssertEqual(cell.nameLabel.frame.height, cell.frame.height, accuracy: 0.1)
    }
    
    // MARK: - Configuration Tests
    func testCellBackgroundColor() {
        let expectedColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        XCTAssertEqual(cell.backgroundColor, expectedColor)
    }
    
    func testImageViewContentMode() {
        XCTAssertEqual(cell.mainImageView.contentMode, .scaleAspectFit)
    }
    
    func testLabelFontAndColor() {
        XCTAssertEqual(cell.nameLabel.font, UIFont.systemFont(ofSize: 18, weight: .light))
        XCTAssertEqual(cell.nameLabel.textColor, .black)
    }
    
    // MARK: - Reuse Identifier
    func testCellReuseIdentifier() {
        XCTAssertEqual(GalleryCollectionViewCell.reuseId, "GalleryCollectionViewCell")
    }
}
