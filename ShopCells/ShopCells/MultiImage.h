//
//  MultiImage.h
//  ShopCells
//
//  Created by Developer on 20/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface MultiImage : ASDisplayNode

@property (nonatomic) CGSize size;

- (instancetype)initWithImageArray:(NSArray<NSURL *> *)urlArray size:(CGSize)size;



@end
