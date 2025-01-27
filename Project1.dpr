program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Articulos},
  FormularioArticulo in 'FormularioArticulo.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TArticulos, Articulos);
 //Application.CreateForm(TForm2, Form2);
  Application.Run;

end.
