//
//  StoryCell.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

class StoryCellNode: ASCellNode, ASCollectionDelegate, ASCollectionDataSource {
    
    // MARK: - Variables
    
    let width = UIScreen.main.bounds.width
    var collectionNode: ASCollectionNode = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 60, height: 60)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        collectionNode.showsHorizontalScrollIndicator = false
        collectionNode.backgroundColor = .clear
        return collectionNode
    }()
    
    // MARK: - Init
    
    override init() {
        super.init()
        collectionNode.dataSource = self
        collectionNode.delegate = self
        setup()
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: collectionNode)
    }
    
    // MARK: - ASCollectionDelegate
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        return ASSizeRangeMake(CGSize(width:80, height: 0), CGSize(width: 80, height: CGFloat.greatestFiniteMagnitude))
    }
    
    // MARK: - ASCollectionDataSource
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 3
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else {
            return 5
        }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        return {
            
            if indexPath.section == 0 {
                let cell = UserStoryNode()
                return cell
            } else if indexPath.section == 1 {
                let cell = StoryNode()
                cell.populate(name: "Jake Mendis", isWatched: false)
                return cell
            } else {
                let cell = StoryNode()
                cell.populate(name: "Chris Brown", isWatched: true)
                return cell
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        self.automaticallyManagesSubnodes = true
        collectionNode.delegate = self
        collectionNode.style.preferredSize = CGSize(width: width, height: 120)
    }
}
