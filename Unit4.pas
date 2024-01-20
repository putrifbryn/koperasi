unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, Menus;

type
  TForm4 = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image5: TImage;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Kembali1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit2, Unit3, Unit1, Unit17;

{$R *.dfm}

procedure TForm4.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  kembali, totalBaris: integer;
  tanggal: TDateTime;
  kode: string;
begin
if key = #13 then
  if strtoint(edit3.Text) >= strtoint(edit1.Text) then
    begin
      kembali := strtoint(edit3.Text) - strtoint(edit1.Text);
      edit2.Text := inttostr(kembali);

      Form2.ADOTable2.First;
      while not Form2.ADOTable2.Eof do
        begin
         if Form2.ADOTable2['nama_barang'] <> '' then
           begin
             Form2.ADOTable2.Delete;
            end
         else
          begin
            Form2.ADOTable2.Next;
           end;

        ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS no_transaksi FROM riwayatpembelian';
        ADOQuery1.Open;

        totalBaris := ADOQuery1.FieldByName('no_transaksi').AsInteger;
        if totalBaris < 10 then
          begin
            kode := 'TR-' + '00' + inttostr(totalBaris + 1);
            label1.Caption := kode;
          end
        else if totalBaris < 100 then
          begin
            kode := 'TR-' + '0' + inttostr(totalBaris + 1);
            label1.Caption := kode;
          end;

        ADOQuery1.Close;

        tanggal := now;

        ADOTable1.Append;
        ADOTable1['no_transaksi'] := label1.Caption;
        ADOTable1['total'] := edit1.Text;
        ADOTable1['tgl_transaksi'] := tanggal;
        ADOTable1.Post;
  end;
    end
  else
    begin
      showmessage('Uang anda kurang');
      edit3.Clear;
      edit3.SetFocus;
    end;
end;

procedure TForm4.Image3Click(Sender: TObject);
begin
form4.Hide;
form2.show;

edit1.Clear;
edit2.Clear;
edit3.Clear;
end;

procedure TForm4.Image4Click(Sender: TObject);
begin
close;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
//dbgrid1.DataSource := form2.DataSource2;
end;

procedure TForm4.Kembali1Click(Sender: TObject);
begin
form4.Hide;
form2.Show;
end;

procedure TForm4.Keluar1Click(Sender: TObject);
begin
form4.Hide;

end;

procedure TForm4.Image5Click(Sender: TObject);
begin
quickreport17.qrlabel9.caption := form4.Edit1.Text;
quickreport17.qrlabel11.caption := form4.Edit3.Text;
quickreport17.qrlabel13.caption := form4.Edit2.Text;
quickreport17.qrlabel14.caption := form4.Label1.Caption;

form4.Hide;
quickreport17.Preview;
end;

end.
