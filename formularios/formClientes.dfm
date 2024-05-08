object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 712
  ClientWidth = 628
  Color = cl3DLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object ntbPrincipal: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 628
    Height = 712
    Align = alClient
    PageIndex = 1
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -15
    TabFont.Name = 'Segoe UI'
    TabFont.Style = []
    TabOrder = 0
    OnChange = ntbPrincipalChange
    ExplicitWidth = 624
    ExplicitHeight = 711
    object TTabPage
      Left = 4
      Top = 31
      Caption = 'Consulta'
      ExplicitTop = 26
      ExplicitWidth = 616
      ExplicitHeight = 681
      object pnlPrincipalConsulta: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 677
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 616
        ExplicitHeight = 681
        object pnlGrid: TPanel
          Left = 0
          Top = 181
          Width = 620
          Height = 496
          Align = alBottom
          BevelOuter = bvNone
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 0
          ExplicitTop = 185
          ExplicitWidth = 616
          object dbgConsulta: TDBGrid
            Left = 5
            Top = 5
            Width = 610
            Height = 486
            Align = alClient
            DataSource = dm.dsClientes
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDblClick = dbgConsultaDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CL_CODIGO'
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CL_NOME'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CL_CPF'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_INATIVO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_DTCADASTRO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_DTNASCIMENTO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_RUA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_NRO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_COMPLEMENTO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_COORDENADAS'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CL_CIDADE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CI_IBGE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CI_NOME'
                Title.Caption = 'Cidade'
                Width = 241
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CI_ESTADO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ES_IBGE'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ES_NOME'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'ES_UF'
                Visible = False
              end>
          end
        end
        object pnlConsulta: TPanel
          Left = 0
          Top = 0
          Width = 620
          Height = 181
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 616
          ExplicitHeight = 185
          object lblCidadeConsulta: TLabel
            Left = 368
            Top = 29
            Width = 42
            Height = 15
            Caption = 'Cidades'
          end
          object lblDataCadastroConsulta: TLabel
            Left = 5
            Top = 134
            Width = 88
            Height = 15
            Caption = 'Data de cadastro'
          end
          object edtCpfConsulta: TLabeledEdit
            Left = 5
            Top = 96
            Width = 111
            Height = 23
            EditLabel.Width = 21
            EditLabel.Height = 15
            EditLabel.Caption = 'CPF'
            EditMask = '999\.999\.999\-99;0;_'
            MaxLength = 14
            TabOrder = 1
            Text = ''
          end
          object edtNomeConsulta: TLabeledEdit
            Left = 5
            Top = 48
            Width = 218
            Height = 23
            EditLabel.Width = 33
            EditLabel.Height = 15
            EditLabel.Caption = 'Nome'
            TabOrder = 0
            Text = ''
          end
          object btnConsultar: TButton
            Left = 368
            Top = 150
            Width = 241
            Height = 25
            Caption = 'Consultar'
            TabOrder = 2
            OnClick = btnConsultarClick
          end
          object chklbCidadesConsulta: TCheckListBox
            Left = 368
            Top = 48
            Width = 241
            Height = 79
            ItemHeight = 17
            TabOrder = 3
          end
          object edtDtIniConsulta: TMaskEdit
            Left = 5
            Top = 152
            Width = 104
            Height = 23
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 4
            Text = '  /  /    '
          end
          object edtDtFimConsulta: TMaskEdit
            Left = 132
            Top = 152
            Width = 110
            Height = 23
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 5
            Text = '  /  /    '
          end
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 31
      Caption = 'Cadastro'
      ExplicitTop = 26
      ExplicitWidth = 616
      ExplicitHeight = 681
      object pnlPrincipalCadastro: TPanel
        Left = 0
        Top = 0
        Width = 620
        Height = 677
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 616
        ExplicitHeight = 681
        object lblNomeCad: TLabel
          Left = 5
          Top = 140
          Width = 38
          Height = 15
          Caption = '*Nome'
        end
        object lblCodigoCad: TLabel
          Left = 5
          Top = 95
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object lblCpfCad: TLabel
          Left = 5
          Top = 185
          Width = 21
          Height = 15
          Caption = 'CPF'
        end
        object lblDataCad: TLabel
          Left = 5
          Top = 307
          Width = 77
          Height = 15
          Caption = '*Data cadastro'
        end
        object lblDataNascimento: TLabel
          Left = 5
          Top = 230
          Width = 64
          Height = 15
          Caption = 'Nascimento'
        end
        object lblFone: TLabel
          Left = 149
          Top = 185
          Width = 44
          Height = 15
          Caption = 'Telefone'
        end
        object pnlBtnCrud: TPanel
          Left = 0
          Top = 0
          Width = 620
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 5
          ExplicitWidth = 616
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 0
            Width = 620
            Height = 42
            DataSource = dm.dsClientes
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 616
          end
        end
        object edtNomeCad: TDBEdit
          Left = 5
          Top = 156
          Width = 610
          Height = 23
          DataField = 'CL_NOME'
          DataSource = dm.dsClientes
          TabOrder = 0
        end
        object edtCodCad: TDBEdit
          Left = 5
          Top = 111
          Width = 75
          Height = 23
          TabStop = False
          DataField = 'CL_CODIGO'
          DataSource = dm.dsClientes
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit3: TDBEdit
          Left = 5
          Top = 201
          Width = 117
          Height = 23
          DataField = 'CL_CPF'
          DataSource = dm.dsClientes
          MaxLength = 14
          TabOrder = 1
        end
        object gpbEnderecoCad: TGroupBox
          Left = 5
          Top = 351
          Width = 610
          Height = 194
          Caption = 'Endere'#231'o'
          TabOrder = 7
          object lblRuaCad: TLabel
            Left = 19
            Top = 23
            Width = 20
            Height = 15
            Caption = 'Rua'
          end
          object lblNroCad: TLabel
            Left = 19
            Top = 68
            Width = 44
            Height = 15
            Caption = 'N'#250'mero'
          end
          object lblComplementoCad: TLabel
            Left = 212
            Top = 68
            Width = 77
            Height = 15
            Caption = 'Complemento'
          end
          object lblCidadeCad: TLabel
            Left = 447
            Top = 67
            Width = 42
            Height = 15
            Caption = '*Cidade'
          end
          object lblUfCad: TLabel
            Left = 391
            Top = 67
            Width = 19
            Height = 15
            Caption = '*UF'
          end
          object lblCoordenadaCad: TLabel
            Left = 19
            Top = 116
            Width = 70
            Height = 15
            Caption = 'Coordenadas'
          end
          object lblCepCad: TLabel
            Left = 391
            Top = 23
            Width = 21
            Height = 15
            Caption = 'CEP'
          end
          object lblBairroCad: TLabel
            Left = 84
            Top = 68
            Width = 31
            Height = 15
            Caption = 'Bairro'
          end
          object edtRuaCad: TDBEdit
            Left = 19
            Top = 39
            Width = 350
            Height = 23
            DataField = 'CL_RUA'
            DataSource = dm.dsClientes
            TabOrder = 0
          end
          object edtNroCad: TDBEdit
            Left = 19
            Top = 84
            Width = 56
            Height = 23
            DataField = 'CL_NRO'
            DataSource = dm.dsClientes
            TabOrder = 3
          end
          object edtComplementoCad: TDBEdit
            Left = 212
            Top = 84
            Width = 157
            Height = 23
            DataField = 'CL_COMPLEMENTO'
            DataSource = dm.dsClientes
            TabOrder = 4
          end
          object edtCoordenadasCad: TDBEdit
            Left = 19
            Top = 132
            Width = 548
            Height = 23
            DataField = 'CL_COORDENADAS'
            DataSource = dm.dsClientes
            TabOrder = 5
          end
          object cbEstadosCad: TComboBox
            Left = 391
            Top = 84
            Width = 49
            Height = 23
            Style = csDropDownList
            TabOrder = 1
            OnChange = cbEstadosCadChange
          end
          object cbCidadesCad: TComboBox
            Left = 447
            Top = 84
            Width = 149
            Height = 23
            Style = csDropDownList
            TabOrder = 2
            OnChange = cbCidadesCadChange
          end
          object btnCoordenadaMaps: TBitBtn
            Left = 573
            Top = 132
            Width = 23
            Height = 23
            TabOrder = 6
          end
          object edtCepCad: TDBEdit
            Left = 391
            Top = 39
            Width = 106
            Height = 23
            DataField = 'CL_CEP'
            DataSource = dm.dsClientes
            MaxLength = 9
            TabOrder = 7
          end
          object btnCepMaps: TBitBtn
            Left = 503
            Top = 39
            Width = 26
            Height = 23
            TabOrder = 8
            OnClick = btnCepMapsClick
          end
          object edtBairroCad: TDBEdit
            Left = 81
            Top = 84
            Width = 125
            Height = 23
            DataField = 'CL_BAIRRO'
            DataSource = dm.dsClientes
            TabOrder = 9
          end
        end
        object edtDtCadastroCad: TDBEdit
          Left = 5
          Top = 322
          Width = 119
          Height = 23
          TabStop = False
          DataField = 'CL_DTCADASTRO'
          DataSource = dm.dsClientes
          MaxLength = 10
          TabOrder = 4
        end
        object edtDataNascCad: TDBEdit
          Left = 5
          Top = 246
          Width = 89
          Height = 23
          DataField = 'CL_DTNASCIMENTO'
          DataSource = dm.dsClientes
          MaxLength = 10
          TabOrder = 3
        end
        object chkInativo: TDBCheckBox
          Left = 130
          Top = 111
          Width = 97
          Height = 17
          Caption = 'Inativo'
          DataField = 'CL_INATIVO'
          DataSource = dm.dsClientes
          TabOrder = 8
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBEdit1: TDBEdit
          Left = 149
          Top = 201
          Width = 107
          Height = 23
          DataField = 'CL_FONE'
          DataSource = dm.dsClientes
          MaxLength = 15
          TabOrder = 2
        end
      end
    end
  end
end
