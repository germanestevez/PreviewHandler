{
Formulario con los componentes necesarios para mostrar la previsualización del fichero seleccionado.
@author Germán Estévez
@cat Form
}
unit uPreviewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFormPreview = class(TForm)
    mmFile: TMemo;
    pnlBotones: TPanel;
    sbWordWrap: TSpeedButton;
    sbMayor: TSpeedButton;
    sbMenor: TSpeedButton;
    procedure sbWordWrapClick(Sender: TObject);
    procedure sbMayorClick(Sender: TObject);
    procedure sbMenorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  System.Math,
  uUtils;

procedure TFormPreview.sbMayorClick(Sender: TObject);
begin
  mmFile.Font.Size := mmFile.Font.Size + 2;
end;

procedure TFormPreview.sbMenorClick(Sender: TObject);
begin
  mmFile.Font.Size := Max(mmFile.Font.Size - 2, 8);
end;

procedure TFormPreview.sbWordWrapClick(Sender: TObject);
begin
  mmFile.WordWrap := not mmFile.WordWrap;
end;

end.
