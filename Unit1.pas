unit Unit1;

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
  Vcl.DBGrids, Data.SqlExpr, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    BInsertarClick: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    SQLConnection1: TSQLConnection;
    //Campos base de datos
    EditNombre: TEdit;
    EditCategoria: TEdit;
    EditImporte: TEdit;
    EditDescripcion: TEdit;
    DateTimePickerCompra: TDateTimePicker;
    DateTimePickerDevolucion: TDateTimePicker;
    PCompra: TPanel;
    PDevolucion: TPanel;
    PNombre: TPanel;
    PDescripcion: TPanel;
    Panel3: TPanel;
    GBEstado: TGroupBox;
    REstado1: TRadioButton;
    REstado2: TRadioButton;
    REstado3: TRadioButton;
    Edit1: TEdit;
    GBCategoria: TGroupBox;
    RBCategoria1: TRadioButton;
    RBCategoria2: TRadioButton;
    RBCategoria3: TRadioButton;
    RBCategoria4: TRadioButton;


    //Procedimientos
    procedure FormCreate(Sender: TObject);
    procedure BInsertarClickClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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

    // Configurar la consulta SQL con parámetros
    FDQuery1.SQL.Text := 'INSERT INTO articulo ' +
      '(nombre, categoria, estado, importe, descripcion, fechaCompra, fechaDevolucion) ' +
      'VALUES (:nombre, :categoria, :estado, :importe, :descripcion, :fechaCompra, :fechaDevolucion)';

    // Asignar valores a los parámetros
    FDQuery1.ParamByName('nombre').AsString := EditNombre.Text;
    FDQuery1.ParamByName('categoria').AsString := categoria; // Asignar la categoría
    FDQuery1.ParamByName('estado').AsString := estado; // Asignar el estado
    FDQuery1.ParamByName('importe').AsFloat := StrToFloat(EditImporte.Text);
    FDQuery1.ParamByName('descripcion').AsString := EditDescripcion.Text;
    FDQuery1.ParamByName('fechaCompra').AsDate := DateTimePickerCompra.Date;
    FDQuery1.ParamByName('fechaDevolucion').AsDate := DateTimePickerDevolucion.Date;

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


procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    // Configurar el DriverID explícitamente
    FDConnection1.Params.Clear; // Limpia los parámetros para evitar conflictos
    FDConnection1.DriverName := 'MySQL';
    FDConnection1.Params.Add('DriverID=MySQL');
    FDConnection1.Params.Add('Server=127.0.0.1');
    FDConnection1.Params.Add('Port=3306');
    FDConnection1.Params.Add('Database=almacen');
    FDConnection1.Params.Add('User_Name=root');
    FDConnection1.Params.Add('Password=root');

    // Probar la conexión
    FDConnection1.Connected := True;

    ShowMessage('Conexión exitosa!');
  except
    on E: Exception do
      ShowMessage('Error al conectar: ' + E.Message);
  end;
end;

end.
