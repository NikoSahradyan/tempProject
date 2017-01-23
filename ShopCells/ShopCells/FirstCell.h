//
//  FirstCell.h
//  ShopCells
//
//  Created by Developer on 19/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface FirstCell : ASCellNode

- (instancetype)initWithURL:(NSURL *)imageUrl textOne:(NSString *)textOne textTwo:(NSString *)textTwo;
- (instancetype)initWithURL:(NSURL *)imageUrl hashTag:(NSString *)hashTag packagesCount:(NSString *)packagesCount;

@end
