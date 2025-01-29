unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, FireDAC.Stan.Pool, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.VCLUI.Wait;

type
  TForm2 = class(TForm)

    EEditID: TEdit;
    ButtonBuscar: TButton;
    LabelNombre: TLabel;
    LabelDescripcion: TLabel;
    LabelImporte: TLabel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    GBDetalleArticulo: TGroupBox;
    PNumeroArticulo: TPanel;
    ImageDefault: TImage;
    BAddFoto: TButton;
    EAddFoto: TEdit;
    GBAddFotografia: TGroupBox;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    FDConnection1: TFDConnection;
    procedure SetArticuloDatos(const Nombre, Descripcion, Importe: string;
      Foto: TStream);
    procedure FormCreate(Sender: TObject);
    procedure ButtonBuscarClick(Sender: TObject);
    procedure BAddFotoClick(Sender: TObject);

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.BAddFotoClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  ImagePath: string;
  FDQuery: TFDQuery;
  ID: Integer;
begin
  try
    // Configurar la conexión
    FDConnection1.Params.Clear;
    FDConnection1.Params.Add('DriverID=MySQL');
    FDConnection1.Params.Add('Server=127.0.0.1');
    FDConnection1.Params.Add('Port=3306');
    FDConnection1.Params.Add('Database=almacen');
    FDConnection1.Params.Add('User_Name=root');
    FDConnection1.Params.Add('Password=root');
    FDConnection1.Connected := True;

    // Crear el diálogo para seleccionar la imagen
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.Title := 'Seleccionar imagen';
      OpenDialog.Filter := 'Archivos de imagen|*.jpg;*.jpeg;*.png;*.bmp';

      if not OpenDialog.Execute then
      begin
        ShowMessage('No se seleccionó ninguna imagen.');
        Exit;
      end;

      // Obtener la ruta de la imagen seleccionada
      ImagePath := OpenDialog.FileName;

      // Validar el ID ingresado
      if not TryStrToInt(EAddFoto.Text, ID) then
      begin
        ShowMessage('Por favor, introduce un ID válido.');
        Exit;
      end;

      // Crear la consulta SQL para actualizar el campo foto
      FDQuery := TFDQuery.Create(nil);
      try
        FDQuery.Connection := FDConnection1;
        FDQuery.SQL.Text :=
          'UPDATE articulo SET foto = :foto WHERE idArticulo = :idArticulo';
        FDQuery.Params.ParamByName('foto').AsString := ImagePath;
        FDQuery.Params.ParamByName('idArticulo').AsInteger := ID;
        FDQuery.ExecSQL;

        ShowMessage('La foto se ha guardado correctamente.');
      except
        on E: Exception do
          ShowMessage('Error al guardar la foto: ' + E.Message);
      end;
      FDQuery.Free;
    finally
      OpenDialog.Free;
    end;
  except
    on E: Exception do
      ShowMessage('Error al conectar con la base de datos: ' + E.Message);
  end;
end;

procedure TForm2.ButtonBuscarClick(Sender: TObject);
var
  NumeroFoto: Integer;
begin
  try

  except
    on E: Exception do
      ShowMessage('Por favor introduce un número válido: ' + E.Message);
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  if FDQuery1.Active then
    FDQuery1.Close;
  // Cargar una imagen por defecto en caso de que no se encuentre el artículo
  ImageDefault.Picture.LoadFromFile
    ('C:\Users\informatica2\Desktop\Warehouse\imagenes\porDefecto.jpg');
  if not FileExists('C:\Users\informatica2\Downloads\porDefecto.jpg') then
    ShowMessage
      ('La imagen por defecto no se encontró en la ruta especificada.');
  try
    FDQuery1.Connection := Form1.FDConnection1;
    FDQuery1.SQL.Text := 'SELECT * FROM articulo';
    FDQuery1.Open;
    FDQuery1.Active := True;
    // ShowMessage('Estoy dentro') ;

  except
    on E: Exception do
      ShowMessage('Error de conexión: ' + E.Message);
  end;

end;

procedure TForm2.SetArticuloDatos(const Nombre, Descripcion, Importe: string;
  Foto: TStream);
var
  RutaImagen: string;
begin
  // Asignar los valores a los controles correspondientes
  LabelNombre.Caption := 'Nombre:  ' + Nombre;
  LabelDescripcion.Caption := 'Descripción:  ' + Descripcion;
  LabelImporte.Caption := 'Importe:  ' + Importe;

  // Definir la ruta relativa a la carpeta "imagenes"
  RutaImagen := ExtractFilePath(Application.ExeName) +
    'C:\Users\informatica2\Desktop\Warehouse\imagenes';

end;

end.
