unit acerp.view.pages.pessoas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Router4D.Interfaces,Router4D, FMX.Objects, FMX.Controls.Presentation,
  acerp.view.components.edit,
  FMX.StdCtrls,acerp.services.chats.interfaces, FMX.Effects;

type
  TPagePessoas = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout4: TLayout;
    Label1: TLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    ShadowEffect1: TShadowEffect;
  private
    procedure CriaEdits;
    { Private declarations }
  public
    function Render: TFMXObject;
    procedure UnRender;
    { Public declarations }
  end;

var
  PagePessoas: TPagePessoas;

implementation

{$R *.fmx}

uses acerp.view.components.interfaces;


procedure TPagePessoas.CriaEdits;
begin
  var LMargem: TEditMargins;
  LMargem.Right := 10;

  Layout5.AddObject(
    TComponentEdit.New(Self)
    .Nome('username')
    .Titulo('User Name')
    .Alinhamento(TAlignLayout.Left)
    .Largura(300)
    .Margem(LMargem)
    .PlaceHolder('User Name')
    .BackgroundColor($FFFFFFFF)
    .Build);

  Layout5.AddObject(
    TComponentEdit.New(Self)
    .Nome('Company')
    .Enable(False)
    .Titulo('Company')
    .Alinhamento(TAlignLayout.Left)
    .Largura(300)
    .Margem(LMargem)
    .PlaceHolder('Company')
    .BackgroundColor($FFFFFFFF)
    .Build);

  Layout5.AddObject(
    TComponentEdit.New(Self)
    .Nome('email')
    .Enable(False)
    .Titulo('Email adrres')
    .Alinhamento(TAlignLayout.Left)
    .Largura(300)
    .Margem(LMargem)
    .PlaceHolder('Email')
    .BackgroundColor($FFFFFFFF)
    .Build);

  Layout9.AddObject(
    TComponentEdit.New(Self)
    .Nome('first')
    .Titulo('First Name')
    .Alinhamento(TAlignLayout.Left)
    .Largura(460)
    .Margem(LMargem)
    .PlaceHolder('First Name')
    .Build);

  Layout9.AddObject(
    TComponentEdit.New(Self)
    .Nome('last')
    .Titulo('Last Name')
    .Alinhamento(TAlignLayout.Left)
    .Largura(460)
    .Margem(LMargem)
    .PlaceHolder('Last Name')
    .Build);

  Layout8.AddObject(
    TComponentEdit.New(Self)
    .Nome('adress')
    .Titulo('Adress')
    .Alinhamento(TAlignLayout.Left)
    .Largura(920)
    .Margem(LMargem)
    .PlaceHolder('Adress')
    .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
    .Nome('city')
    .Titulo('City')
    .Alinhamento(TAlignLayout.Left)
    .Largura(300)
    .Margem(LMargem)
    .PlaceHolder('City')
    .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
    .Nome('country')
    .Titulo('Country')
    .Alinhamento(TAlignLayout.Left)
    .Largura(300)
    .Margem(LMargem)
    .PlaceHolder('Contry')
    .Build);

  Layout7.AddObject(
    TComponentEdit.New(Self)
    .Nome('postal')
    .Titulo('Postal Code')
    .Alinhamento(TAlignLayout.Left)
    .Largura(300)
    .Margem(LMargem)
    .PlaceHolder('Postal Code')
    .Build);

  Layout6.AddObject(
    TComponentEdit.New(Self)
    .Nome('about')
    .Titulo('About Me')
    .Alinhamento(TAlignLayout.Left)
    .Largura(920)
    .Margem(LMargem)
    .VertText(TTextAlign.Leading)
    .PlaceHolder('Tell me a little about you...')
    .Build);


end;

{ TForm1 }

function TPagePessoas.Render: TFMXObject;
begin
  CriaEdits;
  Result := lytContainer;
end;

procedure TPagePessoas.UnRender;
begin

end;

end.
