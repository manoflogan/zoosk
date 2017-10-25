//
//  DrawPolygonControllerViewController.m
//  Zoosk
//
//  Created by Kartik Krishnanand on 9/24/17.
//  Copyright © 2017 Kartik Krishnanand. All rights reserved.
//

#import "DrawPolygonControllerViewController.h"
#import "SimpleRegularPolygonView.h"

@interface DrawPolygonControllerViewController ()

@end

@implementation DrawPolygonControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self.delegate initDrawView];
}

#pragma Delegate function
-(void) initDrawView {
    SimpleRegularPolygonView* view =
    [[SimpleRegularPolygonView alloc] initWithSides:8 andRadius:(CGRectGetWidth(self.view.bounds) / 4) andFrame:self.view.bounds];
    [self.view addSubview:view];
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
