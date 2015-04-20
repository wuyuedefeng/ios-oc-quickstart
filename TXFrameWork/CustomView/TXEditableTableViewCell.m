#import "TXEditableTableViewCell.h"

#define kLeading	10.0
@interface TXEditableTableViewCell()<UITextFieldDelegate>
@end
@implementation TXEditableTableViewCell

@synthesize textField = _textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		_textField = [[TXTextField alloc] initWithFrame: self.bounds];
        _textField.delegate = self;
		_textField.minimumFontSize = 12;
		_textField.adjustsFontSizeToFitWidth = YES;
		[self addSubview: _textField];
        
        [_textField setBackgroundColor:[UIColor whiteColor]];
        [_textField setBorderStyle:UITextBorderStyleNone];
        [_textField.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    return self;
}

- (void)setTextFieldFrame
{
    _textField.frame = CGRectMake(20, 0, self.frame.size.width-110, self.frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) layoutSubviews
{
	[super layoutSubviews];
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextView *)textView
{
    // make sure the cell is at the top
    [self.tx_tableView scrollToRowAtIndexPath:[self.tx_tableView indexPathForCell:self]
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:YES];
    
    return YES;
}
@end
