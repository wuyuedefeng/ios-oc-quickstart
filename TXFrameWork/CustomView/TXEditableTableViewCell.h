#import <UIKit/UIKit.h>

@interface TXEditableTableViewCell : TXTableViewCell

@property (nonatomic, strong)	TXTextField	*textField;

- (void)setTextFieldFrame;

@end
