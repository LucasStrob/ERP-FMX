unit acerp.view.components.sidebar2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts;

type
  TComponentSideBar2 = class(TForm)
    Layout1: TLayout;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentSideBar2;
    function Component: TFMXObject;
    { Public declarations }
  end;

var
  ComponentSideBar2: TComponentSideBar2;

implementation

{$R *.fmx}

uses acerp.view.components.buttonmenu;

function TComponentSideBar2.Component: TFMXObject;
begin
  Result := Layout1;
end;

procedure TComponentSideBar2.FormCreate(Sender: TObject);
begin
  layout1.AddObject(TComponentButtonMenu.New(Self).Component)
end;

class function TComponentSideBar2.New(AOwner: TComponent): TComponentSideBar2;
begin
  Result := Self.Create(AOwner);
end;

end.
