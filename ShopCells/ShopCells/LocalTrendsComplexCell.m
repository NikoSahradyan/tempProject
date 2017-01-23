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
@property (nonatomic) ASTextNode *saleTitle;

@end

@implementation LocalTrendsComplexCell

- (instancetype)initAsBundle:(NSString *)saleTitle {
    self = [self init];
    if (self) {
        _saleTitle = [[ASTextNode alloc] init];
        _saleTitle.attributedText = [[NSAttributedString alloc] initWithString:saleTitle attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

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
    ASStackLayoutSpec *main;
    if (self.saleTitle) {
        main = [ASStackLayoutSpec verticalStackLayoutSpec];
        self.pagerNode.style.preferredSize = CGSizeMake(constrainedSize.max.width, 238);
        self.saleTitle.style.spacingAfter = 12;
        self.saleTitle.style.spacingBefore = 4;
        [main setChildren:@[self.saleTitle, self.pagerNode]];
    } else {
        main = [ASStackLayoutSpec horizontalStackLayoutSpec];
        [main setChild:self.pagerNode];
    }
    return main;
}


- (NSInteger)numberOfPagesInPagerNode:(ASPagerNode *)pagerNode {
    return 10;
}

- (ASCellNodeBlock)pagerNode:(ASPagerNode *)pagerNode nodeBlockAtIndex:(NSInteger)index {
    NSURL *url = [NSURL URLWithString:@"http://cdn2.hubspot.net/hub/53/file-2263493423-jpeg/simple.jpeg"];
    if (self.saleTitle) {
        return ^ {
            ThirdCell *cell = [[ThirdCell alloc] initWithurlArray:@[url,url,url,url] title:@"Merry Christmas Mega Bundle" itemDescription:@"6 packages" salePrice:@"$10.99" oldPrice:@"$12.99"];
            return cell;
        };
        
    } else {
        return ^ {
            ThirdCell *cell = [[ThirdCell alloc] initWithurlArray:@[url,url,url,url] subtext:@"some Text" button:@"#awesome"];
            return cell;
        };
        
    }
}

- (ASSizeRange)pagerNode:(ASPagerNode *)pagerNode constrainedSizeForNodeAtIndex:(NSInteger)index {
    if (self.saleTitle) {
        return ASSizeRangeMake(CGSizeMake(260,0), CGSizeMake(260,260));
    } else {
        return ASSizeRangeMake(CGSizeMake(260,0), CGSizeMake(260,238));
    }
}

@end
