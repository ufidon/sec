using System;
using System.IO;

class Readshow
{
    public static int Main(string[] args)
    {
        string path = args[0];
        if(args.Length != 2){
            Console.WriteLine("Usage: readshow secretfile num\n");
            return 1;
        }

        if (!File.Exists(path))
        {
            Console.WriteLine(path+" not exist.");
            return 1;
        }

        byte[] fbytes = File.ReadAllBytes(path);
        string text = "";
        uint num = (uint)Convert.ToInt32(args[1], 16);

        // https://samsclass.info/126/proj/PMA132.htm
        // num = 0x29 for Challenge1.exe
        // text += (char)(((uint)(b >> 4) | ((uint)(b << 4) & 0xF0u)) ^ 0x29u);
        // num = 0x41 for PMA132.exe
        // text += (char)(((uint)(b >> 4) | ((uint)(b << 4) & 0xF0u)) ^ 0x41u);
        
        foreach (byte b in fbytes)
        {
            text += (char)(((uint)(b >> 4) | ((uint)(b << 4) & 0xF0u)) ^ num);
        }
        text += "\0";

        Console.WriteLine(text);

        return 0;
    }
}