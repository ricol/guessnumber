program GuessNumber;

uses
  Forms,
  main in 'main.pas' {FormMain},
  MyUnit in 'MyUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
