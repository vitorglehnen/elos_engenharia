object frmFuncionarios: TfrmFuncionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funcion'#225'rios'
  ClientHeight = 383
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  Visible = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 383
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblCodigo: TLabel
      Left = 10
      Top = 64
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
      FocusControl = edtCod
    end
    object lblNome: TLabel
      Left = 10
      Top = 112
      Width = 33
      Height = 15
      Caption = 'Nome'
      FocusControl = edtNome
    end
    object lblSenha: TLabel
      Left = 10
      Top = 152
      Width = 32
      Height = 15
      Caption = 'Senha'
      FocusControl = edtSenha
    end
    object pnlGrid: TPanel
      Left = 0
      Top = 216
      Width = 628
      Height = 167
      Align = alBottom
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 6
      object dbgConsulta: TDBGrid
        Left = 10
        Top = 10
        Width = 608
        Height = 147
        Align = alClient
        DataSource = dm_funcionarios.dsFuncionarios
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbgConsultaDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'US_CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_NOME'
            Width = 526
            Visible = True
          end>
      end
    end
    object dbnavCliente: TDBNavigator
      Left = 10
      Top = 5
      Width = 608
      Height = 42
      DataSource = dm_funcionarios.dsFuncionarios
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 0
    end
    object edtCod: TDBEdit
      Left = 10
      Top = 83
      Width = 71
      Height = 23
      DataField = 'US_CODIGO'
      DataSource = dm_funcionarios.dsFuncionarios
      ReadOnly = True
      TabOrder = 1
    end
    object edtNome: TDBEdit
      Left = 10
      Top = 128
      Width = 304
      Height = 23
      DataField = 'US_NOME'
      DataSource = dm_funcionarios.dsFuncionarios
      TabOrder = 4
    end
    object edtSenha: TDBEdit
      Left = 10
      Top = 168
      Width = 304
      Height = 23
      DataField = 'US_SENHA'
      DataSource = dm_funcionarios.dsFuncionarios
      PasswordChar = '*'
      TabOrder = 5
    end
    object chkAdm: TDBCheckBox
      Left = 154
      Top = 86
      Width = 97
      Height = 17
      Caption = 'Admnistrador'
      DataField = 'US_ADMIN'
      DataSource = dm_funcionarios.dsFuncionarios
      TabOrder = 2
    end
    object chkInativo: TDBCheckBox
      Left = 257
      Top = 86
      Width = 57
      Height = 17
      Caption = 'Inativo'
      DataField = 'US_INATIVO'
      DataSource = dm_funcionarios.dsFuncionarios
      TabOrder = 3
    end
  end
end
