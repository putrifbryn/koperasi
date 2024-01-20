unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2, Unit5, Unit7, Unit8, Unit9, Unit10, Unit12, Unit14;

{$R *.dfm}

procedure TForm3.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form3.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
form3.Hide;
form5.Show;

form5.edit1.clear;
form5.edit2.clear;
end;

procedure TForm3.Image8Click(Sender: TObject);
begin
form3.Hide;
form2.Show;

form2.Edit1.SetFocus;
end;

procedure TForm3.Image4Click(Sender: TObject);
begin
if label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form9.Image10.Visible := true;

    form3.Hide;
    form9.Show;

    form9.Edit1.SetFocus;
  end
else
  begin
    form3.Hide;
    form9.Show;

    form9.Edit1.SetFocus;
  end;
end;

procedure TForm3.Image9Click(Sender: TObject);
begin
form3.Hide;
form7.show;

form7.edit1.setfocus;
end;

procedure TForm3.Image5Click(Sender: TObject);
begin
form3.Hide;
form12.show;

if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  form12.Image10.Visible := true
end;

procedure TForm3.Image10Click(Sender: TObject);
begin
form3.Hide;
form8.show;

form8.edit1.setfocus;
end;

procedure TForm3.Image7Click(Sender: TObject);
begin
form3.Hide;
form10.show;

form10.edit1.setfocus;

if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form10.dbgrid1.Visible := false;
    form10.dbgrid2.Visible := true;
    form10.Edit3.Visible := false;
    form10.ComboBox1.Visible := true;
  end;
end;

procedure TForm3.Image6Click(Sender: TObject);
begin
form3.Hide;
form14.show;

if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form14.image8.Visible := true;
  end;
end;

end.
