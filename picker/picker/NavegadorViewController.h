//
//  NavegadorViewController.h
//  picker
//
//  Created by Juan Felipe Montoya Gómez on 7/11/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavegadorViewController : UIViewController<UIWebViewDelegate>
- (IBAction)HtmlClick:(id)sender;
- (IBAction)JSClick:(id)sender;
- (IBAction)CSSClick:(id)sender;
- (IBAction)PDFClick:(id)sender;
- (IBAction)CerrarClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Wait;
@property (weak, nonatomic) IBOutlet UIWebView *viewWeb;

@end
