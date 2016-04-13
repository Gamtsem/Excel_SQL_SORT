Attribute VB_Name = "Module1"
Function GetFileName(Optional ByVal Title As String = "�������� ���� ��� ���������", _
Optional ByVal InitialPath, _
Optional ByVal MyFilter As String = "��� ����� (*.*),") As String
' ������� ������� ���������� ���� ������ ����� � ���������� Title,
' ������� ����� ����� � ����� InitialPath
' ���������� ������ ���� � ��������� �����, ��� ������ ������ � ������ ������ �� ������
If Not IsMissing(InitialPath) Then
On Error Resume Next: ChDrive Left(InitialPath, 1)
ChDir InitialPath ' �������� ��������� �����
End If
res = Application.GetOpenFilename(MyFilter, , Title, "�������") ' ����� ����������� ����
GetFileName = IIf(VarType(res) = vbBoolean, "", res) ' ������ ������ ��� ������ �� ������
End Function

'Sub �������������������_GetFileName()
'�������� = GetFileName("��������� ����", ThisWorkbook.Path) ' ����������� ��� �����
' ===================== ������ �������� ������ ������� =====================
' ��������� �����, ��������� ����� �� �������
' �������� = GetFileName("�������� ��������� ����", , "��������� ����� (*.txt),")
' ����� ������ ���� �� ����� "C:\Windows"
' �������� = GetFileName(, "C:\Windows", "")
' ============================================================�==============

'If �������� = "" Then Exit Sub ' �����, ���� ������������ ��������� �� ������ �����
'MsgBox "������ ����: " & ��������, vbInformation
'End Sub

Sub request1()

Dim r As Long


'���������� �������� ��������� �������
 Dim tbl As Recordset

'������ ������� SQL
Dim SQLr As Variant
Dim val As Variant

'���������� �������� ������ �� ������������ ��
Dim dbs As Database

'������������ � mdb
Set dbs = DAO.OpenDatabase(Worksheets("������� ����").Cells(1, 1).Value)

For r = 6 To 65

 '���������� ������ SQL �������
 val = Worksheets("������� ����").Cells(r, 2).Value
 SQLr = val
 '���������� ������ �������� ��
 '��������� � ���� ������� �������� � tbl
 Set tbl = dbs.OpenRecordset(SQLr)
 
 '��������� ��������� � ���� ������� � ������ A1
 Worksheets("������1").Cells(2, 4 * r - 23).CopyFromRecordset tbl
 
 Next r
'��������� ��������� �������
  tbl.Close
  
'������� ������. ���� ����� �� �������, �� �������
'��� � ��������� ������ � ����������.
  Set tbl = Nothing
  
'��������� ����
dbs.Close
  Set dbs = Nothing
End Sub


