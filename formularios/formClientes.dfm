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
            Width = 26
            Height = 23
            Hint = 'Localizar coordenas no Google Maps'
            Glyph.Data = {
              42040000424D4204000000000000420000002800000010000000100000000100
              200003000000000400006F0000006F00000000000000000000000000FF0000FF
              0000FF000000FCEEA8DCFCEEA8FF73DEF0FF59DBFBFF73E255FF66E14CFF66E1
              4CFF66E14CFF66E14CFF87E37DFF59DBFAFF57DBFEFFB3E6CEFFFCEEA8FFFAEC
              A1FFF4E784FAFDEFA97CFCEEA8FFB9E6CBFF56DBFFFF87E38DFF66E14CFF66E1
              4CFF67E14DFF87E398FF56DBFFFF5BDCFCFFC6E8C4FFFCEEA8FFFCEEA8FFF6E9
              8FFFF6E88CBCE4E4B61CA4E4D6FD9CE3DAFF56DBFFFF6ADDE1FF67E14DFF6CE2
              50FF7CDCB5FF56D5FFFF56DBFFFF80E0E9FFA3E4D6FFA3E4D6FF9CE2D7FF62CD
              E1FFE6DB9932FFFFFF007BE0EAE656DBFFFF56DBFFFF56DBFFFF88E37FFF73DB
              CFFF4A66FAFF444AEFFF55D4FEFF56DBFFFF56DBFFFF56DBFFFF40CDFFFF45C6
              F3FCFFFFFF00FFFFFF0099E58B7F63E06EFF63DF84FF56DBFFFF56D6FFFF4D71
              FFFF4A4AFFFF4745F9FF474AE2FF77D882FF7AE17BFF7AE17BFF69CE57FF9ADB
              85ABFFFFFF00FFFFFF0080FF80027AE258F966E14CFF6DDEE2FF4E76FFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4743F8FF464CDBFF66E14CFF67DA4AFF6CCC47FFFFFF
              8002FFFFFF00FFFFFF00FFFFFF00AFDF7010ADE67B1F5A65F2744A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF433CF0FF4B4BE79FA8E26E2CA7DC721DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF184A4AFFEF4A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF4949FDFF4138ECFB4343F826FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF714A4AFFFF4A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF4A4AFFFF443EF1FF433CF0A7FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFFB34A4AFFFF4A4AFFFF4B4B
              FFC34C4CFF2F4A4AFF304A4AFFC84A4AFFFF4743F7FF4239EDE3FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF005555FF034A4AFFF14A4AFFFF4A4AFFFF4848
              FF3CFFFFFF00FFFFFF004B4BFF444A4AFFFF4948FDFF3F35E9FD0000FF02FFFF
              FF00FFFFFF00FFFFFF00FFFFFF000000FF014A4AFFEF4A4AFFFF4A4AFFFF4B4B
              FF4EFFFFFF00FFFFFF004A4AFF564A4AFFFF4948FDFF3F35E9FDFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B4BFFBC4A4AFFFF4A4AFFFF4A4A
              FFD94B4BFF5C4A4AFF5D4A4AFFDC4A4AFFFF4744F9FF4239ECE9FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848FF434A4AFFFE4A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF4A4AFFFF4239EEFE433CF16AFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF7F4A4AFFFE4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF443EF3FE433CEEB8FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF3E4A4A
              FFB04948FEE64744F8EB443EF3D1443FF265FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = btnCoordenadaMapsClick
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
            Hint = 'Pesquisar CEP'
            Glyph.Data = {
              42040000424D4204000000000000420000002800000010000000100000000100
              200003000000000400006F0000006F00000000000000000000000000FF0000FF
              0000FF000000FCEEA8DCFCEEA8FF73DEF0FF59DBFBFF73E255FF66E14CFF66E1
              4CFF66E14CFF66E14CFF87E37DFF59DBFAFF57DBFEFFB3E6CEFFFCEEA8FFFAEC
              A1FFF4E784FAFDEFA97CFCEEA8FFB9E6CBFF56DBFFFF87E38DFF66E14CFF66E1
              4CFF67E14DFF87E398FF56DBFFFF5BDCFCFFC6E8C4FFFCEEA8FFFCEEA8FFF6E9
              8FFFF6E88CBCE4E4B61CA4E4D6FD9CE3DAFF56DBFFFF6ADDE1FF67E14DFF6CE2
              50FF7CDCB5FF56D5FFFF56DBFFFF80E0E9FFA3E4D6FFA3E4D6FF9CE2D7FF62CD
              E1FFE6DB9932FFFFFF007BE0EAE656DBFFFF56DBFFFF56DBFFFF88E37FFF73DB
              CFFF4A66FAFF444AEFFF55D4FEFF56DBFFFF56DBFFFF56DBFFFF40CDFFFF45C6
              F3FCFFFFFF00FFFFFF0099E58B7F63E06EFF63DF84FF56DBFFFF56D6FFFF4D71
              FFFF4A4AFFFF4745F9FF474AE2FF77D882FF7AE17BFF7AE17BFF69CE57FF9ADB
              85ABFFFFFF00FFFFFF0080FF80027AE258F966E14CFF6DDEE2FF4E76FFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4743F8FF464CDBFF66E14CFF67DA4AFF6CCC47FFFFFF
              8002FFFFFF00FFFFFF00FFFFFF00AFDF7010ADE67B1F5A65F2744A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF433CF0FF4B4BE79FA8E26E2CA7DC721DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF184A4AFFEF4A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF4949FDFF4138ECFB4343F826FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF714A4AFFFF4A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF4A4AFFFF443EF1FF433CF0A7FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFFB34A4AFFFF4A4AFFFF4B4B
              FFC34C4CFF2F4A4AFF304A4AFFC84A4AFFFF4743F7FF4239EDE3FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF005555FF034A4AFFF14A4AFFFF4A4AFFFF4848
              FF3CFFFFFF00FFFFFF004B4BFF444A4AFFFF4948FDFF3F35E9FD0000FF02FFFF
              FF00FFFFFF00FFFFFF00FFFFFF000000FF014A4AFFEF4A4AFFFF4A4AFFFF4B4B
              FF4EFFFFFF00FFFFFF004A4AFF564A4AFFFF4948FDFF3F35E9FDFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B4BFFBC4A4AFFFF4A4AFFFF4A4A
              FFD94B4BFF5C4A4AFF5D4A4AFFDC4A4AFFFF4744F9FF4239ECE9FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848FF434A4AFFFE4A4AFFFF4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF4A4AFFFF4239EEFE433CF16AFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF7F4A4AFFFE4A4A
              FFFF4A4AFFFF4A4AFFFF4A4AFFFF443EF3FE433CEEB8FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4AFF3E4A4A
              FFB04948FEE64744F8EB443EF3D1443FF265FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00}
            ParentShowHint = False
            ShowHint = True
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
          Width = 100
          Height = 23
          DataField = 'CL_FONE'
          DataSource = dm.dsClientes
          MaxLength = 15
          TabOrder = 2
        end
        object btnWhatsApp: TBitBtn
          Left = 255
          Top = 201
          Width = 26
          Height = 23
          Hint = 'Pesquisar CEP'
          Glyph.Data = {
            42040000424D4204000000000000420000002800000010000000100000000100
            20000300000000040000590000005900000000000000000000000000FF0000FF
            0000FF000000E8EFE9EDE5EEE6E7EDEDED8FE5E5E531E1E1E111ECECEC7AEDF1
            EDDEE8F1E9F3E7F0E7F6EEF3EEE1EEEEEE85E7E7E71500000000000000000000
            000000000000E7EFE8DBFFFFFFFFFFFFFFFFEEF7EFFFE8F3E8FFFBFDFBFFF9FC
            F9FFE3F1E4FFE0F0E1FFF6FAF6FFFEFEFEFFEAF3EAFEEFF1EF8EFFFFFF010000
            000000000000EBEBEB75FCFEFCFFB0D8B1FFAED7AFFFCCE6CDFF97CC99FF64B3
            67FF61B164FF61B164FF63B266FF8FC892FFE1F0E2FFF6FAF6FFECEEECC7FFFF
            FF0100000000E6E6E61EE9F4E9FFBADDBCFF61B164FF61B164FF61B164FF61B1
            64FF61B164FF61B164FF61B164FF61B164FF65B368FFC8E4C9FFF6FBF6FFEEF0
            EE9800000000DFDFDF10E7F2E8FFD3E9D4FF61B164FF61B164FF61B164FF61B1
            64FF61B164FF7ABE7DFFA9D4ABFFADD6AEFF6DB770FF65B368FFDEEEDEFFEBF4
            EBFEE4E4E41CEEEEEE85FCFDFCFF95CB97FF61B164FF61B164FF61B164FF70B9
            73FFCCE6CDFFFFFFFFFFFFFFFFFFFFFFFFFFD4EAD5FF61B164FF87C48AFFFFFF
            FFFFEFEFEF9FEDF2EDE3F6FAF6FF63B266FF61B164FF61B164FF74BA77FFEBF5
            EBFFEEF6EEFF97CC99FFC7E3C8FFF1F8F2FFA5D2A6FF61B164FF62B165FFEEF6
            EEFFEAF2EBEFE7F1E7F7DFEFDFFF61B164FF61B164FF65B368FFDFEFDFFFE6F3
            E7FF6EB771FF61B164FF64B367FF67B469FF61B164FF61B164FF61B164FFD4EA
            D4FFE8F2E8FBE6F2E7F9D9ECDAFF61B164FF61B164FFABD5ACFFFFFFFFFF8BC6
            8DFF61B164FF61B164FF61B164FF61B164FF61B164FF61B164FF61B164FFD1E8
            D1FFE8F2E8FCEAF2EAECF0F7F0FF62B165FF61B164FFDCEEDDFFFFFFFFFFC4E2
            C5FF61B164FF61B164FF61B164FF61B164FF61B164FF61B164FF61B164FFE7F3
            E8FFE9F1EAF3EFEFEF9FFFFFFFFF85C387FF61B164FFCCE6CDFFFFFFFFFFA6D3
            A7FF61B164FF61B164FF61B164FF61B164FF61B164FF61B164FF7DBF7FFFFFFF
            FFFFF1F1F1B3E6E6E61FEBF4EBFFD8ECD9FF62B265FF72B974FFB6DBB7FF6AB5
            6DFF61B164FF61B164FF61B164FF61B164FF61B164FF62B165FFD1E8D1FFEDF5
            EDFFE6E6E62900000000EDEFEDABF9FCF9FFBBDEBDFF62B265FF61B164FF61B1
            64FF61B164FF61B164FF61B164FF61B164FF62B165FFB4DAB5FFFBFDFBFFEAEF
            EABA0000000000000000FFFFFF03ECF0ECD9F9FCF9FFD3E9D4FF7CBE7FFF61B1
            64FF61B164FF61B164FF61B164FF79BD7CFFCFE7D0FFFBFDFBFFEAF0EAE3D5D5
            D506000000000000000000000000FFFFFF04ECEEECB3EDF6EDFFFFFFFFFFE4F2
            E5FFCCE6CDFFCAE5CBFFE2F1E3FFFFFFFFFFEEF6EEFFECEFEEBED5D5D5060000
            00000000000000000000000000000000000000000000E6E6E629F0F0F0B8E8F0
            E8F6E7F2E8FEE7F2E8FEE8F2E8F7F2F2F2BDE4E4E42F00000000000000000000
            000000000000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = btnWhatsAppClick
        end
      end
    end
  end
end
