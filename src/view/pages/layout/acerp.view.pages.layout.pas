unit acerp.view.pages.layout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Router4D.Interfaces, FMX.Objects, FMX.Controls.Presentation, FMX.MultiView,
  FMX.StdCtrls,
  Router4D;

type
  TPageLayout = class(TForm, iRouter4DComponent)
    lytContainer: TLayout;
    lytMain: TLayout;
    Layout2: TLayout;
    lytBody: TLayout;
    MultiView1: TMultiView;
    Layout1: TLayout;
    Button1: TButton;
  private
    procedure RenderSideBar;
    { Private declarations }
  public
    { Public declarations }
    function Render: TFMXObject;
    procedure UnRender;
  end;

implementation

{$R *.fmx}

uses acerp.view.components.sidebar, acerp.view.pages.home;

{ TPageLayout }

function TPageLayout.Render: TFMXObject;
begin
  RenderSideBar;
  TRouter4D.Render<TPageHome>.SetElement(lytBody);
  Result := lytContainer;
end;

procedure TPageLayout.RenderSideBar;
begin
  Layout1.AddObject(TComponentSideBar.New(Self).Component);
end;

procedure TPageLayout.UnRender;
begin

end;

end.
