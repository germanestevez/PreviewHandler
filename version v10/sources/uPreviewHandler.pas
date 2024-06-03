{
Unit que implementa las interfaces necesarias (sobre la clase TBaseShellExt) para el previsualizador.
@author Germán Estévez
@cat Unit
}
unit uPreviewHandler;

interface

uses
  Windows, Messages, ActiveX, Classes, ComObj, ComServ, ShlObj, Registry,
  PropSys, Types, SysUtils, Math,
  VCL.ExtCtrls, VCL.StdCtrls, VCL.Controls,
  uPreviewBaseForm;

type
  TBaseShellExt = class abstract(TComObject, IPreviewHandler)
  private
    // Permite cargar datos desde el origen especificado en una llamada de método Initialize anterior y para comenzar la representación en la ventana del controlador de vista previa
    function DoPreview: HRESULT; stdcall;
    // Permite devolver el HWND desde una llamada a la función GetFocus.
    function QueryFocus(var phwnd: HWND): HRESULT; stdcall;
    // Permite establecer el foco en sí mismo.
    function SetFocus: HRESULT; stdcall;
    // Permite cambiar el área dentro del hwnd primario en el que se dibuja.
    function SetRect(var prc: TRect): HRESULT; stdcall;
    // Establece la ventana primaria de la ventana del previsualizador, así como el área dentro del elemento primario que se va a usar para la ventana del previsualizador.
    function SetWindow(hwnd: HWND; var prc: TRect): HRESULT; stdcall;
    // Permite controlar una pulsación de tecla pasada desde la bomba de mensajes del proceso en el que se ejecuta el controlador de vista previa
    function TranslateAccelerator(var pmsg: tagMSG): HRESULT; stdcall;
    // Permite dejar de representar una vista previa y liberar todos los recursos asignados en función del elemento pasado durante la inicialización
    function Unload: HRESULT; stdcall;
  private
    FParent: HWND;     // Handle de la ventana de previsualizacion
    FBounds: TRect;    // Define el area de la previsualizacion
  protected
    FormPreview: TFormPreviewBase;     // formuario de previsualizacion
    // Procedimiento que realmente realiza la previsualizacion
    procedure InternalDoPreview; virtual;
    procedure AfterDoPreview; virtual;
    // testear la ventana de previsualizacion
    procedure TestPreviewWindows;
    // Devuelve la clase contructora del formulario de visualización (a redefinir en los derivados)
    class function FormPreviewClass:TFormPreviewClass; virtual; abstract;
  public
    destructor Destroy; override;
  end;

  TFileShellExt = class(TBaseShellExt, IInitializeWithFile)
  strict private
    function IInitializeWithFile.Initialize = IInitializeWithFile_Init;
  private
    FFilePath: string;
    // Inicialización para ficheros
    function IInitializeWithFile_Init(pszFilePath: LPCWSTR; grfMode: DWORD): HRESULT; stdcall;
  public
    property FilePath:string read FFilePath write FFilePath;
  end;

  TStreamShellExt = class(TBaseShellExt, IInitializeWithStream)
  strict private
    function IInitializeWithStream.Initialize = IInitializeWithStream_Init;
  private
    FStream:IStream;
    // Inicilización para stream
    function IInitializeWithStream_Init(const pstream: IStream; grfMode: DWORD): HRESULT; stdcall;
  protected
    // Procedimiento que realmente realiza la previsualizacion
    procedure InternalDoPreview; override;
  end;

var
  res: HRESULT;

implementation

uses
  uUtils,
  System.StrUtils,
  uConstantes, Vcl.AxCtrls,
  VCL.Graphics, VCL.Forms;


{ TBaseShellExt }

procedure TBaseShellExt.TestPreviewWindows;
begin
  // Si no está asignado el formulario, lo creamos...
  if not Assigned(FormPreview) then begin
    FormPreview := FormPreviewClass.Create(nil);
    FormPreview.ParentWindow := FParent;
  end;

  // Caracteristicas del form de preview
  FormPreview.BorderStyle := bsNone;
  FormPreview.Align := TAlign.alClient;
  FormPreview.WindowState := TWindowState.wsMaximized;
  FormPreview.Show;
  // forzar el repintado
  FormPreview.Invalidate;
  // Forzar la posicion
  SetWindowPos(FormPreview.Handle, 0, fBounds.left, fBounds.top,  RectWidth(fBounds), RectHeight(fBounds), SWP_NOZORDER or SWP_NOACTIVATE);
end;

procedure TBaseShellExt.InternalDoPreview;
begin
  // Chequear la ventana
  TestPreviewWindows;
end;

function TBaseShellExt.DoPreview: HRESULT;
begin
  Result := S_OK;

  // si no tengo asignado parent (de la ventana) salgo..
  if FParent = 0 then begin
    Exit;
  end;

  // Realizo el trabajo0 de previsualizacion
  TestPreviewWindows;
end;

procedure TBaseShellExt.AfterDoPreview;
begin
  FormPreview.RefreshInfo;
end;

destructor TBaseShellExt.Destroy;
begin
  inherited;
  if Assigned(FormPreview) then
    FreeAndNil(FormPreview);
end;

function TBaseShellExt.QueryFocus(var phwnd: HWND): HRESULT;
begin
  phwnd := GetFocus;    // devuelvo el foco
  result := S_OK;
end;

function TBaseShellExt.SetFocus: HRESULT;
begin
  Result := S_OK;
end;

function TBaseShellExt.SetRect(var prc: TRect): HRESULT;
begin
  FBounds := prc;      // me quedo con la nueva posicion y repinto
  InternalDoPreview;
  AfterDoPreview;
  Result := S_OK;
end;

function TBaseShellExt.SetWindow(hwnd: HWND; var prc: TRect): HRESULT;
begin
  if (hwnd <> 0) then
    FParent := hwnd;
  if (@prc <> nil) then
    FBounds := prc;

  InternalDoPreview;            // forzar redibujadio
  AfterDoPreview;
  Result := S_OK;
end;

function TBaseShellExt.TranslateAccelerator(var pmsg: tagMSG): HRESULT;
begin
  Result := S_FALSE;     // Por ahora así; False cuando no se controla nada.
end;

function TBaseShellExt.Unload: HRESULT;
begin
  // liberar lo creado
  FreeAndNil(FormPreview);
  // FStream := nil;
  FParent := 0;

  Result := S_OK;
end;


function TStreamShellExt.IInitializeWithStream_Init(const pstream: IStream; grfMode: DWORD): HRESULT;
begin
  // inicializaciones
  FormPreview := nil;

  // Apuntamos al stream
  FStream := pstream;
  Result := S_OK;
end;

procedure TStreamShellExt.InternalDoPreview;
begin
  inherited;

end;

function TFileShellExt.IInitializeWithFile_Init(pszFilePath: LPCWSTR; grfMode: DWORD): HRESULT;
begin
  // inicializaciones
  FormPreview := nil;
  FFilePath := string.Empty;
  // Apuntamos el path del fichero
  FFilePath := pszFilePath;
  Result := S_OK;
end;


initialization
  res := OleInitialize(nil);

finalization
  if res = S_OK then
    OleUninitialize();

end.
