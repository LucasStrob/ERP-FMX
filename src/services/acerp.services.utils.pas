unit acerp.services.utils;

interface

uses
  FMX.Objects,
  system.Classes,
  system.Types, system.UITypes,
  FMX.Types,
  System.SysUtils;

type
  TUtils = class
  private
  public
    class procedure ResourceImage(Resource: String; Image: TImage); overload;
    class procedure ResourceImage(Resource: String; Image: TFMXObject);
      overload;
    class function UpperCameCase(Value: String): String;
    class procedure ImageColor(Image: TImage; Color: TAlphaColor);
  end;

implementation

{ TUtils }

class procedure TUtils.ResourceImage(Resource: String; Image: TImage);
begin
  var
  lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    Image.BitMap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class procedure TUtils.ImageColor(Image: TImage; Color: TAlphaColor);
begin
  Image.Bitmap.ReplaceOpaqueColor(Color);
end;

class procedure TUtils.ResourceImage(Resource: String; Image: TFMXObject);
begin
  var
  lResource := TResourceStream.Create(HInstance, Resource, RT_RCDATA);
  try
    TShape(Image).Fill.Bitmap.BitMap.LoadFromStream(lResource);
  finally
    lResource.Free;
  end;
end;

class function TUtils.UpperCameCase(Value: String): String;
begin
  Result := UpperCase(Copy(vALUE,1,1)) +
    LowerCase(Copy(Value,2, Length(Value)));
end;

end.
