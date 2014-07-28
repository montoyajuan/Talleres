//
//  ViewController.m
//  SQLLite
//
//  Created by Juan Felipe Montoya Gómez on 7/26/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString * databasePath;
    NSString * empID;
    NSInteger e_id;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString * docsDir;
    NSArray * dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.db"]];
    
    NSFileManager * filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        const char * dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &(contactDB)) == SQLITE_OK) {
            char * errMsg;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMP_NO TEXT, EMP_NAME TEXT, EMP_AGE TEXT, EMP_ADRESS TEXT)";
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                _empStatus.text =@"Error al crear la tabla";
            }
            
            NSLog(@"%s",errMsg);
            
            sqlite3_close(contactDB);
            
        }
    }
    
    _empIdDB.text = @"";
    _empIdText.text = @"";
    _empNameText.text = @"";
    _empAgeText.text = @"";
    _empAddressText.text = @"";
    _empStatus.text =   @"";

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
    
    if (_empIdText.text.length > 0 &&
        _empNameText.text.length > 0 &&
        _empAgeText.text.length > 0 &&
        _empAddressText.text.length > 0 )
    {
        sqlite3_stmt *statement;
        const char* dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            NSString * insertSql = [NSString stringWithFormat:@"INSERT INTO CONTACTS (EMP_NO, EMP_NAME, EMP_AGE, EMP_ADRESS) VALUES (\"%@\", \"%@\", \"%@\", \"%@\")", _empIdText.text, _empNameText.text, _empAgeText.text, _empAddressText.text ];
        
            const char * insert_sql = [insertSql UTF8String];
            sqlite3_prepare_v2(contactDB, insert_sql, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                _empIdDB.text = @"";
                _empIdText.text = @"";
                _empNameText.text = @"";
                _empAgeText.text = @"";
                _empAddressText.text = @"";
                _empStatus.text =   @"La inserción se realizo satisfactoriamente";
            }
            else
            {
                _empStatus.text =   @"Existio un error al insertar la información";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    else
    {
        _empStatus.text =   @"Todos los valores son obligatorios";
    }
}

- (IBAction)loadData:(id)sender {
    if (_empIdText.text.length > 0 )
    {
        sqlite3_stmt *statement;
        const char* dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            NSString * selectSql = [NSString stringWithFormat:@"SELECT ID, EMP_NO, EMP_NAME, EMP_AGE, EMP_ADRESS FROM CONTACTS WHERE EMP_NO = \"%@\"", _empIdText.text];
            
            const char * insert_sql = [selectSql UTF8String];
            if(sqlite3_prepare_v2(contactDB, insert_sql, -1, &statement, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statement) == SQLITE_ROW)
                {
                    _empIdDB.text = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 0)];
                    _empIdText.text = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 1)];
                    _empNameText.text = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 2)];
                    _empAgeText.text = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 3)];
                    _empAddressText.text = [[NSString alloc]initWithFormat:@"%s", sqlite3_column_text(statement, 4)];
                    _empStatus.text =   @"La consulta se realizo satisfactoriamente";
                }
                else
                {
                    _empIdDB.text = @"";
                    _empIdText.text = @"";
                    _empNameText.text = @"";
                    _empAgeText.text = @"";
                    _empAddressText.text = @"";
                    
                    _empStatus.text =   @"Existio un error al consultar la información";
                }
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    else
    {
        _empStatus.text =   @"El ID de la persona es obligatorio";
    }
}

- (IBAction)updateData:(id)sender {
    if (_empIdText.text.length > 0 &&
        _empNameText.text.length > 0 &&
        _empAgeText.text.length > 0 &&
        _empAddressText.text.length > 0 &&
        _empIdDB.text.length > 0)
    {
        sqlite3_stmt *statement;
        const char* dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            NSString * insertSql = [NSString stringWithFormat:@"UPDATE CONTACTS  SET EMP_NO = \"%@\", EMP_NAME = \"%@\", EMP_AGE=\"%@\", EMP_ADRESS=\"%@\" WHERE ID = \"%@\"", _empIdText.text, _empNameText.text, _empAgeText.text, _empAddressText.text, _empIdDB.text];
            
            const char * insert_sql = [insertSql UTF8String];
            sqlite3_prepare_v2(contactDB, insert_sql, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                _empIdDB.text = @"";
                _empIdText.text = @"";
                _empNameText.text = @"";
                _empAgeText.text = @"";
                _empAddressText.text = @"";
                _empStatus.text =   @"La actualización se realizo satisfactoriamente";
            }
            else
            {
                _empStatus.text =   @"Existio un error al actualizar la información";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    else
    {
        _empStatus.text =   @"Todos los valores son obligatorios y debes haber consultado un registro";
    }

}

- (IBAction)deleteData:(id)sender {
    if (_empIdDB.text.length > 0)
    {
        sqlite3_stmt *statement;
        const char* dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK)
        {
            NSString * insertSql = [NSString stringWithFormat:@"DELETE CONTACTS  WHERE ID = \"%@\"", _empIdDB.text];
            
            const char * insert_sql = [insertSql UTF8String];
            sqlite3_prepare_v2(contactDB, insert_sql, -1, &statement, NULL);
            if (sqlite3_step(statement) == SQLITE_DONE)
            {
                _empIdDB.text = @"";
                _empIdText.text = @"";
                _empNameText.text = @"";
                _empAgeText.text = @"";
                _empAddressText.text = @"";
                _empStatus.text =   @"La eliminación se realizo satisfactoriamente";
            }
            else
            {
                _empStatus.text =   @"Existio un error al eliminar la información";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(contactDB);
    }
    else
    {
        _empStatus.text =   @"Todos los valores son obligatorios y debes heber consultado un registro";
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}
@end
