object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 140
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 140
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object edtSenha: TLabeledEdit
      Left = 174
      Top = 71
      Width = 139
      Height = 23
      EditLabel.Width = 32
      EditLabel.Height = 15
      EditLabel.Caption = 'Senha'
      TabOrder = 2
      Text = ''
    end
    object edtUsuario: TLabeledEdit
      Left = 174
      Top = 29
      Width = 139
      Height = 23
      EditLabel.Width = 40
      EditLabel.Height = 15
      EditLabel.Caption = 'Usu'#225'rio'
      TabOrder = 1
      Text = ''
    end
    object btnEntrar: TButton
      Left = 238
      Top = 100
      Width = 75
      Height = 25
      Caption = 'Entrar'
      TabOrder = 3
      OnClick = btnEntrarClick
    end
    object pnlImagemLogo: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 140
      Align = alLeft
      TabOrder = 0
    end
  end
end
