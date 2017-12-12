//
//  _SupportViewDidLoad.m
//  JoUIKit
//
//  Created by Panghu Lee on 12/12/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

#import "_SupportViewDidLoad.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark NSObject, about onceToken

@interface NSObject(_SupportLoad)

@property (nonatomic, strong, nullable) NSObject *_supportload_onceToken;

@end

@implementation NSObject(_SupportLoad)

static char _supportload_associatedKey;

-(NSObject * __nullable)_supportload_onceToken {
    return objc_getAssociatedObject(self, &_supportload_associatedKey);
}

- (void)set_supportload_onceToken:(NSObject * __nullable)_supportload_onceToken {
    objc_setAssociatedObject(self, &_supportload_associatedKey, _supportload_onceToken, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark UIViewController

@interface UIViewController (_SupportLoad)

@end

@implementation UIViewController (_SupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method support = class_getInstanceMethod(self, @selector(_SupportLoadView));
    method_exchangeImplementations(origin, support);
}

-(void)_SupportLoadView {
    [self _SupportLoadView];
    if (self.isViewLoaded && !self._supportload_onceToken) {
        self._supportload_onceToken = [NSObject new];
        [self jo_prepareLoadView];
        [self jo_setupUI];
        [self jo_setupSubviews];
        [self jo_bindingSubviewsLayout];
        [self jo_viewDidLoad];
    }
}

@end

#pragma mark UIView

@interface UIView (_SupportLoad)

@end

@implementation UIView (_SupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(didMoveToWindow));
    Method support = class_getInstanceMethod(self, @selector(_SupportLoadView));
    method_exchangeImplementations(origin, support);
}

-(void)_SupportLoadView {
    [self _SupportLoadView];
    if (self.window && !self._supportload_onceToken) {
        self._supportload_onceToken = [NSObject new];
        [self jo_prepareLoadView];
        [self jo_setupUI];
        [self jo_setupSubviews];
        [self jo_bindingSubviewsLayout];
        [self jo_viewDidLoad];
    }
}

@end

#pragma mark CALayer

@implementation CALayer (_SupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(layoutSublayers));
    Method support = class_getInstanceMethod(self, @selector(_SupportLoadView));
    method_exchangeImplementations(origin, support);
}

-(void)_SupportLoadView {
    [self _SupportLoadView];
    if (self.superlayer && !self._supportload_onceToken) {
        self._supportload_onceToken = [NSObject new];
        [self jo_prepareLoadView];
        [self jo_setupUI];
        [self jo_setupSubviews];
        [self jo_bindingSubviewsLayout];
        [self jo_viewDidLoad];
    }
}

#pragma SupportingLoad methods

-(void)jo_prepareLoadView { }
-(void)jo_setupUI { }
-(void)jo_setupSubviews { }
-(void)jo_bindingSubviewsLayout { }
-(void)jo_viewDidLoad { }

@end

#pragma mark UIResponder

@implementation UIResponder (_SupportLoad)

#pragma SupportingLoad methods

-(void)jo_prepareLoadView { }
-(void)jo_setupUI { }
-(void)jo_setupSubviews { }
-(void)jo_bindingSubviewsLayout { }
-(void)jo_viewDidLoad { }

@end

NS_ASSUME_NONNULL_END
