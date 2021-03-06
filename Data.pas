{------------������ �������������� �������������� �������� �������-------------}

Unit Data;

Interface

Type
    TLoading = record
      GraphBar: word;
      x, y, z, i, j, k, m: real;
    end;
    TSteelMark = string[23];
    TTwoWord = array [1..2] of word;

{--------------------------------������� ���������-----------------------------}
//    MaterialsDB: PDBFile;

TDoubleHelicalInput = record
    Loading: TLoading;
    P1,                      {��������, ������������ ������������ �����}
    n1,                      {������� �������� ������������� ����}
    U: real;                  {������������ ����� ��������}
    DeltaU: byte;
    Lh: longint;              {��������� ������ ��������}
    Tipz: word;               {��� ������ �����:
                                      1 - ������
                                      2 - �����
                                      3 - ���������
                                      0 - ���������}
    betg:byte;               {���� ������� ���� � ��������;
                              ��� Tipz= 0 ���������� �����������
                              ���������� �� ��������� 0, 10, 25}
    kanavka: word;           {��� ��������� ����� ��� ������� ������� = 1,
                              ��� ���������� ������� =0}
    mc1: TSteelMark;          {����� ����� ��� ��������}
    mc2: TSteelMark;          {����� ����� ��� ������}
    Termobr1,                {�������������� ���� ��������, �����}
    Termobr2: byte;           {�������������� ���� ������, �����}
    ImprovStrength: array [1..2] of boolean;
    Zagotowka: TTwoWord;
                             {������ ��������� ��������� �������� � ������
                                      = 1 ��� �������
                                      = 2 ��� ���������
                                      = 3 ��� �������
                                      = 4 ��� �������}
    Ra1,                     {������������� ������� ����������� ���� ��������}
    Ra2:word;                {������������� ������� ����������� ���� ������}
    Wikrugka:TTwoWord;
                             {�������� ��������� �������� ����
                                      = 0 �������� ��������������� ��� ���������
                                      = 1 ��� ����������� ��������}

    Nom_sx: byte;            {����� ����� ������������ �����}
    Zw:byte;                 {����� ����� ����������� � ������������� �������� � ���������}
    Psi_ba:real;             {���������� ������ �����,
                              ��� ������������� �������� �������� �� ������������
                              ���� � ����������� �� ����� ��������;
                              ��� ����� ��������� ���������� �����������
                              ���������� ����� � ����������� �� ����� ��������}
    Nagr,                    {=1 ��� �������� ������, = 0 ��� �����������}
    rewers:boolean;          {��� �������������� = 1; ��� �������������� = 0}
    Ka:real;                 {����������� ������� ��������}
    otw1:boolean;            {��� ����������� ��������� ���������� = 'Y',
                              ��� ������������� ��������� ���������� ='n'}
    BISTR:boolean;           {"0", ���� �������� �������� ���������� ��������}
                             {"1", ���� �������� �������� ������������ ��������}
    motw:TTwoWord;
                             {����� �����������:
                                      1   ��� ��������� ��������
                                      0   ��� ��������� ������
                                      2   ��� ��������� ������ ���������}
    H_HRcs1,                 {��������� ���������� ���� �������� �� ��������}
    H_HRcs2,                 {��������� ���������� ���� ������ �� ��������}
    H_HRcp1,                 {��������� ����������� ���� �������� �� ��������}
    H_HRcp2,                 {��������� ����������� ���� ������ �� ��������}
    H_HBs1,                  {��������� ���������� ���� �������� �� �������}
    H_HBs2,                  {��������� ���������� ���� ������ �� �������}
    H_HBp1,                  {��������� ����������� ���� �������� �� �������}
    H_HBp2,                  {��������� ����������� ���� ������ �� �������}
    H_HVs1,                  {��������� ���������� ���� �������� �� ��������}
    H_HVs2,                  {��������� ���������� ���� ������ �� ��������}
    H_HVp1,                  {��������� ����������� ���� �������� �� ��������}
    H_HVp2 : integer;        {��������� ����������� ���� ������ �� ��������}
    S_f1,                    {����������� ������������ �� ������ ��� ��������}
    S_f2,                    {����������� ������������ �� ������ ��� ������}
    Y_d1,                    {����������� ��������������� ���������� ��� ��������}
    Y_d2,                    {����������� ��������������� ���������� ��� ������}
    Y_g1,                    {�����������, ����������� ����������  ��� ��������}
    Y_g2 : real;             {�����������, ����������� ����������  ��� ������}
    Sigma_t1,                {������ ��������� ��������� ��������}
    Sigma_t2,                {������ ��������� ��������� ������}
    Sigma_Flim01,            {������ ������������ �� ������ ��� ��������}
    Sigma_Flim02,            {������ ������������ �� ������ ��� ������}
    Sigma_Fst01,             {���������� ���������� ��� ��������}
    Sigma_Fst02: real;       {���������� ���������� ��� ������}
    Mn: real;                {���������� ������}
end;

{--------------------------------�������� ���������----------------------------}
TDoubleHelicalOutput = record
    Massa,                   {��������� ����� �������� �����}
    V_p,                     {����� ���������� ���������}
    B1,
    aw,                      {��������� ���������� ��������}
    Da2: real;
    b2: real;                {������ �����}
    z1, z2 : word;           {����� ������}
    St : integer;            {������� ��������}
    Fv : real ;              {��������� �������� �� ���}
    epsias:real;             {��������� �-� ����������}
    alfatw:Real;             {���� ���������� �������� �����}
    Uf,                      {����������� ������������ ����� ��������}
    n2 : real;               {������� �������� ������}
    V : real;                {��������, �/�}
    Da1,                     {������� ���������� ������}
    d1,  d2,                 {����������� �������}
    x1,  x2:real;            {����������� �������� ��������� �������}
    Dw1,                     {��������� �������}
    Df1,                     {������� ���������� ������}
    Dw2,                     {��������� �������}
    Df2,                     {������� ���������� ������}
    Bet: real;
    Sigma_H,                 {���������� ����������}
    T1,                      {������, ������������ ������������ �����}
    T2,                      {������, ������������ ���������� �����}
    Ft1,                     {�������� ������}
    Fr1,                     {���������� ������}
    Fx1,                     {������ ������}
    Ft2,                     {�������� ������}
    Fr2,                     {���������� ������}
    Fx2 : real;
end;

implementation

end.
