//
//  SupportViewDidLoad.h
//  JoUIKit
//
//  Created by Panghu Lee on 12/12/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (_JoSupportLoad)

@property (nonatomic, readonly) BOOL jo_isuiinstalled;

- (void)jo_viewWillInstallSubviews NS_REQUIRES_SUPER;
- (void)jo_viewDidInstallSubviews NS_REQUIRES_SUPER;

- (void)jo_setupSubviews NS_REQUIRES_SUPER;
- (void)jo_makeSubviewsLayout NS_REQUIRES_SUPER;

@end

@interface UIView (_JoSupportLoad)

@property (nonatomic, readonly) BOOL jo_isuiinstalled;

- (void)jo_viewDidLoad NS_REQUIRES_SUPER;

- (void)jo_viewWillInstallSubviews NS_REQUIRES_SUPER;
- (void)jo_viewDidInstallSubviews NS_REQUIRES_SUPER;

- (void)jo_setupSubviews NS_REQUIRES_SUPER;
- (void)jo_makeSubviewsLayout NS_REQUIRES_SUPER;

@end

@interface CALayer (_JoSupportLoad)

@property (nonatomic, readonly) BOOL jo_isuiinstalled;

- (void)jo_layerDidLoad NS_REQUIRES_SUPER;

- (void)jo_layerWillInstallSublayers NS_REQUIRES_SUPER;
- (void)jo_layerDidInstallSublayers NS_REQUIRES_SUPER;

- (void)jo_setupSublayers NS_REQUIRES_SUPER;
- (void)jo_makeSublayersLayout NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
