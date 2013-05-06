//
//  testViewController.h
//  TraitWare
//
//  Created by Waqar on 5/2/13.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testViewController : UIViewController{

    BOOL toggle;
}
- (IBAction)testAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end
