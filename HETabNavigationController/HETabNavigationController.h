//
//  HETabNavigationController.h
//  proshot
//
//  Created by How Else on 6/13/13.
//  Copyright (c) 2013 itomych studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HETabNavigationController : UINavigationController

@property (nonatomic, readonly) NSArray *topViewControllers;
@property (nonatomic, readonly, assign) NSUInteger currentTabIndex;

- (id)initWithTabViewControllers:(NSArray *)tabViewControllers;
- (id)initWithTabViewControllers:(NSArray *)tabViewControllers tabTitles:(NSArray *)tabTitles;

- (void)setTitle:(NSString *)title forTabAtIndex:(NSUInteger)index;
- (void)setImage:(UIImage *)image forTabAtIndex:(NSUInteger)index;
- (void)addTabViewController:(UIViewController *)viewController withTabTitle:(NSString *)tabTitle;
- (void)insertTabViewController:(UIViewController *)viewController withTitle:(NSString *)tabTitle atTabIndex:(NSUInteger)tabIndex;
- (void)removeTabAtIndex:(NSUInteger)index animated:(BOOL)animated;

- (void)selectTabAtIndex:(NSUInteger)index;

@end
