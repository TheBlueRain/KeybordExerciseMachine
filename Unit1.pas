unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    StringGrid1: TStringGrid;
    Button3: TButton;
    Label12: TLabel;
    Image1: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ListBox1: TListBox;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   end;
type TPoint=record
  X:Longint;
  Y:Longint;
end;

const alfp='ЁАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ!"№;%:?*()_+/,';
      alfs='ёабвгдежзийклмнопрстуфхцчшщъыьэюя1234567890-=\.';
     nsoob='41726819914171661626249337893698443211166789999';
var
  Form1: TForm1;
  Fon, Pict1, Pict2:TBitMap;
  FonRct1, FonRct2:TRect;
  fupr,fsp: TextFile;
  fam, nam, klass, nupr,nameflupr:string;
  texti: array[1..100] of string;
  spupr: array[1..100] of string;
  resi: array[1..100] of string;
  nstr, istr, nsim, isim, time,nerr, nosim, v: integer;
  x1, y1, w1, h1,x2,y2, w2, h2: integer;
  buf: string;
  xsim:array[1..50] of integer;
  ysim:array[1..50] of integer;
  xpal:array[1..10] of integer;
  ypal: array[1..10] of integer;
  sim1:char;
  prizn, prwres:boolean;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 xsim[1]:=8; ysim[1]:=7;     {ё}
 xsim[2]:=158; ysim[2]:=65;  {а}
 xsim[3]:=306; ysim[3]:=95;  {б}
 xsim[4]:=125; ysim[4]:=65;  {в}
 xsim[5]:=239; ysim[5]:=37;  {г}
 xsim[6]:=316; ysim[6]:=65;  {д}
 xsim[7]:=174; ysim[7]:=37;  {е}
 xsim[8]:=348; ysim[8]:=65;  {ж}
 xsim[9]:=333; ysim[9]:=37;  {з}
 xsim[10]:=212; ysim[10]:=95; {и}
 xsim[11]:=48; ysim[11]:=37;  {й}
 xsim[12]:=143; ysim[12]:=37; {к}
 xsim[13]:=284; ysim[13]:=65; {л}
 xsim[14]:=180; ysim[14]:=95; {м}
 xsim[15]:=207; ysim[15]:=37; {н}
 xsim[16]:=252; ysim[16]:=65; {о}
 xsim[17]:=189; ysim[17]:=65; {п}
 xsim[18]:=221; ysim[18]:=65; {р}
 xsim[19]:=148; ysim[19]:=95; {с}
 xsim[20]:=243; ysim[20]:=95; {т}
 xsim[21]:=111; ysim[21]:=37; {у}
 xsim[22]:=62; ysim[22]:=65;  {ф}
 xsim[23]:=365; ysim[23]:=37; {х}
 xsim[24]:=79; ysim[24]:=37;  {ц}
 xsim[25]:=116; ysim[25]:=95; {ч}
 xsim[26]:=270; ysim[26]:=37; {ш}
 xsim[27]:=302; ysim[27]:=37; {щ}
 xsim[28]:=396; ysim[28]:=37; {ъ}
 xsim[29]:=94; ysim[29]:=65;  {ы}
 xsim[30]:=274; ysim[30]:=95; {ь}
 xsim[31]:=380; ysim[31]:=65; {э}
 xsim[32]:=338; ysim[32]:=95; {ю}
 xsim[33]:=84; ysim[33]:=95;  {я}
 xsim[34]:=37; ysim[34]:=7;   {1}
 xsim[35]:=68; ysim[35]:=7;   {2}
 xsim[36]:=101; ysim[36]:=7;  {3}
 xsim[37]:=133; ysim[37]:=7;  {4}
 xsim[38]:=164; ysim[38]:=7;  {5}
 xsim[39]:=195; ysim[39]:=7;  {6}
 xsim[40]:=227; ysim[40]:=7;  {7}
 xsim[41]:=259; ysim[41]:=7;  {8}
 xsim[42]:=290; ysim[42]:=7;  {9}
 xsim[43]:=322; ysim[43]:=7;  {0}
 xsim[44]:=354; ysim[44]:=7;  {-}
 xsim[45]:=386; ysim[45]:=7;  {=}
 xsim[46]:=418; ysim[46]:=7;  {\}
 xsim[47]:=370; ysim[47]:=95; {.}
 xpal[1]:=188; ypal[1]:=177;
 xpal[2]:=157; ypal[2]:=164;
 xpal[3]:=124; ypal[3]:=179;
 xpal[4]:=100; ypal[4]:=210;
 xpal[5]:=217; ypal[5]:=253;
 xpal[6]:=279; ypal[6]:=177;
 xpal[7]:=308; ypal[7]:=164;
 xpal[8]:=340; ypal[8]:=179;
 xpal[9]:=370; ypal[9]:=210;
 xpal[10]:=250; ypal[10]:=253;
 Form1.Top:=5;
 Form1.Left:=5;
 Form1.Label5.Caption:='';
 Form1.Edit1.Text:='';
 Form1.Edit2.Text:='';
 Form1.Edit3.Text:='';
 Form1.Edit4.Text:='';
 fam:='';
 nam:='';
 klass:='';
 nupr:='';
 nameflupr:='';
 Form1.Button1.Enabled:=False;
 Form1.Timer1.Enabled:=False;
 Image1.AutoSize:=False;
 Fon:=TBitMap.Create;
 Pict1:=TBitMap.Create;
 Pict2:=TBitMap.Create;
 Fon.LoadFromFile('res/klava1.bmp');
 Image1.Width:=Fon.Width;
 Image1.Height:=Fon.Height;
 Image1.Canvas.Draw(0,0,Fon);
 Pict1.LoadFromFile('res/vkl1.bmp');
 Pict1.Transparent:=True;
 Pict1.TransparentColor:=Pict1.Canvas.Pixels[1,1];
 w1:=Pict1.Width;
 h1:=Pict1.Height;
 x1:=-w1;
 y1:=20;
 FonRct1:=Bounds(x1,y1,w1,h1);
 Pict2.LoadFromFile('res/vpal.bmp');
 w2:=Pict2.Width;
 h2:=Pict2.Height;
 Pict2.Transparent:=True;
 Pict2.TransparentColor:=Pict2.Canvas.Pixels[1,1];
 x2:=-w2;
 y2:=20;
 FonRct2:=Bounds(x2,y2,w2,h2);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 prwres:=false;
 Form1.RadioButton1.Enabled:=false;
 Form1.RadioButton2.Enabled:=false;
 Form1.RadioButton3.Enabled:=false;
 Form1.Edit1.Enabled:=false;
 Form1.Edit3.Enabled:=false;
 Form1.Edit4.Enabled:=false;
 Form1.Edit2.Enabled:=true;
 Form1.ListBox1.Clear;
 Form1.Edit2.SetFocus;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) and (length(Form1.Edit2.Text)>2) then begin
  fam:=trim(Form1.Edit2.Text);
  Form1.Edit3.Enabled:=true;
  Form1.Edit3.SetFocus;
 end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) and (length(Form1.Edit3.Text)>1) then begin
  nam:=trim (Form1.Edit3.Text);
  Form1.Edit4.Enabled:=true;
  Form1.Edit4.SetFocus;
 end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) and (length(Form1.Edit4.Text)>1) then begin
  klass:=trim (Form1.Edit4.Text);
  Form1.RadioButton1.Enabled:=true;
  Form1.RadioButton2.Enabled:=true;
  Form1.RadioButton3.Enabled:=true;
 end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   time:=time+1;
end;

procedure Vivsim;
var j,k:integer;
    sim2:char;
begin
 If ord(sim1)>32 then begin
  k:=0;
  for j:=1 to 47 do
   if (sim1=alfp[j]) or (sim1=alfs[j]) then  k:=j;
  if k<>0 then begin
   Form1.Label6.Caption:=sim1;
   sim2:=nsoob[k]; j:=StrToInt(sim2);
   if j<5 then prizn:=True else prizn:=False;
   x1:=xsim[k]; y1:=ysim[k];
   x2:=xpal[j]; y2:=ypal[j];
  end;
 end
 else begin
   if sim1=' ' then begin
     Form1.Label6.Caption:='пробел';
     x1:=216; y1:=126;  {координаты левого верхнего угла квадрата}
     if prizn=True then j:=10 else j:=5;
     x2:=xpal[j]; y2:=ypal[j]; {координаты левого верхнего угла стрелочки}
   end;
   if Form1.Label6.Caption='Enter' then begin
      x1:=442; y1:=37;
      x2:=xpal[9]; y2:=ypal[9];
   end;
 end;
  {Восстановлением фона удаляем квадрат}
  Form1.Image1.Canvas.CopyRect(FonRct1,Fon.Canvas,FonRct1);
  {Определяем сохраняемую область клавиатуры}
  FonRct1:=Bounds(x1,y1,w1,h1);
  {Выводим квадрат}
  Form1.Image1.Canvas.Draw(x1,y1,Pict1);
  {Восстановлением фона удаляем стрелочку}
  Form1.Image1.Canvas.CopyRect(FonRct2,Fon.Canvas,FonRct2);
  {Определяем сохраняемую область изображения рук}
  FonRct2:=Bounds(x2,y2,w2,h2);
  {Выводим стрелочку}
  Form1.Image1.Canvas.Draw(x2,y2,Pict2);
end;
procedure Wrres;
var fr:TextFile;
    sim1:String;
    i:integer;
begin
  sim1:=fam+';'+nam+';'+klass+';'+DateToStr(Now)+';';
  sim1:=sim1+TimeToStr(Now)+';'+nupr+';';
  sim1:=sim1+IntToStr(nosim)+';'+IntToStr(v)+';'+IntToStr(nerr);
  AssignFile(fr,'Res.txt');
  {$I-}
  Append(fr);
  {$I+}
  if IOResult<>0 then Rewrite(fr);
  writeln(fr,sim1);
  CloseFile(fr);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Form1.Edit1.Enabled:=true;
 Form1.Edit1.Text:='';
 istr:=1;
 buf:=texti[istr];
 Form1.Label11.Caption:=buf;
 istr:=2;
 buf:=texti[istr];
 nsim:=length(buf);
 nosim:=nsim;
 isim:=0;
 nerr:=0;
 time:=0;
 Form1.Edit3.Enabled:=false;
 Form1.Edit4.Enabled:=false;
 Form1.Edit2.Enabled:=false;
 Form1.Label5.Caption:=buf;
 Form1.Timer1.Enabled:=True;
 Form1.Button3.Enabled:=false;
 Form1.Edit1.SetFocus;
 sim1:=buf[1];
 Vivsim;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var simr: char;
begin
 if (key=#13) and (Form1.Label6.Caption='Enter') then begin
  if istr=nstr then begin
   Form1.Timer1.Enabled:=False;
   Form1.Edit1.Text:='Упражнение выполнено';
   Form1.Label7.Caption:='';
   Form1.Label12.Caption:='Упражнение '+nupr;
   Form1.Label8.Caption:='символов: '+IntToStr(nosim);
   v:=nosim*60 div time;
   Form1.Label9.Caption:=IntToStr(v)+' сим/мин';
   Form1.Label10.Caption:='кол-во ошибок: '+IntToStr(nerr);
   Wrres;
   Form1.Image1.Canvas.CopyRect(FonRct1,Fon.Canvas,FonRct1);
   Form1.Image1.Canvas.CopyRect(FonRct2,Fon.Canvas,FonRct2);
   Form1.RadioButton1.Enabled:=true;
   Form1.RadioButton2.Enabled:=true;
   Form1.RadioButton3.Enabled:=true;Form1.Button3.Enabled:=true;
   nupr:='';
  end
  else begin
   istr:=istr+1;
   buf:=texti[istr];
   nsim:=length(buf);
   nosim:=nosim+nsim;
   Form1.Label5.Caption:=buf;
   Form1.Edit1.Text:='';
   sim1:=buf[1];
   Vivsim;
  end;
 end
 else begin
  simr:=buf[isim+1];
  Form1.Label7.Caption:='';
 if simr=key then begin
  isim:=isim+1;
  sim1:=buf[isim+1];
  if isim<nsim then Vivsim
   else begin
    isim:=0;
    sim1:=chr(13);
    Form1.Label6.Caption:='Enter';
    Form1.Label5.Caption:='';
    Vivsim;
  end;
  end
  else begin
   Form1.Label7.Caption:='Ошибка!';
   nerr:=nerr+1;
   key:=chr(0);
  end;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var fr1:TextFile;
    i, i1,j, k, l:integer;
    rm:array[1..10] of string;
begin
 For i:=0 to Form1.StringGrid1.ColCount-1 do
 For j:=0 to Form1.StringGrid1.RowCount-1 do
 Form1.StringGrid1.Cells[i,j]:='';
 AssignFile(fr1,'Res.txt');
 nstr:=0;
 {$I-}
 Reset(fr1);
 while (not eof(fr1)) and (nstr<100) do begin
   readln (fr1,buf);
   nstr:=nstr+1;
   resi[nstr]:=buf;
 end;
 {I+}
 if IOResult=0 then begin
   CloseFile(fr1);
   Form1.Button1.Enabled:=True;
   Form1.Button1.SetFocus;
   Form1.Button3.Enabled:=False;
 end
 else ShowMessage('Не создан журнал');
 Form1.StringGrid1.Cells[0,0]:='  Фамилия';
 Form1.StringGrid1.Cells[1,0]:='  Имя';
 Form1.StringGrid1.Cells[2,0]:='  Класс';
 Form1.StringGrid1.Cells[3,0]:='  Дата';
 Form1.StringGrid1.Cells[4,0]:='  Упр. №';
 Form1.StringGrid1.Cells[5,0]:='  Кол-во симв.';
 Form1.StringGrid1.Cells[6,0]:='  Скорость';
 Form1.StringGrid1.Cells[7,0]:='  Кол-во ош.';
 for i:=1 to nstr do begin
  buf:=resi[i];    l:=length(buf);    i1:=1; j:=1;   k:=0;
  While (j<=l) do begin
  while  (buf[j]<>';') and (j<=l) and (k<10) do j:=j+1;
   k:=k+1;
  if (j<l) then begin
     rm[k]:=copy(buf,i1,(j-i1));
     j:=j+1; i1:=j;
  end
  else rm[k]:=copy(buf,i1,(j-i1+1));
  end;
  Form1.StringGrid1.Cells[0,i]:=rm[1];
  Form1.StringGrid1.Cells[1,i]:=rm[2];
  Form1.StringGrid1.Cells[2,i]:=rm[3];
  Form1.StringGrid1.Cells[3,i]:=rm[4];
  Form1.StringGrid1.Cells[4,i]:=rm[6];
  Form1.StringGrid1.Cells[5,i]:=rm[7];
  Form1.StringGrid1.Cells[6,i]:=rm[8];
  Form1.StringGrid1.Cells[7,i]:=rm[9];
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fon.Free;
  Pict1.Free;
  Pict2.Free;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
var fname, strr: string;
    i,j: integer;
begin
 {Обработка нажатия радиокнопок}
 if Form1.RadioButton1.Checked=true then fname:='sp1.txt';
 if Form1.RadioButton2.Checked=true then fname:='sp2.txt';j:=0;
 if Form1.RadioButton3.Checked=true then fname:='sp3.txt';
 AssignFile(fsp,fname);
 {$I-}
 Reset(fsp);
  {I+}
  if IOResult=0 then begin
   Form1.ListBox1.Clear;
   while not(eof(fsp)) do begin
    Readln(fsp,buf);
    j:=j+1;
    spupr[j]:=buf;
    i:=pos(';',buf);
    strr:=copy(buf,1,i-1);
    Form1.ListBox1.Items.Add(strr);
   end;
   CloseFile(fsp);
   {Form1.RadioButton1.Enabled:=false;
   Form1.RadioButton2.Enabled:=false;
   Form1.RadioButton3.Enabled:=false;}
   Form1.ListBox1.Enabled:=true;
   Form1.ListBox1.SetFocus;
  end;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var i,j,l: integer;
    strr: string;
begin
 {Вывод списка упражнений}
 j:=Form1.ListBox1.ItemIndex+1;
 strr:=spupr[j];
 l:=length(strr);
 i:=pos(';',strr);
 nameflupr:='res/'+copy(strr,i+2,l-i-1)+'.txt';
 nupr:=copy(strr,i+5,l-i-4);
 AssignFile(fupr, nameflupr);
    nstr:=0;
    {$I-}
    Reset(fupr);
     while (not eof(fupr)) and (nstr<100) do begin
      readln (fupr,buf);
      nstr:=nstr+1;
      texti[nstr]:=buf;
     end;
     {I+}
     if IOResult=0 then begin
      CloseFile(fupr);
      Form1.ListBox1.Enabled:=false;
      Form1.Button1.Enabled:=True;
      Form1.Button1.SetFocus;
     end
      else ShowMessage('Неверный номер упражнения. Повторите ввод.');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Form1.Close;
end;

end.
