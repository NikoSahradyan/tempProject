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
        _title.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:14]}];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *main = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [main setChild:self.title];
    return main;
}

@end
