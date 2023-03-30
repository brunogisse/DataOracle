object frmCompraUsina: TfrmCompraUsina
  Left = 0
  Top = 0
  ClientHeight = 588
  ClientWidth = 1116
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
  object PainelTOPO: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1110
    Height = 55
    Margins.Bottom = 1
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object labelTitulo: TLabel
      Left = 4
      Top = 16
      Width = 221
      Height = 31
      Caption = 'Cadastro de compras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -23
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labelOperation: TLabel
      Left = 296
      Top = 29
      Width = 115
      Height = 21
      Caption = 'labelOperation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8553090
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object painelBotoes: TPanel
      Left = 566
      Top = 3
      Width = 504
      Height = 50
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object painelBtnNovo: TPanel
        Left = 8
        Top = 8
        Width = 120
        Height = 35
        BevelOuter = bvNone
        Caption = 'Novo'
        Color = 11360274
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnNovo: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnNovoClick
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 153
          ExplicitHeight = 41
        end
      end
      object PainelCancelar: TPanel
        Left = 130
        Top = 8
        Width = 120
        Height = 35
        BevelOuter = bvNone
        Caption = 'Cancelar'
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object btnCancelar: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnCancelarClick
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 153
          ExplicitHeight = 41
        end
      end
      object painelSalvar: TPanel
        Left = 251
        Top = 8
        Width = 120
        Height = 35
        BevelOuter = bvNone
        Caption = 'Salvar'
        Color = 11360274
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object btnSalvar: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnSalvarClick
          ExplicitLeft = 5
          ExplicitTop = 7
        end
      end
      object PainelExcluir: TPanel
        Left = 373
        Top = 8
        Width = 116
        Height = 35
        BevelOuter = bvNone
        Caption = 'Excluir'
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8553090
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        object btnExcluir: TSpeedButton
          Left = 0
          Top = 0
          Width = 116
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnExcluirClick
          ExplicitLeft = 2
          ExplicitWidth = 120
        end
      end
    end
  end
  object gridCompra: TDBGrid
    Left = 0
    Top = 302
    Width = 1116
    Height = 286
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsCompraUsina
    DrawingStyle = gdsClassic
    FixedColor = 7428151
    Font.Charset = ANSI_CHARSET
    Font.Color = 7428151
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = gridCompraDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'USINA'
        Width = 490
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_COMPRA'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_COMPRA'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME_COMPRA'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Width = 141
        Visible = True
      end>
  end
  object PainelCentral: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 62
    Width = 1110
    Height = 237
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
    TabOrder = 2
    object ImgPrincipal: TImage
      Left = 13
      Top = 7
      Width = 123
      Height = 120
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000780000
        00780806000000396436D2000000017352474200AECE1CE900001BB949444154
        78DAED9D07581457D7C7CF2C2B76EC856A03ACD8B1A55812359658638C1A7B37
        5604EC8AA906B061A2684C6CD144DF686CD1D86B544463EC4A5110B0A0620514
        9699EF9CBB855DB6B07D563FFECFB3EC323BE5CEFDCD39F79C7BEFCC72F03648
        1038B78531E538816BCEF1920EC009CD7169357C95C657217C71FAB6C45736BE
        9EE1EB36FE1B2570B04FE084A8BB537D1F03C709629F9AA5E22CDF85FDE5FEED
        F57250483A10818E41283EB84862A343F15845B1083C12B2651B5266D67E2CF6
        B99BAA3703305AA867785C37418030FCCF47E4D2C4721C0425057AEF7C132CDC
        A1017B84C5F544B891F8B1A2D865D1A354843C2639C8FB4FB10BA24F0E0798DC
        2F2795FE811FDB885D1613754490C9FA389A1B7718C05EE1714D785ED88F1FCB
        8A5D160B959603D0FE5EB0CFBF621784243A60CFF0787F81E78FE0C7E26297C5
        CA4A07816F973CADE659310B211A60B705F15E12097F11E4A9CCDBACA73C2F69
        70777A8D3B621CDCFE80B7084E1E0971A7F05333314E58449D4BAEEADD023EE5
        72EC7950BB02F6088D1D816F3FD9F3988E26CCA9C7A404F9AEB4D7F1EC02B84E
        C855E7E7450B270027B8DAEBC41C5CF75D32B2AA5C0BA99B65EB03D91CB07B58
        4C174EE076DBFA386FA4245CE7E440EFBDB63C844D01A34BDE8E6FDD6D798C37
        5D08605752B04F371BEEDF06920752A9F0E6E7B4F6521A0660156D1180591DB0
        A227EAA12DF6FD964BE0257CC5BB81351F5973A75685E01916574F1084CBF6AD
        97B74B1CC7F92505795FB1DAFEACB5238FB0D83620C01171AAE52D13076D9383
        7C8E5A6757569067686C0701609FA895F29609C174C4E06BBF15F6639930526E
        8D6F47C5AE90B7546D92837D8E59B2038B007B2D88ADCB4BC06AED4581B46569
        9B6C366045B46CD588AF407A24CD2A971C5037CD9C4DCD032CCF73B3CDDEBE40
        A64AC03CB9903979B25980B0DDA5590B059D18F6551AB6C7E54CDDC864C01831
        EFC488F963B1CFF6FFA97620E41EA66C6012608FF0B84EC00B7BC43ECBFFD732
        7180C268C06CC8AF98F36BB1CFAF40002E1959858D1D6A341A30B6BBF7F0ADB2
        D8275720A6FBE8AA8D1A5B370AB04758DC48108455629F5581D4C471A39283BC
        F39D1D933F60794A2413FB7C0AA42D4C9DA4F9A54EF90246D71C8D6F4DC53E99
        02E9D43974D5FE865630085831B53551ECB328907EF1BCA48AA129B90601A3F5
        3E81B77FDEF29BAEA768C565F47DA917B0E28E035167E517C838711249B3A4C0
        1AD13ABFD3B7115AEF4B78FB6E27795B958E565C42D7173A01BB86C636760238
        2F76A90B64BC30946EA2EB86379D800B0613DE48E91C8CD0025C30CEFB064BC7
        B8B11660B4DEC3F8D656ECB216C82C1D412B6EA7BE401760877FEE4481F40B01
        6B30D5F847F14C8C6D6217B2401688E37AA93F3344137068EC03B0D1034FFAD6
        E4A0698DF2666D2BA04F09DEFBD09ED5F4262B15ADB892F29F5CC082C0A105F3
        B638A22CFE142CECDF107ABF5FCFACED7904EC1B7ECBDE15F5C60A2D58A27CC4
        930AB067586C77B494EDD63E982CFE34F04FEFC2E2719D0A00DB491C073D9282
        7C76B0CFCA85E89E63C0CA0F1993DD8E6270C9C73A4B25E02431ED817437D64E
        A279C105804D572CBA695FFAA00ED8AAD1B32C215A05973D1252E3DD3825FE16
        5400D84C29A369F6C7DA9D1BB2C473C03FBB2787A90E56FD7F235400D87C0932
        59797A289B1C7058EC646C92175B63C7B23BE74178761F39EA016B8225170036
        5F02075352827C9630C01EA1713770514D4B772A4BBAC0E02A216A41D6F5D980
        0A005B22EE6672B0772D05E0589AD763D123796549FF81F09CD2684D88823EEB
        35027201608BC4633BECC45923FFCD49BE04FC8B077A2DD55C4B2E006C99281F
        E6DCC26F9697F012B3BB89725208EE43FDE02CB0E402C0968997F015384B9E63
        95937219F8978FF20767A6252B01BF6DFAF3EA0B08DA63FBAE578113BA721EA1
        3111D8204F3075E39CBB5711EEC35C2882C2CB5B117201604B252C43C0B15160
        E2834173EE5D975BAE0A8E0EB85680AC0EF845C66B2859AC30BCCCCC8212459D
        D9FFA4C285A46C9D425209FB4E506C4BEB2AB751AEEBE4248122B83E65FFAF5E
        CB2087E7F5AE4BFB2C8EC7C9C9E14186AF6C598E6ADDBC65502E7F9D2D63BD75
        99AFB3D932DA9E8E53AC4821D536A46D575ED86BF0E42C01A6079655301AEEFD
        1B20BC7C4C98F2C0B13EE4E34B4641D5CAF259BB3E0317C19679FDA0865B5918
        B9703B9CBE2A9FAEED2C7582D80D01084B80EA03C255E55CF2451768DDA03A2C
        FADF49D870E082021A5D34C1ECB3D767A1AA75C7766F0EA3BAF8C3EE333761CE
        2F0754CB1336E10526E1D87E0934E983C6DEB0785C67B89A900AFDBEFE5DB5EE
        8DB553C0B99013341CB90C9E2BC07BBB9783DDDF0E8247CF3260DB89AB30B977
        2BB6BCDFA664884EB1F9632A490F093095C6D928B80F62185C25004DC8BC9ABB
        CE2F98526C9F0FE4DEEFD56595490A58B107FE8BBB0787170ED780433A1FF905
        EC391BA301A754F12270F9E78950B57F18F07CAEDBDFF5CD20C8400BEBFBE56F
        AA6552B4EC5B1B03A1D6902590F12AB7E2E9226956CB035A4DD07C38EC9DDF83
        E19D892B2129F5996AD9A8AECD60CA27EF40ED219AFD4509E885067CB30522A7
        74676522F960C068428FAD25CA22C07469E6DBD0E5A4C622DC346D48E65AB211
        906980220EAD9394F8E029542E5B02361FBD024E688A3356CB9FDA54AF5A25F8
        696A4F702BE702353E0F67EE94740EA1FF7EF81203F4A90266F952C5E19F8851
        CC8D3619F3233C4B7FA5827EF8423CF4695D4F0593AC31667D00A43DCF843EB8
        7D7C8AFCA71822C67785C72F32E1B3B6F55530C99D537342561DBAF9041CC17D
        91C6F568017E58BE4EFEBE2091C8AB384BC6439DC50976A14B95C91933C89093
        1A0F42469A7E48F941CEA7CBD210E4844D5341A268878F5EBC0D83BEFB1FB30A
        DF418B202B3B07E2D1F2EA8F88805675BC6012BAC0AE33D733A861A33B41EB29
        3FC18D7553E0DD89ABD04DA6C3A5D513E1E359EB59BBBD69765F688A90DDCABB
        C0FED0A1506FD85238FDC31874FF7FC295DB0FE060F83098B7F6108316BD622C
        6B228A152E04577F9904D5D065FF11D21FD6EDBB00BB4E5F879F837AC3F14BB7
        61D3C18B10F76B0054E917C6CA4CE5246F133AFA23764190B65E7A0AD3F699F5
        3C15B3942FE09C870837FDA936A87C21EBEA7B361DF2E6D99F42CB3A9EAC2C0D
        47FD80169501ADEA56812F877E089B8F5C82C6BE6E3076311BFA842B58F91D83
        D7C0C988D1CCBA5E65C9C0B36269F80BDBC109CB76C18CFEADE1A3696BE517CB
        E29110BCF26F5837BD37B499B21A1E3C7909C58B38C32574EBED037F81ADF3FB
        43233C1E69FD8C3EB0272A06C6A3458E8FD8854DC55DF4021CDCC636BADEF008
        F877E517E0FDF942B6EE9C81EDD877B5BD2AA0B7B9CCDADE1F2676836EAD6AB1
        EFDBAD4A843BCFECF7D0778380731EDD46CB7D9A6714C802C86658B2BFAF3B6C
        9DD7979527E2CFD3108E2E907461D57828E7520CAAA085284FA062991210BD7C
        1C6C3976198222739F72F0F7F743A04E958AE8C217AAA2E1C2CE528845177C2E
        26057ACDDDA85A7705B6959D9BD764C1D21374C5AC92142EF8EEE317D0E28B15
        AA7527F77E07267FD20A2FAAB5703329372AA675E9E2AA3958EEC2E37F9D8A51
        BE13FBEC1D66DF0E1BBD80F9C709C0673CD30DCC00486B4326E79CB8710A2B13
        B5997E6831A40D68552DD0B2C9752AA5B4AA714B77C2EED33754CBC9AA46746E
        C25CA7BA28585AB2F5148BB495EA8BAE340C5D2AADAB4CB9481484ED3F170763
        16E74E7A695AD303B6A1A55373414095BAB87A02DC7BFC12BDC51AD6F652344E
        4ACB9041B31FEDFBDB1C3A01F36977E4700DA53176841CBB76026B37495E58F1
        654A1481B3CBC7C299EBC9F017A636BF1FBEC8BEDB3A7F00ACDF7F01964DE8AA
        8AB40B3939B176F1E7BDE79925CE5F77882D0FC536FA7EDA0B96BA54C3489BD2
        2C763121F4E93FED834E68C503BFDDC2D61DDED91FFC6BBA43FBA6DEACBD4FCF
        9447DA74310D5AF03FF87A687BD6DE935A37A8864D411B0CFA4AB2F69E9A884D
        B33E65DF2D3CFE0856443D171730FF240984CCE746A531F6821C3EB23D7CDABA
        2E2B5FBBC035B0656E5FE813F21BDCBA97C6DC21B9E90AE89E8F61BB4A6D6F40
        9F77C1152B98DCF49E0583218C45B6B7D8BADE68F1645537316FA514AA6BCB5A
        30AC5313E6A6974FEE0E17E3EFC1CA5D67596EDD6CDC0A78FAF295EA1875AA56
        C280AA1773D3E49E3D2B9682A998BE9D8B1C07FD31158A497AA43A46A9E28531
        621F0DD7EF3C84C63E6EACEC8D226EC38BD7F6C98FD401ABD224FE490A08AF9E
        9B94AB5A04D9C8C0CBAB820B9C5C34941538EE6E1A5BFE010642B4CEC82EFED0
        082BF03DBFAAF0D1F4B590F2509E9B927575C0808B5CA8D2ADB769581DA6F77B
        9F7903B2D2A8EB496CF9F5B593A1CB8CF52C7256769650870A45CA976E3D807D
        D131B0E990DC4B10B4093FEC86ED5F0E50790917CC6F29D0A2A89A72EA796B0F
        B2E59BE77E8601A297AAB2EDDDFE82224D621D1D347F4A78F542372807B0E43B
        1B26A94AED337809BC666D9E7C1D6A1FC952BACC58A75A8752250244F9EEC3A7
        E9AAE5942A51A045CB9572C7548952A42E98625DBE755FB5FC1075AAA095AAB7
        F3942A51EA45D1F4CE53D755CB2955FAB071758D765EB92EBB301FBD828FD6DC
        B53760D6D1F100E156145EA78321EB121BF2851F4762D45C9495BAFEA8E5E83A
        3355EB246EA208F739B41C1FA93AB31EEFD6619D121FA2A5C724E74E378BDD30
        95F541D71A9CDBE354BF862BECFE66200C0BDB0607CFC7A996FFBB723C942D59
        94B972A52A942ECE7ACE16FC761C96EF38A35AFED7778359A746957EA1AA5EAA
        011F3684EF4674609F27EEB8077B6232ED0D3895739D79EC0C646736D7EB42F5
        59B2BE8974AC93C3FA90C7756D02D33E95F7E552DF6EE371916CF957433E80CC
        D759D0B5452D18BB64076B4349142137C05487D226EF810B5515DEBE8937B3AC
        4D18986D3F798D2D270F4039F665B46E02446A5EDB93C139836E9CDAE1D0DF8F
        B3E5D4FDD969FA3A38B56C3454456BE5B10C1E154AC15E6CEBC3B79C644DC588
        70F9DD3F513F8E65B100A9D6C25B20B3C96D050615C5B906EF5F8A1535D1603B
        690964752F6001E492459DE14AE42855C9FB7EF3079CC71C36662DF5372F84E2
        85A5ACF2A90D5D34AE0B24DC7F0211DB4EC19A69BDE1F0BFB7E0D78317D84003
        B950EA18A3D485DAD0D11F3747CBABC85CEECC016DA028C2A73E6DFA9EF2581A
        21A2EDAA7F1ECE22E4A918C05153F0C9FBF5D8447E1A70B88E01DBFB9357B1A6
        80725EEA20A19C9CFACD497411F886DFB63B5D0CAD9672EED30E77E185ECDD72
        366640B6A5BBCEF33971DD7855D169002136E5317CF9EB3138713981ADF303A6
        47F118594FECD992A53EEC14159D147F47C7C2E9AB7760CDDFF207174CECD58A
        05523DD195AB0F5E50F7E2AADDD1E052AC0806627FB3651F35F385B1DD9A43C3
        1A95596789B2BFFBE6FA00F86ED331E88229559FF99BD8B25A5E15588E5E1A53
        39656A77FCD64B18B635D5EE78D980BF5BC891F242A6ECA17C34281FC8FADA64
        7D83F65676D707BEED07BEEEF2070FEC3C1303ADFDBCC06FD40AD5F71C6B8F03
        A1E7BC8D70FE668AEA4487776E0AB3D03AD58713194CB4D2608CA6B71CB9A45A
        F65EFD6AB071661FAD112BB252CAB7E7AF3FAC5A56B5721938BE64A4D688D53F
        E8BE3DD16D2BD56B7D125C7A906D77C06CCA0E560CE73AFD20AF02624BC816BA
        EBCE4D6BC08AF11D354EA2FAA008B4A81CF67D6DCFF2B0EBAB01108D70D5C76A
        A953A462E912E037224235485FD6A518064BE320F9E173786F52EE531AB77FF5
        390B96280D23374FA26EC6380CCED25F65419DA14B54EB2E1ADB99E5D1C3C3FF
        841397E42E58D959A22E1F4C8F04B0BFD8A43BFAE036FD500E56A244508DEB8A
        04599FAB57BC28C78CFF7934DBE5A3E799307BDD1118D5A931F408D9CC8E11BF
        6E22341AB302CE2D1F032DC6AF84B4E7E9AC93612946D3A3166E8775D33F8166
        E396B3EDFFFB6902F49CBB1136CFF90C062FF803D3AC54A85CB6246B37DF45E0
        9436D51C244F8FF6850E856F371E65E3BD2BD17DEF8DBA09459CA5CCAAA99B92
        3A45AA2AD2A395013DE0EC8D649837487EA37D66360F7E4B1244C0AB9C364B80
        671CBE8915E89B5BE90EEAAEF1F3AD9FC7B03E67529541CBE0EACAD1F0C1B40D
        F091BF37BC53C703462CDA01D52A95863FE7F76391F1ED8D53D1EA96B2693427
        968E82493FFEC5A26802D03EE81736D5E6BF55E359DB4A4381ED83D6B094EBB7
        D97D61EB896B108DB0767EFD398BC8691CF9163601D4AB750C5DF3D4157BE1DC
        CD64983FE443C8C2606CE9B6D370112F9CAEB3D6C3BEEF87B0326EFCF709CC3B
        F44404BE6A13DFDD671E9D22F0FC22CD4A774CC8EB02BA401B3FF9F0A1FFA435
        4097E881EF06B028BBCA404C0878F9310E2C180489A9CFE025BAE4C93FCA278D
        52847C6D8DFC8E45DF818B204B31B2B43AB02750DCE45AB604749BBD812D538E
        E76666C9A015E6D78F9F67B0E5C19FBD0F7ED52B432D6C0EFCC72E5755270572
        A918450FFEFE0F08F8E45DE8D0D49B2D7F6F4522DC7B69D7DF849657B5FAAD2B
        EE33A2CA0990F148BBD21DA94D966F5BBF6A05D835B7971CCCBE8BF0D5A61370
        6AD160D87EEA267CBFE51FC5F5C043119A9181299457FF70B5FD016C99DB0FD2
        D19A872208D5B5AE88B429085346C8A4AF87B58777EA5581B601AB352A8F726C
        4A8594D0499FB56B00B33F6FC3260E505E4DCD094984EE497955A9DF7C46729B
        7954D06D59225AB28E3699EE5B4FF8459E0FA7BFCA861601EBE17CC410160855
        1D18A1D807829CD51BDDAF339CBC9C08DF602AC3DA7074B194A7521EAC1EF97E
        33BC0334F2718507692F6168E8560D90049C06F59573B506776C0C83DA3762D1
        D407537F56AD7B1BA192B577C21CF904BA6F52EA8B6C681599240A608DDB47E5
        808FC5602DF8D817B2E2DD18C86ADB5E5F3E84B5A3245E9003A5112282C18E4D
        D368D182A8CF99C02B07F9691D36FD87EE96C07579C5FE94EBA8AF4B564D56A8
        DCBF728AADAE7595CB691D095E44CA4AFDFAD04358FBEF0B31F86ADF00EE36EB
        9FEE68D7DBF55B9603B4C98AFFBF1AD00A06B5AB2B46C599A4064B6E437AB6FD
        13249D8F70A07CD86DF609DE700F941EC87A7A9F4C830C1AC00D41AE5CBA1844
        85F717879A91A2E2FA88743F95CE87B090DC661D974F823707B2552C190C4306
        3DDBAA9629CBC5E739362DE7738F9D777D6B8B938073E35EA2C005BD8F5142B9
        CE3AD19303C583D04C816C08A0396DB2319D21F9406E5BDF0B66F56DC586FB4E
        5D4F86E0D507213DE3958E63180FB9A66705F87E5447D64579E3CE43088CDC0B
        C90F9F69AE84FED1B9512FF96D1462C8D083D048E8A685DC8A3304397FEBCDFB
        59108C81AC6D71A642BE103114C116D13AF7596B0EC3868317751C237FC83479
        802611E4D5AED337E18BA53B54FF33CBE52CBA97DE22197C9421C975F6C92368
        C56D6C01D9F23C590D8A1EC8BB3147F6ABAAFF562BFF09AB311D52CE5C310E32
        7551D24B9FC62FDB0D3BFFB98696DB034375A96870514711B0C68364B51F274C
        9D1E4ED98F342BCE9120EB3F167561DEFA6984C11AB891F4083ACCD8089A775F
        18867C27CFE0415E517A562B14B34CA951B778D94CCACE0D8380496E73FEA199
        6D65F442D655E936830CA0EDAED596A9EDC7D7B5341CF8EA138395409D1B5507
        4768C61006202B6F4CCB4F62F558A9E9095AAFD643DC753FD27FCE89261C48CE
        6957BA58966C1C64CFF225E0E482BE066B81ACADFA901FD4F66B18B2B24FDAD1
        014B245CD33B81DE5A3FC3A037D4739B7BEA259E6C718390ED66C99007807EC8
        89AB871BAC883DD1F13076D91E1D2994FAB9F11A90E37E9DCAEE43D62731EE58
        C823D37E9483E41112DD8CE7B3A3B4A354EB42068BA36B4DC8813D1AC3842E0D
        F5D644B5612B80A70902AA0B0C741C5BD3921BFBBAB379D0FAD43A3201525ED8
        7F469D0AA220F14F9A56E39C4980496E73CF3CC1132CADDD6FEC609035CA26C0
        97FD5BC2E0B6B535CE855C73B3800DF0F85986DA31F85CC8EAC7D561C9DDDFA9
        C36E89C9ABFE9B92E1AC7DEED6D727F37E188B019E77CE0B84EC44FD956E0377
        ADB3A2751DCF306429A6A2ED1B788147B91270E47212C4DD7D02BA1F14A398AD
        A4F302D3B464AAAC96F5AA40FD6A95203A26052EF2D541E25209C494453F6D47
        729F77FA2C9EA3BF6650621B4B361EB2D2B20C43D6B9AD1EC8FADDB5769B4C92
        FABC273A5C2C4F7472B0AFC107E818F1F3B25B9CDCAE7AC9724F1640334F05D0
        0BCC1277AD0ECBE690732F58FD4D452E64C7806BA59F972579CC3F3B52E0F955
        9A91A7ED2CD938C806A26BB320E7E7AEE5EF529F774152D2263F6B61AA4662DB
        BB3ABF958CEE11779B17758F03A1B2A0ABA28DB5644301945EC8A6B4C9F27D69
        4206D0EE14310FB2D4BB9563C015B87BC9D3BCDD8C59D568C07542AE3A3F83F4
        D7B9ED95352D393FC86ADF1B74D76A6D2AE4056999254BABB744B8463F4ECCA6
        72C9C82A7C2DA4AE51A1BB49635A1E73A33B0912618F1CB25A85E6856C134BCE
        0FB2A005C95A90A5D59B83A48463C00509D73939D07BAFB1AB9B3C68E91112B5
        1D1386EEB6870C1AC0AD0359ADBDD682ACDBF348AB3503AE8479BFF76403EDC0
        76B787291B98352AED1E7256FEEBA4F9B96BB3A26BB0B1BB360459D392A5559A
        3A125C9DBF2E9A9FCC9B7680A993FBB56AD9D4DA3B2664CB2D59EAD504E19A5C
        9FB692802951A1FC52225D327B5E098D1B4361C9232550ED8E027BB4C982F63A
        1A653016326858AFD4AB1170C51D06AECE715E6365D1C421CF90E87A582D97E5
        95AE7FF29BA2981640CEBB3F2B59B25606C083D493E03ACE6F63731CE79714E4
        7DC5ECED2D2D804748741BAC9E23B996CC6ACACE81970596AC5646A96743E08A
        95018711076D93837C8E5AB60B2BC82DE44C070E9CF66942D66579CAFF1D0FB2
        D4DDCFA1E022988E49C13EFBADB01FEB48D392152EDB26EEDA08C81ADB43BE90
        A56EF5106E695BF232556D30623E668D1D5975F2AEC797E7FC045EB8940B396F
        C5DAA34D360DB2935B5D87822BE1A1DE9DE93E57ADB53FABCFCE5644D7F46B1D
        9CEE36592DDF14D9929D5C6B0357B49411676517613B91553E39A0AE551F266D
        9BE9F7F23C3915CB5C36D792B53B2094E765B925E7023516B253E59A8E04370D
        F3DC8AE6E4B9F9C9A6F757B8879CDD896F1FE7B6C960034B06C81FB2E667A74A
        BE08D7C596A76E8A4CEE7E344536BF81C6637E7427ACF03DBADB642B4166EF86
        20E77A10A74ADEC0157110B8260E1C9823BBDC2145438D4F85978978B0CA3673
        D7EC5DD0009AD7929D2A12DC92F63865C312B87B2E99AFAB1A3BE46789EC7A0B
        9CFBDCA8D178C4489B59B20177ED54BE3AC22D615A816D23A36662584BF6BFC7
        513EC7EB0CD67D53DB5BB21CB2A47C35E00A8B0EF72C0652AD6C11481992683F
        0C289F922BBB88904BDB12B2A49C97D8709FF2BCA481A1A9ADB694E8BFFCE831
        E774739E130E23A362FA21D367DE64C892329E08B7B858A796CE49246D93026B
        448B59BFA20356CA75CE99261CF007904E196B40969476170B6E9A44C275D075
        2398187218C04A514F182FCDF98313F836E6BA6B06D7B998BD8B7E4490C9FA98
        3B6E6B2B391C6075B9CE3DD593CB91D173FA2B1A0B5952CAD59E705381E3C6A8
        3F13C3D1E4D08055628F783AD50D20270CADDA479FBB9694AA0C5CA1A2B62E4D
        2CC7415052A0F74EE5A38A1C596F06E03C62031A4EAF070939FC181072BC11AE
        8473A984708B58BE734DE155C4C50A9C1009D9B20D8EE67E8DD11B09584B64E1
        0B63CA7102D71C6DAA239E56735C5A0D5F349A50C8C0799205D2A3D8E9D73713
        40E0CE08127E3F028DBA3BD5F7F19B60A1F9E9FF00497B6146F38C6931000000
        0049454E44AE426082}
    end
    object gbEdits: TGroupBox
      Left = 142
      Top = 11
      Width = 563
      Height = 134
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 6
        Width = 28
        Height = 13
        Caption = 'DATA'
      end
      object Label2: TLabel
        Left = 13
        Top = 45
        Width = 34
        Height = 13
        Caption = 'USINA'
      end
      object Label3: TLabel
        Left = 13
        Top = 88
        Width = 52
        Height = 13
        Caption = 'PRODUTO'
      end
      object Label4: TLabel
        Left = 176
        Top = 88
        Width = 48
        Height = 13
        Caption = 'ESTOQUE'
      end
      object Label5: TLabel
        Left = 305
        Top = 88
        Width = 46
        Height = 13
        Caption = 'VOLUME'
      end
      object Label6: TLabel
        Left = 433
        Top = 88
        Width = 35
        Height = 13
        Caption = 'VALOR'
      end
      object labelRepresentante: TLabel
        Left = 83
        Top = 6
        Width = 88
        Height = 13
        Caption = 'REPRESENTANTE'
      end
      object maskeditdata: TMaskEdit
        Left = 11
        Top = 20
        Width = 67
        Height = 21
        EditMask = '!99/99/9999;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 6
        Text = '  /  /    '
      end
      object editUsina: TEdit
        Left = 11
        Top = 59
        Width = 539
        Height = 21
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = editUsinaKeyDown
        OnKeyPress = editUsinaKeyPress
      end
      object editProduto: TEdit
        Left = 13
        Top = 102
        Width = 156
        Height = 21
        ReadOnly = True
        TabOrder = 2
        OnKeyPress = editProdutoKeyPress
      end
      object editEstoque: TEdit
        Left = 176
        Top = 102
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = editEstoqueKeyPress
      end
      object editVolume: TEdit
        Left = 305
        Top = 102
        Width = 121
        Height = 21
        TabOrder = 4
        OnKeyPress = editVolumeKeyPress
      end
      object editValor: TEdit
        Left = 433
        Top = 102
        Width = 117
        Height = 21
        TabOrder = 5
        Text = '0'
        OnChange = editValorChange
        OnKeyPress = editValorKeyPress
      end
      object editRepresentante: TEdit
        Left = 83
        Top = 20
        Width = 467
        Height = 21
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = editRepresentanteKeyDown
        OnKeyPress = editRepresentanteKeyPress
      end
    end
    object gbMotivo: TGroupBox
      Left = 13
      Top = 148
      Width = 1076
      Height = 80
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 9408399
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object labelCaracteres: TLabel
        Left = 27
        Top = 56
        Width = 222
        Height = 13
        Caption = 'informe o motivo (ao menos 10 caracteres)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object cbExcluir: TCheckBox
        Left = 27
        Top = 7
        Width = 96
        Height = 17
        Caption = 'Excluir compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = cbExcluirClick
      end
      object memoMotivo: TEdit
        Left = 24
        Top = 25
        Width = 914
        Height = 25
        MaxLength = 70
        TabOrder = 1
        Visible = False
        OnChange = memoMotivoChange
      end
    end
    object gbPesquisaCompra: TGroupBox
      Left = 711
      Top = 11
      Width = 378
      Height = 134
      TabOrder = 2
      object Label7: TLabel
        Left = 44
        Top = 60
        Width = 17
        Height = 13
        Caption = 'De:'
      end
      object Label8: TLabel
        Left = 148
        Top = 60
        Width = 21
        Height = 13
        Caption = 'At'#233':'
      end
      object labelConsulta: TLabel
        Left = 44
        Top = 23
        Width = 165
        Height = 13
        Caption = 'Consultar compras por per'#237'odo:'
      end
      object DateVencimentoDE: TMaskEdit
        Left = 44
        Top = 75
        Width = 96
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
        Left = 148
        Top = 75
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
      object Panel1: TPanel
        Left = 257
        Top = 67
        Width = 113
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object PainelConsultar: TPanel
          Left = 9
          Top = 8
          Width = 81
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
            Width = 81
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
            ExplicitLeft = 7
            ExplicitWidth = 88
          end
        end
      end
    end
  end
  object qryUsina: TFDQuery
    Connection = frmMenu.FDconexao
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_USINA_ID'
    UpdateOptions.UpdateTableName = 'USINA'
    UpdateOptions.KeyFields = 'USINAID'
    UpdateOptions.AutoIncFields = 'USINAID'
    SQL.Strings = (
      'SELECT * FROM USINA'
      'order by usinaid')
    Left = 336
    Top = 336
    object qryUsinaUSINAID: TFDAutoIncField
      FieldName = 'USINAID'
      Origin = 'USINAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryUsinaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 120
    end
    object qryUsinaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
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
    Left = 416
    Top = 336
  end
  object qryProduto: TFDQuery
    Connection = frmMenu.FDconexao
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_PRODUTO_ID'
    UpdateOptions.UpdateTableName = 'PRODUTO'
    UpdateOptions.KeyFields = 'PRODUTOID'
    UpdateOptions.AutoIncFields = 'PRODUTOID'
    SQL.Strings = (
      'select * from produto')
    Left = 336
    Top = 480
    object qryProdutoPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 424
    Top = 480
  end
  object tcCompraUsina: TFDTransaction
    Options.AutoStop = False
    Connection = frmMenu.FDconexao
    Left = 56
    Top = 488
  end
  object qryCompraUsina: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcCompraUsina
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_COMPRA_USINA_ID'
    UpdateOptions.UpdateTableName = 'COMPRA_USINA'
    UpdateOptions.KeyFields = 'COMPRAID'
    UpdateOptions.AutoIncFields = 'COMPRAID'
    SQL.Strings = (
      'select'
      ''
      
        '    cu.compraid, cu.estoque_usina_id, cu.usinaid, cu.data_compra' +
        ', cu.volume_compra, cu.valor_compra,'
      '    pr.produtoid, pr.descricao as produto,'
      '    u.usinaid as usinaid_fromU, u.nome_fantasia as usina,'
      
        '    eu.estoqueid, eu.usinaid as usinaid_EU, eu.produtoid as prod' +
        'utoid_EU, eu.representanteid, eu.estoque'
      ''
      'from'
      ''
      '  compra_usina cu, produto pr, usina u, estoque_usina eu'
      ''
      'where'
      '  '
      '  (cu.estoque_usina_id = eu.estoqueid) and '
      '  (cu.usinaid = u.usinaid) and'
      '  (pr.produtoid = eu.produtoid) and'
      '  (eu.usinaid = cu.usinaid) and'
      '  (cu.data_compra between :inicio and :fim)'
      '')
    Left = 48
    Top = 416
    ParamData = <
      item
        Name = 'INICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryCompraUsinaCOMPRAID: TIntegerField
      FieldName = 'COMPRAID'
      Origin = 'COMPRAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCompraUsinaUSINAID: TIntegerField
      FieldName = 'USINAID'
      Origin = 'USINAID'
    end
    object qryCompraUsinaDATA_COMPRA: TDateField
      DisplayLabel = 'Data Compra'
      FieldName = 'DATA_COMPRA'
      Origin = 'DATA_COMPRA'
    end
    object qryCompraUsinaVOLUME_COMPRA: TFMTBCDField
      DisplayLabel = 'Volume '
      FieldName = 'VOLUME_COMPRA'
      Origin = 'VOLUME_COMPRA'
      Precision = 18
      Size = 2
    end
    object qryCompraUsinaVALOR_COMPRA: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_COMPRA'
      Origin = 'VALOR_COMPRA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryCompraUsinaPRODUTOID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCompraUsinaPRODUTO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Produto'
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryCompraUsinaUSINAID_FROMU: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'USINAID_FROMU'
      Origin = 'USINAID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCompraUsinaESTOQUEID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ESTOQUEID'
      Origin = 'ESTOQUEID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCompraUsinaUSINAID_EU: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'USINAID_EU'
      Origin = 'USINAID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCompraUsinaPRODUTOID_EU: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOID_EU'
      Origin = 'PRODUTOID'
      ProviderFlags = []
      ReadOnly = True
    end
    object TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Est. atual Fornecedor'
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryCompraUsinaESTOQUE_USINA_ID: TIntegerField
      FieldName = 'ESTOQUE_USINA_ID'
      Origin = 'ESTOQUE_USINA_ID'
    end
    object qryCompraUsinaUSINA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fornecedor'
      FieldName = 'USINA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryCompraUsinaREPRESENTANTEID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsCompraUsina: TDataSource
    DataSet = qryCompraUsina
    Left = 144
    Top = 416
  end
  object qryEstoqueUsina: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcCompraUsina
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_ESTOQUE_USINA_ID'
    UpdateOptions.UpdateTableName = 'ESTOQUE_USINA'
    UpdateOptions.KeyFields = 'ESTOQUEID'
    UpdateOptions.AutoIncFields = 'ESTOQUEID'
    SQL.Strings = (
      'select * from Estoque_usina')
    Left = 336
    Top = 400
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
    Left = 416
    Top = 408
  end
  object qryMovimento: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcCompraUsina
    UpdateTransaction = tcCompraUsina
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_MOVIMENTO_ESTOQUE_ID'
    UpdateOptions.UpdateTableName = 'MOVIMENTO_ESTOQUE'
    UpdateOptions.KeyFields = 'MOVIMENTOID'
    UpdateOptions.AutoIncFields = 'MOVIMENTOID'
    SQL.Strings = (
      'select * from movimento_estoque')
    Left = 808
    Top = 448
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
    Left = 904
    Top = 448
  end
  object dsRepresentante: TDataSource
    DataSet = qryRepresentante
    Left = 419
    Top = 536
  end
  object qryRepresentante: TFDQuery
    Connection = frmMenu.FDconexao
    UpdateOptions.UpdateTableName = 'REPRESENTANTE'
    SQL.Strings = (
      'select * from representante')
    Left = 323
    Top = 536
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
