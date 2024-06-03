library ShellPreviewImagesFiles;

uses
  ComServ,
  uPreviewHandler in 'uPreviewHandler.pas',
  uPreviewBaseForm in 'uPreviewBaseForm.pas' {FormPreviewBase},
  uUtils in 'uUtils.pas',
  uRegister in 'uRegister.pas',
  uConstantes in 'uConstantes.pas',
  uPreviewImagesHandler in 'uPreviewImagesHandler.pas',
  uPreviewImageForm in 'uPreviewImageForm.pas' {FormPreviewImage};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.RES}

begin

end.
