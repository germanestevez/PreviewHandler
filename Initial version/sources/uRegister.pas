unit uRegister;

interface

uses
  Registry;

// Registrar la DLL
function DllRegisterServer: HResult; stdcall;
// Desregistrar la DLL
function DllUnregisterServer: HResult; stdcall;

implementation

uses
  WinAPI.Windows, WinAPI.ShlObj,
  uUtils, uConstantes;

// Registrar la DLL
function DllRegisterServer: HResult; stdcall;
var
  reg: TRegistry;
  sAppId: string;
begin

  // Saber si estamos en 32b o 64b
  if IsRunningOnWOW64 then
    sAppId := '{534A1E02-D58F-44f0-B58B-36CBED287C7C}' // Para las extensiones win32 que corren en Win64
  else
    sAppId := '{6D2B5079-2F0B-48DD-AB7F-97CEC514D30B}';

  Result := E_UNEXPECTED; //will fail if not ADMIN
  reg := TRegistry.Create(KEY_ALL_ACCESS);
  try
    reg.RootKey := HKEY_CLASSES_ROOT;
      if not reg.OpenKey(sExtension, true) then Exit;
    reg.WriteString('', sExtFile);
    reg.CloseKey;

    if not reg.OpenKey(sExtFile, true) then Exit;
    reg.CloseKey;

    if not reg.OpenKey('\CLSID', true) then Exit;
    reg.WriteString('', SID_EXT_ShellHandler);
    reg.CloseKey;

    if not reg.OpenKey(sExtension+'\ShellEx\'+SID_IPreviewHandler, true) then Exit;
    reg.WriteString('', SID_EXT_ShellHandler);
    reg.CloseKey;

    if not reg.OpenKey(sExtFile +'\ShellEx\'+SID_IPreviewHandler, true) then Exit;
    reg.WriteString('', SID_EXT_ShellHandler);
    reg.CloseKey;

    if not reg.OpenKey('CLSID\'+ SID_EXT_ShellHandler, true) then Exit;
    reg.WriteString('', sAppDescription);
    reg.WriteString('AppID', sAppId);
    reg.CloseKey;

    reg.OpenKey('CLSID\'+ SID_EXT_ShellHandler+'\InProcServer32', true);
    reg.WriteString('', GetModuleName);
    reg.WriteString('ThreadingModel', 'Apartment');
    reg.CloseKey;

    reg.OpenKey('CLSID\' + SID_EXT_ShellHandler + '\ProgId', true);
    reg.WriteString('', sExtFile);
    reg.CloseKey;

    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\PreviewHandlers', true) then
    begin
      reg.WriteString(SID_EXT_ShellHandler, sAppDescription);
      reg.CloseKey;
    end;
  finally
    reg.Free;
  end;

  Result := S_OK;
end;

// Desregistrar la DLL
function DllUnregisterServer: HResult; stdcall;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_ALL_ACCESS);
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;

    if reg.OpenKey('SOFTWARE\Microsoft\Windows\'+'CurrentVersion\PreviewHandlers', true) and reg.ValueExists(SID_EXT_ShellHandler) then
      reg.DeleteValue(SID_EXT_ShellHandler);

    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.OpenKey('SOFTWARE\Microsoft\Windows\'+'CurrentVersion\PreviewHandlers', true) and reg.ValueExists(SID_EXT_ShellHandler) then
      reg.DeleteValue(SID_EXT_ShellHandler);

    reg.RootKey := HKEY_CLASSES_ROOT;
    reg.DeleteKey(sExtension);
    reg.DeleteKey(sExtFile);
    if reg.KeyExists(sExtension + '\ShellEx\'+SID_IPreviewHandler) then
      reg.DeleteKey(sExtension + '\ShellEx\'+SID_IPreviewHandler);

    reg.DeleteKey('CLSID\'+SID_EXT_ShellHandler);
    reg.DeleteKey(sExtFile+'\ShellEx\'+SID_IPreviewHandler);
    reg.DeleteKey(sExtFile+'\CLSID');
  finally
    reg.Free;
  end;

  Result := S_OK;
end;

end.