{*************************************************************}
{                                                             }
{ Delphi Runtime Library                                      }
{                                                             }
{ Copyright (C) 1996-2000, Eugene Roshal                      }
{ Copyright (C) 2000-2018, Far Group                          }
{ Copyright (C) 1995-2018, Yegor Myalik. All Rights Reserved. }
{                                                             }
{*************************************************************}

unit Far.Plugin;

{$INCLUDE compiler.inc}
{$WEAKPACKAGEUNIT}

interface

uses
  Winapi.Windows;

{$RTTI EXPLICIT METHODS([]) FIELDS([]) PROPERTIES([])}

type
  PIntPtr = ^IntPtr;

  TFarStdQSortFunc = function (
    Param1: Pointer;
    Param2: Pointer;
    userparam: Pointer): Integer; stdcall;

  FARSTDQSORT = procedure (
    base: Pointer;
    nelem: UIntPtr;
    width: UIntPtr;
    fcmp: TFarStdQSortFunc;
    userparam: Pointer); stdcall;

  FARSTDBSEARCH = procedure (
    key: Pointer;
    base: Pointer;
    nelem: UIntPtr;
    width: UIntPtr;
    fcmp: TFarStdQSortFunc;
    userparam: Pointer); stdcall;

{$INCLUDE Far.Plugin.Farcolor.Generated.pas}
{$INCLUDE Far.Plugin.Plugin.Generated.pas}
{$INCLUDE Far.Plugin.FarGuid.Generated.pas}
{$INCLUDE Far.Plugin.KnownGuids.Generated.pas}
{$INCLUDE Far.Plugin.DlgGuid.Generated.pas}
{$INCLUDE Far.Plugin.Helpers.Generated.pas}
{$INCLUDE Far.Plugin.Settings.pas}

function MakeFarVersion(const Major, Minor, Build, Revision: DWORD; const Stage: VERSION_STAGE = VS_RELEASE): VersionInfo;
procedure InitStartupInfo(const StartupInfo: PluginStartupInfo);

var
  FarAPI: PluginStartupInfo;
  FSF: FarStandardFunctions;

implementation

function MakeFarVersion;
begin
  Result.Major := Major;
  Result.Minor := Minor;
  Result.Build := Build;
  Result.Revision := Revision;
  Result.Stage := Stage;
end;

procedure InitStartupInfo;
begin
  FarAPI := StartupInfo;
  FSF := StartupInfo.FSF^;
  FarAPI.FSF := @FSF;
end;

{$DEFINE _FAR_IMPLEMENTATION_}
{$INCLUDE Far.Plugin.Helpers.Generated.pas}
{$INCLUDE Far.Plugin.Settings.pas}
{$UNDEF _FAR_IMPLEMENTATION_}

end.