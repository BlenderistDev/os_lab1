unit lab1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  p: pointer;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
VAR
 SysInf:SYSTEM_INFO;
begin
  GetSystemInfo(SysInf);
  Memo1.Clear;
  memo1.Lines.Add('Размер страницы '+IntToStr(SysInf.dwPageSize)+' байт');
  memo1.Lines.Add('Процессор '+IntToStr(SysInf.wProcessorArchitecture));
  memo1.Lines.Add('Зарезервировано '+IntToStr(SysInf.wReserved));
  memo1.Lines.Add('Количество процессоров '+IntToStr(SysInf.dwNumberOfProcessors));
  memo1.Lines.Add('Маска активного процессора '+IntToStr(SysInf.dwActiveProcessorMask));
  memo1.Lines.Add('Тип процессора '+IntToStr(SysInf.dwProcessorType));
  memo1.Lines.Add('Гранулярность выделения ресурсов '+IntToStr(SysInf.dwAllocationGranularity));
  memo1.Lines.Add(' '+IntToStr(SysInf.wProcessorLevel));
  memo1.Lines.Add(' '+IntToStr(SysInf.wProcessorRevision));
end;

procedure TForm1.Button2Click(Sender: TObject);
VAR
     ms:TMEMORYSTATUS;
begin
  ms.dwLength:=sizeof(MEMORYSTATUS);
  GlobalMemoryStatus(ms);
  Memo1.Clear;
  Memo1.Lines.Add('Загружено памяти '+IntToStr(ms.dwMemoryLoad)+' байт');
  Memo1.Lines.Add('Всего физическая память '+IntToStr(ms.dwTotalPhys)+' байт');
  Memo1.Lines.Add('Доступная физическая память '+IntToStr(ms.dwAvailPhys)+' байт');
  Memo1.Lines.Add('Общий размер страничного файла '+IntToStr(ms.dwTotalPageFile)+' байт');
  Memo1.Lines.Add('Доступный размер страничного файла '+IntToStr(ms.dwAvailPageFile)+' байт');
  Memo1.Lines.Add('Общий размер виртуальной памяти '+IntToStr(ms.dwTotalVirtual)+' байт');
  Memo1.Lines.Add('Доступный размер виртуальной памяти '+IntToStr(ms.dwAvailVirtual)+' байт');
end;


procedure TForm1.Button3Click(Sender: TObject);
VAR
    mbi:TMemoryBasicInformation;
    dwRez:DWORD;
begin
  if Edit1.GetTextLen <= 0
  then ShowMessage('Введите виртуальный адрес')
  else
  begin
    dwRez:=VirtualQuery(pointer(StrToInt(Edit1.Text)),mbi,sizeof(MEMORY_BASIC_INFORMATION));
    Memo1.Clear;
    Memo1.Lines.Add('Базовый адрес '+IntToStr(integer(mbi.BaseAddress)));
    Memo1.Lines.Add('Адрес размещения'+IntToStr(integer(mbi.BaseAddress)));
    case mbi.AllocationProtect of
      0:            Memo1.Lines.Add('ВАП зарезервировано');
      PAGE_NOACCESS:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_NOACCESS');
      PAGE_READONLY:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_READONLY');
      PAGE_READWRITE:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_READWRITE');
      PAGE_EXECUTE:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE');
      PAGE_EXECUTE_READ:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE_READ');
      PAGE_EXECUTE_READWRITE:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE_READWRITE');
      PAGE_WRITECOPY:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_WRITECOPY');
      PAGE_EXECUTE_WRITECOPY:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE_WRITECOPY');
    end;
    Memo1.Lines.Add('Размер региона '+IntToStr(mbi.RegionSize)+' байт');
    case mbi.State of
      MEM_COMMIT: Memo1.Lines.Add('Состояние ВАП MEM_COMMIT');
      MEM_RESERVE: Memo1.Lines.Add('Состояние ВАП MEM_RESERVE');
      MEM_FREE: Memo1.Lines.Add('Состояние ВАП MEM_FREE');
    end;
    case mbi.Protect of
      0:            Memo1.Lines.Add('зарезервировано');
      PAGE_NOACCESS:Memo1.Lines.Add('Атрибут защиты физ.памяти PAGE_NOACCESS');
      PAGE_READONLY:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_READONLY');
      PAGE_READWRITE:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_READWRITE');
      PAGE_EXECUTE:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE');
      PAGE_EXECUTE_READ:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE_READ');
      PAGE_EXECUTE_READWRITE:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE_READWRITE');
      PAGE_WRITECOPY:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_WRITECOPY');
      PAGE_EXECUTE_WRITECOPY:Memo1.Lines.Add('Атрибут защиты ВАП PAGE_EXECUTE_WRITECOPY');
    end;
  end;
end;


procedure TForm1.Button4Click(Sender: TObject);
VAR   ms:MEMORYSTATUS;
begin
  If Edit1.GetTextLen=0
  then p:=VirtualAlloc(nil,4096,MEM_COMMIT,PAGE_READWRITE)
  else p:=VirtualAlloc(pointer(StrToInt64(Edit1.Text)),4096,MEM_COMMIT,PAGE_READWRITE);
  Memo1.Clear;
  ms.dwLength:=sizeof(MEMORYSTATUS);
  GlobalMemoryStatus(ms);
  Memo1.Clear;
  Memo1.Lines.Add('Загружено памяти '+IntToStr(ms.dwMemoryLoad)+' байт');
  Memo1.Lines.Add('Всего физическая память '+IntToStr(ms.dwTotalPhys)+' байт');
  Memo1.Lines.Add('Доступная физическая память '+IntToStr(ms.dwAvailPhys)+' байт');
  Memo1.Lines.Add('Общий размер страничного файла '+IntToStr(ms.dwTotalPageFile)+' байт');
  Memo1.Lines.Add('Доступный размер страничного файла '+IntToStr(ms.dwAvailPageFile)+' байт');
  Memo1.Lines.Add('Общий размер виртуальной памяти '+IntToStr(ms.dwTotalVirtual)+' байт');
  Memo1.Lines.Add('Доступный размер виртуальной памяти '+IntToStr(ms.dwAvailVirtual)+' байт');
end;

procedure TForm1.Button5Click(Sender: TObject);
VAR
    ms:MEMORYSTATUS;
begin
  VirtualFree(p,4096,MEM_DECOMMIT);
  VirtualFree(p,4096,MEM_RELEASE);
  Memo1.Clear;
  ms.dwLength:=sizeof(MEMORYSTATUS);
  GlobalMemoryStatus(ms);
  Memo1.Clear;
  Memo1.Lines.Add('Загружено памяти '+IntToStr(ms.dwMemoryLoad)+' байт');
  Memo1.Lines.Add('Всего физическая память '+IntToStr(ms.dwTotalPhys)+' байт');
  Memo1.Lines.Add('Доступная физическая память '+IntToStr(ms.dwAvailPhys)+' байт');
  Memo1.Lines.Add('Общий размер страничного файла '+IntToStr(ms.dwTotalPageFile)+' байт');
  Memo1.Lines.Add('Доступный размер страничного файла '+IntToStr(ms.dwAvailPageFile)+' байт');
  Memo1.Lines.Add('Общий размер виртуальной памяти '+IntToStr(ms.dwTotalVirtual)+' байт');
  Memo1.Lines.Add('Доступный размер виртуальной памяти '+IntToStr(ms.dwAvailVirtual)+' байт');
end;


procedure TForm1.Button6Click(Sender: TObject);
VAR
  lpflOldProtect:DWORD;
begin
  if Edit1.GetTextLen <= 0
  then ShowMessage('Введите виртуальный адрес')
  else
  begin
    if VirtualProtect(pointer(StrToInt64(Edit1.Text)), 4096, StrToInt(Edit2.Text), lpflOldProtect)
    then ShowMessage('успех')
    else ShowMessage('неудача');
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Form1.Close;
end;

end.
