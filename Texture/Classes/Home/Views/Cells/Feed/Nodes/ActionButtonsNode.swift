//
//  ActionButtonsNode.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

class ActionButtonsNode: BaseNode {
    
    // MARK: - Variables
    
    var likeButton = ASButtonNode()
    var commentButton = ASButtonNode()
    var shareButton = ASButtonNode()
    var numberOfLikes = ASTextNode()
    var bookmarkButton = ASButtonNode()
    
    var likeCount: Int = 3
    
    // MARK: - Init
    
    override init() {
        super.init()
        setup()
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let bookMarkStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [bookmarkButton])
        
        let bookMarkLayoutSpec = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8),
            child: bookMarkStack)
        bookMarkLayoutSpec.style.flexGrow = 1
        
        let hStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .start,
            alignItems: .stretch,
            children: [likeButton, commentButton, shareButton, bookMarkLayoutSpec])
        
        let padding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 0),
            child: hStack)
        
        var dynamicLayout = [ASLayoutElement]()
        dynamicLayout.append(padding)
        let dynamicPadding = ASInsetLayoutSpec()
        
        // suppose if count is 0 than this would not be added into the layout
        if likeCount > 0 {
            dynamicPadding.insets = UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 0)
            dynamicPadding.child = numberOfLikes
            dynamicLayout.append(dynamicPadding)
        }
        
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 6,
            justifyContent: .start,
            alignItems: .stretch,
            children: dynamicLayout)
        return vStack
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        likeButton.style.preferredSize = CGSize(width: 30, height: 30)
        commentButton.style.preferredSize = CGSize(width: 30, height: 30)
        shareButton.style.preferredSize = CGSize(width: 30, height: 30)
        
        let imageLike = UIImage(named: "like")
        likeButton.tintColor = .white
        likeButton.setImage(imageLike, for: .normal)
        
        let imageComment = UIImage(named: "comment")
        commentButton.tintColor = .white
        commentButton.setImage(imageComment, for: .normal)
        
        let imageShare = UIImage(named: "share")
        shareButton.tintColor = .white
        shareButton.setImage(imageShare, for: .normal)
        
        let imageBookmark = UIImage(named: "bookmark")
        bookmarkButton.tintColor = .white
        bookmarkButton.setImage(imageBookmark, for: .normal)
        
        numberOfLikes.attributedText = NSAttributedString(string: "3 likes", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)])
    }
}
