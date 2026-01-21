unit acerp.view.components.card;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, FMX.Effects;

type
  TComponentCard = class(TFrame)
    lytContainer: TLayout;
    Rectangle1: TRectangle;
    lytTitulo: TLayout;
    lytRodape: TLayout;
    Line1: TLine;
    Layout1: TLayout;
    imageRodape: TImage;
    Layout2: TLayout;
    lblDescricaoRodape: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    imageTitulo: TImage;
    Layout5: TLayout;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    ShadowEffect1: TShadowEffect;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentCard;
    function Nome(Value: String): TComponentCard;
    function Titulo(Value: String; Color:TAlphaColor = $FF9B9EA2): TComponentCard;
    function SubTitulo(Value: String; Color:TAlphaColor = $FF9B9EA2): TComponentCard;
    function ImagemTitulo(Value: String; Color: TAlphaColor = $FFfbc658): TComponentCard;
    function Descricao(Value: String; Color:TAlphaColor = $FF9B9EA2): TComponentCard;
    function ImagemDescricao(Value: String; Color: TAlphaColor = $FF66615b): TComponentCard;
    function Alinhamento(Value: TAlignLayout): TComponentCard;
    function Marge(Bottom, Left, Right, Top: Single): TComponentCard;
    function Build: TFMXObject;
    { Public declarations }
  end;

implementation

// FONT COLOR: #FF9B9EA2


uses acerp.services.utils;
{$R *.fmx}

{ TComponentCard }

function TComponentCard.Alinhamento(Value: TAlignLayout): TComponentCard;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentCard.Build: TFMXObject;
begin
  Result :=  lytContainer;
end;

function TComponentCard.Descricao(Value: String;
  Color:TAlphaColor = $FF9B9EA2): TComponentCard;
begin
  Result := Self;
  lblDescricaoRodape.Text := Value;
  lblDescricaoRodape.TextSettings.FontColor := Color;
end;

function TComponentCard.ImagemDescricao(Value: String;
  Color: TAlphaColor = $FF66615b): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, imageRodape);
  TUtils.ImageColor(imageRodape, Color);
end;

function TComponentCard.ImagemTitulo(Value: String; Color: TAlphaColor = $FFfbc658): TComponentCard;
begin
  Result := Self;
  TUtils.ResourceImage(Value, imageTitulo);
  TUtils.ImageColor(imageTitulo, Color);
end;

function TComponentCard.Marge(Bottom, Left, Right, Top: Single): TComponentCard;
begin
  Result := Self;
  lytContainer.Margins.Bottom := Bottom;
  lytContainer.Margins.Left := Left;
  lytContainer.Margins.Right := Right;
  lytContainer.Margins.Top := Top;
end;

class function TComponentCard.New(AOwner: TComponent): TComponentCard;
begin
  Result := Self.Create(AOwner);
end;

function TComponentCard.Nome(Value: String): TComponentCard;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentCard.SubTitulo(Value: String; Color:TAlphaColor = $FF9B9EA2): TComponentCard;
begin
  Result := Self;
  lblSubTitulo.Text := Value;
  lblSubTitulo.TextSettings.FontColor := Color;
end;

function TComponentCard.Titulo(Value: String; Color:TAlphaColor = $FF9B9EA2): TComponentCard;
begin
  Result := Self;
  lblTitulo.Text := Value;
  lblTitulo.TextSettings.FontColor := Color;
end;

end.
