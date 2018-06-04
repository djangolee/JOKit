//
//  SupportViewDidLoad.m
//  JoUIKit
//
//  Created by Panghu Lee on 12/12/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

#import "SupportViewDidLoad.h"
#import <objc/runtime.h>

#pragma mark NSObject, about onceToken

@interface NSObject(_JoSupportLoad)

@property (nonatomic, strong, nullable) NSObject *_supportload_onceToken;

@end

@implementation NSObject(_SupportLoad)

static char _supportload_associatedKey;
static char _supportload_isuiinstalledKey;

-(NSObject * __nullable)_supportload_onceToken {
    return objc_getAssociatedObject(self, &_supportload_associatedKey);
}

- (void)set_supportload_onceToken:(NSObject * __nullable)_supportload_onceToken {
    objc_setAssociatedObject(self, &_supportload_associatedKey, _supportload_onceToken, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark UIViewController

@interface UIViewController ()

@property (nonatomic) BOOL jo_isuiinstalled;

@end

@implementation UIViewController (_JoSupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method support = class_getInstanceMethod(self, @selector(_jo_supportLoadView));
    method_exchangeImplementations(origin, support);
}

- (BOOL)jo_isuiinstalled {
    NSNumber *number = objc_getAssociatedObject(self, &_supportload_isuiinstalledKey);
    return number.boolValue;
}

- (void)setJo_isuiinstalled:(BOOL)jo_isuiinstalled {
    objc_setAssociatedObject(self, &_supportload_isuiinstalledKey, @(jo_isuiinstalled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// private

-(void)_jo_supportLoadView {
    [self _jo_supportLoadView];
    if (self.isViewLoaded && !self._supportload_onceToken) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self._supportload_onceToken = [NSObject new];
            [self _jo_viewWillInstallSubviews];
        });
    }
}

- (void)_jo_viewWillInstallSubviews {
    [self jo_viewWillInstallSubviews];
    [self _jo_installSubviews];
}

- (void)_jo_installSubviews {
    [self jo_setupSubviews];
    [self jo_makeSubviewsLayout];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self _jo_viewDidInstallSubviews];
    });
}

- (void)_jo_viewDidInstallSubviews {
    [self jo_viewDidInstallSubviews];
    self.jo_isuiinstalled = YES;
}

// public

- (void)jo_viewWillInstallSubviews { }
- (void)jo_viewDidInstallSubviews { }

- (void)jo_setupSubviews { }
- (void)jo_makeSubviewsLayout { }

@end

#pragma mark UIView

@interface UIView ()

@property (nonatomic) BOOL jo_isuiinstalled;

@end

@implementation UIView (_JoSupportLoad)

+ (void)load {
    {
        Method origin = class_getInstanceMethod(self, @selector(didMoveToWindow));
        Method support = class_getInstanceMethod(self, @selector(_jo_didMoveToWindow));
        method_exchangeImplementations(origin, support);
    }
}

- (BOOL)jo_isuiinstalled {
    NSNumber *number = objc_getAssociatedObject(self, &_supportload_isuiinstalledKey);
    return number.boolValue;
}

- (void)setJo_isuiinstalled:(BOOL)jo_isuiinstalled {
    objc_setAssociatedObject(self, &_supportload_isuiinstalledKey, @(jo_isuiinstalled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// private

- (void)_jo_didMoveToWindow {
    [self _jo_didMoveToWindow];
    
    [self _jo_requiresviewDidLoad];
}

- (void)_jo_requiresviewDidLoad {
    if (self.window && !self._supportload_onceToken) {
        [self jo_viewDidLoad];
        self._supportload_onceToken = [NSObject new];
        [self _jo_viewWillInstallSubviews];
    }
}

- (void)_jo_viewWillInstallSubviews {
    [self jo_viewWillInstallSubviews];
    [self _jo_installSubviews];
}

- (void)_jo_installSubviews {
    [self jo_setupSubviews];
    [self jo_makeSubviewsLayout];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self _jo_viewDidInstallSubviews];
    });
}

- (void)_jo_viewDidInstallSubviews {
    [self jo_viewDidInstallSubviews];
    self.jo_isuiinstalled = YES;
}

// public

- (void)jo_viewDidLoad { }

- (void)jo_viewWillInstallSubviews { }
- (void)jo_viewDidInstallSubviews { }

- (void)jo_setupSubviews { }
- (void)jo_makeSubviewsLayout { }

@end

#pragma mark CALayer

@interface CALayer ()

@property (nonatomic) BOOL jo_isuiinstalled;

@end

@implementation CALayer (_JoSupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(layoutSublayers));
    Method support = class_getInstanceMethod(self, @selector(_jo_layoutSublayers));
    method_exchangeImplementations(origin, support);
}

- (BOOL)jo_isuiinstalled {
    NSNumber *number = objc_getAssociatedObject(self, &_supportload_isuiinstalledKey);
    return number.boolValue;
}

- (void)setJo_isuiinstalled:(BOOL)jo_isuiinstalled {
    objc_setAssociatedObject(self, &_supportload_isuiinstalledKey, @(jo_isuiinstalled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// private

- (void)_jo_layoutSublayers {
    [self _jo_layoutSublayers];
    
    [self _jo_requiresLayerDidLoad];
}

- (void)_jo_requiresLayerDidLoad {
    if (self.superlayer && !self._supportload_onceToken) {
        [self jo_layerDidLoad];
        self._supportload_onceToken = [NSObject new];
        [self _jo_layerWillInstallSublayers];
    }
}

- (void)_jo_layerWillInstallSublayers {
    [self jo_layerWillInstallSublayers];
    [self _jo_installSublayers];
}

- (void)_jo_installSublayers {
    [self jo_setupSublayers];
    [self jo_makeSublayersLayout];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self _jo_layerDidInstallSublayers];
    });
}

- (void)_jo_layerDidInstallSublayers {
    [self jo_layerDidInstallSublayers];
    self.jo_isuiinstalled = YES;
}

// public

- (void)jo_layerDidLoad { }

- (void)jo_layerWillInstallSublayers { }
- (void)jo_layerDidInstallSublayers { }

- (void)jo_setupSublayers { }
- (void)jo_makeSublayersLayout { }

@end
