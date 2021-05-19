program clockpi4;

{$mode objfpc}{$H+}

{ QEMU VersatilePB Application                                                 }
{  Add your program code below, add additional units to the "uses" section if  }
{  required and create new units by selecting File, New Unit from the menu.    }
{                                                                              }
{  To compile your program select Run, Compile (or Run, Build) from the menu.  }

uses
  //ProgramInit,
  QEMUVersatilePB,
  GlobalConfig,
  GlobalConst,
  GlobalTypes,
  Platform,
  Threads,
  SysUtils,
  Classes,
  Font,
  Console,
  GraphicsConsole,
  Framebuffer,
  Ultibo
  { Add additional units here };


const
 {Define the ADUG green used on the website, the Raspberry Pi includes a full HD 32bit per pixel framebuffer}
 Mahogeny = $FF663300;

{We also need to declare a variable to hold a console window handle.}
var
 WindowHandle:TWindowHandle;
 ConsoleDevice:PConsoleDevice;
 Title:String;
 Text:String;
 Top:LongWord;
 Left:LongWord;
 Width:LongWord;
 Height:LongWord;
 LargeFont:THandle;
 SmallFont:THandle;

 Ticks:LongWord;


begin

 {Get some fonts and the console device}
 LargeFont:=FontFindByName('Bitstream_Vera_Sans_Mono_40');
 SmallFont:=FontFindByName('Bitstream_Vera_Sans_Mono_25');


 ConsoleDevice:=ConsoleDeviceGetDefault;
 WindowHandle:=GraphicsWindowCreate(ConsoleDevice,CONSOLE_POSITION_FULL);


 {Setup some defaults}
 GraphicsWindowSetForecolor(WindowHandle,COLOR_WHITE);
 GraphicsWindowSetBackcolor(WindowHandle,Mahogeny);
 GraphicsWindowSetFont(WindowHandle,LargeFont);
 GraphicsWindowClear(WindowHandle);

 {Display our title}
 Title:='Ultibo Pi4 GPS Cluster using graphics console';
 Width:=GraphicsWindowGetWidth(WindowHandle);
 Height:=GraphicsWindowGetHeight(WindowHandle);
 Left:=(Width - (Length(Title) * FontGetWidth(LargeFont))) div 4;
 Top:=(Height - (4 * FontGetHeight(LargeFont))) div 2;

 GraphicsWindowDrawText(WindowHandle,Title,Left,Top);

 GraphicsWindowDrawText(WindowHandle,Text,Left,Top);

 GraphicsWindowDrawCircle(WindowHandle, 120,200, $FFFFFFC8, 100, 100);
 GraphicsWindowDrawCircle(WindowHandle, 360,200, $FFFFFFC8, 100, 100);
 GraphicsWindowDrawCircle(WindowHandle, 600,200, $FFFFFFC8, 100, 100);

 GraphicsWindowDrawCircle(WindowHandle, 120,200, $FFB5A642, 8, 100);
 GraphicsWindowDrawCircle(WindowHandle, 360,200, $FFB5A642, 8, 100);
 GraphicsWindowDrawCircle(WindowHandle, 600,200, $FFB5A642, 8, 100);

 GraphicsWindowDrawLine(WindowHandle, 120, 100 + 10, 120, 100 + 20, $FF000000, 2 );



 ThreadHalt(0);
end.

