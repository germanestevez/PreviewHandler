unit uPreviewImageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPreviewBaseForm, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFormPreviewImage = class(TFormPreviewBase)
    img: TImage;
    sbAjustar: TSpeedButton;
    SepAjustar: TSplitter;
    sbCopiar: TSpeedButton;
    SepCopiar: TSplitter;
    pnlTamaño: TPanel;
    actAjustar: TAction;
    actCopy: TAction;
    procedure actCopyExecute(Sender: TObject);
    procedure actAjustarExecute(Sender: TObject);
  private
  protected
  public
    procedure RefreshInfo; override;
    procedure DoPreviewEXT(const AFileName:TFileName); override;
  end;


implementation

{$R *.dfm}

uses
  VCL.Clipbrd,
  System.Math, System.IOUtils, System.IniFiles, System.AnsiStrings;

procedure TFormPreviewImage.actAjustarExecute(Sender: TObject);
begin
  img.Stretch := not img.Stretch;
end;

procedure TFormPreviewImage.actCopyExecute(Sender: TObject);
begin
  Clipboard.Assign(img.Picture);
end;

procedure TFormPreviewImage.DoPreviewEXT(const AFileName: TFileName);
begin
  inherited;
  Extension := AnsiReplaceText(AnsiString(ExtractFileExt(AFileName)), '.', string.Empty);
  img.Picture.LoadFromFile(AFileName);
end;

procedure TFormPreviewImage.RefreshInfo;
begin
  inherited;
  pnlTamaño.Caption := img.Picture.Width.ToString + 'x' + img.Picture.Height.ToString;
  pnlTamaño.Invalidate;
end;

end.
