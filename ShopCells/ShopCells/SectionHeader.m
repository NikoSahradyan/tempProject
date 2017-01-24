//
//  SectionHeader.m
//  ShopCells
//
//  Created by Developer on 22/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "SectionHeader.h"

@interface SectionHeader()

@property (nonatomic) ASTextNode *title;

@end

@implementation SectionHeader

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _title = [[ASTextNode alloc] init];
        _title.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:17], NSForegroundColorAttributeName: [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]}];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *subMain = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [subMain setChild:self.title];
    self.title.style.spacingBefore = 18;
    subMain.style.spacingBefore = 24;
    
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChild:subMain];
        
    return main;
}

@end
