//
//  HomeNode.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

final class HomeNode: BaseNode, ASTableDelegate, ASTableDataSource {
    
    // MARK: - Variables
    
    private lazy var tableNode: ASTableNode = ASTableNode(style: .plain)
    
    // MARK: - Init
    
    override init() {
        super.init()
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.allowsSelection = false
        tableNode.view.showsVerticalScrollIndicator = false
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASWrapperLayoutSpec(layoutElement: tableNode)
    }
    
    // MARK: - ASTableDelegate
    
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let width = UIScreen.main.bounds.width
        return ASSizeRangeMake(CGSize(width: width, height: 0), CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
    
    // MARK: - ASTableDataSource
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 2
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 20
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { () ->  ASCellNode in
            
            if indexPath.section == 0 {
                let cellNode = StoryCellNode()
                return cellNode
            }
            
            let cellNode = FeedCell()
            return cellNode
        }
        return cellNodeBlock
    }
}
