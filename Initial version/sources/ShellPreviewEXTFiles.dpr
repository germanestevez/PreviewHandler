library ShellPreviewEXTFiles;

uses
  ComServ,
  uPreviewHandler in 'uPreviewHandler.pas',
  uPreviewForm in 'uPreviewForm.pas' {FormPreview},
  uUtils in 'uUtils.pas',
  uRegister in 'uRegister.pas',
  uConstantes in 'uConstantes.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.RES}

begin

end.
