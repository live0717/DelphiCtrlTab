{===============================================================================
 Project : DelphiCtrlTab_D27

 Name    : IdePluginInterfaces

 Info    : This Unit contains the class None.

 Copyright (c) 2020 Santiago Burbano
===============================================================================}
unit IdePluginInterfaces;

interface

uses
  ToolsApi;

type
  IEditorNotifier = interface;
  ILogger = interface;

  IViewManager = interface
  ['{53A0592B-86F9-42AF-9ABF-00A1B47E3081}']
    function GetViewAt(aIndex: Integer): string;
    function GetViewCount: Integer;
    procedure ShowSourceView(aIndex: Integer);
    procedure ShutDown;
    procedure ViewActivated(const aFileName: string);
    procedure ViewClosed(const aViewName: string);
    property ViewCount: Integer read GetViewCount;
  end;

  IIdePlugin = interface
  ['{1DFF971B-BE77-48D2-90E8-5F507ADA128C}']
    procedure ActivateKeyboardHook;
    procedure BootUp;
    procedure DesignerClosed(aFormFile: string);
    procedure DisableKeyBoardHook;
    procedure FileClosing(aFormFile: string);
    function GetLogger: ILogger;
    function GetViewManager: IViewManager;
    procedure InstallSourceEditorNotifiers(Module: IOTAModule);
    procedure PrintMessage(const aMsg: string);
    procedure ShutDown;
    procedure EditorNotifierAboutToBeDestroyed(aNotifier: IEditorNotifier);
    property Logger: ILogger read GetLogger;
    property ViewManager: IViewManager read GetViewManager;
  end;

  IEditorNotifier = interface
  ['{3F5EBCA8-162C-467F-A21D-4EB5800F450B}']
    procedure CleanUp;
    function GetFileName: string;
    property FileName: string read GetFileName;
  end;

  ILogger = interface
  ['{B4510A5D-AD1F-4E08-A85B-D1CE1A115D50}']
    procedure ClearLog;
    procedure LogMessage(aMessage: string);
    procedure OpenLogLocation;
  end;

implementation

end.

