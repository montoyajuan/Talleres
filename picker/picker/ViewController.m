//
//  ViewController.m
//  picker
//
//  Created by Juan Felipe Montoya Gómez on 7/11/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSBundle * paquete = [NSBundle mainBundle];
    NSString * ruta = [paquete pathForResource:@"Paises" ofType:@"plist"];
    _paises = [[NSArray alloc] initWithContentsOfFile:ruta];
    
    NSLog(@"%@",_paises);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_paises count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_paises objectAtIndex: row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UIAlertView *alertaSimple = [[UIAlertView alloc] initWithTitle:@"Alerta simple" message:[_paises objectAtIndex:row] delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Aceptar", nil];
    alertaSimple.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alertaSimple show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSLog(@"%@",[alertView textFieldAtIndex:0].text);
    }
}

@end
