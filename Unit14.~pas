unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DB, Grids, DBGrids, ADODB;

type
  TForm14 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Edit4: TEdit;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Edit5: TEdit;
    Edit6: TEdit;
    Image8: TImage;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses Unit3, Unit8, Unit19, Unit5;

{$R *.dfm}

procedure TForm14.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form14.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm14.Image2Click(Sender: TObject);
begin
form14.Hide;
form3.show;
end;

procedure TForm14.Image5Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_siswa', uppercase(edit4.Text), [lopartialkey]) then
  begin
    DBGrid1.Refresh;
    label1.Caption := ADOTable1['no_transaksi'];
    edit1.Text := ADOTable1['nama_siswa'];
    edit2.Text := ADOTable1['nis'];
    edit3.Text := ADOTable1['jenis_transaksi'];
    edit5.Text := ADOTable1['nominal'];
    edit6.Text := ADOTable1['saldo_akhir'];

    showmessage('Data ditemukan!');
  end
else
  begin
    showmessage('Data tidak ditemukan!');
  end;
end;

procedure TForm14.Image6Click(Sender: TObject);
begin
if (edit1.Text = '') or (edit2.Text = '') or (edit5.Text = '') or (edit6.Text = '') then
  begin
    MessageDlg('Semua input harus diisi!', mtError, [mbOK], 0);
  end
else
  begin
    ADOTable1.Edit;
    ADOTable1['no_transaksi'] := label1.Caption;
    ADOTable1['nama_siswa'] := edit1.Text;
    ADOTable1['nis'] := edit2.Text;
    ADOTable1['jenis_transaksi'] := edit3.Text;
    ADOTable1['nominal'] := edit5.Text;
    ADOTable1['saldo_akhir'] := edit6.Text;
    ADOTable1.Post;
    DBGrid1.Refresh;
  end;
  
label1.Caption := '...';
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;
end;

procedure TForm14.Image7Click(Sender: TObject);
begin
label1.Caption := '...';
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;
end;

procedure TForm14.Image8Click(Sender: TObject);
begin
form14.Hide;
form8.show;
end;

procedure TForm14.Image4Click(Sender: TObject);
begin
form14.Hide;
quickreport19.preview;
end;

procedure TForm14.DBGrid1CellClick(Column: TColumn);
begin
label1.caption := ADOTable1['no_transaksi'];
edit1.Text := ADOTable1['nama_siswa'];
edit2.Text := ADOTable1['nis'];
edit3.Text := ADOTable1['jenis_transaksi'];
edit5.Text := ADOTable1['nominal'];
edit6.Text := ADOTable1['saldo_akhir'];
end;

end.
