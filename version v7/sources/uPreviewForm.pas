{
Formulario con los componentes necesarios para mostrar la previsualización del fichero seleccionado.
@author Germán Estévez
@cat Form
}
unit uPreviewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.ComCtrls;

type
  TFormPreview = class(TForm)
    mmFile: TMemo;
    pnlBotones: TPanel;
    sbWordWrap: TSpeedButton;
    sbMayor: TSpeedButton;
    sbMenor: TSpeedButton;
    ilMain: TImageList;
    alMain: TActionList;
    actWordWrap: TAction;
    actZoomMas: TAction;
    actZoomMenos: TAction;
    Panel1: TPanel;
    cbFuenteLetra: TEdit;
    SpeedButton1: TSpeedButton;
    actCopy: TAction;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    pmFuentes: TPopupMenu;
    Cascadiacode1: TMenuItem;
    Cascadiacode2: TMenuItem;
    Courier1: TMenuItem;
    Courier2: TMenuItem;
    Firacode1: TMenuItem;
    Firacode2: TMenuItem;
    Monoid1: TMenuItem;
    Monoid2: TMenuItem;
    erminal1: TMenuItem;
    pnlLineas: TPanel;
    pnlPalabras: TPanel;
    pnlChars: TPanel;
    procedure actZoomMasExecute(Sender: TObject);
    procedure actZoomMenosExecute(Sender: TObject);
    procedure actWordWrapExecute(Sender: TObject);
    procedure cbFuenteLetraChange(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure pmFuentesPopup(Sender: TObject);
  private
    procedure ChangeFont(Sender: TObject);
  protected
    procedure Loaded; override;
  public
    procedure RefreshInfo;
  end;

implementation

{$R *.dfm}

uses
  uConstantes, uConfig, SHFolder,
  VCL.Clipbrd, Registry,
  WinAPI.ShlObj,
  System.Math, System.IOUtils, System.IniFiles,
  uUtils;

procedure TFormPreview.actCopyExecute(Sender: TObject);
begin
  Clipboard.AsText := mmFile.Lines.Text;
end;

procedure TFormPreview.actWordWrapExecute(Sender: TObject);
begin
  mmFile.WordWrap := not mmFile.WordWrap;
end;

procedure TFormPreview.actZoomMasExecute(Sender: TObject);
begin
  mmFile.Font.Size := mmFile.Font.Size + 2;
end;

procedure TFormPreview.actZoomMenosExecute(Sender: TObject);
begin
  mmFile.Font.Size := Max(mmFile.Font.Size - 2, 8);
end;

procedure TFormPreview.cbFuenteLetraChange(Sender: TObject);
begin
  mmFile.Font.Name := cbFuenteLetra.Text;
end;

procedure TFormPreview.ChangeFont(Sender: TObject);
begin
  mmFile.Font.Name := TMenuItem(Sender).Caption;
  TMenuItem(Sender).Checked := True;
  cbFuenteLetra.Text := TMenuItem(Sender).Caption;
end;

procedure TFormPreview.Loaded;
begin
  inherited;
end;

procedure TFormPreview.pmFuentesPopup(Sender: TObject);
begin
  for var i:= 0 to TPopupMenu(Sender).Items.Count - 1 do
    TPopupMenu(Sender).Items[i].OnClick := ChangeFont;
end;

procedure TFormPreview.RefreshInfo;
begin
  pnlLineas.Caption := (mmFile.Lines.Count - 1).ToString + ' l.';
  pnlPalabras.Caption := ContarPalabras(mmFile.Lines.Text).ToString + ' p.';
  pnlChars.Caption := Length(mmFile.Lines.Text).ToString + ' c.';
  pnlLineas.Invalidate;
  pnlPalabras.Invalidate;
  pnlChars.Invalidate;
end;

end.
