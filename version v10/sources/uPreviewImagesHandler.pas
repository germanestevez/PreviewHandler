unit uPreviewImagesHandler;

interface

uses
  Windows, Messages, ActiveX, Classes, ComObj, ComServ, ShlObj, Registry,
  PropSys, Types, SysUtils, Math,
  VCL.ExtCtrls, VCL.StdCtrls, VCL.Controls,
  uPreviewHandler, uPreviewBaseForm, uPreviewImageForm;

type
  TImageShellExt = class(TFileShellExt)
  protected
    // Procedimiento que realmente realiza la previsualizacion
    procedure InternalDoPreview; override;
    class function FormPreviewClass:TFormPreviewClass; override;
  end;

implementation

uses
  uUtils,
  System.StrUtils,
  uConstantes, Vcl.AxCtrls,
  VCL.Graphics, VCL.Forms;


class function TImageShellExt.FormPreviewClass: TFormPreviewClass;
begin
  inherited;
  Result := TFormPreviewImage;
end;

procedure TImageShellExt.InternalDoPreview;
begin
  inherited;

  // Cargar la preview
  var ext := ExtractFileExt(FilePath).ToLower;
  ext := ReplaceText(ext, '.', string.empty);

  if MatchStr(ext, ['bmp', 'jpg', 'jpeg', 'png', 'gif', 'ico', {'svg', 'webp', 'wbmp',} 'wmf', 'emf', 'tif', 'tiff']) then
    FormPreview.DoPreviewEXT(FilePath);
end;

initialization
  // Permite registrar nuestro "Preview" con el ID, nombre, descripción y extensión del archivo
  TComObjectFactory.Create(ComServer, TImageShellExt, IID_EXT_ShellHandler, _sAppId, _sAppDescription, ciMultiInstance, tmApartment);

end.
