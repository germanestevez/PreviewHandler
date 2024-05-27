unit uConstantes;

interface

// NOTA: sólo cambiando esta constante podemos registrar varias extewnsiones diferentes
const
  EXTENSIONES_FICHEROS_SEPARADAS = 'log;ini;cfg;inf;key;nfo;txt';

  _sAppId          = 'TextFilesShellHandler';     // nombre asociado al Preview (aaaShellHandler)
  _sAppDescription = 'Text Files Shell Handler';  // Descripción del Preview (aaa Shell Handler)

  SID_EXT_ShellHandler = '{BF610D72-56C3-45A0-8739-94465FF1062F}';
  IID_EXT_ShellHandler: TGUID = SID_EXT_ShellHandler;


implementation

end.
