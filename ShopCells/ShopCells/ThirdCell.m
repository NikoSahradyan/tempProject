//
//  ThirdCell.m
//  ShopCells
//
//  Created by Developer on 20/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "ThirdCell.h"
#import "MultiImage.h"


@interface ThirdCell()
@property (nonatomic) MultiImage *imageSet;
@property (nonatomic) ASTextNode *itemDescrition;

@property (nonatomic) ASButtonNode *hashtag;

@property (nonatomic) ASTextNode *itemName;
@property (nonatomic) ASButtonNode *salePriceButton;
@property (nonatomic) ASTextNode *oldPrice;




@end

@implementation ThirdCell

- (instancetype)initWithurlArray:(NSArray<NSURL *> *)urlArr title:(NSString *)title itemDescription:(NSString *)itemDescription salePrice:(NSString *)salePrice oldPrice:(NSString *)oldPrice {
    self = [super init];
    if (self) {
        _imageSet = [[MultiImage alloc] initWithImageArray:urlArr size:CGSizeMake(130, 90)];
        
        _itemDescrition = [[ASTextNode alloc] init];
        _itemDescrition.attributedText = [[NSAttributedString alloc] initWithString:itemDescription attributes:@{}];
        
        _itemName = [[ASTextNode alloc] init];
        _itemName.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{}];
        [_itemName setMaximumNumberOfLines:2];
        
        _salePriceButton = [[ASButtonNode alloc] init];
        [_salePriceButton setBackgroundColor:[UIColor blueColor]];
        [_salePriceButton setTitle:salePrice withFont:[UIFont systemFontOfSize:12] withColor:[UIColor whiteColor] forState:ASControlStateNormal];
        
        _oldPrice = [[ASTextNode alloc] init];
        _oldPrice.attributedText = [[NSAttributedString alloc] initWithString:oldPrice attributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
        
        self.automaticallyManagesSubnodes = YES;
        
        
    }
    return self;
}

-(instancetype)initWithurlArray:(NSArray<NSURL *> *)urlArr subtext:(NSString *)textOne button:(NSString *)hashTag {
    self = [super init];
    if (self) {
        _imageSet = [[MultiImage alloc] initWithImageArray:urlArr size:CGSizeMake(130, 90)];
        
        _itemDescrition = [[ASTextNode alloc] init];
        _itemDescrition.attributedText = [[NSAttributedString alloc] initWithString:textOne attributes:@{}];
        
        _hashtag = [[ASButtonNode alloc] init];
        [_hashtag setTitle:hashTag withFont:[UIFont boldSystemFontOfSize:14] withColor:[UIColor whiteColor] forState:ASControlStateNormal];
        [_hashtag setBackgroundColor:[UIColor blueColor]];
        _hashtag.style.height = ASDimensionMake(34);
        [_hashtag setContentEdgeInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    
    ASStackLayoutSpec *bottomSpec = [ASStackLayoutSpec horizontalStackLayoutSpec];
    
    if (self.salePriceButton) {
        ASStackLayoutSpec *titleSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
        [titleSpec setChildren:@[self.itemName, self.itemDescrition]];
        titleSpec.style.flexGrow = YES;
        
        ASStackLayoutSpec *priceSpec = [ASStackLayoutSpec verticalStackLayoutSpec];
        [priceSpec setChildren:@[self.salePriceButton, self.oldPrice]];
        priceSpec.style.spacingBefore = 12;
        priceSpec.alignItems = ASStackLayoutAlignItemsCenter;
        
        [bottomSpec setChildren:@[titleSpec, priceSpec]];
    } else {
        ASStackLayoutSpec *hashtag = [ASStackLayoutSpec horizontalStackLayoutSpec];
        [hashtag setChild:self.hashtag];
        hashtag.style.flexGrow = YES;
        hashtag.style.spacingBefore = 12;
        
        self.itemDescrition.style.spacingAfter = 12;
        [bottomSpec setChildren:@[hashtag, self.itemDescrition]];
        
    }
    
    bottomSpec.style.flexGrow = YES;
    bottomSpec.style.spacingBefore = 12;
    bottomSpec.style.spacingAfter = 12;
    bottomSpec.alignItems = ASStackLayoutAlignItemsCenter;
    
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChildren:@[self.imageSet, bottomSpec]];
    
    return main;
}



@end
