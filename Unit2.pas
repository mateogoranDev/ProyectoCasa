﻿unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm2 = class(TForm)
    EEditID: TEdit;
    ButtonBuscar: TButton;
    LabelNombre: TLabel;
    LabelDescripcion: TLabel;
    LabelImporte: TLabel;
    Image1: TImage;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    GBDetalleArticulo: TGroupBox;
    PNumeroArticulo: TPanel;

    procedure ButtonBuscarClick(Sender: TObject);
    procedure SetArticuloDatos(const Nombre, Descripcion, Importe: string;
      Foto: TStream);
    procedure FormCreate(Sender: TObject);

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.FormCreate(Sender: TObject);
begin
  // Cargar una imagen por defecto en caso de que no se encuentre el artículo
  Image1.Picture.LoadFromFile('C:\Users\informatica2\Downloads\porDefecto.jpg');
end;

procedure TForm2.SetArticuloDatos(const Nombre, Descripcion, Importe: string;
  Foto: TStream);
var
  RutaImagen: string;
begin
  // Asignar los valores a los controles correspondientes
  LabelNombre.Caption := 'Nombre: ' + Nombre;
  LabelDescripcion.Caption := 'Descripción: ' + Descripcion;
  LabelImporte.Caption := 'Importe: ' + Importe;

  // Definir la ruta relativa a la carpeta "imagenes"
  RutaImagen := ExtractFilePath(Application.ExeName) +
    'imagenes\fotoArticulo.jpg';

  // Cargar la imagen desde el stream si está disponible
  if Foto <> nil then
  begin
    Foto.Position := 0;
    // Asegurarse de que el stream comience desde el principio
    Image1.Picture.Graphic.LoadFromStream(Foto);
  end
  else if FileExists(RutaImagen) then
  begin
    // Si no hay foto en el stream, cargar la imagen desde la carpeta 'imagenes'
    Image1.Picture.LoadFromFile(RutaImagen);
  end
  else
  begin
    // Si no hay foto y no se encuentra la imagen, cargar una imagen por defecto
    Image1.Picture.LoadFromFile
      ('C:\Users\informatica2\Downloads\porDefecto.jpg');
  end;
end;

procedure TForm2.ButtonBuscarClick(Sender: TObject);
var
  idArticulo: Integer;
  FotoStream: TMemoryStream;
begin
  // Validar que se haya ingresado un ID
  if EEditID.Text = '' then
  begin
    ShowMessage('Por favor, introduce un ID de artículo.');
    Exit;
  end;

  // Validar que el ID sea numérico
  if not TryStrToInt(EEditID.Text, idArticulo) then
  begin
    ShowMessage('El ID del artículo debe ser un número válido.');
    Exit;
  end;

  // Realizar la consulta para obtener los detalles del artículo por IDArticulo
  try
    FDQuery1.SQL.Text :=
      'SELECT nombre, descripcion, importe, foto FROM articulo WHERE idArticulo = :idArticulo';
    FDQuery1.ParamByName('idArticulo').AsInteger := idArticulo;
    FDQuery1.Open;

    if FDQuery1.RecordCount = 0 then
    begin
      ShowMessage('No se encontró ningún artículo con el ID proporcionado.');
      Exit;
    end;

    // Crear un stream para la foto si está disponible
    FotoStream := TMemoryStream.Create;
    try
      if not FDQuery1.FieldByName('foto').IsNull then
      begin
        TBlobField(FDQuery1.FieldByName('foto')).SaveToStream(FotoStream);
      end;

      // Pasar los datos al método SetArticuloDatos
      SetArticuloDatos(FDQuery1.FieldByName('nombre').AsString,
        FDQuery1.FieldByName('descripcion').AsString,
        FDQuery1.FieldByName('importe').AsString, FotoStream);
    finally
      FotoStream.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Error al buscar el artículo: ' + E.Message);
  end;
end;

end.
