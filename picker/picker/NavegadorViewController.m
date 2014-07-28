//
//  NavegadorViewController.m
//  picker
//
//  Created by Juan Felipe Montoya Gómez on 7/11/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _Wait.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)HtmlClick:(id)sender {
    NSString * html = @"<HTML><HEAD><TITLE>Su título va aquí</TITLE></HEAD><BODY BGCOLOR='FFFFFF'><CENTER><IMG SRC='http://upload.wikimedia.org/wikipedia/commons/0/0d/Extensión_de_nubes..JPG' ALIGN='BOTTOM'> </CENTER><HR><a href='http://algunsitiowebestupendo.com'>Nombre del vínculo </a>es un vínculo a otro buen sitio web<H1>Esto es un encabezado</H1><H2>Este es un encabezado mediano</H2>Envíen el correo a <a href='mailto:soporte@suempresa.com'>soporte@suempresa.com</a>.<P> ¡Este es un nuevo párrafo!<P> <B>¡Este es un nuevo párrafo!</B><BR> <B><I>Esta es una nueva oración sin salto de párrafo, en cursiva negrita.</I></B><HR></BODY></HTML>";
    [_viewWeb loadHTMLString:html baseURL:nil];
}

- (IBAction)JSClick:(id)sender {
    NSString * script =@"alert('Alerta desde JS');";
    [_viewWeb stringByEvaluatingJavaScriptFromString:script];
}

- (IBAction)CSSClick:(id)sender {
    NSURL * url = [[NSURL alloc] initWithString:@"http://apple.com"];
    
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    
    [_viewWeb loadRequest:request];
}

- (IBAction)PDFClick:(id)sender {
   
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Example" ofType:@"pdf"];
    //NSURL *targetURL = [NSURL fileURLWithPath:path];
    //NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    //[_viewWeb loadRequest:request];
    
    NSData * datosPDF = [[NSData alloc] initWithContentsOfFile:path];
    
    [_viewWeb loadData:datosPDF MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
    
}

- (IBAction)CerrarClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) webViewDidStartLoad:(UIWebView *)webView{
    _Wait.hidden = NO;
    [_Wait startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    _Wait.hidden = YES;
    [_Wait stopAnimating];
}
@end
