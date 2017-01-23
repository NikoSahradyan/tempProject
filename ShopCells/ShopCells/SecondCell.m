//
//  SecondCell.m
//  ShopCells
//
//  Created by Developer on 20/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "SecondCell.h"
@interface SecondCell()
@property (nonatomic) ASNetworkImageNode *image;
@property (nonatomic) ASDisplayNode *line;
@property (nonatomic) ASTextNode *title;
@end

@implementation SecondCell

- (instancetype)initWithURL:(NSURL *)url title:(NSString *)title {
    self = [super init];
    if (self) {
        _image = [[ASNetworkImageNode alloc] init];
        _image.style.preferredSize = CGSizeMake(122, 122);
        _image.URL = url;
        _image.backgroundColor = [UIColor grayColor];
        
        _line = [[ASDisplayNode alloc] init];
        _line.style.height = ASDimensionMake(2);
        _line.style.width = ASDimensionMake(122);
        _line.backgroundColor = [UIColor grayColor];
        
        _title = [[ASTextNode alloc] init];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        _title.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{NSParagraphStyleAttributeName : style,
                                                                                              NSFontAttributeName : [UIFont systemFontOfSize:14]}];
        [_title setMaximumNumberOfLines:2];
        
        
        self.automaticallyManagesSubnodes = YES;
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    self.title.style.spacingBefore = 8;
    
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChildren:@[self.image, self.line, self.title]];
    return main;
}

@end
