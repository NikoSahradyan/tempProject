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
@property (nonatomic) ASTextNode *seeAll;



@end

@implementation SeeAll

-(instancetype)initWithurlArray:(NSArray<NSURL *> *)urlArr subtext:(NSString *)textOne button:(NSString *)hashTag {
    self = [super init];
    if (self) {
        _imageSet = [[MultiImage alloc] initWithImageArray:urlArr size:CGSizeMake(130, 90)];
        
        _seeAll = [[ASTextNode alloc] init];
        _seeAll.attributedText = [[NSAttributedString alloc] initWithString:@"See All" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:12], NSForegroundColorAttributeName: [UIColor blackColor]}];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

        ASStaticLayoutSpec *backgroundImageStaticSpec = [ASStaticLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingSizeToFit children:@[self.imageSet]];
        
        UIEdgeInsets insets = UIEdgeInsetsMake(65 , 65 , 45, 45);
        ASInsetLayoutSpec *textInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets child:self.seeAll];
        
        ASOverlayLayoutSpec *textOverlaySpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:backgroundImageStaticSpec
                                                                                       overlay:textInsetSpec];
        

    return textOverlaySpec;
}



@end
