unit acerp.view.pages.tables;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Router4D.Interfaces,
  acerp.view.components.extendedTable;

type
  TPageTables = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
  private
    { Private declarations }
  public
    function Render: TFMXObject;
    procedure UnRender;
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TPageTables }

function TPageTables.Render: TFMXObject;
begin
  lytContainer.AddObject(
    TComponentExtendedTable.New(Self)
      .ColorTitulo($FFb6cfce)
      .Build);
  Result := lytContainer;
end;

procedure TPageTables.UnRender;
begin

end;

end.
