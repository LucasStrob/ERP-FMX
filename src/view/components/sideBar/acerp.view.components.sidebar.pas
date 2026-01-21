unit acerp.view.components.sidebar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, Router4D;

type
  TComponentSideBar = class(TFrame)
    lytContainer: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Line2: TLine;
    lytProfile: TLayout;
    lytMenu: TLayout;
    Rectangle1: TRectangle;
  private
    procedure ConstruirMenu;
    procedure ConstruirPerfil;
    { Private declarations }
  public
    class function New(AOwner: TComponent): TComponentSideBar;
    function Component: TFMXObject;
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses acerp.view.components.button, System.Generics.Collections;

{ TFrame1 }

function TComponentSideBar.Component: TFMXObject;
begin

  ConstruirMenu;
  ConstruirPerfil;
  Result := lytContainer;
end;

procedure TComponentSideBar.ConstruirMenu;
begin
  var lListaBotoes := TObjectList<TFMXObject>.Create;

  lListaBotoes.Add(
    TComponentButton.New(self)
    .Nome('Pessoas')
    .SingleButton
    .Descricao('Pessoas')
    .Image('pessoas')
    .ColorDefault($FFFFFFFF)
    .Click(procedure (Sender: TObject)
    begin
      TRouter4D.Link.&To('Pessoas')
    end)
    .Component
    );

  lytMenu.AddObject(
    TComponentButton.New(Self)
    .Nome('cadastros')
    .CompositeButton
    .SubMenu(lListaBotoes)
    .Descricao('Cadastros')
    .Image('cadastros')
    .ColorDefault($FFFFFFFF)
    .Alinhamento(TAlignLayout.Top)
    .Component);


  lytMenu.AddObject(
    TComponentButton.New(Self)
    .Nome('dashboard')
    .SingleButton
    .Descricao('Dashboard')
    .Image('banco')
    .ColorDefault($FFFFFFFF)
    .Click(procedure(Sender: TObject)
    begin
      TRouter4D.Link.&To('Home')
    end
    )
    .Alinhamento(TAlignLayout.Top)
    .Component);

end;

procedure TComponentSideBar.ConstruirPerfil;
begin
  lytProfile.AddObject(
    TComponentButton.New(Self)
      .Nome('perfil')
      .Perfil('lucas')
      .Descricao('Lucas Strob')
      .ColorDefault($FFFFFFFF)
      .Component
  );
end;

class function TComponentSideBar.New(AOwner: TComponent): TComponentSideBar;
begin
  Result := Self.Create(AOwner);
end;

end.
