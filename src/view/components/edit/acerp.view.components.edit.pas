unit acerp.view.components.edit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.edit, FMX.Objects, FMX.Effects,
  acerp.view.components.interfaces;
type
  TComponentEdit = class(TFrame, iEdits)
    lytContainer: TLayout;
    lblTitulo: TLabel;
    Rectangle1: TRectangle;
    edText: TEdit;
    procedure edTextChange(Sender: TObject);
  private
    FChange: TProc<TObject>;
    { Private declarations }
  public
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
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TComponentEdit }


{ TComponentEdit }

function TComponentEdit.Alinhamento(Value: TAlignLayout): iEdits;
begin
  Result := Self;
  lytContainer.Align := TAlignLayout.None;
  lytContainer.Align := Value;
end;

function TComponentEdit.BackgroundColor(Value: TAlphaColor): iEdits;
begin
  Result := self;
  Rectangle1.Fill.Color := Value;
end;

function TComponentEdit.Build: TFmxObject;
begin
  Result := lytContainer;
end;

function TComponentEdit.Change(Value: TProc<TObject>): iEdits;
begin
  Result := self;
  FChange := Value;
end;

procedure TComponentEdit.edTextChange(Sender: TObject);
begin
  if Assigned(FChange) then
    FChange(Sender);

end;

function TComponentEdit.Enable(Value: Boolean): iEdits;
begin
  Result := self;
  Rectangle1.Fill.Color := $FFE3E3E3;
  edText.Enabled := Value;
end;

function TComponentEdit.FontColor(Value: TAlphaColor): iEdits;
begin
  Result := self;
  edText.TextSettings.FontColor := Value;
end;

function TComponentEdit.FontColorTitulo(Value: TAlphaColor): iEdits;
begin
  Result := self;
  lblTitulo.TextSettings.FontColor := Value;
end;

function TComponentEdit.HorzText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edText.TextSettings.HorzAlign := Value;
end;

function TComponentEdit.Image(Value: String): iEdits;
begin
  Result := self;
end;

function TComponentEdit.ImageColor(Value: TAlphaColor): iEdits;
begin
  Result := self;
end;

function TComponentEdit.Largura(Value: Integer): iEdits;
begin
  Result := Self;
  lytContainer.Width := Value;
end;

function TComponentEdit.Margem(Value: TEditMargins): iEdits;
begin
  Result := self;
  lytContainer.Margins.Left := Value.Left;
  lytContainer.Margins.Right := Value.Right;
  lytContainer.Margins.Bottom := Value.Bottom;
  lytContainer.Margins.Top := Value.Top;
end;

class function TComponentEdit.New(AOwner: TComponent): iEdits;
begin
  Result := TComponentEdit.Create(AOwner);
end;

function TComponentEdit.Nome(Value: String): iEdits;
begin
  Result := self;
  Self.Name := Value;
end;

function TComponentEdit.Password(Value: Boolean): iEdits;
begin
  Result := self;
end;

function TComponentEdit.PlaceHolder(Value: String): iEdits;
begin
  Result := Self;
  edText.TextPrompt := Value;
end;

function TComponentEdit.Text(Value: String): iEdits;
begin
  Result := self;
  edText.Text := Value;
end;

function TComponentEdit.Titulo(Value: String): iEdits;
begin
  Result := self;
  lblTitulo.Text := Value;
end;

function TComponentEdit.VertText(Value: TTextAlign): iEdits;
begin
  Result := Self;
  edText.TextSettings.VertAlign := Value;
end;

end.
