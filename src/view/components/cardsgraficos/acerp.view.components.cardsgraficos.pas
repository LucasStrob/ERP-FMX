unit acerp.view.components.cardsgraficos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  acerp.services.enums,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Effects;

type
  TComponentCardGraficos = class(TFrame)
    lytContainer: TLayout;
    RectangleBackgroud: TRectangle;
    lytTitulos: TLayout;
    lytRodape: TLayout;
    lytGraficosEmbed: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    lblInfo: TLabel;
    lblTitulo: TLabel;
    Line1: TLine;
    Layout3: TLayout;
    Circle1: TCircle;
    imageRodape: TImage;
    lytRodapeTitulo: TLayout;
    lblTituloRodape: TLabel;
    lytTituloGrafico: TLayout;
    lblTituloGrafico: TLabel;
    ShadowEffect1: TShadowEffect;
    lytGraficos: TLayout;
  private
    FTituloGrafico: String;
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentCardGraficos;
    function Nome(Avalue: String): TComponentCardGraficos;
    function TituloInfo(Avalue: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function TituloDescricao(AValue: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function DescricaoRodape(AValue: String; Color: TAlphaColor = $FF6BD098): TComponentCardGraficos;
    function ImagemRodape(AValue: String; Color: TAlphaColor = $FFFFFFFF): TComponentCardGraficos;
    function TituloGrafico(AValue: String; Color: TAlphaColor = $FF000000): TComponentCardGraficos;
    function TipoGrafico(Value: TChartType): TComponentCardGraficos;
    function Alinhamento(AValue: TAlignLayout): TComponentCardGraficos;
    function Build: TFMXObject;


    { Public declarations }
  end;

implementation

{$R *.fmx}

uses acerp.services.utils, acerp.services.charts;

{ TComponentCardGraficos }

function TComponentCardGraficos.Alinhamento(
  AValue: TAlignLayout): TComponentCardGraficos;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := AValue;
end;

function TComponentCardGraficos.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentCardGraficos.DescricaoRodape(AValue: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTituloRodape.Text := AValue;
  lblTituloRodape.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos.ImagemRodape(AValue: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  TUtils.ResourceImage(AValue,ImageRodape);
  TUtils.ImageColor(ImageRodape,Color);

end;

class function TComponentCardGraficos.New(
  AOwner: TComponent): TComponentCardGraficos;
begin
  Result := Self.Create(AOwner);
end;

function TComponentCardGraficos.Nome(Avalue: String): TComponentCardGraficos;
begin
  Result := Self;
  Self.Name := AValue;
end;

function TComponentCardGraficos.TipoGrafico(
  Value: TChartType): TComponentCardGraficos;
begin
  var lJson := '[{"field":"Jan", "value":520}, {"field":"Fev", "value":400}, {"field":"Mar", "value":840}, {"field":"Abr", "value":200}, {"field":"Mai", "value":997}, {"field":"Jun", "value":1270}]';
  Result := Self;
  case Value of
    Pie: ;
    Donuts: ;
    Lines: TCharts.New(lytGraficos)
            .LoadFromJSON(lJson)
            .ChartType(Value)
            .TextStyle([TFontStyle.fsBold])
            .TextFontSize(12)
            .TextOffset(0.1)
            .FormatValues('##,#0')
            .ShowPercent(True)
            .ShowValues(True)
            .ShowHint(True)
            .FullHint(True)
            .Animate(True)
            .AnimationDuration(0.8)
            .SetColor([TAlphaColors.Green],[TAlphaColors.Black])
            .ColorLinePoint(TAlphaColors.Black)
            .LineTickness(3)
            .LinePointDiameter(8)
            .Gerar;
    Bars: ;
  end;
end;

function TComponentCardGraficos.TituloDescricao(AValue: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTitulo.Text := AValue;
  lblTitulo.TextSettings.FontColor := Color;
end;

function TComponentCardGraficos.TituloGrafico(AValue: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblTituloGrafico.Text := AValue;
  lblTituloGrafico.TextSettings.FontColor := Color;
  lytTituloGrafico.Visible := true;

end;

function TComponentCardGraficos.TituloInfo(Avalue: String;
  Color: TAlphaColor): TComponentCardGraficos;
begin
  Result := Self;
  lblInfo.Text := AValue;
  lblInfo.TextSettings.FontColor := Color;

end;

end.
