//
//  MultiImage.m
//  ShopCells
//
//  Created by Developer on 20/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "MultiImage.h"

@interface MultiImage()

@property (nonatomic) ASNetworkImageNode *topLeft;
@property (nonatomic) ASNetworkImageNode *topRight;
@property (nonatomic) ASNetworkImageNode *bottomLeft;
@property (nonatomic) ASNetworkImageNode *bottomRight;

@end

@implementation MultiImage

- (instancetype)initWithImageArray:(NSArray<NSURL *> *)urlArray size:(CGSize)size{
    self = [super init];
    if (self) {
        _size = size;
        
        _topLeft = [[ASNetworkImageNode alloc] init];
        _topLeft.URL = urlArray[0];
        _topLeft.style.preferredSize = size;
        
        _topRight = [[ASNetworkImageNode alloc] init];
        _topRight.URL = urlArray[1];
        _topRight.style.preferredSize = size;
        
        _bottomLeft = [[ASNetworkImageNode alloc] init];
        _bottomLeft.URL = urlArray[2];
        _bottomLeft.style.preferredSize = size;
        
        _bottomRight = [[ASNetworkImageNode alloc] init];
        _bottomRight.URL = urlArray[3];
        _bottomRight.style.preferredSize = size;
        
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *firstRow = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [firstRow setChildren:@[self.topLeft, self.topRight]];
    
    ASStackLayoutSpec *secondRow = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [secondRow setChildren:@[self.bottomLeft, self.bottomRight]];
    
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChildren:@[firstRow, secondRow]];
    return main;
}

- (void)setSize:(CGSize)size {
    _size = size;
    self.topLeft.style.preferredSize = size;
    self.topRight.style.preferredSize = size;
    self.bottomLeft.style.preferredSize = size;
    self.bottomRight.style.preferredSize = size;
    
}

@end
