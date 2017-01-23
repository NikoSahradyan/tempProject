//
//  ViewController.m
//  ShopCells
//
//  Created by Developer on 19/01/2017.
//  Copyright © 2017 Nsystems. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewController.h"

@interface ViewController ()
@property (nonatomic) UIButton *shopcell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shopcell = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    [self.shopcell setTitle:@"go to cell" forState:UIControlStateNormal];
    [self.shopcell setBackgroundColor:[UIColor grayColor]];
    [self.shopcell addTarget:self action:@selector(actionOne) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shopcell];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)actionOne {
    CollectionViewController *vc = [[CollectionViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
