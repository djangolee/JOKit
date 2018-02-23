//
//  SupportViewDidLoad.h
//  JoUIKit
//
//  Created by Panghu Lee on 12/12/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (_SupportLoad)

- (void)jo_viewWillInstallSubviews NS_REQUIRES_SUPER;
- (void)jo_viewDidInstallSubviews NS_REQUIRES_SUPER;

- (void)jo_setupSubviews NS_REQUIRES_SUPER;
- (void)jo_makeSubviewsLayout NS_REQUIRES_SUPER;

@end

@interface UIView (_SupportLoad)

- (void)jo_viewDidLoad NS_REQUIRES_SUPER;

- (void)jo_viewWillAppear NS_REQUIRES_SUPER;
- (void)jo_viewDidAppear NS_REQUIRES_SUPER;

- (void)jo_viewWillDisappear NS_REQUIRES_SUPER;
- (void)jo_viewDidDisappear NS_REQUIRES_SUPER;

- (void)jo_viewWillInstallSubviews NS_REQUIRES_SUPER;
- (void)jo_viewDidInstallSubviews NS_REQUIRES_SUPER;
- (void)jo_setupSubviews NS_REQUIRES_SUPER;
- (void)jo_makeSubviewsLayout NS_REQUIRES_SUPER;

@end

@interface CALayer (_SupportLoad)

- (void)jo_layerDidLoad NS_REQUIRES_SUPER;

- (void)jo_layerWillInstallSublayers NS_REQUIRES_SUPER;
- (void)jo_layerDidInstallSublayers NS_REQUIRES_SUPER;

- (void)jo_setupSublayers NS_REQUIRES_SUPER;
- (void)jo_makeSublayersLayout NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
