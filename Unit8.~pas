unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, jpeg, ExtCtrls, Grids, DBGrids;

type
  TForm8 = class(TForm)
    Image1: TImage;
    ADOTable1: TADOTable;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
    Image2: TImage;
    Image3: TImage;
    Label2: TLabel;
    Image4: TImage;
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    ADOQuery1: TADOQuery;
    Image5: TImage;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit3, Unit14, Unit15, Unit5;

{$R *.dfm}

procedure TForm8.FormCreate(Sender: TObject);
begin
combobox1.Items.Add('Ambil');
combobox1.Items.Add('Simpan');
end;

procedure TForm8.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form8.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm8.Image2Click(Sender: TObject);
begin
if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form8.Hide;
    form14.show;
    form14.Image8.Visible := true;
  end
else
  begin
    form8.Hide;
    form3.show;
  end;
end;

procedure TForm8.Image4Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;

combobox1.Text := 'Pilih salah satu';
label2.Caption := '...';
end;

procedure TForm8.ComboBox1Change(Sender: TObject);
begin
if ADOTable1.Locate('nis', uppercase(edit2.Text), [lopartialkey]) then
  begin
    DBGrid1.Refresh;
    label2.Caption := ADOTable1['saldo'];
  end
else
  begin
    label2.Caption := '0';
  end;
end;

procedure TForm8.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  totalBaris: integer;
  kode: string;
begin
if key = #13 then
  begin
    if combobox1.Text = 'Ambil' then
      begin
        if strtoint(edit3.Text) > strtoint(label2.Caption) then
          begin
            MessageDlg('Saldo anda tidak cukup untuk melakukan transaksi ini!', mtError, [mbOK], 0);

            edit3.Clear;
            edit3.SetFocus;
          end
        else
          begin
            showmessage('Transaksi yang anda lakukan berhasil, silahkan mencetak struk!');
            label2.Caption := inttostr(strtoint(label2.Caption) - strtoint(edit3.Text));

            edit3.Enabled := false;
            edit4.Enabled := false;
            edit5.Enabled := false;

            ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS no_transaksi FROM riwayattabungan';
            ADOQuery1.Open;

            totalBaris := ADOQuery1.FieldByName('no_transaksi').AsInteger;
            if totalBaris < 10 then
              begin
                kode := 'TR-' + '00' + inttostr(totalBaris + 1);
                label3.Caption := kode;
              end
            else if totalBaris < 100 then
              begin
                kode := 'TR-' + '0' + inttostr(totalBaris + 1);
                label3.Caption := kode;
              end;

            ADOQuery1.Close;

            if ADOTable1.Locate('nama_siswa', uppercase(edit1.Text), [lopartialkey]) then
              begin
                ADOTable1.Edit;
                ADOTable1['nama_siswa'] := edit1.Text;
                ADOTable1['nis'] := edit2.Text;
                ADOTable1['saldo'] := label2.Caption;
                ADOTable1.Post;

                ADOTable2.Append;
                ADOTable2['no_transaksi'] := label3.Caption;
                ADOTable2['nama_siswa'] := edit1.Text;
                ADOTable2['nis'] := edit2.Text;
                ADOTable2['jenis_transaksi'] := combobox1.Text;
                ADOTable2['nominal'] := edit3.Text;
                ADOTable2['nama_siswa'] := edit1.Text;
                ADOTable2['saldo_akhir'] := label2.caption;
                ADOTable2.Post;

                edit1.Clear;
                edit2.Clear;
                edit3.Clear;
                edit4.Clear;
                edit5.Clear;

                combobox1.Text := 'Pilih salah satu';
                label2.Caption := '...';
              end
          else
            begin
                ADOTable1.Append;;
                ADOTable1['nama_siswa'] := edit1.Text;
                ADOTable1['nis'] := edit2.Text;
                ADOTable1['saldo'] := label2.Caption;
                ADOTable1.Post;

                ADOTable2.Append;
                ADOTable2['no_transaksi'] := label3.Caption;
                ADOTable2['nama_siswa'] := edit1.Text;
                ADOTable2['nis'] := edit2.Text;
                ADOTable2['jenis_transaksi'] := combobox1.Text;
                ADOTable2['nominal'] := edit3.Text;
                ADOTable2['nama_siswa'] := edit1.Text;
                ADOTable2['saldo_akhir'] := label2.caption;
                ADOTable2.Post;

                edit1.Clear;
                edit2.Clear;
                edit3.Clear;
                edit4.Clear;
                edit5.Clear;

                combobox1.Text := 'Pilih salah satu';
                label2.Caption := '...';
            end;
          end;
      end;
  end;
end;

procedure TForm8.Edit4KeyPress(Sender: TObject; var Key: Char);
var
  totalBaris: integer;
  kode: string;
begin
if key = #13 then
  begin
    if strtoint(edit3.Text) > strtoint(edit4.Text) then
      begin
        MessageDlg('Uang yang anda masukkan kurang!', mtError, [mbOK], 0);

        edit4.Clear;
        edit4.SetFocus;
      end
    else
      begin
        showmessage('Transaksi yang anda lakukan berhasil, silahkan mencetak struk!');

        label2.Caption := inttostr(strtoint(label2.Caption) + strtoint(edit3.Text ));
        edit5.Text := inttostr(strtoint(edit4.Text) - strtoint(edit3.Text));
        
        ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS no_transaksi FROM riwayattabungan';
        ADOQuery1.Open;

        totalBaris := ADOQuery1.FieldByName('no_transaksi').AsInteger;
        if totalBaris < 10 then
          begin
            kode := 'TR-' + '00' + inttostr(totalBaris + 1);
            label3.Caption := kode;
          end
        else if totalBaris < 100 then
          begin
            kode := 'TR-' + '0' + inttostr(totalBaris + 1);
            label3.Caption := kode;
          end;

        ADOQuery1.Close;

        if ADOTable1.Locate('nama_siswa', uppercase(edit1.Text), [lopartialkey]) then
          begin
            ADOTable1.Edit;
            ADOTable1['nama_siswa'] := edit1.Text;
            ADOTable1['nis'] := edit2.Text;
            ADOTable1['saldo'] := label2.Caption;
            ADOTable1.Post;
            dbgrid1.Refresh;

            ADOTable2.Append;
            ADOTable2['no_transaksi'] := label3.Caption;
            ADOTable2['nama_siswa'] := edit1.Text;
            ADOTable2['nis'] := edit2.Text;
            ADOTable2['jenis_transaksi'] := combobox1.Text;
            ADOTable2['nominal'] := edit3.Text;
            ADOTable2['nama_siswa'] := edit1.Text;
            ADOTable2['saldo_akhir'] := label2.caption;
            ADOTable2.Post;
            dbgrid2.Refresh;

            edit1.Clear;
            edit2.Clear;
            edit3.Clear;
            edit4.Clear;
            edit5.Clear;

            combobox1.Text := 'Pilih salah satu';
            label2.Caption := '...';
          end
        else
          begin
            ADOTable1.Append;
            ADOTable1['nama_siswa'] := edit1.Text;
            ADOTable1['nis'] := edit2.Text;
            ADOTable1['saldo'] := label2.Caption;
            ADOTable1.Post;
            dbgrid1.Refresh;

            ADOTable2.Append;
            ADOTable2['no_transaksi'] := label3.Caption;
            ADOTable2['nama_siswa'] := edit1.Text;
            ADOTable2['nis'] := edit2.Text;
            ADOTable2['jenis_transaksi'] := combobox1.Text;
            ADOTable2['nominal'] := edit3.Text;
            ADOTable2['nama_siswa'] := edit1.Text;
            ADOTable2['saldo_akhir'] := label2.caption;
            ADOTable2.Post;
            dbgrid2.Refresh;

            edit1.Clear;
            edit2.Clear;
            edit3.Clear;
            edit4.Clear;
            edit5.Clear;

            combobox1.Text := 'Pilih salah satu';
            label2.Caption := '...';
          end;
      end;
  end;
end;

procedure TForm8.Image5Click(Sender: TObject);
begin
form8.Hide;
quickreport15.preview;
end;

end.
