unit acerp.view.pages.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects,Router4D.Interfaces,
  acerp.view.components.editImage, acerp.services.utils, acerp.view.components.interfaces, Router4D;

type
  TPageLogin = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    Layout7: TLayout;
    Label3: TLabel;
    imageRegistrar: TImage;
    Layout8: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    Label5: TLabel;
    Layout14: TLayout;
    imageUsuario: TImage;
    Layout9: TLayout;
    Layout10: TLayout;
    Label4: TLabel;
    Layout11: TLayout;
    imageBloquear: TImage;
    Layout15: TLayout;
    Layout16: TLayout;
    Layout17: TLayout;
    Rectangle3: TRectangle;
    Layout18: TLayout;
    procedure Layout18Click(Sender: TObject);
  private
    procedure MontarEdits;
    { Private declarations }
  public
    function Render: TFMXObject;
    procedure UnRender;
    { Public declarations }
  end;

var
  PageLogin: TPageLogin;

implementation

{$R *.fmx}


{ TPageLogin }

procedure TPageLogin.Layout18Click(Sender: TObject);
begin
  TRouter4D.Link.IndexLink('Layout');
end;

procedure TPageLogin.MontarEdits;
begin
  var lMargem: TEditMargins;
  lMargem.Bottom := 5;
  lMargem.Top := 5;

  Layout7.AddObject(
    TComponentEditImage.New(Self)
      .Nome('bloquear')
      .BackgroundColor($FFFFFFFF)
      .FontColor($FF4b2b8b)
      .Alinhamento(TAlignLayout.Top)
      .Margem(lMargem)
      .Image('bloquear')
      .ImageColor($FFbebcba)
      .Password(True)
      .PlaceHolder('Password')
      .Build);

  Layout7.AddObject(
    TComponentEditImage.New(Self)
      .Nome('usuario')
      .BackgroundColor($FFFFFFFF)
      .FontColor($FF4b2b8b)
      .Alinhamento(TAlignLayout.Top)
      .Margem(lMargem)
      .Image('user')
      .ImageColor($FFbebcba)
      .PlaceHolder('Usuário')
      .Build);

end;

function TPageLogin.Render: TFMXObject;
begin
  TUtils.ResourceImage('user', imageUsuario);
  TUtils.ImageColor(imageUsuario, $FFFFFFFF);
  TUtils.ResourceImage('registrar', imageRegistrar);
  TUtils.ImageColor(imageRegistrar, $FFFFFFFF);
  TUtils.ResourceImage('bloquear', imageBloquear);
  TUtils.ImageColor(imageBloquear, $FFFFFFFF);
  MontarEdits;
  Result := lytContainer;
end;

procedure TPageLogin.UnRender;
begin

end;

end.
