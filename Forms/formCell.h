//
//  formCell.h
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICheckbox;

@interface formCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;

- (IBAction)checkBoxAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@property (weak, nonatomic) IBOutlet UICheckbox *kBOX;
- (IBAction)kBocAction:(id)sender;
- (IBAction)cBoxAction:(id)sender;



@end
