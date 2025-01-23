unit frmArticulo;

interface

uses
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Dialogs;

type
  TfrmArticulo = class(TForm)
    imgArticulo: TImage;
    OpenDialog1: TOpenDialog;
    ButtonCargarFoto: TButton;
    procedure ButtonCargarFotoClick(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TfrmArticulo.ButtonCargarFotoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    imgArticulo.Picture.LoadFromFile(OpenDialog1.FileName); // Cargar imagen
end;

end.

