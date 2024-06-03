unit uConstantes;

interface

// NOTA: sólo cambiando esta constante podemos registrar varias extewnsiones diferentes
const
  EXTENSIONES_FICHEROS_SEPARADAS = 'bmp;jpg;jpeg;png;gif;ico;wmf;emf;tif;tiff';

  _sAppId          = 'TextFilesShellHandler';     // nombre asociado al Preview (aaaShellHandler)
  _sAppDescription = 'Text Files Shell Handler';  // Descripción del Preview (aaa Shell Handler)

  SID_EXT_ShellHandler = '{706FE8D6-7005-44D8-91EE-43755823010B}';
  IID_EXT_ShellHandler: TGUID = SID_EXT_ShellHandler;

  NEFTALIURL = 'https://neftali.clubdelphi.com';


implementation

end.
