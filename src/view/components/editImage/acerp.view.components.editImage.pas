unit acerp.view.components.editImage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, acerp.view.components.interfaces;

type
  TComponentEditImage = class(TFrame, iEdits)
    lytContainer: TLayout;
    RectangleContainer: TRectangle;
    Layout1: TLayout;
    ImageEdit: TImage;
    Layout2: TLayout;
    RectangleBackground: TRectangle;
    Edit1: TEdit;
  private
    { Private declarations }
    FProc: TProc<TObject>;
  public
    { Public declarations }
    class function New(AOwner: TComponent): iEdits;
    function Nome(Value: String): iEdits;
    function Text(Value: String): iEdits;
    function FontColor(Value: TAlphaColor = $FF000000): iEdits;
    function BackgroundColor(Value: TAlphaColor = $FFFFFFFF): iEdits;
    function Enable(Value: Boolean = false): iEdits;
    function Change(Value: TProc<TObject>): iEdits;
    function Alinhamento(Value: TAlignLayout): iEdits;
    function VertText(Value: TTextAlign): iEdits;
    function HorzText(Value: TTextAlign): iEdits;
    function Largura(Value: Integer): iEdits;
    function Margem(Value: TEditMargins): iEdits;
    function Titulo(Value: String): iEdits;
    function FontColorTitulo(Value: TAlphaColor = $FFE3E3E3): iEdits;
    function PlaceHolder(Value: String): iEdits;
    function Image(Value: String): iEdits;
    function ImageColor(Value: TAlphaColor): iEdits;
    function Password(Value: Boolean): iEdits;
    function Build: TFmxObject;
  end;

implementation

{$R *.fmx}

uses acerp.services.utils;


{ TComponentEditImage }

function TComponentEditImage.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;

end;

function TComponentEditImage.BackgroundColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  RectangleBackground.Fill.Color := Value;
end;

function TComponentEditImage.Build: TFmxObject;
begin
  Result := lytContainer;
end;

function TComponentEditImage.Change(Value: TProc<TObject>): iEdits;
begin
  Result := self;
  FProc := Value;
end;

function TComponentEditImage.Enable(Value: Boolean): iEdits;
begin
  Result := self;
  RectangleContainer.Enabled := Value;
end;

function TComponentEditImage.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := Self;
  Edit1.TextSettings.FontColor := Value;
end;

function TComponentEditImage.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := self;
end;

function TComponentEditImage.HorzText(Value: TTextAlign): iEdits;
begin
  Result := self;
  Edit1.TextSettings.HorzAlign := Value;
end;

function TComponentEditImage.Image(Value: String): iEdits;
begin
  Result := Self;
  TUtils.ResourceImage(Value, ImageEdit);
end;

function TComponentEditImage.ImageColor(Value: TAlphaColor): iEdits;
begin
  Result := self;
  TUtils.ImageColor(ImageEdit, Value);
end;

function TComponentEditImage.Largura(Value: Integer): iEdits;
begin
  Result := self;
end;

function TComponentEditImage.Margem(Value: TEditMargins): iEdits;
begin
  Result := self;
  lytContainer.Margins.Top := Value.Top;
  lytContainer.Margins.Left := Value.Left;
  lytContainer.Margins.Right := Value.Right;
  lytContainer.Margins.Bottom := Value.Bottom;
end;

class function TComponentEditImage.New(AOwner: TComponent): iEdits;
begin
  Result := TComponentEditImage.Create(AOwner);
end;

function TComponentEditImage.Nome(Value: String): iEdits;
begin
  Result := Self;
  Self.Name := Value;
end;

function TComponentEditImage.Password(Value: Boolean): iEdits;
begin
  Result := Self;
  Edit1.Password := Value;
end;

function TComponentEditImage.PlaceHolder(Value: String): iEdits;
begin
  Result := Self;
  Edit1.TextPrompt := Value;
end;

function TComponentEditImage.Text(Value: String): iEdits;
begin
  Result := Self;
  Edit1.Text := Value;
end;

function TComponentEditImage.Titulo(Value: String): iEdits;
begin
  Result := Self;
end;

function TComponentEditImage.VertText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  Edit1.TextSettings.VertAlign := Value;
end;

end.
