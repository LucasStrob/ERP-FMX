program ACERP;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  acerp.view.router in 'src\view\router\acerp.view.router.pas',
  acerp.view.pages.home in 'src\view\pages\home\acerp.view.pages.home.pas' {PageHome},
  acerp.view.pages.layout in 'src\view\pages\layout\acerp.view.pages.layout.pas' {PageLayout},
  acerp.view.components.button in 'src\view\components\buttonMenu\acerp.view.components.button.pas' {ComponentButton: TFrame},
  acerp.view.components.sidebar in 'src\view\components\sideBar\acerp.view.components.sidebar.pas' {ComponentSideBar: TFrame},
  acerp.services.utils in 'src\services\acerp.services.utils.pas',
  acerp.view.components.card in 'src\view\components\card\acerp.view.components.card.pas' {ComponentCard: TFrame},
  acerp.view.components.cardsgraficos in 'src\view\components\cardsgraficos\acerp.view.components.cardsgraficos.pas' {ComponentCardGraficos: TFrame},
  acerp.services.charts in 'src\services\acerp.services.charts.pas',
  acerp.services.chats.interfaces in 'src\services\acerp.services.chats.interfaces.pas',
  acerp.services.enums in 'src\services\acerp.services.enums.pas',
  acerp.view.pages.pessoas in 'src\view\pages\pessoas\acerp.view.pages.pessoas.pas' {PagePessoas},
  acerp.view.components.edit in 'src\view\components\edit\acerp.view.components.edit.pas' {ComponentEdit: TFrame},
  acerp.view.index in 'src\view\acerp.view.index.pas' {PageIndex},
  acerp.view.components.interfaces in 'src\view\components\acerp.view.components.interfaces.pas',
  acerp.view.pages.login in 'src\view\pages\login\acerp.view.pages.login.pas' {PageLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageIndex, PageIndex);
  Application.Run;
end.
