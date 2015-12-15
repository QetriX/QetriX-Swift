//
//  DataStore/FileSystem.swift
//
//  Created by QetriX on 28/08/14.
//  Copyright (c) 2015 QetriX. All rights reserved.
//

import Foundation

class FileSystem
{
    class func DocumentsPath() -> String
    {
        return (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String) + "/"
    }

    class func DirList(path: String) -> (filenames: String[]?, error: NSError?)
    {
        var error: NSError? = nil
        let fileManager = NSFileManager.defaultManager()
        let contents = fileManager.contentsOfDirectoryAtPath(DocumentsPath() + path, error: &error)
        if contents == nil { return (nil, error) }
        let filenames = contents as String[]
        return (filenames, nil)
    }
    
    class func DirCreate(dir:String) -> Bool
    {
        var res:Bool = NSFileManager.defaultManager().createDirectoryAtPath(DocumentsPath() + dir, withIntermediateDirectories:true, attributes:nil, error:nil)
        return res
    }
    
    class func DirDelete(dir:String)
    {
        
    }

    class func FileList(path: String, keepExt:Bool) -> (filenames: String[]?, error: NSError?)
    {
        var error: NSError? = nil
        let fileManager = NSFileManager.defaultManager()
        let contents = fileManager.contentsOfDirectoryAtPath(DocumentsPath() + path, error: &error)
        if contents == nil { return (nil, error) }
        let filenames = contents as String[]
        return (filenames, nil)
    }
    
    class func FileRead(dir:String, name:String) -> String
    {
        return String.stringWithContentsOfFile(DocumentsPath() + dir + "/" + name, encoding:NSUTF8StringEncoding, error:nil)!;
    }
    
    class func FileSave(dir:String, name:String, data:String) -> Bool
    {
        var res:Bool = NSFileManager.defaultManager().createFileAtPath(DocumentsPath() + dir + "/" + name, contents:data.dataUsingEncoding(NSUTF8StringEncoding), attributes:nil)
        return res
    }
    
    class func FileDelete(dir:String, name:String)
    {
        var res:Bool = NSFileManager.defaultManager().removeItemAtPath(DocumentsPath() + dir + "/" + name, error: nil)
    }
}
