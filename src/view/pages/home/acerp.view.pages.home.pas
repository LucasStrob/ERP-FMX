unit acerp.view.pages.home;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Router4D.Interfaces, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TPageHome = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    Layout1: TLayout;
    lytCards: TLayout;
    lytCardLeft: TLayout;
    lytCardRight: TLayout;
    lytGraficos: TLayout;
    procedure lytCardsResize(Sender: TObject);
    procedure lytCardLeftResize(Sender: TObject);
    procedure lytCardRightResize(Sender: TObject);
  private
    procedure CarregaCards;
    procedure CarregaGraficos;
    procedure ResponsiveLayout(Value: TLayout; Count: Integer);
    { Private declarations }
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

var
  PageHome: TPageHome;

implementation

{$R *.fmx}

uses acerp.view.components.card, acerp.view.components.cardsgraficos,
  acerp.services.enums;

{ TPageHome }

procedure TPageHome.CarregaCards;
begin


  lytCardRight.AddObject(
    TComponentCard.New(Self)
      .Nome('errors')
      .Titulo('Erros')
      .SubTitulo('23')
      .imagemTitulo('erro', $FFE10101)
      .ImagemDescricao('cronometro')
      .Descricao('Última hora')
      .Alinhamento(TAlignLayout.Left)
    .Build);

  lytCardRight.AddObject(
    TComponentCard.New(Self)
      .Nome('followers')
      .Titulo('Seguidores')
      .SubTitulo('+45K')
      .imagemTitulo('seguidores', $FF00B3A0)
      .ImagemDescricao('atualizar')
      .Descricao('Atualizar agora')
      .Alinhamento(TAlignLayout.Left)
    .Build);

  lytCardLeft.AddObject(
    TComponentCard.New(Self)
      .Nome('capacity')
      .Titulo('Capacidade')
      .SubTitulo('150GB')
      .imagemTitulo('globo')
      .ImagemDescricao('atualizar')
      .Descricao('Atualizar agora')
      .Alinhamento(TAlignLayout.Left)
    .Build);

  lytCardLeft.AddObject(
    TComponentCard.New(Self)
      .Nome('revenue')
      .Titulo('Saldo')
      .SubTitulo('R$ 30.560,00')
      .imagemTitulo('dinheiro',$FF0CB830)
      .ImagemDescricao('calendario')
      .Descricao('Último dia')
      .Alinhamento(TAlignLayout.Left)
    .Build);
end;

procedure TPageHome.CarregaGraficos;
begin
  lytGraficos.AddObject(
    TComponentCardGraficos.New(Self)
      .Nome('financial')
      .TituloInfo('+18')
      .TituloDescricao('R$34,657')
      .TituloGrafico('TOTAL SEI LA')
      .DescricaoRodape('Finanças Estátisticas')
      .imagemRodape('mais', $FFFFFFFF)
      .Alinhamento(TAlignLayout.Left)
      .TipoGrafico(TChartType.Lines)
    .Build);
end;

procedure TPageHome.lytCardLeftResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardLeft,2);
end;

procedure TPageHome.lytCardRightResize(Sender: TObject);
begin
  ResponsiveLayout(lytCardRight,2);
end;

procedure TPageHome.lytCardsResize(Sender: TObject);
begin
  lytCardLeft.Width := Round((lytContainer.Width - 40)/2)
end;

function TPageHome.Render: TFMXObject;
begin
  CarregaCards;
  CarregaGraficos;
  Result := lytContainer;
end;

procedure TPageHome.ResponsiveLayout(Value: TLayout; Count: Integer);
begin
  for var i := 0 to Pred(Value.ChildrenCount) do
    if Value.Children.Items[i] is TLayout then
      TLayout(Value.Children.Items[i]).Width :=
        Round(Value.Width / 2);
end;

procedure TPageHome.UnRender;
begin

end;

end.
