object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 615
  ClientWidth = 690
  Color = clAqua
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 96
    Top = 8
    Width = 289
    Height = 401
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object BInsertarClick: TButton
    Left = 391
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 1
    OnClick = BInsertarClickClick
  end
  object EditNombre: TEdit
    Left = 488
    Top = 50
    Width = 137
    Height = 23
    HideSelection = False
    TabOrder = 2
    Text = 'Nombre'
  end
  object EditCategoria: TEdit
    Left = 488
    Top = 108
    Width = 137
    Height = 23
    TabOrder = 3
    Text = 'Categoria'
  end
  object EditImporte: TEdit
    Left = 391
    Top = 137
    Width = 91
    Height = 23
    Alignment = taCenter
    Color = clMoneyGreen
    TabOrder = 4
    Text = 'Importe:'
  end
  object EditDescripcion: TEdit
    Left = 488
    Top = 79
    Width = 137
    Height = 23
    TabOrder = 5
    Text = 'Descripcion'
  end
  object DateTimePickerCompra: TDateTimePicker
    Left = 488
    Top = 166
    Width = 137
    Height = 23
    Date = 45677.000000000000000000
    Time = 0.701945879627601200
    TabOrder = 6
  end
  object DateTimePickerDevolucion: TDateTimePicker
    Left = 488
    Top = 195
    Width = 137
    Height = 23
    Date = 45677.000000000000000000
    Time = 0.702417476852133400
    TabOrder = 7
  end
  object PCompra: TPanel
    Left = 391
    Top = 166
    Width = 91
    Height = 23
    Caption = 'Fecha Compra'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 8
  end
  object PDevolucion: TPanel
    Left = 391
    Top = 195
    Width = 91
    Height = 23
    Caption = 'Fecha Retorno'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 9
  end
  object PNombre: TPanel
    Left = 391
    Top = 46
    Width = 91
    Height = 23
    Caption = 'Nombre:'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 10
  end
  object PDescripcion: TPanel
    Left = 391
    Top = 79
    Width = 91
    Height = 23
    Caption = 'Descripcion:'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 11
  end
  object Panel3: TPanel
    Left = 391
    Top = 108
    Width = 91
    Height = 23
    Caption = 'Categoria:'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 12
  end
  object GBEstado: TGroupBox
    Left = 391
    Top = 224
    Width = 100
    Height = 80
    Caption = 'Estado'
    Color = clMoneyGreen
    ParentBackground = False
    ParentColor = False
    TabOrder = 13
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
  object Edit1: TEdit
    Left = 488
    Top = 137
    Width = 137
    Height = 23
    TabOrder = 14
    Text = 'Precio compra'
  end
  object GBCategoria: TGroupBox
    Left = 513
    Top = 224
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
    TabOrder = 15
    object RBCategoria1: TRadioButton
      Left = 3
      Top = 15
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
      Top = 78
      Width = 113
      Height = 15
      Caption = 'Otro'
      TabOrder = 3
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'DriverID=MySQL'
      'User_Name=root')
    Left = 8
    Top = 352
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 352
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 24
    Top = 352
  end
  object SQLConnection1: TSQLConnection
    Left = 16
    Top = 352
  end
end
