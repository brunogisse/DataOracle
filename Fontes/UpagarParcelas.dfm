object frmPagarParcelas: TfrmPagarParcelas
  Left = 0
  Top = 0
  Caption = 'frmPagarParcelas'
  ClientHeight = 590
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PainelTopo: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1003
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object labelTituloParcelas: TLabel
      Left = 11
      Top = 30
      Width = 282
      Height = 37
      Caption = 'Pagamento de Parcelas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -27
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object painelReverter: TPanel
      Left = 730
      Top = 28
      Width = 160
      Height = 40
      BevelOuter = bvNone
      TabOrder = 0
      object PainelReverterPagamento: TPanel
        Left = 6
        Top = 6
        Width = 145
        Height = 31
        BevelOuter = bvNone
        Caption = 'Reverter Pagamentos'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 145
          Height = 31
          Align = alClient
          Flat = True
          OnClick = SpeedButton1Click
          ExplicitLeft = 32
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
    end
  end
  object PainelCentral: TPanel
    Left = 0
    Top = 76
    Width = 1009
    Height = 229
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 9408399
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Image1: TImage
      Left = 14
      Top = 44
      Width = 107
      Height = 105
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000640000
        0064080600000070E29554000000017352474200AECE1CE900000DA849444154
        78DAED9D097014551AC7BFEE99CCE422090984430E03080A2A4720C94C088B4A
        A1ACE2811A97908442573C56ABACD2B2C45D577675DD75B576AB5C97D575B790
        4C9272A388ACA2C0AA9C331D20E11494844330283749CC3557F77E6FC2247366
        BA7B7AFAF5447E55537D4CBFF33FEFBDEF1DFD86812B680A867604AEE04FFC08
        22084C7ED58E010982338767D86B78602730208CC0DB8359E0D304607478DD86
        C72E7CFA140870149F6BD0F3CEC37C92EE1C576CEEA49D0431685690BC553BB2
        5896BF8D618432CCDC7CBC951E657C1DF869421F3E1378C6D29A98B6E750F124
        07ED7406A21D41F0A76EAAE66660E63F8F9F5BF14EA20AA19E6204E12DBBDEF8
        567DC9F4F3B4B380405D908295DCD54C82F06714E11EBCD4538CCA198CC34B2D
        89E9EFD02C39D404315BACB7637DFF369E5E452B0E6110F0B3164BCE23B6F2C2
        B36A07AEBA20268B6D211EFE899F54B5C396C116974BFF8B5D4BF24EAB15A06A
        82A010663CFC173F596A85A9180CAC05032C54C3528BB920F995B569ACC06F24
        A7B10E2BC6F002C33C555B6AFA5B2C0389A920E64AEBC3683CBD1DEB7054E624
        B62F3362D5BEC424A326D61C34A477B56C43DFF3629B37D410D020595A5B66FA
        97D21E2B2E484105771D76E676833AFD08DAACE74A4D3F074CB0521E2A2A0856
        51A5584559D4CF17AAFC6034DAC76F2EBEA94D09CF1413C454697B052DF865F4
        F2852A7696778FB72E2E3A19AD478A088226ED2A3C94D3CE15CAF0583B5C5F5B
        6EFA3A1A4FA216C45461AB425F4A68E786461080875C6EB1798F5C0FA212C46C
        B1BE83D6C62F69E782C6E0F133812B331F91E358B62028C67214E345DAA9D728
        4E37AF1BB67371FE05A90E6509820DF83D58383FA49D6A8DD3ECE83064D73F32
        DD29C59164413CC3E57AE1981CB73F417663D5952BC581A44CBDBFA646D7641F
        71094F07D04E69DC20C09FB872B3E8EE802441B0AA5A7F7936EF0A12D0817BCA
        F6B2A27D629E152D08F635EEC6C31ADA898B53DAB8A3A67458CEF0911E142588
        67B0D0DE4286061268A72C6E61C0C2959A23769E45098255D5475855DD453B4D
        FD806B22F54F220A627ED73A56D031B23A39570880816FB194E4F4FD4804B0ED
        68C0C335B4D31231AD9892E129893034D508DF5C688376A79B7694C2310F4BC9
        FAB0E9E8CBE5CC8A6DF96E46574B3B05E148D2EBE0E6D159503A69388C4A4BF2
        4B4C7397137EBBBD11EA4EB7D08E6620CD28C8C0705FF62908968E137818453B
        05BE24EA59B873DC10289F7415642645B631FEB1E724580E9EA21D6D3F0481B9
        B3B6DCF471A8EFC20A62AAB65D0B6E886A28592958AC8F668FCA8427A68D86A1
        2946C9EE5FB61D814F8F9DA39D0C5FCE62291912EA8BF08254DA6C68599968C6
        7A80410F4FCFC88139576779448986A51BBE82AFCEFD4833397E30827083ADBC
        F0ABA0FBA11EBEB1625F4A0AD3AEC894A41C72D293E005F338B8364BB9B574BC
        20C01D1FD443B35DD2585F2CB1622999197833A420583A9EC3D2F147B13EFFF5
        E6EB60645AEF9A065E00586E6D8443E7C56B6AD4B170FBD86C7874CA284835E8
        629203AD7617CCFB60175932A2095A8CE9C6C075C4A105A9B05DC06F32C57AFC
        F90379909CE09F89AFEF3C061F369C09EB86049C996480796306C1FCB143FC04
        95CBA91FBB203BD90009286E3876FED00C4F7DA189A691B0184B494560BEF891
        5B5D37C8E076486A01C5089284D6D132D3381883D55176B21152F0F9289B8520
        DE3DD004ED2E37FC6AEAE83E9F5BB1E704541EFC5ED9C0E5D188828CF7BD1194
        250515DCB30C23BC2AC5D75082FCCE7A04361CEFD535CDA887F5F7CF8869EA16
        7DBC174EB476C196927CD04550BBEC937D70B4B923A6F11183A3C360F09DC40A
        8A35F63DC8E4538E144F4309F2FCD6C3B0F9E4C59E6B350429AAAA053736108F
        6309219DC5BEE872F130B76627B878BA0D8A00CC4DB565A6CDDE6B3F412E4F40
        3941E23C89164AC8E9763B2C58B3DB73CE62EC3714E779AAC5BED87BB6151EDF
        78306671120503EF73A5E6E2DE4B1FF256ED18AF63DD87A5FA29A60D89B52081
        9DBFCCC404587B6F6EC4AAEB2574F719DD4E630BB62319DE0BBFD86275F50C1E
        5E93EA6328415EDB710CD634AA2388D3CDC3ECF7760499B35949095073D754CF
        985738881B5275D11C8CF46D470205D98A8722A91ED26E437EB3AD01BE3C117A
        C54D02D65F2BE65E0F930685EF64365E6A87C5EBF6C7246E62700BBA313BCBF3
        8F93F340419AA1FBF56349D01464D3C90BF0EBAD0D119F1B9262047D1FD5D7A9
        B62EC5E326166CD84BB161AF22E78182F02063790F2D41B67C7711966D91DCE4
        690E1464250AF22039EFC9FCDCB7EB920DC98E76391ED210840CA993A1F57EC2
        2E6CD83D2F37F5085264D93ACC057A59DD57B505215514A9AAA28558604BA78C
        84B249F2DECCB6A331414AE9ABB547A1D315714149581810CEDBCA0A07779F5F
        6666D5B65C37AFAB93E3A15A821023EA994D5FC3C916E9F53DE93076A0254532
        917C7C999B33089617CA9FA52623C90F7D76000E5F9455C1103AB084A490931E
        414C15B65BF16ABD1CDF685B595271F23CAC3B7A0EFEB2EB784F4F7DC5DC4930
        253B4DB69F519ACF4E14C4404E7A04315BACF762E3F2811CDFE24D102F173A9D
        307F7577A570757A1254CF9F12957FDB9B2EC1B39BBF91E51605F168D1234881
        857B0CEBB215723C8B574108A4FF41FA21644672D6C881A2DD7967330D3E43FD
        A4B4CDAA96B72644754152F1FB8D0F68EF2DE9273F3F04F53257A69079FE5766
        4DF0BB4704913360192488B9D27A9F2030EFCB8998184108CFE4E5C082F14315
        C948A5985BB30BDA1C2E596EA70F4D8737E64CF4BBA79820A64ADB1D68C67C2C
        D927102F08A1684426FC61D678D0B3F45F2F21D3CC1B8FCBDF264B4141821BF5
        C2CAED05BCC07272225671FB64189A620006EB61E2A1D73CDD7736F42A0F525F
        2F9D3C12164E1CEE196B920B09E762A723C88C0D479BC30D5F5F68F3F41D769F
        6905874877E15050904E1424999CF40AB26ADB289ED59D882A861221814F1E92
        E611870CFE25B06C443724B1B65397E0DFFB9BE00836C634A7971414E4120A92
        E9CD130FB36B36A5DAED46AA0B9748B537312B15C519006332923C731A84F368
        9ED67E7F09EA4EB7A2A9AA9D6D121514643F0A32999CF4D61764CFC34A2EBA32
        AC2224E21350BCF9E3B261D480444F2FF9CDDDAA1670C504C1FEDF7BB565A685
        DE74F560B2D8480989879DDE60DD7DD3616062EFDA5E62BA1213564D142C218F
        620921DB58050942BAAD92DE1AA505E96492CEA697B81684811BB952F381EE53
        1FE26903997E25881192BDDB07FA0982BDF569D85BAF57355532E94782B46375
        D5D34CF80972F9E54EBBAAA99249A020E4059DBD67D535123312F54123C43204
        F9020599E3BD08B5508EEC253858D594C9205010AD205910061660FBB1A6F732
        80820AEE7586119EA69DB048F417411C1D8694FA47A6F7AC690D12C45C651D2D
        F0CCB7B41316897E22C869ACAE86F9DE08FD3A82C546E622936927AE2F020521
        D3A85D51CC6BCB818CC991771E7D9128C8B32888DFC2C49082982BAC6F080CF3
        A4AAA993487FB0B258079F667D68A69F25125290A29AAD835D76BDEA1BD14B21
        DE05C1EE4583ADAC7042F0FD3060B5D5888771AAA650021F2DC8F5BC2DE5A5E9
        C72E285E2B7BAB43592CB961043C3C79A4DF3DEF2B111161600E5A575F04DF0E
        03761267A38A9B544DA104C8B21DB27CC717D21739D3A1CE6870B25E17F41A1E
        596634E73F3BC538EF59F61348A48D03C8666519A04186A51A61F5DDD36847C3
        8F77F67D072B0F348979F44914E4CD505F441244D37B642D2B18EB197ED702E7
        3B1D70D7EA7A3113660EEEA82929DCDE5991379F91F846AEDA6861E1C4B1E60E
        58F2E97E708AB1AE0478822B37FF3DDCD791B767AAB2CEC28EE216AA298E4046
        62022C9A381CA666A7814EA5C51324EB4FB47442F5A1EF3DEBBA44D28A55559F
        AF7B88DBC0CC6223E64B74CBFAAE000C2BFCCCB6A8706B9FCF88F188FCA7A08E
        756BE26FE5E21606383473CD911F13099AC1CFA319FC07DAE98A53DC8E0E439A
        EF206238A46D13ABF1CEA256C11FF27DD82B5F2DEE5909E4D6D4A51BEC0EF2A6
        4C6C7687E98F08F0095A55F3C53E2ED9243155DA6EC1403EA79DCE38E12CF639
        8689D9AFD78BBCCDF82DB6DFE3E105DAA9D5386E304236576CBE28C551347F57
        B15600E64EDAA9D62A68E24E451377AF6477D1041A4FEBB8548581F968E27E22
        CF693490E5A716EE10FA722DED3CD00C0C2C4231AAE53B8F96E5026B1ACBEDC2
        336D0DBDD2204A31BABD5082EE85DAC4F2BA99769E50A4CF1DABC5A2EC1F4B5A
        AC2BB0A17F8C5E9E50C189BFC7C9D1FE5D9E17C58746B19F5282FD942AF5F385
        0A4DAC839F18B850211A6232567D796D17192116FF9E71BC41FE0F649169B192
        FF83DBED6DACC0C6DE3CD6568155D8A298678EBAD8314DB7F9EE93A824319FCD
        31ADB24D0516BE048DCECD4BE4234787A158EA5FE14941A5E9354F7FE5390CED
        65BC8AFC66A7C66004E13B41CFCCE54ACCF2F6CD9012969A099BF7C6A7C6E68C
        8C1518EA12B5C3968500641CAA842B376F502B482A9962AAB1254117BC82A13F
        8197DA5B318DD6130FEC833BCA0AFEA776C0747FA5D8F0178CABBD9FE5F9D704
        861919BD8751E1664058E712F44F7937A4A48166AA8DD92B376574E9131FC74C
        218BBCD55AD74336B7B2B12CFFA2B5B1708B94798B58A119417C417112ED09C6
        4286171EC618DE82666696427125EB4C1BC8BE607AD665D95E32F3B8D2FD8868
        D1A42041102BED7D6E20B63B3760664EC35893975347E367085E0FC4C6B7774A
        998556BC26DBDD9EC6E3375815D6E1678FAB5DFFAD984506B4890F417E425C11
        4463FC1F9E718BB0D7A284E60000000049454E44AE426082}
    end
    object gbPesquisaPosto: TGroupBox
      Left = 145
      Top = 11
      Width = 856
      Height = 209
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object labelNF: TLabel
        Left = 217
        Top = 69
        Width = 18
        Height = 13
        Caption = 'NF:'
      end
      object Label2: TLabel
        Left = 113
        Top = 69
        Width = 21
        Height = 13
        Caption = 'At'#233':'
      end
      object labelVencimento: TLabel
        Left = 9
        Top = 5
        Width = 186
        Height = 13
        Caption = 'PPESQUISA POR VENCIMENTO E NF'
      end
      object labelCaracteres: TLabel
        Left = 429
        Top = 107
        Width = 229
        Height = 13
        Caption = 'Registre uma OBS ( ao menos 10 caracteres )'
        Visible = False
      end
      object Label1: TLabel
        Left = 9
        Top = 69
        Width = 17
        Height = 13
        Caption = 'De:'
      end
      object labelRepresentante: TLabel
        Left = 11
        Top = 27
        Width = 75
        Height = 13
        Caption = 'Representante'
        Font.Charset = ANSI_CHARSET
        Font.Color = 8553090
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editPesquisaNF: TEdit
        Left = 217
        Top = 85
        Width = 114
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyPress = editPesquisaNFKeyPress
      end
      object Panel1: TPanel
        Left = 337
        Top = 77
        Width = 90
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        object PainelConsultar: TPanel
          Left = -7
          Top = 8
          Width = 88
          Height = 25
          BevelOuter = bvNone
          Caption = 'Consultar'
          Color = 11360274
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object btnConsultar: TSpeedButton
            Left = 0
            Top = 0
            Width = 88
            Height = 25
            Align = alClient
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnConsultarClick
            ExplicitTop = -3
            ExplicitWidth = 73
            ExplicitHeight = 27
          end
        end
      end
      object DateVencimentoDE: TMaskEdit
        Left = 9
        Top = 85
        Width = 97
        Height = 25
        EditMask = '!99/99/9999;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
      end
      object DateVencimentoATE: TMaskEdit
        Left = 113
        Top = 85
        Width = 98
        Height = 25
        EditMask = '!99/99/9999;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 124
        Width = 409
        Height = 76
        Color = clWhite
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        object labelDataPagamento: TLabel
          Left = 16
          Top = 17
          Width = 87
          Height = 13
          Caption = 'Data Pagamento'
        end
        object painelBotoes: TPanel
          Left = 137
          Top = 24
          Width = 87
          Height = 42
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object painelbtnPagar: TPanel
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            BevelOuter = bvNone
            Caption = 'Pagar'
            Color = 11360274
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            Visible = False
            object btnPagar: TSpeedButton
              Left = 0
              Top = 0
              Width = 75
              Height = 25
              Align = alClient
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btnPagarClick
              ExplicitLeft = 64
              ExplicitTop = 8
              ExplicitWidth = 153
              ExplicitHeight = 41
            end
          end
        end
        object maskEditDataPagamento: TMaskEdit
          Left = 16
          Top = 33
          Width = 105
          Height = 25
          EditMask = '!99/99/9999;1;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
        end
        object cbExcluir: TCheckBox
          Left = 245
          Top = 40
          Width = 98
          Height = 17
          Caption = 'Confirmar pgto.'
          Font.Charset = ANSI_CHARSET
          Font.Color = 9408399
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = cbExcluirClick
        end
      end
      object memoMotivo: TEdit
        Left = 429
        Top = 86
        Width = 411
        Height = 21
        MaxLength = 70
        TabOrder = 5
        Visible = False
        OnChange = memoMotivoChange
      end
      object editRepresentante: TEdit
        Left = 9
        Top = 42
        Width = 409
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = 5195076
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnKeyDown = editRepresentanteKeyDown
      end
    end
  end
  object painelGrid: TPanel
    Left = 0
    Top = 314
    Width = 1001
    Height = 268
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object gridPagarParcelas: TDBGrid
      Left = 0
      Top = 0
      Width = 1001
      Height = 268
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPagarParcelas
      DrawingStyle = gdsClassic
      FixedColor = 7428151
      Font.Charset = ANSI_CHARSET
      Font.Color = 7428151
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = gridPagarParcelasDrawColumnCell
      OnTitleClick = gridPagarParcelasTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'VENDAID'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NF'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO_NF'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_PARCELA'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL_NF'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PARCELA'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VOLUME_PARCELADO'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 152
          Visible = True
        end>
    end
  end
  object qryPagarParcelas: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPagarParcelas
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_PARCELA_VENDA_PARA_POSTOS_I'
    UpdateOptions.UpdateTableName = 'PARCELA_VENDA_PARA_POSTOS'
    UpdateOptions.KeyFields = 'PARCELAID'
    UpdateOptions.AutoIncFields = 'PARCELAID'
    SQL.Strings = (
      'SELECT'
      
        '   parc.parcelaid, parc.vendaid, parc.forma_pgto_id, parc.status' +
        ', parc.qtde_parcelas, parc.valor_total_nf, parc.valor_parcela, p' +
        'arc.data_parcela, parc.volume_venda_total,'
      
        '   parc.volume_parcelado, parc.documento, parc.volume_restante, ' +
        'parc.nf, parc.emissao_nf, parc.acesso, parc.parcela, parc.data_p' +
        'gto_parcela,'
      ''
      '   fp.formaid, fp.descricao,'
      ''
      '   v.vendaid as vendaFK, v.nf as nfVenda,'
      '   '
      '   r.representanteid'
      ''
      
        ' from parcela_venda_para_postos PARC, forma_pgto FP, venda_para_' +
        'postos V, representante r'
      ''
      ' where'
      ''
      ' (v.representanteid = r.representanteid) and'
      ' (PARC.forma_pgto_id = FP.formaid) and'
      ' (parc.vendaid = v.vendaid) and'
      ' (parc.status = '#39'ABERTO'#39') and'
      ' (parc.nf = :NF) ')
    Left = 64
    Top = 357
    ParamData = <
      item
        Name = 'NF'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPagarParcelasPARCELAID: TFDAutoIncField
      FieldName = 'PARCELAID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPagarParcelasVENDAID: TIntegerField
      DisplayLabel = 'Venda:'
      FieldName = 'VENDAID'
    end
    object qryPagarParcelasFORMA_PGTO_ID: TIntegerField
      FieldName = 'FORMA_PGTO_ID'
    end
    object qryPagarParcelasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object qryPagarParcelasQTDE_PARCELAS: TIntegerField
      DisplayLabel = 'Qtde Parc.'
      FieldName = 'QTDE_PARCELAS'
    end
    object qryPagarParcelasVALOR_PARCELA: TFMTBCDField
      DisplayLabel = 'Valor parc.'
      FieldName = 'VALOR_PARCELA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasDATA_PARCELA: TDateField
      DisplayLabel = 'Venc. Parc.'
      FieldName = 'DATA_PARCELA'
    end
    object qryPagarParcelasDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object qryPagarParcelasNF: TIntegerField
      FieldName = 'NF'
    end
    object qryPagarParcelasEMISSAO_NF: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO_NF'
    end
    object qryPagarParcelasACESSO: TStringField
      FieldName = 'ACESSO'
      Size = 9
    end
    object qryPagarParcelasPARCELA: TStringField
      DisplayLabel = 'Parc.'
      FieldName = 'PARCELA'
      Size = 5
    end
    object qryPagarParcelasDATA_PGTO_PARCELA: TDateField
      FieldName = 'DATA_PGTO_PARCELA'
      Origin = 'DATA_PGTO_PARCELA'
    end
    object qryPagarParcelasFORMAID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FORMAID'
      Origin = 'FORMAID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPagarParcelasDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Forma pgto.'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPagarParcelasVALOR_TOTAL_NF: TFMTBCDField
      DisplayLabel = 'Total NF'
      FieldName = 'VALOR_TOTAL_NF'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasVOLUME_PARCELADO: TFMTBCDField
      DisplayLabel = 'Volume parc.'
      FieldName = 'VOLUME_PARCELADO'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasVOLUME_RESTANTE: TFMTBCDField
      FieldName = 'VOLUME_RESTANTE'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasVOLUME_VENDA_TOTAL: TFMTBCDField
      FieldName = 'VOLUME_VENDA_TOTAL'
      Origin = 'VOLUME_VENDA_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasREPRESENTANTEID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object tcPagarParcelas: TFDTransaction
    Options.AutoStop = False
    Connection = frmMenu.FDconexao
    Left = 88
    Top = 469
  end
  object dsPagarParcelas: TDataSource
    DataSet = qryPagarParcelas
    Left = 160
    Top = 360
  end
  object qryVendas: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPagarParcelas
    UpdateOptions.UpdateTableName = 'VENDA_PARA_POSTOS'
    UpdateOptions.AutoIncFields = 'VENDAID'
    SQL.Strings = (
      'select * from venda_para_postos')
    Left = 408
    Top = 328
    object qryVendasVENDAID: TFDAutoIncField
      FieldName = 'VENDAID'
      Origin = 'VENDAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryVendasREPRESENTANTEID: TIntegerField
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
    end
    object qryVendasPOSTOID: TIntegerField
      FieldName = 'POSTOID'
      Origin = 'POSTOID'
    end
    object qryVendasPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
    end
    object qryVendasMOTORISTAID: TIntegerField
      FieldName = 'MOTORISTAID'
      Origin = 'MOTORISTAID'
    end
    object qryVendasCORRETORID: TIntegerField
      FieldName = 'CORRETORID'
      Origin = 'CORRETORID'
    end
    object qryVendasUSINAID: TIntegerField
      FieldName = 'USINAID'
      Origin = 'USINAID'
    end
    object qryVendasNF: TIntegerField
      FieldName = 'NF'
      Origin = 'NF'
    end
    object qryVendasVALOR_NF: TFMTBCDField
      FieldName = 'VALOR_NF'
      Origin = 'VALOR_NF'
      Precision = 18
      Size = 2
    end
    object qryVendasDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'DATA_EMISSAO_NF'
    end
    object qryVendasVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 18
      Size = 2
    end
    object qryVendasTAXA_FRETE: TBCDField
      FieldName = 'TAXA_FRETE'
      Origin = 'TAXA_FRETE'
      Precision = 18
    end
    object qryVendasVALOR_TOTAL_FRETE: TFMTBCDField
      FieldName = 'VALOR_TOTAL_FRETE'
      Origin = 'VALOR_TOTAL_FRETE'
      Precision = 18
      Size = 2
    end
    object qryVendasTAXA_CORRETAGEM: TBCDField
      FieldName = 'TAXA_CORRETAGEM'
      Origin = 'TAXA_CORRETAGEM'
      Precision = 18
    end
    object qryVendasVALOR_TOTAL_CORRETAGEM: TFMTBCDField
      FieldName = 'VALOR_TOTAL_CORRETAGEM'
      Origin = 'VALOR_TOTAL_CORRETAGEM'
      Precision = 18
      Size = 2
    end
    object qryVendasVENCIMENTO_NF_ATUAL: TDateField
      FieldName = 'VENCIMENTO_NF_ATUAL'
      Origin = 'VENCIMENTO_NF_ATUAL'
    end
    object qryVendasSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 10
    end
    object qryVendasATUALIZAR_PARCELA: TIntegerField
      FieldName = 'ATUALIZAR_PARCELA'
      Origin = 'ATUALIZAR_PARCELA'
    end
    object qryVendasPARCELAS_GERADAS: TStringField
      FieldName = 'PARCELAS_GERADAS'
      Origin = 'PARCELAS_GERADAS'
      FixedChar = True
      Size = 1
    end
    object qryVendasTOTAL_NF_RECEBIDO: TFMTBCDField
      FieldName = 'TOTAL_NF_RECEBIDO'
      Origin = 'TOTAL_NF_RECEBIDO'
      Precision = 18
      Size = 2
    end
    object qryVendasVOLUME_TOTAL_RETIRADO: TFMTBCDField
      FieldName = 'VOLUME_TOTAL_RETIRADO'
      Origin = 'VOLUME_TOTAL_RETIRADO'
      Precision = 18
      Size = 2
    end
    object qryVendasVALOR_RECEBIDO_MES: TFMTBCDField
      FieldName = 'VALOR_RECEBIDO_MES'
      Origin = 'VALOR_RECEBIDO_MES'
      Precision = 18
      Size = 2
    end
    object qryVendasVOLUME_RECEBIDO_MES: TFMTBCDField
      FieldName = 'VOLUME_RECEBIDO_MES'
      Origin = 'VOLUME_RECEBIDO_MES'
      Precision = 18
      Size = 2
    end
    object qryVendasESTOQUEID: TIntegerField
      FieldName = 'ESTOQUEID'
      Origin = 'ESTOQUEID'
    end
    object qryVendasVALOR_COMBUSTIVEL: TFMTBCDField
      FieldName = 'VALOR_COMBUSTIVEL'
      Origin = 'VALOR_COMBUSTIVEL'
      Precision = 18
      Size = 10
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 480
    Top = 328
  end
  object qryUsina: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPagarParcelas
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_USINA_ID'
    UpdateOptions.UpdateTableName = 'USINA'
    UpdateOptions.KeyFields = 'USINAID'
    UpdateOptions.AutoIncFields = 'USINAID'
    SQL.Strings = (
      'select * from Usina')
    Left = 408
    Top = 407
    object qryUsinaUSINAID: TFDAutoIncField
      FieldName = 'USINAID'
      Origin = 'USINAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryUsinaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 60
    end
    object qryUsinaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object qryUsinaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object qryUsinaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object qryUsinaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object qryUsinaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryUsinaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
  end
  object dsUsina: TDataSource
    DataSet = qryUsina
    Left = 480
    Top = 407
  end
  object qryEstoqueUsina: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPagarParcelas
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_ESTOQUE_USINA_ID'
    UpdateOptions.UpdateTableName = 'ESTOQUE_USINA'
    UpdateOptions.KeyFields = 'ESTOQUEID'
    UpdateOptions.AutoIncFields = 'ESTOQUEID'
    SQL.Strings = (
      'select * from Estoque_usina')
    Left = 408
    Top = 472
    object qryEstoqueUsinaESTOQUEID: TFDAutoIncField
      FieldName = 'ESTOQUEID'
      Origin = 'ESTOQUEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryEstoqueUsinaUSINAID: TIntegerField
      FieldName = 'USINAID'
      Origin = 'USINAID'
    end
    object qryEstoqueUsinaPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
    end
    object qryEstoqueUsinaESTOQUE: TFMTBCDField
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      Precision = 18
      Size = 2
    end
    object qryEstoqueUsinaREPRESENTANTEID: TIntegerField
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
    end
  end
  object dsEstoqueUsina: TDataSource
    DataSet = qryEstoqueUsina
    Left = 488
    Top = 472
  end
  object qryMovimento: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPagarParcelas
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_MOVIMENTO_ESTOQUE_ID'
    UpdateOptions.UpdateTableName = 'MOVIMENTO_ESTOQUE'
    UpdateOptions.KeyFields = 'MOVIMENTOID'
    UpdateOptions.AutoIncFields = 'MOVIMENTOID'
    SQL.Strings = (
      'select * from movimento_estoque')
    Left = 672
    Top = 328
    object qryMovimentoMOVIMENTOID: TIntegerField
      FieldName = 'MOVIMENTOID'
      Origin = 'MOVIMENTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMovimentoPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
    end
    object qryMovimentoESTOQUEID: TIntegerField
      FieldName = 'ESTOQUEID'
      Origin = 'ESTOQUEID'
    end
    object qryMovimentoUSINAID: TIntegerField
      FieldName = 'USINAID'
      Origin = 'USINAID'
    end
    object qryMovimentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryMovimentoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryMovimentoVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 18
      Size = 2
    end
    object qryMovimentoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
    object qryMovimentoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
      Size = 200
    end
    object qryMovimentoESTOQUE_ANTERIOR: TFMTBCDField
      FieldName = 'ESTOQUE_ANTERIOR'
      Origin = 'ESTOQUE_ANTERIOR'
      Precision = 18
      Size = 2
    end
    object qryMovimentoREPRESENTANTEID: TIntegerField
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
    end
  end
  object dsMovimento: TDataSource
    DataSet = qryMovimento
    Left = 739
    Top = 328
  end
  object dsRepresentante: TDataSource
    DataSet = qryRepresentante
    Left = 739
    Top = 440
  end
  object qryRepresentante: TFDQuery
    Connection = frmMenu.FDconexao
    UpdateOptions.UpdateTableName = 'REPRESENTANTE'
    SQL.Strings = (
      'select * from representante')
    Left = 643
    Top = 440
    object qryRepresentanteREPRESENTANTEID: TIntegerField
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRepresentanteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object qryRepresentanteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 60
    end
    object qryRepresentanteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
  end
end
