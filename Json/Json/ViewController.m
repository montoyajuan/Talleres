//
//  ViewController.m
//  Json
//
//  Created by Juan Felipe Montoya Gómez on 7/26/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"

#define kJsonLoadURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]

#define kQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()
- (NSDictionary*) withContextOfJSONUrl: (NSString*) urlAddress;
- (NSData*) toJSON:(id) objeto;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(kQueue, ^{
        [self performSelectorOnMainThread:@selector(fetchData:) withObject:nil waitUntilDone:YES];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary*) withContextOfJSONUrl: (NSURL*) urlAddress
{
    NSData * data = [NSData dataWithContentsOfURL:urlAddress];
    NSError * error = nil;
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error != nil)
    {
        return nil;
    }
    else
    {
        return result;
    }
}

- (NSData*) toJSON:(id) objeto
{
    NSError * error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:objeto options:kNilOptions error:&error];
    
    if(error != nil)
    {
        return nil;
    }
    else
    {
        return result;
    }
}

-(void) fetchData: (NSData*) responseData{
    //Toma el Data del JSON y lo pinta
    //NSError *error;
    NSDictionary * json = [self withContextOfJSONUrl:kJsonLoadURL];
    
    NSArray * ultimoRegistro = [json objectForKey:@"loans"];
    NSDictionary * registro = [ultimoRegistro objectAtIndex:0];
    
    
    NSNumber * registro_id = [registro objectForKey:@"id"];
    NSString * registro_nombre = [registro objectForKey:@"name"];
    NSString * registro_actividad = [registro objectForKey:@"activity"];
    NSString * registro_fecha = [registro objectForKey:@"posted_date"];
    
    
    _outParserJson.text = [NSString stringWithFormat:@"El usuario %@, asignado al cliente %@ tiene a cargo un %@ y su ultimo acceso fue %@",registro_id, registro_nombre, registro_actividad, registro_fecha];
    
    NSDictionary * info = [NSDictionary dictionaryWithObjectsAndKeys: [registro objectForKey:@"id"], @"ID", [registro objectForKey:@"name"], @"Nombre",[registro objectForKey:@"activity"], @"Actividad", [registro objectForKey:@"posted_date"], @"Fecha", nil];
    
    NSData * jsonData = [self toJSON:info];
    _outJson.text = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
