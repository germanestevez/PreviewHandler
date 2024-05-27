unit uConstantes;

interface

// NOTA: sólo cambiando esta constante podemos registrar otra extensión diferente
const
  EXTENSION_FICHERO_SIN_PUNTO = 'log';

  sExtension     = '.' + EXTENSION_FICHERO_SIN_PUNTO;               // Extensión del fichero
  sExtFile        = EXTENSION_FICHERO_SIN_PUNTO + 'File';            // ProgID - Nombre asociado al fichero (aaaFile)
  aAppId          = EXTENSION_FICHERO_SIN_PUNTO + 'ShellHandler';    // nombre asociado al Preview (aaaShellHandler)
  sAppDescription = EXTENSION_FICHERO_SIN_PUNTO + ' Shell Handler';  // Descripción del Preview (aaa Shell Handler)

  SID_EXT_ShellHandler = '{BF610D72-56C3-45A0-8739-94465FF1062F}';
  IID_EXT_ShellHandler: TGUID = SID_EXT_ShellHandler;

implementation

end.
