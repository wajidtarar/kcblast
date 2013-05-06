//
//  formCell.m
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "formCell.h"

@implementation formCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
     [self.checkButton setTitle:@"popopo0000000" forState:UIControlStateNormal];
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkBoxAction:(id)sender {
//    NSIndexPath *indexPath =
//    [self.myTableView
//     indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
//    NSUInteger row = indexPath.row
    
    [self.checkButton setTitle:@"aslndjvnkjnj" forState:UIControlStateNormal];
    NSLog(@"checkButtonAction tirle = %@", self.checkButton.titleLabel.text);
    
//    self.checkButton.enabled = NO;
    NSLog(@"checkButtonAction title = %@", self.checkButton.titleLabel.text);
//    [self.checkButton setImage:[UIImage imageNamed:@"uicheckbox_checked.png"] forState:UIControlStateNormal];
    


}
- (IBAction)kBocAction:(id)sender {
    NSLog(@"skmvkjnjkn");
}

- (IBAction)cBoxAction:(id)sender {
    NSLog(@"skmvkjnjkn");

}
@end
