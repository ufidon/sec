using System;
using System.IO;

// How to compile?
// csc decode.cs
// How to use?
// decode.exe secretResourceFile

class DecodeSecret
{
    public static int Main(string[] args)
    {
        string path = args[0];
        if(args.Length != 1){
            Console.WriteLine("Usage: decode secretfile\n");
            return 1;
        }

        if (!File.Exists(path))
        {
            Console.WriteLine(path+" not exist.");
            return 1;
        }

        byte[] fbytes = File.ReadAllBytes(path);
        string text = "";

        // put the secret-decoding C# code found in ILSpy in the loop body   
        foreach (byte b in fbytes)
        {
          ;
        }
        text += "\0";

        Console.WriteLine(text);

        return 0;
    }
}