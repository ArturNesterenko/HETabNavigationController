//
//  ViewController.m
//  NavigationTabsExample
//
//  Created by How Else on 6/14/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabNavigationController setTitle:@"Second" forTabAtIndex:1];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Example" style:UIBarButtonItemStylePlain target:nil action:nil]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (IBAction)pushButtonAction:(id)sender {
    UIViewController *viewController = [[UIViewController alloc] init];
    [self.tabNavigationController pushViewController:viewController animated:YES];
}

- (IBAction)addTabAction:(id)sender {
    UIViewController *viewController = [[UIViewController alloc] init];
    UIImage *testImage = [UIImage imageNamed:@"testicon.png"];
    [self.tabNavigationController insertTabViewController:viewController withTitle:nil atTabIndex:1];
    [self.tabNavigationController setImage:testImage forTabAtIndex:1];
}

- (IBAction)nextTabAction:(id)sender {
    [self.tabNavigationController selectTabAtIndex:1];
}

@end
