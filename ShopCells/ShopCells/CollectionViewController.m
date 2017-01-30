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
#import "FreeComplexCell.h"
#import "LocalTrendsComplexCell.h"
#import "TrendingNow.h"

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
    ((UICollectionViewFlowLayout *)[self.collectionNode.view collectionViewLayout]).headerReferenceSize = CGSizeMake(0, 0);
    self.mostUsedWidth = (self.collectionNode.frame.size.width - 20) / 2;
}

- (void)setupCollectionNode {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(300, 53);
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
    } else if (indexPath.section == 1) {
        return ^{
            FreeComplexCell *cell = [[FreeComplexCell alloc] init];
            return cell;
        };
    } else if (indexPath.section == 2) {
        return ^ {
            TrendingNow *cell = [[TrendingNow alloc] init];
            return cell;
        };
    } else if (indexPath.section == 3) {
        return ^ {
            LocalTrendsComplexCell *cell = [[LocalTrendsComplexCell alloc] init];
            return cell;
        };
    } if (indexPath.section == 4) {
        return ^ {
            LocalTrendsComplexCell *cell = [[LocalTrendsComplexCell alloc] initAsBundle:@"Buy a package bundle and save up to $2.00"];
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
    if (indexPath.section == 0 || indexPath.section == 2 ) {
        return ASSizeRangeMake(CGSizeMake(self.collectionNode.frame.size.width, 0), CGSizeMake(self.collectionNode.frame.size.width,240));
    } else if (indexPath.section == 1) {
        return ASSizeRangeMake(CGSizeMake(self.collectionNode.frame.size.width, 0), CGSizeMake(self.collectionNode.frame.size.width,172));
    } else if (indexPath.section == 3) {
        return ASSizeRangeMake(CGSizeMake(self.collectionNode.frame.size.width, 0), CGSizeMake(self.collectionNode.frame.size.width,238));
    } else if (indexPath.section == 4) {
        return ASSizeRangeMake(CGSizeMake(self.collectionNode.frame.size.width, 0), CGSizeMake(self.collectionNode.frame.size.width,260));
    } else {
        return ASSizeRangeMake(CGSizeMake(self.mostUsedWidth, 0), CGSizeMake(self.mostUsedWidth, 300));
    }
}


//http://cdn2.hubspot.net/hub/53/file-2263493423-jpeg/simple.jpeg
//http://www.planwallpaper.com/static/images/desktop-year-of-the-tiger-images-wallpaper.jpg

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2 || section == 3 || section == 4) {
        return 1;
    } else {
        return 50;
    }
    
}

- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [[SectionHeader alloc] initWithTitle:@"Featured"];
//    } else if (indexPath.section == 1 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [[SectionHeader alloc] initWithTitle:@"Free"];
//    } else if (indexPath.section == 2 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [[SectionHeader alloc] initWithTitle:@"Trending Now"];
//    } else if (indexPath.section == 3 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [[SectionHeader alloc] initWithTitle:@"Local Trends"];
//    } else if (indexPath.section == 4 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [[SectionHeader alloc] initWithTitle:@"Bundles"];
//    } else {
//        return [[SectionHeader alloc] initWithTitle:@""];
//    }
    return [[SectionHeader alloc] initWithTitle:@""];
}

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode {
    return 6;
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
