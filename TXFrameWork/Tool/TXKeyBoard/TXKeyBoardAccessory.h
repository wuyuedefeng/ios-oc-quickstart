//
//  WSKeyBoardAccessory.h
//  WSFouncDesign
//
//  Created by TX-009 on 14-9-12.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TXKeyBoardAccessoryDelegate <NSObject>
@optional
- (void)calcContentOffset:(NSInteger)offset;
- (void)didClickDoneButton;
- (void)onEditingComponent:(UIView *)component withOffset:(float)offset;
@end



@interface TXKeyBoardAccessory : NSObject <UITextFieldDelegate, UITextViewDelegate>
@property (nonatomic, strong) UIView *inputAccessoryView;
@property (nonatomic, assign) id<TXKeyBoardAccessoryDelegate>delegate;

+ (TXKeyBoardAccessory *)sharedTXKeyBoardAccessory;
- (id)init;
- (void)setTextIdlView:(NSArray *)array;
@end
