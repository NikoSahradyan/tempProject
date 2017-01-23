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
        [_button setTitle:@"Free" withFont:[UIFont boldSystemFontOfSize:14] withColor:[UIColor redColor] forState:ASControlStateNormal];
        [_button addTarget:self action:@selector(free) forControlEvents:ASControlNodeEventTouchUpInside];
        
        self.automaticallyManagesSubnodes = YES;
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *textes = [ASStackLayoutSpec verticalStackLayoutSpec];
    [textes setChildren:@[_textOne, _textTwo]];
    textes.style.flexGrow = YES;
    
    ASStackLayoutSpec *textesButton = [ASStackLayoutSpec horizontalStackLayoutSpec];
    [textesButton setChildren:@[textes,_button]];
    textesButton.style.flexGrow = YES;
    textesButton.style.alignSelf = ASStackLayoutAlignSelfStart;
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
