object Form1: TForm1
  Left = 3
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = 'Form1'
  ClientHeight = 637
  ClientWidth = 1475
  Color = clAqua
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clGrayText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  Visible = True
  OnShow = FormShow
  DesignSize = (
    1475
    637)
  TextHeight = 15
  object LTitulo: TLabel
    Left = 8
    Top = 40
    Width = 6
    Height = 30
    Color = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = 30
    Font.Name = 'Segoe UI Variable Text Semibold'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
  end
  object SpeedButton1: TSpeedButton
    Left = 48
    Top = 168
    Width = 23
    Height = 22
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 93
    Width = 1201
    Height = 276
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clAqua
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clGrayText
    TitleFont.Height = -20
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object GBInsertarArticulos: TGroupBox
    AlignWithMargins = True
    Left = 1215
    Top = 182
    Width = 265
    Height = 304
    Caption = 'INSERTAR ARTICULOS'
    Color = clMoneyGreen
    DefaultHeaderFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -12
    Font.Name = '@Adobe Gothic Std B'
    Font.Style = [fsBold]
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clBtnShadow
    HeaderFont.Height = -12
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object GBCategoria: TGroupBox
      Left = 13
      Top = 166
      Width = 100
      Height = 97
      Caption = 'Categoria'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object RBCategoria1: TRadioButton
        Left = 3
        Top = 17
        Width = 118
        Height = 15
        Caption = 'Comic'
        TabOrder = 0
      end
      object RBCategoria2: TRadioButton
        Left = 3
        Top = 36
        Width = 113
        Height = 15
        Caption = 'Figura'
        TabOrder = 1
      end
      object RBCategoria3: TRadioButton
        Left = 3
        Top = 57
        Width = 113
        Height = 15
        Caption = 'Electronica'
        TabOrder = 2
      end
      object RBCategoria4: TRadioButton
        Left = 3
        Top = 79
        Width = 113
        Height = 15
        Caption = 'Otro'
        TabOrder = 3
      end
    end
    object GBEstado: TGroupBox
      Left = 119
      Top = 166
      Width = 100
      Height = 80
      Caption = 'Estado'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object REstado1: TRadioButton
        Left = 3
        Top = 17
        Width = 113
        Height = 15
        Caption = 'Vendido'
        TabOrder = 0
      end
      object REstado2: TRadioButton
        Left = 3
        Top = 38
        Width = 113
        Height = 15
        Caption = 'Conservado'
        TabOrder = 1
      end
      object REstado3: TRadioButton
        Left = 3
        Top = 59
        Width = 113
        Height = 15
        Caption = 'Disponible'
        TabOrder = 2
      end
    end
    object EditDescripcion: TEdit
      Left = 111
      Top = 46
      Width = 137
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = 'Descripcion'
    end
    object EditNombre: TEdit
      Left = 111
      Top = 17
      Width = 137
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      HideSelection = False
      ParentFont = False
      TabOrder = 12
      Text = 'Nombre'
    end
    object EditImporte: TEdit
      Left = 111
      Top = 75
      Width = 137
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Precio compra'
    end
    object BInsertarClick: TButton
      Left = 11
      Top = 269
      Width = 75
      Height = 25
      Caption = 'Insertar'
      TabOrder = 3
      OnClick = BInsertarClickClick
    end
    object DateTimePickerCompra: TDateTimePicker
      Left = 111
      Top = 108
      Width = 137
      Height = 23
      Date = 45677.000000000000000000
      Time = 0.701945879627601200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DateTimePickerDevolucion: TDateTimePicker
      Left = 111
      Top = 137
      Width = 137
      Height = 23
      Date = 45677.000000000000000000
      Time = 0.702417476852133400
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object PCompra: TPanel
      Tag = 2
      Left = 15
      Top = 108
      Width = 90
      Height = 23
      Caption = 'Fecha Compra'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 6
    end
    object PDescripcion: TPanel
      Tag = 2
      Left = 15
      Top = 46
      Width = 90
      Height = 23
      Caption = 'Descripcion:'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 7
    end
    object PDevolucion: TPanel
      Tag = 2
      Left = 15
      Top = 137
      Width = 90
      Height = 23
      Caption = 'Fecha Retorno'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 9
    end
    object PImporte: TEdit
      Tag = 2
      Left = 15
      Top = 75
      Width = 90
      Height = 23
      Alignment = taCenter
      Color = clMoneyGreen
      TabOrder = 10
      Text = 'Importe:'
    end
    object PNombre: TPanel
      Tag = 2
      Left = 15
      Top = 17
      Width = 90
      Height = 23
      Caption = 'Nombre:'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 11
    end
  end
  object BListado: TButton
    Left = 1230
    Top = 107
    Width = 138
    Height = 53
    Caption = 'Listar '#13#10'articulos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Gill Sans Ultra Bold Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BListadoClick
  end
  object GBEliminarArticulos: TGroupBox
    Left = 1215
    Top = 508
    Width = 241
    Height = 105
    Caption = 'ELIMINAR ARTICULOS'
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -12
    Font.Name = '@Adobe Gothic Std B'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object PIDByBorrar: TPanel
      Left = 5
      Top = 18
      Width = 124
      Height = 23
      Caption = 'Eliminar por n'#250'mero:'
      TabOrder = 0
    end
    object EBorrar: TEdit
      Left = 135
      Top = 18
      Width = 90
      Height = 23
      TabOrder = 1
      Text = ' ID para borrar'
    end
    object BBorrar: TButton
      Left = 5
      Top = 47
      Width = 94
      Height = 23
      Caption = 'Eliminar registro'
      TabOrder = 2
      OnClick = BBorrarClick
    end
  end
  object GBDetalleArticulos: TGroupBox
    Left = 8
    Top = 377
    Width = 169
    Height = 80
    Caption = 'ARTICULO A DETALLE'
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -12
    Font.Name = '@Adobe Gothic Std B'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object BDetalles: TButton
      Left = 3
      Top = 45
      Width = 75
      Height = 28
      Caption = 'Detalles'
      TabOrder = 0
      OnClick = BDetallesClick
    end
    object PArticuloDetalle: TPanel
      Left = 3
      Top = 16
      Width = 150
      Height = 23
      Caption = 'Ingrese el ID de articulo '
      TabOrder = 1
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=almacen'
      'Server=127.0.0.1'
      'Port=3306'
      'User_Name=root'
      'Password=root')
    Connected = True
    Left = 400
    Top = 560
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 560
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 304
    Top = 560
  end
  object SQLConnection1: TSQLConnection
    Left = 232
    Top = 560
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 128
    Top = 560
  end
end
