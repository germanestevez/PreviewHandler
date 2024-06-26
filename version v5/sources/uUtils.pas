unit uUtils;

interface

// Detectar si mi aplicación Delphi se ejecuta en una versión de 64 bits de Windows.
function IsRunningOnWOW64: Boolean;
// Permite LOG a OutputdebugString
procedure _ODS(AMensaje:string);
function GetModuleName: string;

implementation

uses
  System.SysUtils,
  Windows;

{ procedure from:
  https://theroadtodelphi.com/2009/09/23/detect-if-my-delphi-application-is-running-under-a-64-bit-version-of-windows/}
function IsRunningOnWOW64: Boolean;
type
  TIsWow64Process = function( hProcess: Windows.THandle; var Wow64Process: Windows.BOOL): Windows.BOOL; stdcall;
var
  IsWow64Process: TIsWow64Process;
  Wow64Process  : Windows.BOOL;
begin
  Result := False;
  IsWow64Process := GetProcAddress(GetModuleHandle(Windows.kernel32), 'IsWow64Process');
  if Assigned(IsWow64Process) then
  begin
    if not IsWow64Process(GetCurrentProcess, Wow64Process) then
    Raise Exception.Create('Invalid handle');
    Result := Wow64Process;
  end;
end;

procedure _ODS(AMensaje:string); overload;
begin
  OutputDebugString(PChar('  ' + AMensaje));
end;

function GetModuleName: string;
var
  i: integer;
begin
  SetLength(Result, MAX_PATH);
  i := GetModuleFileName(hInstance, @Result[1], MAX_PATH);
  SetLength(Result, i);

  var str:string := Result;
  _ODS('  GetModuleName=' + str);
end;

end.
