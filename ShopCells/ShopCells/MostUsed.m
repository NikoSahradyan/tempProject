//
//  MostUsed.m
//  ShopCells
//
//  Created by Developer on 20/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "MostUsed.h"

@interface MostUsed()
@property (nonatomic) ASNetworkImageNode *image;
@property (nonatomic) ASTextNode *title;
@property (nonatomic) ASTextNode *info;
@property (nonatomic) ASButtonNode *mainButton;
@end

@implementation MostUsed

- (instancetype)initWithUrl:(NSURL *)url title:(NSString *)title info:(NSString *)info {
    self = [super init];
    if (self) {
        
        _image = [[ASNetworkImageNode alloc] init];
        _image.URL = url;
        
        _title = [[ASTextNode alloc] init];
        _title.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{}];
        
        _info = [[ASTextNode alloc] init];
        _info.attributedText = [[NSAttributedString alloc] initWithString:info attributes:@{}];
        
        _mainButton = [[ASButtonNode alloc] init];
        [_mainButton setTitle:@"FREE" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor redColor] forState:ASControlStateNormal];
        
        self.automaticallyManagesSubnodes = YES;
        
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.image.style.preferredSize = CGSizeMake(constrainedSize.max.width, 108);
    self.title.style.spacingBefore = 8;
    self.info.style.spacingBefore = 4;
    ASStackLayoutSpec *main = [ASStackLayoutSpec verticalStackLayoutSpec];
    [main setChildren:@[self.image, self.title, self.info, self.mainButton]];
    main.alignItems = ASStackLayoutAlignItemsCenter;
    
    //ASInsetLayoutSpec *mainInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 20, 0, 20) child:main];
    return main;
}

@end
