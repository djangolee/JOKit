//
//  _SupportViewDidLoad.h
//  JoUIKit
//
//  Created by Panghu Lee on 12/12/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JoSupportLoadViewProtocol<NSObject>

-(void)jo_prepareLoadView;
-(void)jo_setupUI;
-(void)jo_setupSubviews;
-(void)jo_bindingSubviewsLayout;
-(void)jo_viewDidLoad;

@end

@interface UIResponder (_SupportLoad) <JoSupportLoadViewProtocol>

@end

@interface CALayer (_SupportLoad) <JoSupportLoadViewProtocol>

@end

NS_ASSUME_NONNULL_END
