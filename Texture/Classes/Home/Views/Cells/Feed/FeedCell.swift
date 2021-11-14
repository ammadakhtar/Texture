//
//  FeedCell.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

class FeedCell: BaseCellNode {
    
    // MARK: - Variables
    
    let headerNode = HeaderNode()
    let imageNode = ImageNode()
    let actionButtonsNode = ActionButtonsNode()
    let latestCommentNode = CommentNode()
    
    // MARK: - Init
    
    override init() {
        super.init()
    }
    
    // MARK: - LayoutSpec

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [headerNode, imageNode, actionButtonsNode, latestCommentNode])
        return vStack
    }
}
