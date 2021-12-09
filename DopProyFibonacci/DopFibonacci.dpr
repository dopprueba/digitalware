program DopFibonacci;

uses
  Vcl.Forms,
  VistaMenu in 'vista\VistaMenu.pas' {FVistaMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFVistaMenu, FVistaMenu);
  Application.Run;
end.
