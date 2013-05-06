//
//  FormViewController.h
//  TraitWare
//
//  Created by Waqar on 5/1/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICheckbox.h"


@interface FormViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *formsTable;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
- (IBAction)checkButtonAction:(id)sender;


@end
