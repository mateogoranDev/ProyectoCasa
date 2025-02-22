﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.DateUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.SqlExpr, Vcl.ComCtrls, Vcl.ExtCtrls, Unit2, Vcl.Buttons;

type
  TForm1 = class(TForm)

    // Conexión
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    SQLConnection1: TSQLConnection;
    DataSource1: TDataSource;

    // Campos base de datos
    DBGrid1: TDBGrid;
    BInsertarClick: TButton;
    EditNombre: TEdit;
    EditDescripcion: TEdit;
    DateTimePickerCompra: TDateTimePicker;
    DateTimePickerDevolucion: TDateTimePicker;
    PCompra: TPanel;
    PDevolucion: TPanel;
    PNombre: TPanel;
    PDescripcion: TPanel;
    GBEstado: TGroupBox;
    REstado1: TRadioButton;
    REstado2: TRadioButton;
    REstado3: TRadioButton;
    EditImporte: TEdit;
    EBorrar: TEdit;
    GBCategoria: TGroupBox;
    RBCategoria1: TRadioButton;
    RBCategoria2: TRadioButton;
    RBCategoria3: TRadioButton;
    RBCategoria4: TRadioButton;
    BListado: TButton;
    GBInsertarArticulos: TGroupBox;

    PIDByBorrar: TPanel;
    GBEliminarArticulos: TGroupBox;
    BBorrar: TButton;
    BDetalles: TButton;
    GBDetalleArticulos: TGroupBox;
    PArticuloDetalle: TPanel;
    LTitulo: TLabel;
    SpeedButton1: TSpeedButton;

    // Procedimientos
    procedure FormCreate(Sender: TObject);
    procedure BInsertarClickClick(Sender: TObject); // Insertar registros
    procedure BListadoClick(Sender: TObject);
    procedure BBorrarClick(Sender: TObject);
    procedure BDetallesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AjustarAnchoColumnas(Grid: TDBGrid; AnchoEnCaracteres: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AjustarAnchoColumnas(Grid: TDBGrid;
  AnchoEnCaracteres: Integer);
var
  i: Integer;
  Canvas: TCanvas;
  Ancho: Integer;
begin
  Canvas := Grid.Canvas;
  Ancho := Canvas.TextWidth(StringOfChar('c', AnchoEnCaracteres));
  // Calcula el ancho en píxeles
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Width := Ancho;
  // Aplica el ancho calculado a todas las columnas
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // Configuración del título
  LTitulo.Caption := 'Gestión de Artículos';
  LTitulo.Font.Size := 20;
  LTitulo.Font.Style := [fsBold];
  LTitulo.Alignment := taCenter;

end;

procedure TForm1.BDetallesClick(Sender: TObject);
begin
  // Crear y mostrar Form2, pasando los datos
  Form2 := TForm2.Create(Self); // Crear Form2
  Form2.SetArticuloDatos(EditNombre.Text, EditDescripcion.Text,
    EditImporte.Text, nil);

  Form2.Show; // Mostrar Form2
end;

procedure TForm1.BInsertarClickClick(Sender: TObject);
var
  categoria, estado: string;
begin
  try
    // Obtener el valor de la categoría según el RadioButton seleccionado
    if RBCategoria1.Checked then
      categoria := 'comic'
    else if RBCategoria2.Checked then
      categoria := 'figura'
    else if RBCategoria3.Checked then
      categoria := 'electronica'
    else if RBCategoria4.Checked then
      categoria := 'otro';

    // Obtener el valor del estado según el RadioButton seleccionado
    if REstado1.Checked then
      estado := 'vendido'
    else if REstado2.Checked then
      estado := 'conservado'
    else if REstado3.Checked then
      estado := 'disponible';
    if not(RBCategoria1.Checked or RBCategoria2.Checked or
      RBCategoria3.Checked or RBCategoria4.Checked) then
    begin
      ShowMessage('Por favor, selecciona una categoría.');
      Exit;
    end;

    if not(REstado1.Checked or REstado2.Checked or REstado3.Checked) then
    begin
      ShowMessage('Por favor, selecciona un estado.');
      Exit;
    end;

    // Configurar la consulta SQL con parámetros
    FDQuery1.SQL.Text := 'INSERT INTO articulo ' +
      '(nombre, categoria, estado, importe, descripcion, fechaCompra, fechaDevolucion) '
      + 'VALUES (:nombre, :categoria, :estado, :importe, :descripcion, :fechaCompra, :fechaDevolucion)';

    // Asignar valores a los parámetros
    FDQuery1.ParamByName('nombre').AsString := EditNombre.Text;
    FDQuery1.ParamByName('categoria').AsString := categoria;
    FDQuery1.ParamByName('estado').AsString := estado;
    FDQuery1.ParamByName('importe').AsFloat := StrToFloat(EditImporte.Text);
    FDQuery1.ParamByName('descripcion').AsString := EditDescripcion.Text;
    FDQuery1.ParamByName('fechaCompra').AsDate := DateTimePickerCompra.Date;
    FDQuery1.ParamByName('fechaDevolucion').AsDate :=
      DateTimePickerDevolucion.Date;

    // Ejecutar la consulta
    FDQuery1.ExecSQL;

    ShowMessage('Registro insertado con éxito!');

    // Opcional: recargar datos en el DBGrid
    FDQuery1.SQL.Text := 'SELECT * FROM articulo';
    FDQuery1.Active := True;
  except
    on E: Exception do
      ShowMessage('Error al insertar: ' + E.Message);
  end;
end;

// Listar todos los articulos de la base de datos
procedure TForm1.BListadoClick(Sender: TObject);
begin
  try
    // Cerrar dataset antes de realizar una nueva consulta
    if FDQuery1.Active then
      FDQuery1.Close;

    // Configura y ejecuta la consulta SQL
    FDQuery1.SQL.Text := 'SELECT * FROM articulo';
    FDQuery1.Open; // Abre el conjunto de datos y carga los resultados

    // Ajustar las columnas a un ancho fijo de 10 caracteres
    AjustarAnchoColumnas(DBGrid1, 12);

    // Mensaje opcional
    ShowMessage('Artículos listados correctamente.');
  except
    on E: Exception do
      ShowMessage('Error al listar los artículos: ' + E.Message);
  end;
end;

// Borrar articulo por ID
procedure TForm1.BBorrarClick(Sender: TObject);
var
  IdArticulo: Integer;
begin
  // Verifica si el TEdit tiene contenido
  if EBorrar.Text = '' then
  begin
    ShowMessage('Por favor, introduce un ID de artículo.');
    Exit;
  end;

  // Intenta convertir el texto a un número
  if not TryStrToInt(EBorrar.Text, IdArticulo) then
  begin
    ShowMessage('El ID del artículo debe ser un número válido.');
    Exit;
  end;

  try
    // Configura el SQL para eliminar el artículo
    FDQuery1.SQL.Text := 'DELETE FROM articulo WHERE idArticulo = :IdArticulo';
    FDQuery1.Params.ParamByName('IdArticulo').AsInteger := IdArticulo;

    // Ejecutar el comando DELETE
    FDQuery1.ExecSQL;

    // Verificar si se eliminó algún registro
    if FDQuery1.RowsAffected = 0 then
    begin
      ShowMessage('El ID del artículo no existe en la base de datos.');
      Exit;
    end;

    ShowMessage('Artículo eliminado correctamente.');
  except
    on E: Exception do
      ShowMessage('Error al eliminar el artículo: ' + E.Message);
  end;

end;

// Configuracion de la base de datos
procedure TForm1.FormCreate(Sender: TObject);
begin

  try

    // Configurar el DriverID explícitamente
    FDConnection1.Params.Clear;
    FDConnection1.Params.Add('DriverID=MySQL');
    FDConnection1.Params.Add('Server=127.0.0.1');
    FDConnection1.Params.Add('Port=3306');
    FDConnection1.Params.Add('Database=almacen');
    FDConnection1.Params.Add('User_Name=root');
    FDConnection1.Params.Add('Password=root');

    // Probar la conexión
    FDConnection1.Connected := True;

    ShowMessage('Conexión realizada con exito');
  except
    on E: Exception do
    begin
      ShowMessage('Error al conectar: ' + E.Message);
    end;
  end;

end;

end.
