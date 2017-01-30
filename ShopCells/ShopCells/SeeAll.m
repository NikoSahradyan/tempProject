//
//  SeeAll.m
//  ShopCells
//
//  Created by Hayk Brsoyan on 1/30/17.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "SeeAll.h"
#import "MultiImage.h"

@interface SeeAll ()

@property (nonatomic) MultiImage *imageSet;
@property (nonatomic) ASButtonNode *seeAll;



@end

@implementation SeeAll

-(instancetype)initWithurlArray:(NSArray<NSURL *> *)urlArr subtext:(NSString *)textOne button:(NSString *)hashTag {
    self = [super init];
    if (self) {
        _imageSet = [[MultiImage alloc] initWithImageArray:urlArr size:CGSizeMake(130, 90)];
        
        _seeAll = [[ASButtonNode alloc] init];
        [_seeAll setTitle:@"$1.99" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor colorWithRed:1 green:0.40 blue:0.6 alpha:1] forState:ASControlStateNormal];
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

    
    self.seeAll.contentVerticalAlignment = ASVerticalAlignmentCenter;
    self.seeAll.contentHorizontalAlignment = ASHorizontalAlignmentMiddle;

    
    
    ASStaticLayoutSpec *backgroundImageStaticSpec = [ASStaticLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingSizeToFit children:@[self.imageSet]];
    self.seeAll.style.alignSelf = ASStackLayoutAlignSelfCenter;
    ASOverlayLayoutSpec *main = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:backgroundImageStaticSpec
                                                                        overlay:self.seeAll];
    
    return main;
}



@end
