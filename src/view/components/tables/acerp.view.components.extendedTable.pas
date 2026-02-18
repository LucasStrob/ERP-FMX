unit acerp.view.components.extendedTable;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Effects, FMX.Objects;

type
  TComponentExtendedTable = class(TFrame)
    lytContainer: TLayout;
    RectangleBackground: TRectangle;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    Label1: TLabel;
    lytTable: TLayout;
    VertScrollBox1: TVertScrollBox;
    lytTitulosTable: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentExtendedTable;
    function Nome(Value: String): TComponentExtendedTable;
    function ColorTitulo(Value: TAlphaColor): TComponentExtendedTable;
    function Build: TFMXObject;
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TComponentExtendedTable }

function TComponentExtendedTable.Build: TFMXObject;
begin
  Result := lytContainer;
end;

function TComponentExtendedTable.ColorTitulo(
  Value: TAlphaColor): TComponentExtendedTable;
begin
  Result := Self;
  for var i := 0 to Pred(ComponentCount) do
    if Components[i] is TLabel and (not TLabel(Components[i]).Text.Equals('Simple Example')) then
      TLabel(Components[i]).TextSettings.FontColor := Value;

end;

class function TComponentExtendedTable.New(
  AOwner: TComponent): TComponentExtendedTable;
begin
  Result := Self.Create(AOwner);
end;

function TComponentExtendedTable.Nome(Value: String): TComponentExtendedTable;
begin
  Result := self;
  self.Name := Value;
end;

end.
