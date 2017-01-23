//
//  CollectionViewController.m
//  ShopCells
//
//  Created by Developer on 19/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "CollectionViewController.h"
#import "FirstCell.h"
#import "SecondCell.h"
#import "ThirdCell.h"
#import "MostUsed.h"
#import "FeaturedComplexCell.h"
#import "SectionHeader.h"

@interface CollectionViewController () <ASCollectionDelegate, ASCollectionDataSource>

@property (nonatomic) ASCollectionNode *collectionNode;
@property (nonatomic) CGFloat mostUsedWidth;

@end

@implementation CollectionViewController

- (instancetype)init {
    ASDisplayNode *node = [[ASDisplayNode alloc] init];
    node.backgroundColor = [UIColor whiteColor];
    self = [super initWithNode:node];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [self setupCollectionNode];
    self.mostUsedWidth = (self.collectionNode.frame.size.width - 20) / 2;
}

- (void)setupCollectionNode {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(300, 20);
    self.collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
    [self.collectionNode registerSupplementaryNodeOfKind:UICollectionElementKindSectionHeader];
    self.collectionNode.frame =CGRectMake(20, 0, self.node.bounds.size.width - 40, self.node.bounds.size.height);// self.node.frame;
    self.collectionNode.delegate = self;
    self.collectionNode.dataSource = self;
    self.collectionNode.view.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [self.node addSubnode:self.collectionNode];
    
}


- (ASCellNodeBlock)collectionView:(ASCollectionView *)collectionView nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSURL *url = [NSURL URLWithString:@"http://cdn2.hubspot.net/hub/53/file-2263493423-jpeg/simple.jpeg"];
    if (indexPath.section == 0) {
        return ^ {
            FeaturedComplexCell *cell = [[FeaturedComplexCell alloc] init];
            return cell;
        };
    } else if (indexPath.row == 0) {
        return ^{
            SecondCell *cell = [[SecondCell alloc] initWithURL:url title:@"Very long Title of package"];
            return cell;
        };
    } else if (indexPath.row == 1) {
        return ^ {
            ThirdCell *cell = [[ThirdCell alloc] initWithurlArray:@[url,url,url,url] subtext:@"some Text" button:@"awesome"];
            return cell;
        };
    } else {
        return ^ {
            MostUsed *cell = [[MostUsed alloc] initWithUrl:url title:@"Coffeholic" info:@"16 stickers"];
            return cell;
        };
    }
}
- (ASSizeRange)collectionNode:(ASCollectionNode *)collectionNode constrainedSizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return ASSizeRangeMake(CGSizeMake(self.collectionNode.frame.size.width, 0), CGSizeMake(self.collectionNode.frame.size.width,300));
    } else if (indexPath.row == 1) {
        return ASSizeRangeMake(CGSizeMake(260,0), CGSizeMake(260,300));
    } else if (indexPath.row == 0) {
        return ASSizeRangeMake(CGSizeMake(122,0), CGSizeMake(122,300));
    } else {
        return ASSizeRangeMake(CGSizeMake(self.mostUsedWidth, 0), CGSizeMake(self.mostUsedWidth, 300));
    }
}


//http://cdn2.hubspot.net/hub/53/file-2263493423-jpeg/simple.jpeg
//http://www.planwallpaper.com/static/images/desktop-year-of-the-tiger-images-wallpaper.jpg

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 50;
    }
    
}

- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && [kind isEqualToString:UICollectionElementKindSectionHeader])
        return [[SectionHeader alloc] initWithTitle:@"Featured"];
    else return [[SectionHeader alloc] initWithTitle:@""];
}

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode {
    return 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
