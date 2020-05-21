//
//  ViewController.m
//  无侵入式埋点
//
//  Created by lei li on 2020/5/21.
//  Copyright © 2020 lei li. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnClick:(id)sender {
    NextViewController *nextVc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}
@end
