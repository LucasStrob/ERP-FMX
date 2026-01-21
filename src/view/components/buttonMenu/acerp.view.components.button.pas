unit acerp.view.components.button;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, System.Generics.Collections, acerp.services.utils;

type
  TComponentButton = class(TFrame)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    lytImageInfo: TLayout;
    lytImageMenu: TLayout;
    ImageInfo: TImage;
    ImageMenu: TImage;
    lytDescricao: TLayout;
    lblDescricao: TLabel;
    lytSubMenu: TLayout;
    lytButton: TLayout;
    fotoPerfil: TCircle;
    procedure lytButtonResized(Sender: TObject);
    procedure lytButtonClick(Sender: TObject);
  private
    FHeight: Single;
    FComposite: Boolean;
    FProc: TProc<TObject>;
    procedure StyleMenu;
    procedure ChamaSubMenu(Sender: TObject);
    constructor Create(AOwner: TComponent); override;
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentButton;
    function Nome(Value: string): TComponentButton;
    function CompositeButton: TComponentButton;
    function SingleButton: TComponentButton;
    function Perfil(Value: String): TComponentButton;
    function Descricao(Value: String): TComponentButton;
    function ColorDefault(Value: TAlphaColor): TComponentButton;
    function Alinhamento(Value: TAlignLayout): TComponentButton;
    function Image(Value: String): TComponentButton;
    function Component: TFMXObject;
    function SubMenu(Value: TObjectList<TFMXObject>): TComponentButton;
    function Click(Value: TProc<TObject>): TComponentButton;
    { Public declarations }
  end;

implementation

{$R *.fmx}


{ TComponentButtonMenu }

function TComponentButton.Alinhamento(Value: TAlignLayout): TComponentButton;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.Bottom;
  lytContainer.Align := Value;

end;

procedure TComponentButton.ChamaSubMenu(Sender: TObject);
begin
  if not FComposite then
  begin
    Layout1.Padding.Right := 0;
    if Assigned(FProc) then
      FProc(Sender);
    exit;
  end;

  lytSubMenu.Visible := not lytSubMenu.Visible;

  if not lytSubMenu.Visible then
  begin
    lytContainer.AnimateFloat('Height', 80,  0.2, TAnimationType.&In,
      TInterpolationType.Linear);
    ImageMenu.AnimateFloat('rotationAngle',  0, 0.2,TAnimationType.&In,
      TInterpolationType.Linear);

    Exit;
  end;

  lytContainer.AnimateFloat('Height', lytContainer.Height+FHeight,  0.2, TAnimationType.&In,
    TInterpolationType.Linear);
  ImageMenu.AnimateFloat('rotationAngle',  180, 0.2,TAnimationType.&In,
    TInterpolationType.Linear);

end;

function TComponentButton.Click(Value: TProc<TObject>): TComponentButton;
begin
  Result := Self;
  FProc := Value;
end;

function TComponentButton.ColorDefault(Value: TAlphaColor): TComponentButton;
begin
  Result := Self;
  TUtils.ImageColor(ImageInfo,Value);
  TUtils.ImageColor(ImageMenu,Value);
  lblDescricao.TextSettings.FontColor := Value;
end;

function TComponentButton.Component: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentButton.CompositeButton: TComponentButton;
begin
  Result := Self;
  FComposite := True;
end;

constructor TComponentButton.Create(AOwner: TComponent);
begin
  inherited;
  lytContainer.Height := 80;
  TUtils.ResourceImage('setabaixo', ImageMenu);

end;

function TComponentButton.Descricao(Value: String): TComponentButton;
begin
  Result := Self;
  lblDescricao.Text := Value;
end;

function TComponentButton.Image(Value: String): TComponentButton;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageInfo);
end;

procedure TComponentButton.lytButtonClick(Sender: TObject);
begin
  ChamaSubMenu(Sender);
end;

procedure TComponentButton.lytButtonResized(Sender: TObject);
begin
  StyleMenu;
end;

class function TComponentButton.New(AOwner: TComponent): TComponentButton;
begin
  Result := Self.Create(AOwner);
end;

function TComponentButton.Nome(Value: string): TComponentButton;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentButton.Perfil(Value: String): TComponentButton;
begin
  Result := Self;
  TUtils.ResourceImage(Value, fotoPerfil);
  fotoPerfil.Visible := True;
  Layout1.Padding.Left := 10;
end;

function TComponentButton.SingleButton: TComponentButton;
begin
  Result := Self;
  FComposite := false;
end;

procedure TComponentButton.StyleMenu;
begin
  lytImageMenu.Visible := False;
  if not (lytContainer.Width > 80) then
  begin
    lytImageMenu.Visible := False;
    exit;
  end;

  if FComposite then
    lytImageMenu.Visible := True;
end;

function TComponentButton.SubMenu(Value: TObjectList<TFMXObject>): TComponentButton;
begin
  Result := Self;
  for var i in Value do
  begin
    FHeight := FHeight + TLayout(i).Height;
    lytSubMenu.AddObject(i);
  end;
end;

end.
