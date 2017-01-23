//
//  LocalTrendsComplexCell.m
//  ShopCells
//
//  Created by Developer on 23/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "LocalTrendsComplexCell.h"
#import "ThirdCell.h"

@interface LocalTrendsComplexCell() <ASPagerDataSource, ASPagerDelegate>

@property (nonatomic) ASPagerNode *pagerNode;

@end

@implementation LocalTrendsComplexCell

- (instancetype)init {
    self = [super init];
    if (self) {
        //UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        ASPagerFlowLayout *layout = [[ASPagerFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;;
        _pagerNode = [[ASPagerNode alloc] initWithCollectionViewLayout:layout];
        _pagerNode.delegate = self;
        _pagerNode.dataSource = self;
        [self addSubnode:_pagerNode];
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.pagerNode.style.flexGrow = YES;
    ASStackLayoutSpec *main = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [main setChild:self.pagerNode];
    return main;
}


- (NSInteger)numberOfPagesInPagerNode:(ASPagerNode *)pagerNode {
    return 10;
}

- (ASCellNodeBlock)pagerNode:(ASPagerNode *)pagerNode nodeBlockAtIndex:(NSInteger)index {
    NSURL *url = [NSURL URLWithString:@"http://cdn2.hubspot.net/hub/53/file-2263493423-jpeg/simple.jpeg"];
    return ^ {
        ThirdCell *cell = [[ThirdCell alloc] initWithurlArray:@[url,url,url,url] subtext:@"some Text" button:@"awesome"];
        return cell;
    };
}

- (ASSizeRange)pagerNode:(ASPagerNode *)pagerNode constrainedSizeForNodeAtIndex:(NSInteger)index {
    return ASSizeRangeMake(CGSizeMake(260,0), CGSizeMake(260,238));
}

@end
