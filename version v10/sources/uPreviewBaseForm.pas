{
Formulario con los componentes necesarios para mostrar la previsualizaci�n del fichero seleccionado.
@author Germ�n Est�vez
@cat Form
}
unit uPreviewBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TFormPreviewClass = class of TFormPreviewBase;

  TFormPreviewBase = class(TForm)
    pnlBotones: TPanel;
    ilMain: TImageList;
    alMain: TActionList;
    pnlExtensi�n: TPanel;
    SpeedButton1: TSpeedButton;
    sepInfo: TSplitter;
    actInfo: TAction;
    procedure actInfoExecute(Sender: TObject);
  private
    FExtension: Ansistring;

  protected
    procedure Loaded; override;
  public
    procedure DoPreviewEXT(const AFileName:TFileName); virtual; abstract;

    procedure RefreshInfo; virtual;
    property Extension:Ansistring read FExtension write FExtension;
  end;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI,
  uConstantes, SHFolder,
  VCL.Clipbrd,
  WinAPI.ShlObj,
  System.Math, System.IOUtils, System.IniFiles, System.AnsiStrings,
  uUtils;


procedure TFormPreviewBase.actInfoExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(NEFTALIURL), nil, nil, SW_SHOW);
  ShellExecute(Handle, 'open', PChar('http://neftali.clubdelphi.com'), nil, nil, SW_SHOWNORMAL);
  ShellExecute(Handle, nil, PChar('http://neftali.clubdelphi.com'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormPreviewBase.Loaded;
begin
  inherited;
end;

procedure TFormPreviewBase.RefreshInfo;
begin
  pnlExtensi�n.Caption := string(FExtension).ToUpper;
  pnlExtensi�n.Invalidate;
end;

end.
