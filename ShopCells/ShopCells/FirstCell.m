//
//  FirstCell.m
//  ShopCells
//
//  Created by Developer on 19/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "FirstCell.h"

@interface FirstCell()
@property (nonatomic) ASNetworkImageNode *image;
@property (nonatomic) ASTextNode *textOne;
@property (nonatomic) ASTextNode *textTwo;
@property (nonatomic) ASButtonNode *button;

@property (nonatomic) ASButtonNode *hashTag;
@property (nonatomic) ASTextNode *packagesCount;
@end

@implementation FirstCell

- (instancetype)initWithURL:(NSURL *)imageUrl textOne:(NSString *)textOne textTwo:(NSString *)textTwo {
    self = [super init];
    if (self) {
        _image = [[ASNetworkImageNode alloc] init];
        _image.style.preferredSize = CGSizeMake(260, 180);
        _image.URL = imageUrl;
        _image.backgroundColor = [UIColor grayColor];
        
        _textOne = [[ASTextNode alloc] init];
        _textOne.attributedText = [[NSAttributedString alloc] initWithString:textOne attributes:@{}];
        
        _textTwo = [[ASTextNode alloc] init];
        _textTwo.attributedText = [[NSAttributedString alloc] initWithString:textTwo attributes:@{}];
        
        _button = [[ASButtonNode alloc] init];
        [_button setTitle:@"$1.99" withFont:[UIFont boldSystemFontOfSize:14] withColor:[UIColor colorWithRed:1 green:0.40 blue:0.6 alpha:1] forState:ASControlStateNormal];
        [_button setBorderWidth:2];
        _button.cornerRadius = 5;
        [_button setBorderColor:[[UIColor colorWithRed:1 green:0.40 blue:0.6 alpha:1] CGColor]];
        [_button setContentEdgeInsets:UIEdgeInsetsMake(4, 8, 4, 8)];
        
        [_button addTarget:self action:@selector(free) forControlEvents:ASControlNodeEventTouchUpInside];
        
        self.automaticallyManagesSubnodes = YES;
        
    }
    return self;
}

- (instancetype)initWithURL:(NSURL *)imageUrl hashTag:(NSString *)hashTag packagesCount:(NSString *)packagesCount {
    self = [super init];
    if (self) {
        _image = [[ASNetworkImageNode alloc] init];
        _image.style.preferredSize = CGSizeMake(260, 180);
        _image.URL = imageUrl;
        _image.backgroundColor = [UIColor grayColor];
        
        _hashTag = [[ASButtonNode alloc] init];
        [_hashTag setTitle:hashTag withFont:[UIFont boldSystemFontOfSize:15] withColor:[UIColor whiteColor] forState:ASControlStateNormal];
        [_hashTag setBackgroundColor:[UIColor colorWithRed:0.47 green:0.3 blue:0.62 alpha:1]];
        [_hashTag setContentEdgeInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
        _hashTag.cornerRadius = 6;
        
        _packagesCount = [[ASTextNode alloc] init];
        _packagesCount.attributedText = [[NSAttributedString alloc] initWithString:packagesCount attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:12], NSForegroundColorAttributeName: [UIColor grayColor]}];
        
        self.automaticallyManagesSubnodes = YES;
    }
    return self;
}


- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *textesButton = [ASStackLayoutSpec horizontalStackLayoutSpec];
    
    if (!self.hashTag) {
        ASStackLayoutSpec *textes = [ASStackLayoutSpec verticalStackLayoutSpec];
        [textes setChildren:@[_textOne, _textTwo]];
        textes.style.flexGrow = YES;
        [textesButton setChildren:@[textes,_button]];
    } else {
        ASStackLayoutSpec *hashtag = [ASStackLayoutSpec horizontalStackLayoutSpec];
        [hashtag setChild:self.hashTag];
        hashtag.style.flexGrow = YES;
        [textesButton setChildren:@[hashtag,_packagesCount]];
    }
    
    textesButton.style.flexGrow = YES;
    textesButton.alignItems = ASStackLayoutAlignItemsCenter;
    textesButton.style.spacingAfter = 12;
    textesButton.style.spacingBefore = 12;
    
    ASStackLayoutSpec *textesButtonLarge = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [textesButtonLarge setChildren:@[textesButton]];
    textesButtonLarge.alignItems = ASStackLayoutAlignItemsStart;
    textesButtonLarge.style.flexGrow = YES;
    textesButtonLarge.style.spacingAfter = 12;
    textesButtonLarge.style.spacingBefore = 12;
    
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChildren:@[_image, textesButtonLarge]];
    main.style.flexGrow = YES;
    return main;

}

- (void)free {
    
}

@end
