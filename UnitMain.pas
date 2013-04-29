unit UnitMain;

{
CONTACT: WANGXINGHE1983@GMAIL.COM
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormMain = class(TForm)
    BtnOk: TButton;
    BtnReset: TButton;
    EditNumber: TEdit;
    Label1: TLabel;
    lblCommand: TLabel;
    lblHelp: TLabel;
    ListBoxHistory: TListBox;
    procedure BtnResetClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure EditNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function GetResult(tmpNum, num: string): string;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  MyUnit;

var
  num, tmpNum: string;

procedure TFormMain.BtnOkClick(Sender: TObject);
begin
  tmpNum := EditNumber.Text;
  lblCommand.Caption := '结果是:' + GetResult(tmpNum, num);
  Application.ProcessMessages;
  Sleep(1000);
  lblCommand.Caption := '请继续猜...';
  ListBoxHistory.Items.Add(format('数字:%s' + '  -->> ' + '%s', [tmpNum, GetResult(tmpNum, num)]));
  if GetResult(tmpNum, num) = '4A0B' then
  begin
    ListBoxHistory.Items.Add('成功啦，您真厉害!');
    lblCommand.Caption := '成功，您真厉害';
    BtnOk.Enabled := false;
    Application.ProcessMessages;
    Sleep(1000);
    lblCommand.Caption := '';
  end;
  ListBoxHistory.ItemIndex := ListBoxHistory.Items.Count - 1;
  EditNumber.Text := '';
  EditNumber.SetFocus;
end;

procedure TFormMain.BtnResetClick(Sender: TObject);
var
  i: integer;
begin
  Randomize;
  num := '';
  for i := 1 to 4 do
    num := num + IntToStr(random(10));
  if LeftString(num, 1) = '0' then
  begin
    num := RightString(num, 3);
    num := IntToStr(random(9) + 1) + num;
  end;
  lblCommand.Caption := '请猜数字...';
  ListBoxHistory.Items.Clear;
  BtnOk.Enabled := true;
  EditNumber.SetFocus;
end;

procedure TFormMain.EditNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BtnOkClick(Sender);
end;

procedure TFormMain.EditNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9']) then
  begin
    Key := #0;
    exit;
  end;
  if (Length(EditNumber.Text) >= 4) then
  begin
    EditNumber.Text := Key;
    EditNumber.SetFocus;
    EditNumber.Text := Key;
    Key := #0;
  end;
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  lblHelp.Caption := '帮助：' + sLineBreak +
                     'XAYB - X个数字数值和位置均猜对；' + sLineBreak +
                     '     - Y个数字数值猜对但位置不对！';
  BtnResetClick(nil);
end;

function TFormMain.GetResult(tmpNum, num: string): string;
var
  a, b, i, j: integer;
  NewNum: string;
begin
  NewNum := num;
  if (length(tmpNum) <> 4) or (length(NewNum) <> 4) then
  begin
    result := '出错';
    exit;
  end;
  a := 0; b := 0;
  for i := 1 to 4 do
    if tmpNum[i] = NewNum[i] then
    begin
      inc(a);
      tmpNum[i] := '*';
      NewNum[i] := '*';
    end;
  for i := 1 to 4 do
    if tmpNum[i] <> '*' then
      for j := 1 to 4 do
        if (NewNum[j] <> '*') and (tmpNum[i] = NewNum[j]) then
        begin
          inc(b);
          tmpNum[i] := '*';
          NewNum[j] := '*';
          break;
        end;
  result := IntToStr(a) + 'A' + IntToStr(b) + 'B';
end;

end.
