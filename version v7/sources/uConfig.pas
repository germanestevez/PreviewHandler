unit uConfig;

interface

uses
  VCL.Graphics;

type
  TPreviewConfig = record
    Init: boolean;
    FontName: TFontName;
    FontSize: integer;
    WordWrap: boolean;
    procedure Fill(const AFontName:TFontName; const AFontSize: integer; const AWordWrap: boolean);
  end;

var
  PreviewConfig:TPreviewConfig;

implementation

{ TPreviewConfig }

procedure TPreviewConfig.Fill(const AFontName: TFontName;const AFontSize: integer; const AWordWrap: boolean);
begin
  Init := True;
  FontName := AFontName;
  FontSize := AFontSize;
  WordWrap := AWordWrap;
end;

end.
