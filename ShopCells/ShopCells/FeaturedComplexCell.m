//
//  FeaturedComplexCell.m
//  ShopCells
//
//  Created by Developer on 22/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "FeaturedComplexCell.h"
#import "FirstCell.h"

@interface FeaturedComplexCell()<ASPagerDelegate, ASPagerDataSource>

@property (nonatomic) ASPagerNode *pagerNode;

@property (nonatomic) ASTextNode *headerText;


@end

@implementation FeaturedComplexCell

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
        
        _headerText = [[ASTextNode alloc] init];
        _headerText.attributedText = [[NSAttributedString alloc] initWithString:@"headerText" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17], NSForegroundColorAttributeName: [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]}];
        
        self.automaticallyManagesSubnodes = YES;
        
        [self addSubnode:_pagerNode];
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *header = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [header setChild:self.headerText];
    header.style.spacingBefore = 24;
    header.style.spacingAfter = 12;
    
    self.pagerNode.style.flexGrow = YES;
    ASStackLayoutSpec *body = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [body setChild:self.pagerNode];
    
//    ASStackLayoutSpec *subMain = [ASStackLayoutSpec horizontalStackLayoutSpec];
//    [subMain setChild:self.title];
//    self.title.style.spacingBefore = 18;
//    subMain.style.spacingBefore = 24;
    
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChildren:@[header, body]];
//    header.style.spacingAfter = 100;
    return main;
}


- (NSInteger)numberOfPagesInPagerNode:(ASPagerNode *)pagerNode {
    return 10;
}

- (ASCellNodeBlock)pagerNode:(ASPagerNode *)pagerNode nodeBlockAtIndex:(NSInteger)index {
    NSURL *url = [NSURL URLWithString:@"http://cdn2.hubspot.net/hub/53/file-2263493423-jpeg/simple.jpeg"];
    return ^ {
        FirstCell *cell = [[FirstCell alloc] initWithURL:url textOne:@"TEXT ONE" textTwo:@"TEXT TWO"];
//        FirstCell *cell = [[FirstCell alloc] initWithURL:url hashTag:@"#hashTag" packagesCount:@"8 packages"];
        return cell;
    };
}

- (ASSizeRange)pagerNode:(ASPagerNode *)pagerNode constrainedSizeForNodeAtIndex:(NSInteger)index {
    return ASSizeRangeMake(CGSizeMake(260,0), CGSizeMake(260,240));
}

@end
