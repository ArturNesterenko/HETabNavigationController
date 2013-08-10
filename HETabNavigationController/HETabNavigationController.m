//
//  HETabNavigationController.m
//  proshot
//
//  Created by How Else on 6/13/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//


#import "HETabNavigationController.h"


@interface HETabNavigationController ()

@property (nonatomic, strong) NSMutableArray *tabNavigationArrays;

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, readwrite, assign) NSUInteger currentTabIndex;

@end


@implementation HETabNavigationController

- (id)initWithTabViewControllers:(NSArray *)tabViewControllers
{
    return [self initWithTabViewControllers:tabViewControllers tabTitles:nil];
}

- (id)initWithTabViewControllers:(NSArray *)tabViewControllers tabTitles:(NSArray *)tabTitles
{
    self = [super init];
    if (self) {
        _tabNavigationArrays = [NSMutableArray array];
        _segmentedControl = [[UISegmentedControl alloc] init];
        
        for (NSUInteger index = 0; index < tabViewControllers.count; index++) {
            UIViewController *viewController = [tabViewControllers objectAtIndex:index];
            [_tabNavigationArrays addObject:@[viewController]];
            
            NSString *tabTitle = index < tabTitles.count ? [tabTitles objectAtIndex:index] : nil;
            [self.segmentedControl insertSegmentWithTitle:tabTitle atIndex:self.segmentedControl.numberOfSegments animated:NO];
        }
        
        [_segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
        [_segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_segmentedControl sizeToFit];
        [_segmentedControl setSelectedSegmentIndex:0];
        
        UIViewController *rootViewController = [tabViewControllers objectAtIndex:0];
        [self pushViewController:rootViewController animated:NO];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (NSArray *tabNavigationArray in self.tabNavigationArrays) {
        UIViewController *viewController = [tabNavigationArray objectAtIndex:0];
        [viewController.navigationItem setTitleView:self.segmentedControl];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (void)showTabAtIndex:(NSUInteger)index
{
    [self.tabNavigationArrays replaceObjectAtIndex:self.currentTabIndex withObject:self.viewControllers];
    NSArray *tabNavigationArray = [self.tabNavigationArrays objectAtIndex:index];
    [self setViewControllers:tabNavigationArray];
    [self setCurrentTabIndex:index];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated tabTitle:(NSString *)tabTitle
{
    [super pushViewController:viewController animated:animated];
    if (tabTitle) {
        [self setTitle:tabTitle forTabAtIndex:self.currentTabIndex];
        [viewController.navigationItem setTitleView:self.segmentedControl];
    }
}


#pragma mark - Handle Events

- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl
{
    [self showTabAtIndex:segmentedControl.selectedSegmentIndex];
}


#pragma mark - Public Methods

- (void)setTitle:(NSString *)title forTabAtIndex:(NSUInteger)index
{
    if (index < self.segmentedControl.numberOfSegments) {
        [self.segmentedControl setTitle:title forSegmentAtIndex:index];
        [self.segmentedControl sizeToFit];
    }
}

- (void)setImage:(UIImage *)image forTabAtIndex:(NSUInteger)index
{
    if (index < self.segmentedControl.numberOfSegments) {
        [self.segmentedControl setImage:image forSegmentAtIndex:index];
        [self.segmentedControl sizeToFit];
    }
}

- (void)addTabViewController:(UIViewController *)viewController withTabTitle:(NSString *)tabTitle
{
    [self insertTabViewController:viewController withTitle:tabTitle atTabIndex:self.tabNavigationArrays.count];
}

- (void)insertTabViewController:(UIViewController *)viewController withTitle:(NSString *)tabTitle atTabIndex:(NSUInteger)tabIndex
{
    if (viewController && tabIndex <= self.tabNavigationArrays.count) {
        [self.tabNavigationArrays insertObject:@[viewController] atIndex:tabIndex];
        [viewController.navigationItem setTitleView:self.segmentedControl];
        
        [self.segmentedControl insertSegmentWithTitle:tabTitle atIndex:tabIndex animated:YES];
        [self.segmentedControl sizeToFit];
    }
}

- (void)selectTabAtIndex:(NSUInteger)index
{
    [self showTabAtIndex:index];
    [self.segmentedControl setSelectedSegmentIndex:index];
}

@end
