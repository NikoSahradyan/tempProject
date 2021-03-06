//
//  ThirdCell.h
//  ShopCells
//
//  Created by Developer on 20/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ThirdCell : ASCellNode

- (instancetype)initWithurlArray:(NSArray<NSURL *> *)urlArr subtext:(NSString *)textOne button:(NSString *)hashTag;

- (instancetype)initWithurlArray:(NSArray<NSURL *> *)urlArr title:(NSString *)title itemDescription:(NSString *)itemDescription salePrice:(NSString *)salePrice oldPrice:(NSString *)oldPrice;

@end
