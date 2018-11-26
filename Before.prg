program Before;

import "mod_grproc";
import "mod_key";
import "mod_map";
import "mod_math";
import "mod_proc";
import "mod_rand";
import "mod_screen";
import "mod_scroll";
import "mod_sound";
import "mod_text";
import "mod_video";
import "mod_wm";
import "mod_file";

global

  // Variables

  int LevelCheckID;
  int Volume;
  int Song;
  int Selection;
  int ItemSelect;
  int ItemNumber;
  int ArcadeSeaOn;
  int DarkBlockOn;
  int DarkBlockOn2;
  int RemoveDarkBlock;
  int LocationX;
  int LocationY;
  int SongNumber;

  int PlayerID;
  int PlayerFlag;
  int PlayerX;
  int PlayerY;
  int PlayerAngle;
  int PlayerFish;
  int PlayerLaps;
  int SneakBoostOn;
  int KnownPowers;
  int FishPower;
  int PlayerHP;
  int HPBoostOn;

  int ShadowCounter;
  int DarkArea;
  int RaceFishWin;
  int CarryOn;
  int DarkMotherOn;
  int DeepTribeOn;
  int StreamRoomOn;
  int SwarmJelliconOn;
  int BlobOn;
  int OctolingOn;
  int NonPlayerFishOn;

  int FriendFish;
  int FriendFishID;
  int FriendFishOrder;

  int SpawnItem;
  int ShellItem;
  int GelatinumItem;
  int HookItem;
  int EggItem;
  int MapItem;
  int DrumItem;
  int CollectItem;
  int CollectItemList[10];

  int ScreenFull;

  string Symbols="ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789!?";  //36
  string Name;
  string TempString;

  int Quests;
  int TotalQuests;
  int RaceWon;
  int DoIntro;
  int DarkBringersDone;

  int FirstStone;
  int SecondStone;
  int ThirdStone;

  int SunlitDiscover;
  int CavernsDiscover;
  int DeepRoadsDiscover;
  int OceanDiscover;
  int AbyssDiscover;
  int RaceDiscover;
  int BreederDiscover;
  int RoadsConnectionDiscover;
  int SeaRoadsDiscover;
  int TribeDiscover;
  int BreedingGroundDiscover;
  int MotherDiscover;

  int MoldConversation;
  int FolderMemory;
  int FolderMemory2;
  int LimMemory;
  int BluMemory;
  int LuddMemory;
  int JudgeMemory;
  int EldaMemory;
  int BurlMemory;
  int ZipMemory;
  int DadImpression;
  int GlumMemory;
  int FinnMemory;
  int SlugMemory;
  int VeolaMemory;
  int SarkMemory;
  int StrimMemory;
  int GhostFishMemory;
  int MoistMemory;
  int DrumMemory;
  int SlugQuest;
  int MoistQuest;
  int GhostFishQuest;

  // Save

  struct Save[0];
    string Name;
    int SaveDone;
    int ItemSelect;
    int ItemNumber;
    int RemoveDarkBlock;
    int PlayerFish;
    int KnownPowers;
    int FishPower;
    int FriendFish;
    int FriendFishOrder;
    int SpawnItem;
    int ShellItem;
    int GelatinumItem;
    int HookItem;
    int EggItem;
    int MapItem;
    int DrumItem;
    int Quests;
    int RaceWon;
    int DoIntro;
    int DarkBringersDone;
    int FirstStone;
    int SecondStone;
    int ThirdStone;
    int SunlitDiscover;
    int CavernsDiscover;
    int DeepRoadsDiscover;
    int OceanDiscover;
    int AbyssDiscover;
    int RaceDiscover;
    int BreederDiscover;
    int RoadsConnectionDiscover;
    int SeaRoadsDiscover;
    int TribeDiscover;
    int BreedingGroundDiscover;
    int MotherDiscover;
    int MoldConversation;
    int FolderMemory;
    int FolderMemory2;
    int LimMemory;
    int BluMemory;
    int LuddMemory;
    int JudgeMemory;
    int EldaMemory;
    int BurlMemory;
    int ZipMemory;
    int DadImpression;
    int GlumMemory;
    int FinnMemory;
    int SlugMemory;
    int VeolaMemory;
    int SarkMemory;
    int StrimMemory;
    int GhostFishMemory;
    int MoistMemory;
    int DrumMemory;
    int SlugQuest;
    int MoistQuest;
    int GhostFishQuest;
    int CollectItem;
    int CollectItemList[10];
  end

  int MindSignal;
  int BeamFishSound;
  int Boing;
  int Flame;
  int Inspire;
  int Jump;
  int Jump2;
  int Mine;
  int Mine2;
  int Open;
  int Dark;
  int Splash;
  int Zap;
  int Cage;
  int Hurt;
end


local
  int Control;
  int HP;
  int TP;
end


begin

Full_Screen=true;
set_mode(320,240,16,256);
set_fps(30,0);
sound_freq=44100;
load_fpg("Graphics.fpg");


MindSignal=load_wav("Sound/beam.wav");
BeamFishSound=load_wav("Sound/beam2.wav");
BeamFishSound=load_wav("Sound/beam2.wav");
Boing=load_wav("Sound/boing.wav");
Flame=load_wav("Sound/flame.wav");
Inspire=load_wav("Sound/inspire.wav");
Jump=load_wav("Sound/jump.wav");
Jump2=load_wav("Sound/jump2.wav");
Mine=load_wav("Sound/mine.wav");
Mine2=load_wav("Sound/mine2.wav");
Open=load_wav("Sound/open.wav");
Dark=load_wav("Sound/dark.wav");
Splash=load_wav("Sound/splash.wav");
Zap=load_wav("Sound/zap.wav");
Cage=load_wav("Sound/cage.wav");
Hurt=load_wav("Sound/hurt.wav");


ScreenFull=1;
SystemControl();

frame(2000);

Volume=100;

Logos();

end



process Logos();
begin

  SkipButton();
  SongPlayer(14);
  graph=379; x=630; y=120;
  LogoObject3(160,120,2,422);
  repeat x-=5; frame; until(x<=-310)

  frame(1000);
  Control=1;
  frame(5000); frame(3000);
  Control=0;
  LogoObject(160,180,2,381);
  graph=380; x=160; y=80; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)

  frame(5000); frame(5000); frame(1000);

  Control=1;
  repeat alpha-=3; frame(50); until(alpha<=0)

  frame(3000);
  fade(0,0,0,16);
  frame(2000);

  TitleScreen(0);

end



process Credits();
begin

  let_me_alone();
  SystemControl();
  CreditsCam();

  SongPlayer(9);

  graph=426; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  LogoObject2(285,60,2,390);
  Control=0;
  graph=382; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(3000);
  LogoObject(x,y+16,3,383);
  frame(6000); Control=1;
  repeat alpha-=5; frame(50); until(alpha<=0)

  LogoObject2(40,180,2,390);
  Control=0;
  graph=384; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(3000);
  LogoObject(x-11,y+3,3,385);
  frame(6000); Control=1;
  repeat alpha-=5; frame(50); until(alpha<=0)

  graph=427; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  LogoObject2(285,140,2,390);
  Control=0;
  graph=386; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(3000);
  LogoObject(x+8,y+24,3,387);
  frame(6000); Control=1;
  repeat alpha-=5; frame(50); until(alpha<=0)

  LogoObject2(35,180,2,390);
  Control=0;
  graph=388; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(3000);
  LogoObject(x+24,y+10,3,389);
  frame(6000); Control=1;
  repeat alpha-=5; frame(50); until(alpha<=0)

  graph=428; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  Control=0;
  graph=423; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(3000);
  LogoObject(160,120,3,424);
  frame(6000); Control=1;
  repeat alpha-=5; frame(50); until(alpha<=0)

  graph=429; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  LogoObject4(160,120,4,425);

  frame(5000); frame(5000); frame(5000); frame(5000);

  if (Selection!=1)
    graph=431; x=160; y=120; z=4; alpha=0;
    repeat alpha+=5; frame(50); until(alpha=>255)
    frame(5000); frame(5000); frame(5000); frame(5000);
    repeat alpha-=5; frame(50); until(alpha<=0)
  end
  if (Selection==1)
    graph=430; x=160; y=120; z=4; alpha=0;
    repeat alpha+=5; frame(50); until(alpha=>255)
    frame(5000); frame(5000); frame(5000); frame(5000);
    repeat alpha-=5; frame(50); until(alpha<=0)
  end

  graph=432; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000); frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  if (PlayerFish!=3)
    graph=433; x=160; y=120; z=4; alpha=0;
    repeat alpha+=5; frame(50); until(alpha=>255)
    frame(5000); frame(5000); frame(5000); frame(5000);
    repeat alpha-=5; frame(50); until(alpha<=0)
  end
  if (PlayerFish==3)
    graph=434; x=160; y=120; z=4; alpha=0;
    repeat alpha+=5; frame(50); until(alpha=>255)
    frame(5000); frame(5000); frame(5000); frame(5000);
    repeat alpha-=5; frame(50); until(alpha<=0)
  end

  graph=435; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000); frame(5000); frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  graph=436; x=160; y=120; z=4; alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(5000);
  repeat alpha-=5; frame(50); until(alpha<=0)

  fade(0,0,0,16);
  frame(2000);

  TitleScreen(0);

end



process CreditsCam();
begin
  x=160; y=130; z=20; scroll.camera=id;
  loop frame; end
end



process SkipButton();
begin
  loop
    if (key(_esc))
      fade(0,0,0,16);
      frame(2000);
      TitleScreen(0);
      frame(700);
      return;
    end
    frame;
  end
end



process LogoObject4(x,y,z,graph);
begin
  alpha=0; size_x=0;
  repeat
    alpha+=5;
    if (alpha>150 and size_x<100) size_x+=5; end
    frame;
  until(alpha=>255)
  repeat
    if (size_x>0) size_x-=5; end
    frame(50);
  until(size_x<=10)
  flags=1;
  repeat
    if (size_x<100) size_x+=5; end
    frame(50);
  until(size_x==100)
  repeat
    if (size_x>0) size_x-=5; end
    frame(50);
  until(size_x<=10)
  flags=0;
  repeat
    if (size_x<100) size_x+=5; end
    frame(50);
  until(size_x==100)
  repeat
    if (size_x>0) size_x-=5; end
    frame(50);
  until(size_x<=10)
  flags=1;
  repeat
    if (size_x<100) size_x+=5; end
    frame(50);
  until(size_x==100)
  repeat
    if (size_x>0) size_x-=5; end
    frame(50);
  until(size_x<=10)
  flags=0;
  repeat
    if (size_x<100) size_x+=5; end
    frame(50);
  until(size_x==100)
  repeat
    alpha-=5;
    if (size_x>0) size_x-=5; end
    frame(50);
  until(alpha<=0)
end



process LogoObject3(x,y,z,graph);
begin
  alpha=0; frame(5000); frame(5000); frame(5500);
  repeat alpha+=5; frame(50); until(alpha=>255)
  repeat frame; until(father.Control==1)
  repeat alpha-=5; frame(50); until(alpha<=0)
end




process LogoObject(x,y,z,graph);
begin
  alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  repeat frame; until(father.Control==1)
  repeat alpha-=5; frame(50); until(alpha<=0)
end



process LogoObject2(x,y,z,graph);
begin
  alpha=0; size_y=0; frame(700);
  repeat
    alpha+=5;
    if (alpha>50 and size_y<100) size_y+=5; end
    frame(50);
  until(alpha=>255)
  frame(3000);
  repeat
    alpha-=5;
    if (size_y>0) size_y-=5; end
    frame(50);
  until(alpha<=0)
end



process TitleScreen(Mode);
private
  int BkgGraph;
begin
  let_me_alone();
  SystemControl();
  x=160; y=120; z=4;
  if (Mode==1) SongPlayer(14); end
  BkgGraph=map_new(320,240,16);
  map_clear(0,BkgGraph,rgb(0,20,60));
  start_scroll(0,0,BkgGraph,0,0,0);

  SkipButton2();

  fade(100,100,100,2);

  IntroText(132,25,3,260,0);
  IntroText(160,50,3,261,0);

  IntroTextFade(132,25,2,100,0);
  IntroTextFade(160,50,2,200,0);

  repeat frame; until(exists(type IntroTextFade)==0)

  IntroPicture1(105,90,3,263,0);

  IntroPicture1(185,90,4,271,0);
  IntroPicture2(185,90,3,264,0);

  repeat frame; until(exists(type IntroPicture2)==0)

  FoodFish(460,120,3,1030,730,1);
  FoodFish(510,120,3,1030,730,1);
  FoodFish(460,170,3,1030,730,1);
  FoodFish(460,60,3,1030,730,1);
  FoodFish(410,120,3,1030,730,1);
  FoodFish(410,170,3,1030,730,1);
  FoodFish(430,100,3,1030,730,1);

  IntroText(160,139,2,411,1); frame(700);
  IntroText(160,180,2,412,1); frame(700);
  IntroText(160,220,2,413,1); frame(700);

  Selector(3); frame(700);
  repeat frame; until(key(_enter) or key(_space))

  repeat frame; until(Selection>0)

  fade(0,0,0,2);
  frame(5000);

  if (Selection==1) Intro(); end
  if (Selection==2) LoadGame(); end
  if (Selection==3) exit("Quit",0); end

end



process TitleScreen2(Mode);
private
  int BkgGraph;
begin
  let_me_alone();
  SystemControl();
  x=160; y=120; z=4;
  if (Mode==1) SongPlayer(14); end
  BkgGraph=map_new(320,240,16);
  map_clear(0,BkgGraph,rgb(0,20,60));
  start_scroll(0,0,BkgGraph,0,0,0);

  fade(100,100,100,2);

  IntroText(132,25,3,260,0);
  IntroText(160,50,3,261,0);

  IntroPicture1(105,90,3,263,0);

  IntroPicture1(185,90,4,271,0);
  IntroPicture2(185,90,3,264,0);

  FoodFish(460,120,3,1030,730,1);
  FoodFish(510,120,3,1030,730,1);
  FoodFish(460,170,3,1030,730,1);
  FoodFish(460,60,3,1030,730,1);
  FoodFish(410,120,3,1030,730,1);
  FoodFish(410,170,3,1030,730,1);
  FoodFish(430,100,3,1030,730,1);

  IntroText(160,139,2,411,1); frame(700);
  IntroText(160,180,2,412,1); frame(700);
  IntroText(160,220,2,413,1); frame(700);

  Selector(3); frame(700);
  repeat frame; until(key(_enter) or key(_space))

  repeat frame; until(Selection>0)

  fade(0,0,0,2);
  frame(5000);

  if (Selection==1) Intro(); end
  if (Selection==2) LoadGame(); end
  if (Selection==3) exit("Quit",0); end

end



process SkipButton2();
begin
  loop
    if (key(_esc))
      fade(0,0,0,16);
      frame(2000);
      TitleScreen2(1);
      frame(700);
      return;
    end
    frame;
  end
end



process IntroText(x,y,z,graph,Mode);
begin
  if (Mode==1)
    alpha=0;
    repeat alpha+=5; frame(25); until(alpha=>255)
  end
  loop frame; end
end



process IntroTextFade(x,y,z,DelayCounter,Mode);
begin
  graph=262;
  repeat DelayCounter--; frame; until(DelayCounter==0)
  repeat x+=4; frame; until(x=>420);
end



process IntroPicture1(x,y,z,graph,Mode);
begin
  alpha=0;
  repeat alpha+=3; frame(50); until(alpha=>255)
  loop frame; end
end



process IntroPicture2(x,y,z,graph,Mode);
begin
  alpha=0;
  repeat alpha+=5; frame(40); until(alpha==255)
  frame(2000);
  if (graph==264); IntroPicture2(x,y,z,265,Mode); end
  if (graph==265); IntroPicture2(x,y,z,266,Mode); end
  if (graph==266); IntroPicture2(x,y,z,267,Mode); end
  if (graph==267); IntroPicture2(x,y,z,268,Mode); end
  if (graph==268); IntroPicture2(x,y,z,269,Mode); end
  if (graph==269); IntroPicture2(x,y,z,270,Mode); end
  repeat alpha-=5; frame(40); until(alpha==0)
  if (graph==269) BonePart(65,-30,8,1); BonePart(305,-30,8,0); end
end



process BonePart(x,y,z,Mode);
begin
  frame(5000); graph=378; flags=Mode;
  repeat
    y++;
    if (Mode==1) x++; end
    if (Mode==0) x--; end
    frame(10);
  until(x==185 and y==90)
  loop frame; end
end



process SaveGame();
begin

  Save[0].SaveDone=1;
  Save[0].Name=Name;
  Save[0].ItemSelect=ItemSelect;
  Save[0].ItemNumber=ItemNumber;
  Save[0].RemoveDarkBlock=RemoveDarkBlock;
  Save[0].PlayerFish=PlayerFish;
  Save[0].KnownPowers=KnownPowers;
  Save[0].FishPower=FishPower;
  Save[0].FriendFish=FriendFish;
  Save[0].FriendFishOrder=FriendFishOrder;
  Save[0].SpawnItem=SpawnItem;
  Save[0].ShellItem=ShellItem;
  Save[0].GelatinumItem=GelatinumItem;
  Save[0].HookItem=HookItem;
  Save[0].EggItem=EggItem;
  Save[0].MapItem=MapItem;
  Save[0].DrumItem=DrumItem;
  Save[0].CollectItem=CollectItem;
  Save[0].Quests=Quests;
  Save[0].RaceWon=RaceWon;
  Save[0].DoIntro=DoIntro;
  Save[0].DarkBringersDone=DarkBringersDone;
  Save[0].FirstStone=FirstStone;
  Save[0].SecondStone=SecondStone;
  Save[0].ThirdStone=ThirdStone;
  Save[0].SunlitDiscover=SunlitDiscover;
  Save[0].CavernsDiscover=CavernsDiscover;
  Save[0].DeepRoadsDiscover=DeepRoadsDiscover;
  Save[0].OceanDiscover=OceanDiscover;
  Save[0].AbyssDiscover=AbyssDiscover;
  Save[0].RaceDiscover=RaceDiscover;
  Save[0].BreederDiscover=BreederDiscover;
  Save[0].RoadsConnectionDiscover=RoadsConnectionDiscover;
  Save[0].SeaRoadsDiscover=SeaRoadsDiscover;
  Save[0].TribeDiscover=TribeDiscover;
  Save[0].BreedingGroundDiscover=BreedingGroundDiscover;
  Save[0].MotherDiscover=MotherDiscover;
  Save[0].MoldConversation=MoldConversation;
  Save[0].FolderMemory=FolderMemory;
  Save[0].FolderMemory2=FolderMemory2;
  Save[0].LimMemory=LimMemory;
  Save[0].BluMemory=BluMemory;
  Save[0].LuddMemory=LuddMemory;
  Save[0].JudgeMemory=JudgeMemory;
  Save[0].EldaMemory=EldaMemory;
  Save[0].BurlMemory=BurlMemory;
  Save[0].ZipMemory=ZipMemory;
  Save[0].DadImpression=DadImpression;
  Save[0].GlumMemory=GlumMemory;
  Save[0].FinnMemory=FinnMemory;
  Save[0].SlugMemory=SlugMemory;
  Save[0].VeolaMemory=VeolaMemory;
  Save[0].SarkMemory=SarkMemory;
  Save[0].StrimMemory=StrimMemory;
  Save[0].GhostFishMemory=GhostFishMemory;
  Save[0].MoistMemory=MoistMemory;
  Save[0].DrumMemory=DrumMemory;
  Save[0].SlugQuest=SlugQuest;
  Save[0].MoistQuest=MoistQuest;
  Save[0].GhostFishQuest=GhostFishQuest;
  Save[0].CollectItemList[0]=CollectItemList[0];
  Save[0].CollectItemList[1]=CollectItemList[1];
  Save[0].CollectItemList[2]=CollectItemList[2];
  Save[0].CollectItemList[3]=CollectItemList[3];
  Save[0].CollectItemList[4]=CollectItemList[4];
  Save[0].CollectItemList[5]=CollectItemList[5];
  Save[0].CollectItemList[6]=CollectItemList[6];
  Save[0].CollectItemList[7]=CollectItemList[7];
  Save[0].CollectItemList[8]=CollectItemList[8];
  Save[0].CollectItemList[9]=CollectItemList[9];
  Save[0].CollectItemList[10]=CollectItemList[10];

  save("save.dat",Save);
end



process LoadGame();
begin

  load("save.dat",Save);

  if (Save[0].SaveDone==0) TitleScreen(0); return; end

  DoIntro=1;
  HPBoostOn=0;
  SneakBoostOn=0;
  NonPlayerFishOn=0;
  ArcadeSeaOn=0;
  DarkArea=0;
  CarryOn=0;
  DarkMotherOn=0;
  DeepTribeOn=0;
  StreamRoomOn=0;
  SwarmJelliconOn=0;
  BlobOn=0;
  OctolingOn=0;
  TotalQuests=13;

  Name=Save[0].Name;
  ItemSelect=Save[0].ItemSelect;
  ItemNumber=Save[0].ItemNumber;
  RemoveDarkBlock=Save[0].RemoveDarkBlock;
  PlayerFish=Save[0].PlayerFish;
  KnownPowers=Save[0].KnownPowers;
  FishPower=Save[0].FishPower;
  FriendFish=Save[0].FriendFish;
  FriendFishOrder=Save[0].FriendFishOrder;
  SpawnItem=Save[0].SpawnItem;
  ShellItem=Save[0].ShellItem;
  GelatinumItem=Save[0].GelatinumItem;
  HookItem=Save[0].HookItem;
  EggItem=Save[0].EggItem;
  MapItem=Save[0].MapItem;
  DrumItem=Save[0].DrumItem;
  CollectItem=Save[0].CollectItem;
  Quests=Save[0].Quests;
  RaceWon=Save[0].RaceWon;
  DoIntro=Save[0].DoIntro;
  DarkBringersDone=Save[0].DarkBringersDone;
  FirstStone=Save[0].FirstStone;
  SecondStone=Save[0].SecondStone;
  ThirdStone=Save[0].ThirdStone;
  SunlitDiscover=Save[0].SunlitDiscover;
  CavernsDiscover=Save[0].CavernsDiscover;
  DeepRoadsDiscover=Save[0].DeepRoadsDiscover;
  OceanDiscover=Save[0].OceanDiscover;
  AbyssDiscover=Save[0].AbyssDiscover;
  RaceDiscover=Save[0].RaceDiscover;
  BreederDiscover=Save[0].BreederDiscover;
  RoadsConnectionDiscover=Save[0].RoadsConnectionDiscover;
  SeaRoadsDiscover=Save[0].SeaRoadsDiscover;
  TribeDiscover=Save[0].TribeDiscover;
  BreedingGroundDiscover=Save[0].BreedingGroundDiscover;
  MotherDiscover=Save[0].MotherDiscover;
  MoldConversation=Save[0].MoldConversation;
  FolderMemory=Save[0].FolderMemory;
  FolderMemory2=Save[0].FolderMemory2;
  LimMemory=Save[0].LimMemory;
  BluMemory=Save[0].BluMemory;
  LuddMemory=Save[0].LuddMemory;
  JudgeMemory=Save[0].JudgeMemory;
  EldaMemory=Save[0].EldaMemory;
  BurlMemory=Save[0].BurlMemory;
  ZipMemory=Save[0].ZipMemory;
  DadImpression=Save[0].DadImpression;
  GlumMemory=Save[0].GlumMemory;
  FinnMemory=Save[0].FinnMemory;
  SlugMemory=Save[0].SlugMemory;
  VeolaMemory=Save[0].VeolaMemory;
  SarkMemory=Save[0].SarkMemory;
  StrimMemory=Save[0].StrimMemory;
  GhostFishMemory=Save[0].GhostFishMemory;
  MoistMemory=Save[0].MoistMemory;
  DrumMemory=Save[0].DrumMemory;
  SlugQuest=Save[0].SlugQuest;
  MoistQuest=Save[0].MoistQuest;
  GhostFishQuest=Save[0].GhostFishQuest;

  CollectItemList[0]=Save[0].CollectItemList[0];
  CollectItemList[1]=Save[0].CollectItemList[1];
  CollectItemList[2]=Save[0].CollectItemList[2];
  CollectItemList[3]=Save[0].CollectItemList[3];
  CollectItemList[4]=Save[0].CollectItemList[4];
  CollectItemList[5]=Save[0].CollectItemList[5];
  CollectItemList[6]=Save[0].CollectItemList[6];
  CollectItemList[7]=Save[0].CollectItemList[7];
  CollectItemList[8]=Save[0].CollectItemList[8];
  CollectItemList[9]=Save[0].CollectItemList[9];
  CollectItemList[10]=Save[0].CollectItemList[10];

  PlayerHP=1000;

  if (MapItem==0) Area1(53,605,1); return; end
  if (SarkMemory>0) SarkMemory=3; LimMemory=9; Area38(448,1260,1); return; end
  Area5(500,450,1);
end



process Intro();
private
  int DelayCounter;
begin

  let_me_alone();
  PlayerFish=0;
  ArcadeSeaOn=0;
  RemoveDarkBlock=0;
  KnownPowers=1;
  DarkArea=0;
  CarryOn=0;
  DarkMotherOn=0;
  DeepTribeOn=0;
  StreamRoomOn=0;
  SwarmJelliconOn=0;
  BlobOn=0;
  OctolingOn=0;
  NonPlayerFishOn=0;
  Quests=1;
  TotalQuests=13;
  RaceWon=0;
  DoIntro=0;
  DarkBringersDone=0;
  FriendFish=0;
  FriendFishOrder=1;
  SpawnItem=0;
  ShellItem=0;
  GelatinumItem=0;
  HookItem=0;
  EggItem=0;
  MapItem=0;
  DrumItem=0;
  CollectItem=0;
  FirstStone=0;
  SecondStone=0;
  ThirdStone=0;
  SunlitDiscover=0;
  CavernsDiscover=0;
  DeepRoadsDiscover=0;
  OceanDiscover=0;
  AbyssDiscover=0;
  RaceDiscover=0;
  BreederDiscover=0;
  RoadsConnectionDiscover=0;
  SeaRoadsDiscover=0;
  TribeDiscover=0;
  BreedingGroundDiscover=0;
  MotherDiscover=0;
  MoldConversation=0;
  FolderMemory=0;
  FolderMemory2=0;
  LimMemory=0;
  BluMemory=0;
  LuddMemory=0;
  JudgeMemory=0;
  EldaMemory=0;
  BurlMemory=0;
  ZipMemory=0;
  DadImpression=0;
  GlumMemory=0;
  FinnMemory=0;
  SlugMemory=0;
  VeolaMemory=0;
  SarkMemory=0;
  StrimMemory=0;
  GhostFishMemory=0;
  MoistMemory=0;
  DrumMemory=0;
  SlugQuest=0;
  MoistQuest=0;
  GhostFishQuest=0;
  PlayerHP=0;
  HPBoostOn=0;

  CollectItemList[0]=0;
  CollectItemList[1]=0;
  CollectItemList[2]=0;
  CollectItemList[3]=0;
  CollectItemList[4]=0;
  CollectItemList[5]=0;
  CollectItemList[6]=0;
  CollectItemList[7]=0;
  CollectItemList[8]=0;
  CollectItemList[9]=0;
  CollectItemList[10]=0;

  fade(100,100,100,4);
  x=160; y=120; z=0; graph=421; alpha=0;
  repeat alpha+=4; frame; until(alpha=>255)
  repeat frame; until(key(_enter) or key(_space) or key(_esc))
  repeat alpha-=4; frame; until(alpha<=0)
  frame(2000);

  x=160; y=120; z=0; graph=419;
  repeat alpha+=4; frame; until(alpha=>255)
  frame(5000); frame(5000); frame(2000);
  repeat alpha-=4; frame; until(alpha<=0)
  frame(2000);
  alpha=255;

  x=160; y=360; z=0; graph=417;

  SongPlayer(13);

  fade(0,0,0,64);
  Area5(160,600,0);
  fade(100,100,100,1);

  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==500)
  FadeBkg(0);
  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==40)
  let_me_alone();
  FadeBkg(1);
  Area38(160,1300,0);

  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==500)
  FadeBkg(0);
  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==40)
  let_me_alone();
  FadeBkg(1);
  x=160; y=380; z=0; graph=418;
  Area19(160,180,0);

  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==500)
  FadeBkg(0);
  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==40)
  let_me_alone();
  FadeBkg(1);
  Area21(160,400,0);
  fade(100,100,100,1);

  DelayCounter=0;
  repeat DelayCounter++; if (DelayCounter%2==0) y--; end frame; until(DelayCounter==500)
  FadeBkg(0);
  frame(5000); frame(5000);
  CharSelect();

end



process FadeBkg(Mode);
begin
  x=160; y=120; z=1; graph=225; flags=32;
  if (Mode==0)
    alpha=0;
    repeat alpha+=4; frame; until(alpha=>255)
    alpha=255;
  end
  if (Mode==1)
    alpha=255;
    repeat alpha-=4; frame; until(alpha<=0)
    return;
  end
  loop frame; end
end



process IntroCamera(x,y);
begin
  ctype=c_scroll; scroll.camera=id;
  frame(3000);
  loop x++; frame; end
end



process CharSelect();
private
  int Select;
  int EnterText;
  int NameText;
  int LetterNumber;
  int FadeCounter;
  int ScrollGraph;
begin

  let_me_alone();
  SystemControl();
  SongPlayer(7);

  ScrollGraph=map_new(320,240,16);
  map_clear(0,ScrollGraph,rgb(0,20,60));
  start_scroll(0,0,ScrollGraph,0,0,0);

    Select=0; LetterNumber=0;
    set_text_color(rgb(255,0,0));
    EnterText=write(0,175,30,3,symbols[Select]);
    set_text_color(rgb(255,255,255));
    write(0,90,30,3,"Enter Name : ");

    AnimateMenuFish(70,80,4,1);
    AnimateMenuFish(130,80,4,2);
    AnimateMenuFish(190,80,4,3);
    AnimateMenuFish(250,80,4,4);

    repeat
      if (key(_up))
        Select++;
        if (Select==-1) Select=36; end
        if (Select==37) Select=0; end
        delete_text(0);
        set_text_color(rgb(255,255,255));
        write(0,90,30,3,"Enter Name : ");
        NameText=write(0,175,30,3,Name);
        set_text_color(rgb(255,0,0));
        EnterText=write(0,175+(LetterNumber*8),30,3,Symbols[Select]);
        frame; frame; frame;
      end
      if (key(_down))
        Select--;
        if (Select==-1) Select=36; end
        if (Select==37) Select=0; end
        delete_text(0);
        set_text_color(rgb(255,255,255));
        write(0,90,30,3,"Enter Name : ");
        NameText=write(0,175,30,3,Name);
        set_text_color(rgb(255,0,0));
        EnterText=write(0,175+(LetterNumber*8),30,3,Symbols[Select]);
        frame; frame; frame;
      end
      if (key(_right) or key(_control))
        LetterNumber++;
        Name+=Symbols[Select];
        delete_text(0);
        set_text_color(rgb(255,255,255));
        write(0,90,30,3,"Enter Name : ");
        NameText=write(0,175,30,3,Name);
        set_text_color(rgb(255,0,0));
        EnterText=write(0,175+(LetterNumber*8),30,3,symbols[Select]);
        frame; frame; frame;
      end
      if (key(_left) and LetterNumber>0)
        LetterNumber=0;
        Name="";
        delete_text(0);
        set_text_color(rgb(255,255,255));
        write(0,90,30,3,"Enter Name : ");
        NameText=write(0,175,30,3,Name);
        set_text_color(rgb(255,0,0));
        EnterText=write(0,175+(LetterNumber*8),30,3,symbols[Select]);
        frame; frame; frame;
      end
      frame;
    until (key(_enter) or LetterNumber==6);

    delete_text(EnterText);
    if (Name==""); Name="PLAYER"; end
    frame(700);
    graph=16; x=70; y=80; z=3; Select=1;
    FishInfo();
    repeat
      if (key(_right)) Select++; end
      if (key(_left)) Select--; end

      if (key(_esc)) Name=""; CharSelect(); end

      if (Select==5) Select=1; end
      if (Select==-1) Select=5; end

      Control=Select;

      if (Select==1)
        repeat
          if (x>70) x--; end
          frame(10);
        until(x==70)
      end
      if (Select==2)
        repeat
          if (x<130) x++; end
          if (x>130) x--; end
          frame(10);
        until(x==130)
      end
      if (Select==3)
        repeat
          if (x<190) x++; end
          if (x>190) x--; end
          frame(10);
        until(x==190)
      end
      if (Select==4)
        repeat
          if (x<250) x++; end
          if (x>250) x--; end
          frame(10);
        until(x==250)
      end
      frame;
    until (key(_enter));

    PlayerFish=Select;
    set_text_color(rgb(255,255,255));
    delete_text(0);
    signal(type AnimateMenuFish, s_kill);
    signal(type FishInfo, s_kill);
    PlayerHP=1000;
    Area1(53,605,1);
end



process FishInfo();
begin
  x=160; y=160; z=2;
  loop
    if (father.Control==1) graph=19; end
    if (father.Control==2) graph=20; end
    if (father.Control==3) graph=21; end
    if (father.Control==4) graph=22; end
    frame;
  end
end



process AnimateMenuFish(x,y,z,Mode);
private
  int AnimationCounter;
begin
  loop
    AnimationCounter++;
    if (Mode==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=1; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=2; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=3; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=2; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=4; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=5; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=6; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=5; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=9; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=17; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=18; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=17; end
      if (AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==16) graph=9; end
      if (AnimationCounter==17 or AnimationCounter==18 or AnimationCounter==19) graph=8; end
      if (AnimationCounter==20 or AnimationCounter==21 or AnimationCounter==22) graph=7; end
      if (AnimationCounter==23 or AnimationCounter==24 or AnimationCounter==25) graph=8; end
      if (AnimationCounter==26) AnimationCounter=0; end
    end
    if (Mode==4)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=10; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=11; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=12; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=11; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    frame(150);
  end
end



process Area1(x,y,PlaySong);  // Mothercave
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; BlobOn=1;
  fade(100,100,100,4);

  if (PlaySong==1) SongPlayer(11); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  MiniBlob(500,270,4,27);
  MiniBlob(350,330,4,28);

  MiniBlob(340,370,4,27);
  MiniBlob(590,490,4,28);

  MiniBlob(470,430,4,27);
  MiniBlob(490,370,4,28);

  Blob(530,300,4);
  Blob(300,360,4);
  Blob(480,440,4);

  Microbe(720,310,6,1);

  BounceAmoeba(891,148,5,310000,15,1);
  BounceAmoeba(832,52,5,145000,15,1);

  SingleNonPlayerFish(155,610,4,21);
  SingleNonPlayerFish(413,536,4,22);
  SingleNonPlayerFish(890,441,4,23);
  SingleNonPlayerFish(80,164,4,24);
  SingleNonPlayerFish(782,85,4,25);

  LevelScroll(23,0,225,12);
  LevelCheckID=LevelCheck(500,350,14,23);
  LevelForeground(500,350,3,24);

  if (CollectItemList[0]==0)
    CollectItem(950,527,4,0);
  end

  frame(300);

  if (DoIntro==0)
    GillIntro1(128,588,4,0);

    MumDialog(0);
    repeat frame; until(exists(type MumDialog)==0)

    frame(4000);

    GillIntroDialog(0);
    repeat frame; until(exists(type GillIntroDialog)==0)
    DoIntro=1;
  end

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,990),710,100); BubbleCounter=0; end
    if (PlayerX>878 and PlayerY<0) Area2(20,480,0); end
    if (PlayerX>1000 and PlayerY<62) Area2(20,480,0); end
    frame;
  end
end




process GillIntro1(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int BounceCounter;
begin
  ctype=c_scroll; graph=40; flags=1;

  repeat frame; until(exists(type MumDialog)==0)
  frame(200);
  repeat frame; until(exists(type GillIntroDialog)==0)
  flags=0;

  repeat
    TempAngle=fget_angle(x,y,257,502);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,257,502)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,732,467);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,732,467)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,834,115);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,834,115)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,1020,-20);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,1020,-20)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)
end




process Area2(x,y,PlaySong);  // Road to Spipreef
private
  int BubbleCounter;
  int GelollynomCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; StreamRoomOn=0; ArcadeSeaOn=0; BlobOn=1;

  if (PlaySong==1) SongPlayer(11); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  LevelScroll(42,0,225,12);
  LevelCheckID=LevelCheck(500,350,14,42);
  LevelForeground(500,350,3,43);

  SpinePlant(470,548,6,0);

  MiniBlob(850,445,4,27);
  MiniBlob(750,450,4,28);
  Blob(803,445,4);

  FoodFish(260,130,3,1030,730,0);
  FoodFish(230,130,3,1030,730,0);
  FoodFish(300,150,3,1030,730,0);
  FoodFish(260,90,3,1030,730,0);
  FoodFish(250,100,3,1030,730,0);
  FoodFish(290,160,3,1030,730,0);
  FoodFish(300,120,3,1030,730,0);

  ConfuseAmoeba(733,527,5,1);
  ConfuseAmoeba(871,354,5,2);
  ConfuseAmoeba(723,258,5,1);

  frame(300);

  if (DoIntro==1)
    GillIntro2(60,480,4,0);
    GillIntroDialog2(0);
    repeat frame; until(exists(type GillIntroDialog2)==0)
    DoIntro=2;
  end

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,990),710,100); BubbleCounter=0; end
    GelollynomCounter++;
    if (GelollynomCounter==200) Gelollynoms(-30,0+rand(0,100),3,1050,rand(1,3)); GelollynomCounter=0; end
    if (PlayerX<0 and PlayerY>435 and PlayerY<522) Area1(965,30,0); end
    if (PlayerY>700 and PlayerX>796 and PlayerX<952) Area3(125,25,0); end
    if (PlayerX<0 and PlayerY>0 and PlayerY<43) Area4(785,80,0); end
    if (PlayerY<0 and PlayerX>0 and PlayerX<142) Area4(785,80,0); end
    if (PlayerY<0 and PlayerX>787 and PlayerX<1000) Area10(25,305,0); end
    if (PlayerX>1000 and PlayerY>0 and PlayerY<32) Area10(25,305,0); end
    frame;
  end
end



process GillIntro2(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int BounceCounter;
begin
  ctype=c_scroll; graph=40; flags=1;

  repeat frame; until(exists(type GillIntroDialog2)==0)
  flags=0;

  repeat
    TempAngle=fget_angle(x,y,279,489);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,279,489)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,652,458);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,652,458)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,766,273);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,766,273)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,800,60);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,800,60)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,1010,-40);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,1010,-40)<20)

  angle=0;
  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)

end



process Area3(x,y,PlaySong);  // Ancient Stone
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; DoIntro=3; BlobOn=0;

  if (PlaySong==1) SongPlayer(11); end

  Song=load_song("Music/Oppression.ogg"); play_song(Song,99);

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  LevelScroll(44,0,227,12);
  LevelCheckID=LevelCheck(235,180,14,44);
  OppressiveEffect(235,180,3,44);

  frame(300);

  loop
    if (PlayerY>100 and FirstStone==0) FirstStoneMessage(); FirstStone=1; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,480),380,100); BubbleCounter=0; end
    if (PlayerX>23 and PlayerX<196 and PlayerY<0) Area2(865,680,1); end
    frame;
  end
end



process Area4(x,y,PlaySong);  // Spipreef Tunnel
private
  int BubbleCounter;
  int ColorCounter;
  int GelollynomCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; DoIntro=3; BlobOn=0;

  if (PlaySong==1) SongPlayer(11); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  LevelScroll(46,0,225,12);
  LevelCheckID=LevelCheck(400,120,14,46);
  LevelForeground(400,120,3,47);

  Eelhost(150,120,4,0);
  Eelhost(380,150,4,0);
  Eelhost(620,90,4,0);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,800),250,100); BubbleCounter=0; end
    GelollynomCounter++;
    if (GelollynomCounter==200) Gelollynoms(-30,0+rand(0,100),3,450,rand(1,3)); GelollynomCounter=0; end
    if (PlayerX>800) Area2(55,20,0); end
    if (PlayerX<0) Area35(341,170,0); end
    frame;
  end
end




process Area5(x,y,PlaySong);  // Spipreef
private
  int BubbleCounter;
  int SpipCounter;
begin

  if (PlayerFish>0) let_me_alone(); end
  SystemControl();

  DarkArea=0; NonPlayerFishOn=1; fade(100,100,100,4);
  LocationX=125; LocationY=109;

  if (PlaySong==1) SongPlayer(1); end

  if (PlayerFish==0) PlayerID=IntroCamera(x,y); end
  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(52,0,225,12);
  LevelCheckID=LevelCheck(500,350,14,52);
  LevelForeground(500,350,3,53);

  SpipAura(405,670,11);
  SpipAura(473,675,11);
  SpipAura(598,673,11);
  SpipAura(701,665,11);

  if (MoldConversation!=7) NonPlayerFish(450,220,4,1); end  //Mold
  NonPlayerFish(480,260,4,2);
  NonPlayerFish(620,400,4,3);
  if (GlumMemory!=3) NonPlayerFish(450,350,4,4); end //Glum
  NonPlayerFish(380,440,4,5);
  NonPlayerFish(580,500,4,6);

  SingleNonPlayerFish(308,68,4,18);
  SingleNonPlayerFish(168,108,4,19);
  SingleNonPlayerFish(197,56,4,20);

  SingleNonPlayerFish(465,173,4,2);
  SingleNonPlayerFish(880,230,4,3);
  SingleNonPlayerFish(155,475,4,4);

  if (FriendFish!=1) SingleNonPlayerFish(377,610,4,15); end
  if (FriendFish!=2) SingleNonPlayerFish(139,158,4,16); end
  if (FriendFish!=3 and SlugQuest!=3) SingleNonPlayerFish(828,570,4,17); end

  if (BluMemory=>4) SingleNonPlayerFish(210,575,4,6); end

  if (MoistQuest==6 or MoistQuest==7) SingleNonPlayerFish(705,345,4,28); end

  if (CollectItemList[1]==0)
    CollectItem(915,488,4,1);
  end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,990),710,100); BubbleCounter=0; end
    SpipCounter++;
    if (SpipCounter==20) SpipOrb(380,725,rand(650,680),1); SpipCounter=0; end
    if (PlayerY<0 and PlayerX>481 and PlayerX<650) Area6(330,595,0); end
    if (PlayerX<0 and PlayerY>613 and PlayerY<700) Area37(236,59,0); end
    if (PlayerY>700 and PlayerX>0 and PlayerX<114) Area37(236,59,0); end
    frame;
  end
end




process Area6(x,y,PlaySong);  // Spipreef Gateway
private
  int BubbleCounter;
  int MoveCounter;
  int SpipCounter;
begin

  frame;
  let_me_alone();
  SystemControl();

  DarkArea=0; NonPlayerFishOn=0;
  LocationX=124; LocationY=83; OctolingOn=0;

  if (PlaySong==1) SongPlayer(1); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(72,0,225,12);
  LevelCheckID=LevelCheck(345,307,14,72);
  LevelForeground(345,307,3,73);

  LightKrill(222,206,50,4,0);
  LightKrill(202,206,50,4,0);
  LightKrill(222,226,50,4,0);
  LightKrill(222,226,50,4,0);
  LightKrill(202,226,50,4,0);

  SpinePlant(442,592,6,0);

  ConfuseAmoeba(469,132,5,1);
  ConfuseAmoeba(507,100,5,2);
  ConfuseAmoeba(515,171,5,1);

  ConfuseAmoeba(559,200,5,1);
  ConfuseAmoeba(481,208,5,2);
  ConfuseAmoeba(437,177,5,1);

  ConfuseAmoeba(527,237,5,1);
  ConfuseAmoeba(471,83,5,2);
  ConfuseAmoeba(427,95,5,1);

  SingleNonPlayerFish(540,135,4,27);

  ctype=c_scroll; graph=91; x=348; y=324; z=2;  //SpipSeed

  frame(300);

  loop
    MoveCounter++;
    if (MoveCounter>0 and MoveCounter<15) if (MoveCounter%2==0) y--; end end
    if (MoveCounter>15 and MoveCounter<30) if (MoveCounter%2==0) y++; end end
    if (MoveCounter==30) MoveCounter=0; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,680),620,100); BubbleCounter=0; end
    SpipCounter++;
    if (SpipCounter==40) SpipOrb(145,265,rand(550,570),1); SpipCounter=0; end
    if (PlayerX>290 and PlayerX<384 and PlayerY>614) Area5(560,15,0); end
    if (PlayerX>690 and PlayerY>270 and PlayerY<343) Area7(15,375,1); end
    if (PlayerX<0 and PlayerY>272 and PlayerY<341) Area18(770,922,1); end
    if (PlayerY<0 and PlayerX>288 and PlayerX<385) Area41(146,968,1); end
    frame;
  end
end



process Area7(x,y,PlaySong);  // Road to Gelatinum Caverns
private
  int BubbleCounter;
  int GelollynomCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; SwarmJelliconOn=0; CavernsDiscover=1; OctolingOn=1;
  LocationX=162; LocationY=82;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(76,0,225,12);
  LevelCheckID=LevelCheck(675,321,14,74);
  LevelForeground(675,321,3,75);

  Octoling(256,329,4,1,0);

  Octoling(547,420,4,0,75);
  Octoling(535,254,4,3,25);
  Octoling(627,254,4,3,50);

  Octoling(1012,251,4,4,1);
  Octoling(838,252,4,4,1);

  GasSpawner(500,454,4,0);
  GasSpawner(599,454,4,0);
  GasSpawner(1195,456,4,0);

  GhostfishHunter(556,132,4,200,60,0);
  GhostfishHunter(1010,136,4,200,60,0);

  AquaMine(774,430,4,0);
  AquaMine(1080,340,4,0);
  AquaMine(1146,300,4,0);
  AquaMine(1146,375,4,0);
  AquaMine(980,336,4,0);

  if (MoistQuest==0) SingleNonPlayerFish(240,50,4,28); end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1340),660,100); BubbleCounter=0; end
    GelollynomCounter++;
    if (GelollynomCounter==200) Gelollynoms(-30,0+rand(0,100),3,1360,rand(1,3)); GelollynomCounter=0; end
    if (PlayerX<0 and PlayerY>307 and PlayerY<436) Area6(670,310,1); end
    if (PlayerX>1350 and PlayerY>281 and PlayerY<381) Area8(15,485,0); end
    if (PlayerY>642 and PlayerX>367 and PlayerX<473) Area12(92,27,1); end
    frame;
  end
end



process Area8(x,y,PlaySong);  // Gelatinum Caverns Entry
private
  int BubbleCounter;
  int SpipCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; SwarmJelliconOn=1; OctolingOn=0;
  LocationX=197; LocationY=70;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(77,0,225,12);
  LevelCheckID=LevelCheck(350,300,14,77);
  LevelForeground(350,300,3,78);

  SwarmJellicon(200,320,4,0,0,1,2);
  SwarmJellicon(250,370,4,50,0,0,1);
  SwarmJellicon(300,320,4,100,0,0,1);
  SwarmJellicon(250,270,4,150,0,0,1);

  SwarmJellicon(350,470,4,0,150,0,1);
  SwarmJellicon(400,520,4,50,150,0,1);
  SwarmJellicon(450,470,4,100,150,1,1);
  SwarmJellicon(400,420,4,150,150,0,1);

  SwarmJellicon(500,320,4,0,300,0,1);
  SwarmJellicon(550,370,4,50,300,1,1);
  SwarmJellicon(600,320,4,100,300,0,1);
  SwarmJellicon(550,270,4,150,300,0,1);

  SwarmJellicon(350,170,4,0,450,0,1);
  SwarmJellicon(400,220,4,50,450,0,1);
  SwarmJellicon(450,170,4,100,450,0,1);
  SwarmJellicon(400,120,4,150,450,1,1);

  CarryJellicon(173,94,5,7);

  frame(300);

  loop
    SpipCounter++;
    if (SpipCounter==40) SpipOrb(553,610,rand(540,580),1); SpipCounter=0; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,710),610,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>466 and PlayerY<502) Area7(1335,335,0); end
    if (PlayerX>700 and PlayerY>0 and PlayerY<41) Area9(20,112,0); end
    if (PlayerY<0 and PlayerX>662 and PlayerX<700) Area9(20,112,0); end
    frame;
  end
end



process Area9(x,y,PlaySong);  // Gelatinum Tunnels
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; CarryOn=0; SwarmJelliconOn=0;
  LocationX=222; LocationY=62;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(81,0,225,12);
  LevelCheckID=LevelCheck(400,120,14,79);
  LevelForeground(400,120,3,80);

  PoisonTricker(192,204,5,0);
  PoisonTricker(420,204,5,1);

  AquaMine(430,35,4,0);
  AquaMine(520,35,4,0);

  JelliconPillar(300,248,2,0);
  JelliconPillar(600,248,2,0);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),250,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>78 and PlayerY<142) Area8(680,22,0); end
    if (PlayerY<0 and PlayerX>455 and PlayerX<499) Area11(260,285,0); end
    if (PlayerX>800 and PlayerY>104 and PlayerY<156) Area15(25,215,0); end
    frame;
  end
end




process Area10(x,y,PlaySong);  // Arcade Sea 1
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; ArcadeSeaOn=1; StreamRoomOn=1; BlobOn=1;

  if (PlaySong==1) SongPlayer(11); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  LevelScroll(89,0,226,12);
  LevelCheckID=LevelCheck(400,300,14,89);

  Blob(630,100,4);
  Blob(200,520,4);

  MiniBlob(620,90,4,27);
  MiniBlob(640,110,4,28);

  MiniBlob(190,510,4,27);
  MiniBlob(210,530,4,28);

  BounceAmoeba(205,385,5,90000,17,1);
  BounceAmoeba(205,85,5,180000,17,2);
  BounceAmoeba(290,80,5,90000,17,3);
  BounceAmoeba(290,210,5,180000,16,1);
  BounceAmoeba(190,210,5,135000,17,2);
  BounceAmoeba(300,300,5,180000,16,3);
  BounceAmoeba(400,290,5,270000,16,1);
  BounceAmoeba(390,200,5,225000,16,2);
  BounceAmoeba(490,110,5,90000,16,3);
  BounceAmoeba(490,210,5,90000,16,1);
  BounceAmoeba(480,290,5,90000,16,2);
  BounceAmoeba(490,390,5,180000,16,3);
  BounceAmoeba(610,400,5,225000,17,1);
  BounceAmoeba(710,310,5,270000,16,2);

  FoodFish(550,380,3,1030,730,0);
  FoodFish(500,380,3,1030,730,0);
  FoodFish(600,380,3,1030,730,0);
  FoodFish(550,430,3,1030,730,0);
  FoodFish(550,330,3,1030,730,0);
  FoodFish(570,340,3,1030,730,0);
  FoodFish(540,320,3,1030,730,0);

  ArcadeCounter();

  frame(300);

  if (DoIntro==2)
    GillIntro3(25,300,4,0);
    DoIntro=3;
  end

  loop
    if (rand(1,6)==1) SuckEffect(710+rand(-10,10),70+rand(-10,10),3,2); SuckObject2(680+rand(-50,50),110+rand(-50,50),3,799,1,0); end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),610,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>267 and PlayerY<336) Area2(840,29,0); end
    frame;
  end
end




process GillIntro3(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int BounceCounter;
begin
  ctype=c_scroll; graph=40;


  repeat
    TempAngle=fget_angle(x,y,150,220);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,150,220)<20)

  repeat
    TempAngle=fget_angle(x,y,296,53);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,296,53)<20)

  repeat
    TempAngle=fget_angle(x,y,752,43);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,752,43)<20)

  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)


  repeat
    TempAngle=fget_angle(x,y,820,-20);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,820,-20)<20)
end




process Area11(x,y,PlaySong);  // Gelatinum Prison
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0;
  LocationX=222; LocationY=49;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(92,0,225,12);
  LevelCheckID=LevelCheck(250,150,14,92);
  LevelForeground(250,150,3,93);

  if (BluMemory<2) SingleNonPlayerFish(380,160,3,5); end
  if (BluMemory<4) SingleNonPlayerFish(380,156,4,6); end

  if (CollectItemList[2]==0)
    CollectItem(65,178,4,2);
  end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,510),310,100); BubbleCounter=0; end
    if (PlayerY>300 and PlayerX>216 and PlayerX<315) Area9(475,20,0); end
    frame;
  end
end



process Area12(x,y,PlaySong);  // Deep Road Tunnel
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1; OctolingOn=0;
  LocationX=159; LocationY=112;
  if (DeepRoadsDiscover==0) DeepRoadsDiscover=1; NewArea(160,40,1,439); end

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(94,0,227,12);
  LevelCheckID=LevelCheck(170,400,14,94);
  LevelForeground(170,400,3,95);

  LightSource(271,200,3,96,1);
  LightSource(53,351,3,96,1);
  LightSource(105,540,3,96,1);
  LightSource(31,622,3,96,1);
  LightSource(325,627,3,96,1);
  LightSource(110,720,3,96,1);

  Eelhost(100,440,4,0);

  if (MoistQuest==1) SingleNonPlayerFish(276,495,4,28); end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,350),810,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>0 and PlayerX<165) Area7(405,623,1); end
    if (PlayerX<0 and PlayerY>0 and PlayerY<28) Area7(405,623,1); end
    if (PlayerY>800 and PlayerX>160 and PlayerX<305) Area13(220,25,0); end
    frame;
  end
end




process Area13(x,y,PlaySong);  // Deep Road Darkbringer Junction
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  LocationX=162; LocationY=139;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(108,0,227,12);
  LevelCheckID=LevelCheck(300,350,14,108);
  LevelForeground(300,350,3,109);

  LightSource(126,40,3,96,1);
  LightSource(76,121,3,96,1);
  LightSource(349,90,3,96,1);
  LightSource(488,31,3,96,1);

  if (DarkBringersDone==0);
    Darkbringer(268,333,4,0);
    Darkbringer(256,359,4,0);
    Darkbringer(279,322,4,0);
    Darkbringer(297,347,4,0);
    Darkbringer(313,371,4,0);
    Darkbringer(325,315,4,0);
    Darkbringer(333,357,4,0);
  end

  if (CollectItemList[3]==0)
    CollectItem(160,402,4,3);
  end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,610),710,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>144 and PlayerX<285) Area12(221,776,0); end
    if (PlayerY>700 and PlayerX>344 and PlayerX<459) Area14(101,20,0); end
    if (PlayerX>600 and PlayerY>258 and PlayerY<376) Area26(25,312,0); end
    frame;
  end
end




process Area14(x,y,PlaySong);  // Deep Road Dungeon
private
  int BubbleCounter;
  int GelollynomCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DeepTribeOn=0;
  LocationX=181; LocationY=166;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(110,0,227,12);
  LevelCheckID=LevelCheck(600,300,14,110);
  LevelForeground(600,300,3,111);

  LightSource(42,27,3,96,1);
  LightSource(25,202,3,96,1);

  GhostfishHunter(774,170,4,200,70,1);

  DarkbringerLurker(564,285,4,300,1);

  AquaMineBall(140,400,4,0);
  AquaMineBall(1010,340,4,0);

  PoisonTricker(990,556,5,0);

  if (CollectItemList[4]==0)
    CollectItem(525,231,4,4);
  end

  frame(300);

  loop
    GelollynomCounter++;
    if (GelollynomCounter==200) Gelollynoms2(700,50+rand(0,1100),3,rand(1,3)); GelollynomCounter=0; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1210),610,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>61 and PlayerX<138) Area13(400,660,0); end
    if (PlayerX>1200 and PlayerY>512 and PlayerY<590) Area19(25,50,0); end
    if (PlayerX>1200 and PlayerY>32 and PlayerY<143) Area25(117,566,1); end
    frame;
  end
end



process Area15(x,y,PlaySong);  // Gelatinum Caverns Processing Room
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; CarryOn=1; SwarmJelliconOn=1;
  LocationX=248; LocationY=60;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(119,0,225,12);
  LevelCheckID=LevelCheck(400,250,14,118);

  SwarmJellicon(550,110,4,0,0,1,0);
  SwarmJellicon(600,160,4,50,0,0,0);
  SwarmJellicon(650,110,4,100,0,0,0);
  SwarmJellicon(600,60,4,150,0,0,0);

  CarryJellicon(850,205,5,3);
  CarryJellicon(910,205,5,4);
  CarryJellicon(670,360,5,5);

  GasSpawner(420,405,4,0);
  GasSpawner(475,405,4,0);
  GasSpawner(260,405,4,0);
  GasSpawner(200,405,4,0);

  JelliconPillar(300,248,2,0);
  JelliconPillar(600,248,2,0);

  if (CollectItemList[5]==0)
    CollectItem(475,73,4,5);
  end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),510,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>158 and PlayerY<260) Area9(780,130,0); end
    if (PlayerX>800 and PlayerY>146 and PlayerY<257) Area16(20,322,0); end
    frame;
  end
end



process Area16(x,y,PlaySong);  // Gelatinum Caverns Ore Nodes
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; CarryOn=1; SwarmJelliconOn=1; OctolingOn=0;
  LocationX=275; LocationY=61;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(121,0,225,12);
  LevelCheckID=LevelCheck(350,250,14,120);

  SwarmJellicon(170,180,4,0,0,1,0);
  SwarmJellicon(220,230,4,50,0,0,0);
  SwarmJellicon(270,180,4,100,0,0,0);
  SwarmJellicon(220,130,4,150,0,0,0);

  SwarmJellicon(470,180,4,0,0,1,0);
  SwarmJellicon(520,230,4,50,0,0,0);
  SwarmJellicon(570,180,4,100,0,0,0);
  SwarmJellicon(520,130,4,150,0,0,0);

  CarryJellicon(310,210,5,1);
  CarryJellicon(480,260,5,2);
  CarryJellicon(585,260,5,6);

  JelliconPillar(300,248,2,0);
  JelliconPillar(600,248,2,0);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,710),510,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>282 and PlayerY<363) Area15(758,207,0); end
    if (PlayerY<0 and PlayerX>274 and PlayerX<369) Area17(180,674,0); end
    if (PlayerX>700 and PlayerY>137 and PlayerY<222) Area39(25,140,0); end
    frame;
  end
end



process Area17(x,y,PlaySong);  // Gelatinum Sea Roads
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; CarryOn=0; SwarmJelliconOn=0; SeaRoadsDiscover=1;
  LocationX=247; LocationY=37; OctolingOn=1;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(127,0,226,12);
  LevelCheckID=LevelCheck(350,350,14,127);
  LevelForeground(350,350,3,128);

  GasSpawner(483,634,4,0);
  GasSpawner(552,634,4,0);
  GasSpawner(129,330,4,0);
  GasSpawner(237,330,4,0);

  Octoling(117,596,4,0,50);
  Octoling(117,395,4,2,50);
  Octoling(260,391,4,4,1);

  AquaMineBall(182,498,4,0);

  Octoling(445,600,4,1,50);
  Octoling(517,600,4,1,40);
  Octoling(583,600,4,1,30);

  Eelhost(270,200,4,0);

  AquaMineBall(430,270,4,0);
  AquaMineBall(570,270,4,0);

  Octoling(502,93,4,2,50);
  Octoling(182,92,4,4,1);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,710),610,100); BubbleCounter=0; end
    if (PlayerY>700 and PlayerX>141 and PlayerX<220) Area16(325,19,0); end
    if (PlayerX<0 and PlayerY>140 and PlayerY<219) Area40(476,533,1); end
    frame;
  end
end



process Area18(x,y,PlaySong);  // Road to Sunlit Sea
private
  int BubbleCounter;
  int SpipCounter;
  int RayCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; BlobOn=0;
  LocationX=97; LocationY=64;
  if (SunlitDiscover==0) SunlitDiscover=1; NewArea(160,40,1,438); end

  if (PlaySong==1) SongPlayer(5); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(133,0,226,12);
  LevelCheckID=LevelCheck(400,500,14,132);
  LevelForeground(400,500,3,134);

  Eelhost(360,863,4,0);

  FoodFish(370,410,3,830,1030,0);
  FoodFish(350,430,3,830,1030,0);
  FoodFish(380,450,3,830,1030,0);
  FoodFish(400,390,3,830,1030,0);
  FoodFish(340,420,3,830,1030,0);

  SpinePlant(302,200,6,0);

  SingleNonPlayerFish(120,890,4,26);

  if (MoistQuest==2) SingleNonPlayerFish(290,454,4,28); end

  if (CollectItemList[6]==0)
    CollectItem(135,778,4,6);
  end

  frame(300);

  loop
    SpipCounter++;
    if (SpipCounter==40) SpipOrb(440,484,rand(245,250),1); SpipCounter=0; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),1010,100); BubbleCounter=0; end
    RayCounter++;
    if (RayCounter==200) StingRay(-50,0+rand(0,100),3,850,rand(0,1)); RayCounter=0; end
    if (PlayerX>800 and PlayerY>885 and PlayerY<958) Area6(20,305,1); end
    if (PlayerX<0 and PlayerY>55 and PlayerY<129) Area21(965,278,0); end
    frame;
  end
end




process Area19(x,y,PlaySong);  // Deep Road Garden
private
  int BubbleCounter;
  int SpipCounter;
begin

  if (PlayerFish>0) let_me_alone(); end
  SystemControl();

  DarkArea=1;
  DarkBlockOn=1;
  LocationX=225; LocationY=186;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==0) PlayerID=IntroCamera(x,y); end
  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(136,0,227,12);
  LevelCheckID=LevelCheck(400,250,14,135);
  LevelForeground(400,250,3,137);

  LightSource(21,157,3,96,1);
  LightSource(571,149,3,96,1);
  LightSource(536,417,3,96,1);

  BroodFish(670,220,4,0);
  GhostfishHunter(415,358,4,110,40,1);

  PoisonTricker(120,183,5,1);
  PoisonTricker(197,184,5,0);

  BeamFish(316,229,4,1);

  if (RemoveDarkBlock==0)
    DarkBlock(778,310,3,0);
    DarkBlock(769,346,3,0);
    DarkBlock(767,331,3,0);
  end

  frame(300);

  loop
    SpipCounter++;
    if (SpipCounter==40) SpipOrb(452,504,rand(220,230),1); SpipCounter=0; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),510,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>0 and PlayerX<35) Area14(1175,547,0); end
    if (PlayerX<0 and PlayerY>0 and PlayerY<99) Area14(1175,547,0); end
    if (PlayerY>500 and PlayerX>79 and PlayerX<167) Area20(1066,23,0); end
    if (PlayerX>800 and PlayerY>292 and PlayerY<373) Area29(25,362,1); end
    frame;
  end
end




process Area20(x,y,PlaySong);  // Deep Road Dungeon 2
private
  int BubbleCounter;
  int SpipCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  LocationX=179; LocationY=222;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(138,0,227,12);
  LevelCheckID=LevelCheck(584,317,14,138);
  LevelForeground(584,317,3,139);

  LightSource(1107,108,3,96,1);
  LightSource(1026,396,3,96,1);
  LightSource(1072,553,3,96,1);
  LightSource(926,606,3,96,1);
  LightSource(583,402,3,96,1);
  LightSource(15,622,3,96,1);
  LightSource(118,488,3,96,1);
  LightSource(111,256,3,96,1);
  LightSource(335,183,3,96,1);

  GasSpawner(283,590,4,1);
  GasSpawner(378,590,4,1);
  GasSpawner(460,590,4,1);

  BroodFish(310,340,4,1);
  DarkbringerLurker(678,228,4,200,3);
  PoisonTricker(614,556,5,0);

  if (MoistQuest==3) SingleNonPlayerFish(980,229,4,28); end

  SingleNonPlayerFish(50,560,4,29);

  if (CollectItemList[7]==0)
    CollectItem(653,161,4,7);
  end

  frame(300);

  loop
    SpipCounter++;
    if (SpipCounter==40) SpipOrb(932,984,rand(550,560),1); SpipCounter=0; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1210),630,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>1027 and PlayerX<1164) Area19(128,481,0); end
    if (PlayerY>634 and PlayerX>66 and PlayerX<131) Area30(160,20,1); end
    frame;
  end
end



process Area21(x,y,PlaySong);  // Sunlit Sea Grassway
private
  int BubbleCounter;
begin

  if (PlayerFish>0) let_me_alone(); end
  SystemControl();

  DarkArea=0; BlobOn=1;
  LocationX=73; LocationY=45;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==0) PlayerID=IntroCamera(x,y); end
  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(141,0,226,12);
  LevelCheckID=LevelCheck(500,300,14,141);
  LevelForeground(500,300,3,142);

  FoodFish(648,295,3,1030,630,0);
  FoodFish(695,284,3,1030,630,0);
  FoodFish(707,216,3,1030,630,0);
  FoodFish(655,242,3,1030,630,0);
  FoodFish(605,264,3,1030,630,0);

  Blob(450,190,4);
  MiniBlob(470,190,4,27);
  MiniBlob(470,210,4,28);
  MiniBlob(430,190,4,27);

  Blob(255,211,4);
  MiniBlob(235,201,4,27);
  MiniBlob(275,211,4,28);
  MiniBlob(255,221,4,27);

  Blob(160,390,4);
  MiniBlob(140,390,4,27);
  MiniBlob(160,390,4,28);
  MiniBlob(180,400,4,27);

  AquaMine(656,162,4,0);
  AquaMine(360,200,4,0);
  AquaMine(175,225,4,0);

  SpinePlant(775,517,6,1);

  if (CollectItemList[8]==0)
    CollectItem(336,476,4,8);
  end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1010),640,100); BubbleCounter=0; end
    if (PlayerX>1000 and PlayerY>240 and PlayerY<319) Area18(25,95,0); end
    if (PlayerX<0 and PlayerY>228 and PlayerY<302) Area22(475,234,0); end
    frame;
  end
end




process Area22(x,y,PlaySong);  // Passway to Raceway
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; BlobOn=0;
  LocationX=46; LocationY=49;

  if (SarkMemory==2 or SarkMemory==3) PlayerMovie3(); return; end
  if (SarkMemory==1) PlayerMovie2(); return; end

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(148,0,226,12);
  LevelCheckID=LevelCheck(250,250,14,148);
  LevelForeground(250,250,3,149);

  FoodFish(376,253,3,530,530,0);
  FoodFish(420,237,3,530,530,0);
  FoodFish(405,194,3,530,530,0);
  FoodFish(360,208,3,530,530,0);
  FoodFish(334,241,3,530,530,0);
  FoodFish(368,164,3,530,530,0);

  FoodFish(100,213,3,530,530,0);
  FoodFish(136,233,3,530,530,0);
  FoodFish(104,258,3,530,530,0);
  FoodFish(129,194,3,530,530,0);
  FoodFish(91,180,3,530,530,0);

  SpinePlant(385,415,6,0);

  SingleNonPlayerFish(183,383,4,7);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,510),510,100); BubbleCounter=0; end
    if (PlayerX>500 and PlayerY>188 and PlayerY<275) Area21(20,264,0); end
    if (PlayerY>500 and PlayerX>204 and PlayerX<334) Area23(127,28,0); end
    if (PlayerX<0 and PlayerY>219 and PlayerY<299) Area24(970,387,0); end
    if (PlayerY<0 and PlayerX>212 and PlayerX<294) Area42(49,571,0); end
    frame;
  end
end




process Area23(x,y,PlaySong);  // Raceway
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  fade(100,100,100,8);

  DarkArea=0; RaceDiscover=1;
  LocationX=47; LocationY=67;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(151,0,226,12);
  LevelCheckID=LevelCheck(1000,750,14,150);
  LevelForeground(1000,750,3,152);

  BounceAmoeba(1520,200,5,225000,18,1);
  BounceAmoeba(1635,70,5,180000,19,1);
  BounceAmoeba(1838,80,5,135000,18,1);
  BounceAmoeba(1942,193,5,75000,20,1);
  BounceAmoeba(1880,390,5,45000,17,1);

  BounceAmoeba(522,1247,5,90000,17,1);
  BounceAmoeba(519,1390,5,45000,17,1);
  BounceAmoeba(440,1430,5,0,20,1);
  BounceAmoeba(235,1420,5,325000,20,1);
  BounceAmoeba(90,1298,5,270000,18,1);

  if (RaceWon!=2)
    SingleNonPlayerFish(475,150,4,8);
  end
  if (RaceWon==2)
    SingleNonPlayerFish(700,240,4,8);
  end

  SingleNonPlayerFish(360,68,4,9);

  SingleNonPlayerFish(355,252,4,10);

  SingleNonPlayerFish(80,225,4,11);

  SingleNonPlayerFish(50,135,4,12);

  SingleNonPlayerFish(47,76,4,13);

  if (ShellItem==0)
    ShellItem(648,172,4,0);
  end

  if (CollectItemList[9]==0)
    CollectItem(731,1221,4,9);
  end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,2010),1510,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>77 and PlayerX<173) Area22(265,478,0); end
    frame;
  end
end




process Area24(x,y,PlaySong);  // Selachimorph Sea - Cubesea
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0;
  LocationX=19; LocationY=44;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(154,0,226,12);
  LevelCheckID=LevelCheck(500,300,14,153);
  LevelForeground(500,300,3,155);

  PoisonTricker(163,558,5,0);
  GhostfishHunter(220,475,4,150,70,1);
  GhostfishHunter(492,225,4,115,60,1);

  GhostFish2(70,260,4,0);
  GhostFish3(615,500,4,0);

  if (GhostFishQuest<=4) SingleNonPlayerFish(60,64,4,30); end
  if (MoistQuest==4) SingleNonPlayerFish(914,80,4,28); end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1010),610,100); BubbleCounter=0; end
    if (PlayerX>1000 and PlayerY>332 and PlayerY<444) Area22(22,260,0); end
    if (PlayerX<0 and PlayerY>334 and PlayerY<424) Area34(1162,475,0); end
    frame;
  end
end



process Area25(x,y,PlaySong);  // Tribe of the Deep
private
  int BubbleCounter;
  int LightCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DeepTribeOn=1; TribeDiscover=1;
  LocationX=217; LocationY=139;

  if (PlaySong==1) SongPlayer(4); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(156,0,227,12);
  LevelCheckID=LevelCheck(400,300,14,156);
  LevelForeground(400,300,3,157);

  LightSource(149,354,3,158,2);
  LightSource(228,230,3,158,2);
  LightSource(337,331,3,158,2);
  LightSource(499,100,3,158,2);
  LightSource(675,324,3,158,2);

  DeepTribeFish(518,419,4,1);
  DeepTribeFish(190,177,4,2);
  SingleNonPlayerFish(400,380,4,1);

  if (GhostFishQuest==6)
    SingleNonPlayerFish(120,190,4,29);
    SingleNonPlayerFish(120,250,4,30);
  end

  frame(300);

  loop
    LightCounter++;
    if (LightCounter==100)
      DescendingLight(150,99,3,251,0);
      DescendingLight(228,67,3,158,0);
      DescendingLight(337,47,3,280,0);
      DescendingLight(499,43,3,52,0);
      DescendingLight(675,68,3,251,0);
      LightCounter=0;
    end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),610,100); BubbleCounter=0; end
    if (PlayerY>600 and PlayerX>62 and PlayerX<160) Area14(1164,104,1); end
    if (PlayerX<0 and PlayerY>289 and PlayerY<369) Area26(760,237,1); end
    if (PlayerX>800 and PlayerY>34 and PlayerY<146) Area27(25,244,1); end
    frame;
  end
end




process Area26(x,y,PlaySong);  // Darkbringer Nestingplace
private
  int BubbleCounter;
  int LightCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DeepTribeOn=0; BreedingGroundDiscover=1;
  LocationX=185; LocationY=140;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(162,0,227,12);
  LevelCheckID=LevelCheck(400,300,14,161);
  LevelForeground(400,300,3,163);

  LightSource(697,224,3,158,2);
  LightSource(746,250,3,158,2);

  Darkbringer(206,248,4,0);
  Darkbringer(366,239,4,0);
  Darkbringer(402,285,4,0);
  Darkbringer(290,361,4,0);
  Darkbringer(448,329,4,0);
  Darkbringer(193,377,4,0);

  frame(300);

  loop
    LightCounter++;
    if (LightCounter==100)
      DescendingLight(697,198,3,21,0);
      DescendingLight(746,277,3,21,1);
      LightCounter=0;
    end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,810),610,100); BubbleCounter=0; end
    if (PlayerX>800 and PlayerY>198 and PlayerY<277) Area25(25,330,1); end
    if (PlayerX<0 and PlayerY>265 and PlayerY<352) Area13(570,316,0); end
    frame;
  end
end




process Area27(x,y,PlaySong);  // Arturus Krill Nesting Place
private
  int BubbleCounter;
  int LightCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DarkMotherOn=0;
  DarkBlockOn=1;
  DeepTribeOn=0;
  if (DeepRoadsDiscover==0) DeepRoadsDiscover=1; NewArea(160,40,1,439); end
  LocationX=258; LocationY=136;

  if (PlaySong==1) SongPlayer(12); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(180,0,227,12);
  LevelCheckID=LevelCheck(300,250,14,180);
  LevelForeground(300,250,3,181);

  LightSource(26,465,3,96,1);
  LightSource(284,474,3,96,1);
  LightSource(534,442,3,96,1);

  LightSource(115,234,3,158,2);
  LightSource(186,186,3,158,2);
  LightSource(232,293,3,158,2);
  LightSource(471,197,3,158,2);

  LightKrill(440,250,50,4,0);
  LightKrill(460,250,50,4,0);
  LightKrill(440,230,50,4,0);
  LightKrill(430,230,50,4,0);

  LightKrill(320,150,50,4,0);
  LightKrill(320,130,50,4,0);
  LightKrill(300,130,50,4,0);
  LightKrill(310,140,50,4,0);

  LightKrill(170,260,50,4,0);
  LightKrill(190,260,50,4,0);
  LightKrill(180,280,50,4,0);
  LightKrill(180,270,50,4,0);

  if (RemoveDarkBlock==0 and Quests<=5)
    DarkBlock(117,470,3,0);
    DarkBlock(165,454,3,0);
    DarkBlock(191,474,3,0);
  end

  if (MoistQuest==5) SingleNonPlayerFish(423,282,4,28); end

  frame(300);

  loop
    LightCounter++;
    if (LightCounter==100)
      DescendingLight(115,99,3,130,0);
      DescendingLight(186,51,3,130,0);
      DescendingLight(232,48,3,240,0);
      DescendingLight(471,62,3,130,0);
      LightCounter=0;
    end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,610),510,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>201 and PlayerY<282) Area25(770,102,1); end
    if (PlayerY<0 and PlayerX>541 and PlayerX<600) Area28(100,770,1); end
    if (PlayerX>600 and PlayerY>0 and PlayerY<78) Area28(100,770,1); end
    if (PlayerY>500 and PlayerX>26 and PlayerX<209) Area33(293,43,1); end
    frame;
  end
end




process Area28(x,y,PlaySong);  // Gelatinum Sea - Deep Roads Connection
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; CarryOn=0; RoadsConnectionDiscover=1; SwarmJelliconOn=1;
  LocationX=282; LocationY=97;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(183,0,227,12);
  LevelCheckID=LevelCheck(350,400,14,182);
  LevelForeground(350,400,3,184);

  DarkbringerLurker(32,620,4,200,3);
  DarkbringerLurker(322,589,4,200,4);
  PoisonTricker(433,429,5,1);
  BroodFish(165,119,4,0);
  BroodFish(171,298,4,0);

  SwarmJellicon(350,170,4,0,0,2,0);
  SwarmJellicon(400,220,4,50,0,2,0);
  SwarmJellicon(450,170,4,100,0,2,0);
  SwarmJellicon(400,120,4,150,0,2,0);

  CapturedObject(400,170,5,0);

  frame(300);

  loop
    if (PlayerX>440 and PlayerY>540 and SecondStone==0) SecondStoneMessage(); SecondStone=1; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,710),810,100); BubbleCounter=0; end
    if (PlayerY>800 and PlayerX>50 and PlayerX<132) Area27(560,50,0); end
    if (PlayerY<0 and PlayerX>516 and PlayerX<613) Area39(183,269,1); end
    frame;
  end
end



process CapturedObject(x,y,z,Mode);
private
  int BounceCounter;
begin
  ctype=c_scroll; graph=217;
  loop
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==3 or BounceCounter==5) y--; end
    if (BounceCounter==7 or BounceCounter==9 or BounceCounter==11) y++; end
    if (BounceCounter==13) BounceCounter=0; end
    frame(200);
  end
end



process Area29(x,y,PlaySong);  // Gelatinum Sea - Dark Mother Cave
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DarkMotherOn=1; MotherDiscover=1;
  LocationX=280; LocationY=189;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(240,0,227,12);
  LevelCheckID=LevelCheck(800,300,14,240);
  LevelForeground(800,300,3,241);

  FishVortex(522,113,2,0,1);
  FishVortex(645,115,2,0,1);
  FishVortex(522,570,2,1,2);
  FishVortex(645,573,2,1,2);

  DarkMotherJaw(1280,490,3,0);

  DarkMotherEgg(1352,448,11,253,0);
  DarkMotherSpawn(1355,441,10,0);

  DarkMotherEgg(1404,475,11,255,0);
  DarkMotherSpawn(1407,463,10,0);

  DarkMotherEgg(1437,506,11,256,0);
  DarkMotherSpawn(1440,500,10,0);

  LightSource(818,286,3,96,1);
  LightSource(1042,210,3,96,1);
  LightSource(1362,206,3,96,1);

  frame(300);

  loop

    if (PlayerX>1212 and PlayerX<1320 and PlayerY>465)
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=20;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=20;
      end
    end

    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1610),610,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>321 and PlayerY<395) Area19(776,327,0); end
    if (PlayerX>1600 and PlayerY>249 and PlayerY<357) Area33(45,372,0); end
    frame;
  end
end




process Area30(x,y,PlaySong);  // Abyssal Tunnel
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DarkBlockOn2=0;
  LocationX=153; LocationY=234;
  if (AbyssDiscover==0) AbyssDiscover=1; NewArea(160,40,1,440); end

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(272,0,227,12);
  LevelCheckID=LevelCheck(160,500,14,272);
  LevelForeground(160,500,3,273);

  LightSource(27,41,3,96,1);
  LightSource(292,208,3,96,1);

  LightSource(25,832,3,282,1);
  LightSource(276,876,3,282,1);
  LightSource(27,950,3,282,1);

  Eye(120,430,2,0);
  Eye(187,538,2,0);
  Eye(105,633,2,0);
  Eye(186,753,2,0);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,330),1010,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>72 and PlayerX<261) Area20(97,610,0); end
    if (PlayerY>1000 and PlayerX>59 and PlayerX<234) Area31(437,25,0); end
    frame;
  end
end



process Area31(x,y,PlaySong);  // The Abyss
private
  int BubbleCounter;
  int SpipCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DarkBlockOn2=1;
  LocationX=153; LocationY=234;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(274,0,227,12);
  LevelCheckID=LevelCheck(500,400,14,274);
  LevelForeground(500,400,3,275);

  LightSource(246,120,3,282,1);
  LightSource(155,378,3,282,1);
  LightSource(154,606,3,282,1);

  LightSource(337,758,3,282,1);
  LightSource(376,670,3,282,1);
  LightSource(473,678,3,282,1);

  LightSource(573,86,3,282,1);
  LightSource(653,205,3,282,1);
  LightSource(968,334,3,282,1);

  DarkBlock(154,717,3,1);
  DarkBlock(282,728,3,1);
  DarkBlock(228,707,3,1);

  DarkBlock(590,761,3,1);
  DarkBlock(698,751,3,1);
  DarkBlock(640,735,3,1);

  DarkVortex(221,726,5,0);
  DarkVortex(639,741,5,0);

  Eye(470,103,2,0);
  Eye(524,182,2,0);
  Eye(361,178,2,0);
  Eye(432,240,2,0);

  BlackLurkerBaby(210,240,3,0);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1010),810,100); BubbleCounter=0; end
    SpipCounter++;
    if (SpipCounter==30) SpipOrb(801,974,rand(414,550),2); SpipCounter=0; end
    if (rand(1,30)==1) SuckEffect(223,720,3,1); end
    if (rand(1,30)==1) SuckEffect(634,713,3,1); end
    if (PlayerY<0 and PlayerX>375 and PlayerX<498) Area30(160,975,0); end
    if (PlayerX>1000 and PlayerY>183 and PlayerY<296) Area32(20,103,0); end
    frame;
  end
end



process Area32(x,y,PlaySong);  // Room of the Zero Stone
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  DarkBlockOn2=0;
  LocationX=153; LocationY=234;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(276,0,227,12);
  LevelCheckID=LevelCheck(160,120,14,276);
  LevelForeground(160,120,3,277);

  LightSource(15,22,3,282,1);
  LightSource(62,3,3,282,1);
  LightSource(258,-1,3,282,1);
  LightSource(308,22,3,282,1);

  LightSource(16,165,3,282,1);
  LightSource(40,213,3,282,1);
  LightSource(96,233,3,282,1);
  LightSource(278,225,3,282,1);
  LightSource(304,176,3,282,1);

  frame(300);

  loop
    if (PlayerX>100 and ThirdStone==0) ThirdStoneMessage(); ThirdStone=1; end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,330),250,100); BubbleCounter=0; end
    if (PlayerX<0 and PlayerY>63 and PlayerY<142) Area31(975,243,0); end
    frame;
  end
end



process Area33(x,y,PlaySong);  // Dark Mothers Secret Passage
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=1;
  LocationX=283; LocationY=166;

  if (PlaySong==1) SongPlayer(3); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(2,1); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(278,0,227,12);
  LevelCheckID=LevelCheck(160,200,14,278);
  LevelForeground(160,200,3,279);

  LightSource(87,166,3,96,1);
  LightSource(296,186,3,96,1);
  LightSource(197,382,3,96,1);

  frame(300);

  loop
    BubbleCounter++;    
    if (BubbleCounter==120) IntroBubble(rand(10,330),410,100); BubbleCounter=0; end
    if (PlayerY>400 and PlayerX>0 and PlayerX<92) Area29(1575,321,0); end
    if (PlayerX<0 and PlayerY>351 and PlayerY<400) Area29(1575,321,0); end

    if (PlayerY<0 and PlayerX>263 and PlayerX<320) Area27(163,465,1); end
    if (PlayerX>320 and PlayerY>0 and PlayerY<107) Area27(163,465,1); end
    frame;
  end
end




process Area34(x,y,PlaySong);  // Selachimorph Sea - Predators Way
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; fade(100,100,100,16);
  LocationX=4; LocationY=45;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(280,0,226,12);
  LevelCheckID=LevelCheck(600,400,14,280);
  LevelForeground(600,400,3,281);

  Selachimorph2(688,234,4,1);
  Selachimorph2(1030,553,4,2);
  Selachimorph2(550,510,4,3);
  Selachimorph2(480,700,4,4);
  Selachimorph2(460,335,4,5);

  if (LimMemory==9) Selachimorph3(125,85,4,0); end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1210),810,100); BubbleCounter=0; end
    if (PlayerX>1200 and PlayerY>425 and PlayerY<524) Area24(24,380,0); end
    frame;
  end
end



process Area35(x,y,PlaySong);  // Selachimorph Encounter
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0;

  if (PlaySong==1) SongPlayer(11); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  LevelScroll(305,0,226,12);
  LevelCheckID=LevelCheck(182,160,14,305);
  LevelForeground(182,160,3,306);

  SingleNonPlayerFish(80,194,4,14);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,374),330,100); BubbleCounter=0; end
    if (PlayerX>364 and PlayerY>135 and PlayerY<196) Area4(25,120,0); end
    if (PlayerX<0 and PlayerY>0 and PlayerY<74) Area36(1061,439,0); end
    if (PlayerY<0 and PlayerX>0 and PlayerX<41) Area36(1061,439,0); end
    frame;
  end
end



process Area36(x,y,PlaySong);  // Small Selachimorph Sea
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0;

  if (PlaySong==1) SongPlayer(11); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,0);

  LevelScroll(313,0,226,12);
  LevelCheckID=LevelCheck(590,240,14,313);
  LevelForeground(590,240,3,314);

  Selachimorph(1000,150,4,290,110,140,0);
  Selachimorph(490,20,4,290,110,140,0);
  Selachimorph(510,329,4,290,110,140,0);
  Selachimorph(190,150,4,290,110,140,0);

  if (HookItem==0) HookItem(50,405,4,0); end

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,1190),490,100); BubbleCounter=0; end
    if (PlayerY>480 and PlayerX>1001 and PlayerX<1163) Area35(26,39,0); end
    frame;
  end
end




process Area37(x,y,PlaySong);  // Spipreef Entryway
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; StreamRoomOn=0; ArcadeSeaOn=0; BlobOn=0;
  LocationX=106; LocationY=124;

  if (PlaySong==1) SongPlayer(1); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(318,0,225,12);
  LevelCheckID=LevelCheck(160,120,14,317);
  LevelForeground(160,120,3,319);

  if (MapItem==0) GillIntro4(184,89,4,0); end

  frame(300);

  loop
    if (rand(1,6)==1) SuckEffect(-80+rand(-10,10),360+rand(-10,10),3,2); SuckObject2(-80+rand(-50,50),360+rand(-50,50),3,87,180,0); end
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,250),330,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>235 and PlayerX<320) Area5(43,661,0); end
    if (PlayerX>320 and PlayerY>0 and PlayerY<20) Area5(43,661,0); end
    frame;
  end
end



process GillIntro4(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int BounceCounter;
begin
  ctype=c_scroll; graph=40;

  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)
  GillMapDialog(0);

  repeat
    TempAngle=fget_angle(x,y,340,-20);
    if (angle<TempAngle) angle+=10000; end
    if (angle>TempAngle) angle-=10000; end
    if (ForwardSpeed=>0) ForwardSpeed=5; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);
    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end
    frame;
  until (fget_dist(x,y,340,-20)<20)
  return;
end





process Area38(x,y,PlaySong);  // Arcade Sea
private
  int BubbleCounter;
  int TimeCounter;
begin

  if (PlayerFish>0) let_me_alone(); end
  SystemControl();

  fade(100,100,100,4);

  DarkArea=0; ArcadeSeaOn=1;
  LocationX=125; LocationY=10;
  if (OceanDiscover==0 and PlayerFish>0) OceanDiscover=1; NewArea(160,40,1,437); end

  if (PlaySong==1) SongPlayer(10); end

  if (PlayerFish==0) PlayerID=IntroCamera(x,y); end
  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(320,0,226,12);
  LevelCheckID=LevelCheck(1000,650,14,320);
  //if (SarkMemory==3) LevelCheckID=LevelCheck(1000,650,14,371); end
  LevelForeground(1000,650,3,321);

  BounceAmoeba(981,1114,5,270000,19,1);
  BounceAmoeba(450,1099,5,225000,19,1);
  BounceAmoeba(1578,1097,5,-45000,19,1);

  BounceAmoeba(980,956,5,270000,21,1);
  BounceAmoeba(736,811,5,-45000,19,1);
  BounceAmoeba(1248,820,5,225000,19,1);

  BounceAmoeba(594,715,5,-45000,19,2);
  BounceAmoeba(445,573,5,45000,19,1);
  BounceAmoeba(297,673,5,270000,19,2);
  BounceAmoeba(304,470,5,225000,19,1);
  BounceAmoeba(452,365,5,135000,19,2);
  BounceAmoeba(591,471,5,225000,19,1);

  BounceAmoeba(1437,629,5,225000,19,2);
  BounceAmoeba(1545,506,5,225000,19,3);
  BounceAmoeba(1676,378,5,135000,19,2);
  BounceAmoeba(1793,518,5,225000,19,3);
  BounceAmoeba(1880,321,5,-45000,19,2);
  BounceAmoeba(1682,196,5,45000,19,3);
  BounceAmoeba(1494,313,5,-45000,19,2);

  BounceAmoeba(981,638,5,-65000,19,1);
  BounceAmoeba(884,417,5,-55000,19,3);
  BounceAmoeba(789,315,5,-65000,19,1);
  BounceAmoeba(754,170,5,225000,19,3);
  BounceAmoeba(848,49,5,180000,17,1);
  BounceAmoeba(1011,49,5,135000,17,3);
  BounceAmoeba(1120,140,5,75000,17,1);
  BounceAmoeba(1092,267,5,35000,17,3);
  BounceAmoeba(979,310,5,-45000,17,1);
  BounceAmoeba(890,230,5,225000,17,3);
  BounceAmoeba(960,158,5,0,17,1);

  DirectionBlob(980,1112,6,1);

  DirectionBlob(980,956,6,2);
  DirectionBlob(980,956,6,3);

  DirectionBlob(980,640,6,4);

  Crab(660,1253,5,0);
  Crab(1125,1253,5,0);

  ArcadeCounter();

  if (CollectItemList[10]==0)
    CollectItem(30,30,4,10);
  end

  frame(300);

  if (SarkMemory==3)
    signal(PlayerID, s_freeze);
    BlueMovie1(355,1160,4);
    repeat frame; until(exists(type BlueMovie1)==0)
    SingleNonPlayerFish(1046,1234,4,4);
    SarkMemory=4;
  end

  loop
    if (LimMemory==10 or LimMemory==11)
      if (LimMemory==10)
        Selachimorph(1500,450,4,800,500,700,1);
        Selachimorph(500,450,4,800,500,700,1);
        LimMemory=11;
      end
      if (fget_dist(PlayerX,PlayerY,1046,1234)>320 and LimMemory==11) signal(type SingleNonPlayerFish, s_kill); LimMemory=12; end
    end
    if (LimMemory=>11)
      TimeCounter++;
      if (TimeCounter==1500) fade_off(); frame(5000); EndMovie(); end  
    end

    if (FriendFish==3 and SlugQuest==1)
      if (PlayerX>1715 and PlayerY>960)
        SlugQuestDialog(0);
      end
    end

    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,2010),1310,100); BubbleCounter=0; end

    if (PlayerY>1300 and PlayerX>1493 and PlayerX<1652)
      if (SarkMemory<=2) Area40(169,43,1); end
      if (SarkMemory>2) PlayerY=1300; end
    end
    if (PlayerY>1300 and PlayerX>938 and PlayerX<1030)
      if (SarkMemory<=2) Area41(162,25,1); end
      if (SarkMemory>2) PlayerY=1300; end
    end
    if (PlayerY>1300 and PlayerX>383 and PlayerX<516)
      if (SarkMemory<=2) Area42(432,36,1); end
      if (SarkMemory>2) PlayerY=1300; end
    end
    frame;
  end
end




process Area39(x,y,PlaySong);  // Gelatinum Caverns - Breeding Room
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; CarryOn=1; SwarmJelliconOn=1; BreederDiscover=1;
  LocationX=298; LocationY=61;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(357,0,225,12);
  LevelCheckID=LevelCheck(200,150,14,357);

  CarryJellicon(195,140,4,8);
  CarryJellicon(195,115,4,9);
  CarryJellicon(195,190,4,10);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,410),310,100); BubbleCounter=0; end
    if (PlayerY>300 and PlayerX>129 and PlayerX<205) Area28(558,34,1); end
    if (PlayerX<0 and PlayerY>111 and PlayerY<166) Area16(673,181,0); end
    frame;
  end
end



process Area40(x,y,PlaySong);  // Gelatinum Tunnel
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; ArcadeSeaOn=0; OctolingOn=0;
  LocationX=250; LocationY=31;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(358,0,226,12);
  LevelCheckID=LevelCheck(250,300,14,358);
  LevelForeground(250,300,3,359);

  BeamFish(87,502,4,1);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,510),610,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>93 and PlayerX<222) Area38(1574,1260,1); end
    if (PlayerX>500 and PlayerY>492 and PlayerY<575) Area17(25,182,0); end
    frame;
  end
end



process Area41(x,y,PlaySong);  // Gateway Tunnel
private
  int BubbleCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; ArcadeSeaOn=0;
  LocationX=125; LocationY=52;

  if (PlaySong==1) SongPlayer(2); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(360,0,226,12);
  LevelCheckID=LevelCheck(160,500,14,360);
  LevelForeground(160,500,3,361);

  BounceAmoeba(100,860,5,270000,18,1);
  BounceAmoeba(100,700,5,270000,18,1);
  BounceAmoeba(100,560,5,270000,18,1);
  BounceAmoeba(100,435,5,270000,18,1);
  BounceAmoeba(100,300,5,270000,18,1);

  frame(300);

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,330),1010,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>48 and PlayerX<272) Area38(985,1260,1); end
    if (PlayerY>1000 and PlayerX>47 and PlayerX<246) Area6(336,39,0); end
    frame;
  end
end



process Area42(x,y,PlaySong);  // Sunlit Tunnel
private
  int BubbleCounter;
  int SpipCounter;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0; ArcadeSeaOn=0;
  LocationX=52; LocationY=29;
  if (SunlitDiscover==0) SunlitDiscover=1; NewArea(160,40,1,438); end

  if (PlaySong==1) SongPlayer(5); end

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(x,y,4,FriendFish);

  LevelScroll(362,0,226,12);
  LevelCheckID=LevelCheck(250,300,14,362);
  LevelForeground(250,300,3,363);

  frame(300);

  loop

    SpipCounter++;
    if (SpipCounter==40) SpipOrb(220,330,rand(410,435),1); SpipCounter=0; end

    if (SarkMemory==2 and PlayerY<300)
      if (FriendFish==1)
        TunnelDialogGill();
        repeat frame; until(exists(type TunnelDialogGill)==0)
      end
      if (FriendFish==2)
        TunnelDialogFinn();
        repeat frame; until(exists(type TunnelDialogFinn)==0)
      end
      if (FriendFish==3)
        TunnelDialogSlug();
        repeat frame; until(exists(type TunnelDialogSlug)==0)
      end
      SarkMemory=3;
    end

    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,510),610,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>386 and PlayerX<500) Area38(448,1260,1); end
    if (PlayerX>500 and PlayerY>0 and PlayerY<22) Area38(448,1260,1); end
    if (PlayerY>600 and PlayerX>0 and PlayerX<111) Area22(252,25,0); end
    if (PlayerX<0 and PlayerY>546 and PlayerY<600) Area22(252,25,0); end
    frame;
  end
end



process GameOver();
begin

  let_me_alone();
  SystemControl();
  LevelScroll(321,0,226,12);
  x=160; y=60; alpha=0; graph=373;
  fade(100,100,100,1);
  SmallBubble(280,250,4,1);
  frame(5000); frame(4000);
  repeat alpha+=10; frame; until(alpha=>200)
  frame(5000);

  IntroText(160,139,2,414,1); frame(700);
  IntroText(160,180,2,415,1); frame(700);
  IntroText(160,220,2,416,1); frame(700);

  Selector(3); frame(700);
  repeat frame; until(key(_enter) or key(_space))

  repeat frame; until(Selection>0)

  fade(0,0,0,2);
  frame(5000);

  if (Selection==1)
    SaveGame();
    PlayerHP=1000;
    if (MapItem==0) Area1(53,605,1); return; end
    if (SarkMemory>0) SarkMemory=3; LimMemory=9; Area38(448,1260,1); return; end
    Area5(500,450,1);
  end

  if (Selection==2) SaveGame(); TitleScreen(1); end
  if (Selection==3) TitleScreen(1); end

end



process SaveMenu();
begin

  IntroText(160,30,2,421,1);

  IntroText(160,139,2,414,1); frame(700);
  IntroText(160,180,2,415,1); frame(700);
  IntroText(160,220,2,416,1); frame(700);

  Selector(3); frame(700);
  repeat frame; until(key(_enter) or key(_space))
  repeat frame; until(Selection>0)

  if (Selection==1) SaveGame(); signal(type IntroText, s_kill); return; end
  if (Selection==2) SaveGame(); TitleScreen(1); end
  if (Selection==3) TitleScreen(1); end
end




process EndMovie5();
begin

  let_me_alone();
  SystemControl();
  LevelScroll(321,0,226,12);
  fade(100,100,100,1);

  ScrollBkg(160,120,3,372,2,0);
  ScrollBkg(480,120,3,372,2,1);

  EndMoviePart10(156,130,4,237);

  if (Selection!=4) EndMoviePart10(43,141,4,40); end
  if (Selection!=2) EndMoviePart10(93,70,4,324); end
  if (Selection!=3) EndMoviePart10(236,64,4,327); end
  if (Selection!=1) EndMoviePart11(274,143,4); end

  if (Selection==1) FinalEndingDialog2(); end
  if (Selection!=1) FinalEndingDialog1(); end

  loop
    if (rand(1,5)==1) SuckEffect(rand(0,340),rand(110,130),3,3); end
    if (rand(1,5)==1) ParticleMoveEffect(rand(-20,300),rand(90,150),3,0); end
    frame;
  end
end



process ScrollBkg(x,y,z,graph,Velocity,flags);
begin
  loop
    x-=Velocity;
    if (x==-160) x=480; end
    frame(50);
  end
end



process BlueMovie1(x,y,z);
begin
  ctype=c_scroll; graph=238; alpha=5;
  repeat alpha+=10; frame(50); until(alpha==255);
  frame(700);
  BluEndDialog();
  signal(PlayerID, s_freeze);
  frame(2000); flags=1;
  PlayerScene3(630,1110,1); PlayerScene3(670,1070,1); PlayerScene3(720,1140,1);
  repeat x-=5; frame; until(x<-20)
  signal(PlayerID, s_wakeup);
end



process FinalEndingDialog1();
begin

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...I'm closing the stream behind us now...");
  write(0,6,156,0,"Sorry kid but... I can't feel the presence of");
  write(0,6,166,0,"your friend there anymore. He died for something");
  write(0,6,176,0,"great. Something great indeed. It happens.");
  write(0,6,186,0,"Sacrifices are made, it is the harsh and cruel");
  write(0,6,196,0,"reality...");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"Shut up Lim. This is not the time. You should");
  write(0,6,136,0,"have known how the Selachimorphs would react.");

  write(0,6,156,0,"Dead?! But... that cannot be! He can't be dead!");

  write(0,6,186,0,"He... he was a good friend. I will remember");
  write(0,6,196,0,"him and tell his story.");

  write(0,6,216,0,"The Selachimorphs underestimate me. They have");
  write(0,6,226,0,"taken my friend, I will take it all from them.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I... I dunno kid. That's just the way things...");
    write(0,6,156,0,"This sea, it's... Man...");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I'm sorry. I should have known. Maybe I was too");
    write(0,6,156,0,"blinded by the possibilities that presented");
    write(0,6,166,0,"themselves, the possibilities that we still have.");
    write(0,6,176,0,"I'm really sorry kid. Sometimes I wonder if I've");
    write(0,6,186,0,"grown too cold, when you have seen as much as I");
    write(0,6,196,0,"have of this sea  it is hard to not get a little");
    write(0,6,206,0,"jaded.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"It's a mess out there, there's darkness");
    write(0,6,156,0,"everywhere. But your friend shouldn't have had");
    write(0,6,166,0,"to die. If I could have stayed behind I would");
    write(0,6,176,0,"have, but I had to be able to close the stream");
    write(0,6,186,0,"so that all of us wouldn't have been killed.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==2 or Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I'm... sorry kid. I have lost fish too, seen");
    write(0,6,156,0,"how the depths have swallowed their tiny little");
    write(0,6,166,0,"lives. This sea is one big darkness and we");
    write(0,6,176,0,"are... we are just tiny little flickers of life.");
    write(0,6,186,0,"Know that his death won't have been in vain kid.");
    write(0,6,196,0,"His sacrifice has granted all of us to remain");
    write(0,6,206,0,"as flickers.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Together we might become something more,");
    write(0,6,156,0,"something that can make the Selachimorphs pay");
    write(0,6,166,0,"and free us all from the Triumvirate.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Now you understand why our struggle is so");
    write(0,6,156,0,"important. The Selachimorphs must die if we are");
    write(0,6,166,0,"to live. It is the only possible solutions to");
    write(0,6,176,0,"our problems. The death of the Selachimorphs");
    write(0,6,186,0,"and the fall of the Triumvirate. We'll take them");
    write(0,6,196,0,"down kid, we'll take them all down.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"But now we have to look towards the future.");
  write(0,6,156,0,"We will honor the memory of your friend with");
  write(0,6,166,0,"deeds. In a couple of hours we will reach the");
  write(0,6,176,0,"outer tunnels of the Great Sphere City.");
  write(0,6,186,0,"This is where our work will truly begin.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Rest... my friends. My soon to be fellow");
  write(0,6,156,0,"revolutionaries. I will show you what power your");
  write(0,6,166,0,"bodies hold and push you to reach the limits of");
  write(0,6,176,0,"your potential. The City is a wonderful place");
  write(0,6,186,0,"but behind it all lurks despicable evil.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Let's show them all a little anarchy.");
  repeat frame; until(key(_enter) or key(_space))

  Credits();

end



process FinalEndingDialog2();
begin

  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey Lim! Hey Lim! Hey Lim!!!");
  write(0,6,156,0,"WHERE IS " + Name + "?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I... I can't feel his presence any longer...");
  write(0,6,156,0,"I'm collapsing the stream behind us now.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"What?!");
  write(0,6,156,0,"Are you saying those Selachimorphs got him?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I am sorry but... I think he is dead.");
  write(0,6,156,0,"That Sark must have gotten him...");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"But... but... no. That cannot be...");
  write(0,6,156,0,Name + " was my best... That cannot be. ;_;");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I can't believe it! I bet " + Name + " took");
  write(0,6,156,0,"down a couple of them before he went. He was");
  write(0,6,166,0,"the hardest mothercrudd of a fish I have ever");
  write(0,6,176,0,"met.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"He... was my first friend. Now he is my last.");
  write(0,6,156,0,"I guess its back to how it used to be now.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Come on Slug! I'll... I'll still be your friend. ;_;");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ugh. Get it together you two! We'll stick");
  write(0,6,156,0,"together from now on, don't worry so much.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...Thank you. Thank the both of you. I really");
  write(0,6,156,0,"appreciate it... I think that were going");
  write(0,6,166,0,"to need all the friends we can get from now on.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Well, you won't be alone. Me and Blu will take");
  write(0,6,156,0,"you under our Finns and once we get to");
  write(0,6,166,0,"Great Sphere City we will introduce you to our");
  write(0,6,176,0,"fellow revolutionaries. " + Name + " might be");
  write(0,6,186,0,"dead but we will honor who he was by the deeds");
  write(0,6,196,0,"that we will do. Kid... I mean... Kids. I'll");
  write(0,6,206,0,"make real fighters out of you. One day you'll");
  write(0,6,216,0,"be the ones who decide what shape this sea will");
  write(0,6,226,0,"take.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"But for now... rest. There will be a couple of");
  write(0,6,156,0,"hours before we reach the outskirts of the reef.");
  write(0,6,166,0,"Once we get there... Well that's when the real");
  write(0,6,176,0,"story begins.");
  repeat frame; until(key(_enter) or key(_space))

  Credits();

end




process EndMoviePart11(x,y,z);
begin
  if (PlayerFish==1) graph=2; end
  if (PlayerFish==2) graph=5; end
  if (PlayerFish==3) graph=8; end
  if (PlayerFish==4) graph=11; end
  loop
    angle+=5000;
    if (angle=>360000) angle=0; end
    frame;
  end
end


process EndMoviePart10(x,y,z,graph);
begin
  loop
    angle+=5000;
    if (angle=>360000) angle=0; end
    frame;
  end
end



process EndMovie4();
begin

  let_me_alone();
  SystemControl();
  LevelScroll(321,0,226,12);
  if (Selection==1) x=160; y=120; alpha=0; graph=373; end
  if (Selection!=1) x=160; y=120; alpha=0; graph=374; end
  fade(100,100,100,1);
  SmallBubble(280,250,4,1);
  frame(5000); frame(5000);
  repeat alpha+=10; frame; until(alpha=>200)
  frame(5000);
  fade(0,0,0,1);
  frame(5000); frame(5000);
  EndMovie5();
end



process EndMovie3();
private
  int AnimationCounter;
begin

  let_me_alone();
  SystemControl();
  LevelScroll(372,0,226,12);
  SongPlayer(8);

  EndMoviePart5(270,20,4,237,1,1000);

  if (Selection!=4) EndMoviePart5(280,80,4,40,1,2500); end
  if (Selection!=2) EndMoviePart5(280,100,4,324,1,5000); end
  if (Selection!=3) EndMoviePart5(280,120,4,327,1,7500); end
  if (Selection!=1) EndMoviePart9(280,60,4,10000); end

  if (Selection==4) EndMoviePart6(280,80,4,40,1); end
  if (Selection==2) EndMoviePart6(280,100,4,324,1); end
  if (Selection==3) EndMoviePart6(280,120,4,327,1); end
  if (Selection==1) EndMoviePart8(280,60,4); end

  frame(5000);
  EndMoviePart7();
  frame(5000);

  TextBox(0); frame(700);
  set_text_color(rgb(150,150,180));
  write(0,6,126,0,"Sark");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"This damn confusing sea! All these blobs kept");
  write(0,6,156,0,"whirling me around! And then a group of");
  write(0,6,166,0,"Jellicons appeared to hassle me?");
  write(0,6,176,0,"THIS HAS NOT BEEN A GOOD DAY. I am... hungry.");
  write(0,6,186,0,"So you are the last one? I will feast upon you,");
  write(0,6,196,0,"and then I will catch up to your friends.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"We will see about that. I've managed to survive");
    write(0,6,156,0,"this sea so far!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"OH OH OH! NO, I CAN'T ALLOW YOU TO DO THAT,");
    write(0,6,156,0,"THEY'RE TO IMPORTANT TO ME WHAAAAAA!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Tough guy eh? Well i'll show you a thing or two!");
    write(0,6,156,0,"TAKE THIS YOU CRUD!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Somehow I always knew it would end like this,");
    write(0,6,156,0,"well, at least my final hours have been spent");
    write(0,6,166,0,"with friends.");
    repeat frame; until(key(_enter) or key(_space))
  end

  Control=1;

  fade(255,0,80,1);
  frame(5000);
  fade(0,0,0,4);
  frame(4000);

  EndMovie4();

end



process EndMoviePart7();
begin
  graph=315; x=-20; y=80; z=4;
  repeat
    x+=4;
    frame;
  until(x=>100)
  loop frame; end
end



process EndMoviePart9(x,y,z,Delay);
begin
  if (PlayerFish==1) graph=2; end
  if (PlayerFish==2) graph=5; end
  if (PlayerFish==3) graph=8; end
  if (PlayerFish==4) graph=11; end
  frame(Delay);
  repeat x+=2; y--; frame; until(x>340)
end



process EndMoviePart8(x,y,z);
begin
  flags=1;
  if (PlayerFish==1) graph=2; end
  if (PlayerFish==2) graph=5; end
  if (PlayerFish==3) graph=8; end
  if (PlayerFish==4) graph=11; end
  repeat frame; until(father.Control==1)
  frame(700);
  repeat x-=2; frame; until(x<-20)
end


process EndMoviePart6(x,y,z,graph,flags);
begin
  repeat frame; until(father.Control==1)
  repeat x-=2; frame; until(x<-20)
end


process EndMoviePart5(x,y,z,graph,flags,Delay);
begin
  frame(Delay); flags=0;
  repeat x+=2; y--; frame; until(x>340)
end



process EndMovie2();
private
  int AnimationCounter;
begin

  let_me_alone();
  SystemControl();

  LevelScroll(372,0,226,12);

  EndMoviePart3(270,20,4,237,1);

  EndMoviePart3(280,80,4,40,1);
  EndMoviePart3(280,100,4,324,1);
  EndMoviePart3(280,120,4,327,1);

  EndMoviePart4(-20,60,4);

end



process EndMoviePart4(x,y,z);
private
  int AnimationCounter;
begin
  if (PlayerFish==1) graph=2; end
  if (PlayerFish==2) graph=5; end
  if (PlayerFish==3) graph=8; end
  if (PlayerFish==4) graph=11; end
  repeat
    AnimationCounter++;
    if (PlayerFish==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=1; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=2; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=3; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=2; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=4; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=5; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=6; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=5; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=9; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=17; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=18; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=17; end
      if (AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==16) graph=9; end
      if (AnimationCounter==17 or AnimationCounter==18 or AnimationCounter==19) graph=8; end
      if (AnimationCounter==20 or AnimationCounter==21 or AnimationCounter==22) graph=7; end
      if (AnimationCounter==23 or AnimationCounter==24 or AnimationCounter==25) graph=8; end
      if (AnimationCounter=>26) AnimationCounter=0; end
    end
    if (PlayerFish==4)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=10; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=11; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=12; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=11; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    x+=5;
    frame;
  until(x=>280)
  flags=1;

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ah... Here we are. Now watch this.");
  repeat frame; until(key(_enter) or key(_space))
  frame(700);
  x=270; y=20;
  InspireEffect(282);
  x=280; y=60;
  StreamEffect();

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"YES! It worked! I've never done this under");
  write(0,6,156,0,"pressure you know! Now, we'll need to enter");
  write(0,6,166,0,"this stream one at a time kid... so one of");
  write(0,6,176,0,"us will have to go in last and probably try");
  write(0,6,186,0,"to delay the Selachimorphs for a few precious");
  write(0,6,196,0,"seconds. Once were all in, I will collapse");
  write(0,6,206,0,"the entrance to the stream.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Who will it be kid? Who will stay the longest?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"I will stay. It's only fair.");

  write(0,6,156,0,"Finn likes dangerous things, he can handle");
  write(0,6,166,0,"this.");

  write(0,6,186,0,"Slug has shown me a lot of bravery, he can");
  write(0,6,196,0,"take care of this.");

  write(0,6,216,0,"Gill is my oldest friend, I can only trust");
  write(0,6,226,0,"him with this.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That's brave of you! See you on the other side");
    write(0,6,156,0,"kid!");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hah! Are you SURE?! OH SPIP THIS IS SCARY.");
    write(0,6,156,0,"But... but I can handle this. Thanks for");
    write(0,6,166,0,"the confidence " + Name + ". You always were a");
    write(0,6,176,0,"good friend.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You've made the right choice " + Name + ".");
    write(0,6,156,0,"This is the most fun i've had in my whole life!");
    write(0,6,166,0,"Thanks for not being such a crudding");
    write(0,6,176,0,"boremonger. ;)");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I'm just glad I finally found a friend, maybe");
    write(0,6,156,0,"even a couple more. I'll do this, not only for");
    write(0,6,166,0,"you guys but for myself. Thanks for liking me");
    write(0,6,176,0,Name + ".");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(5000);

  EndMovie3();
end




process StreamEffect();
begin
  loop
    if (rand(1,6)==1)
      SuckEffect(310+rand(-10,10),0+rand(-10,10),3,2);
      SuckObject2(310+rand(-50,50),0+rand(-50,50),3,799,1,0);
    end
    frame;
  end
end



process EndMoviePart3(x,y,z,graph,flags);
private
  int AnimationCounter;
begin
  loop frame; end
end



process EndMovie();
private
  int AnimationCounter;
begin

  let_me_alone();
  SystemControl();
  LevelScroll(321,0,226,12);
  delete_text(0);

  fade(100,100,100,4);


  if (PlayerFish==1) graph=2; end
  if (PlayerFish==2) graph=5; end
  if (PlayerFish==3) graph=8; end
  if (PlayerFish==4) graph=11; end
  x=-20; y=80; z=4;
  repeat
    AnimationCounter++;
    if (PlayerFish==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=1; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=2; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=3; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=2; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=4; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=5; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=6; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=5; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=9; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=17; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=18; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=17; end
      if (AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==16) graph=9; end
      if (AnimationCounter==17 or AnimationCounter==18 or AnimationCounter==19) graph=8; end
      if (AnimationCounter==20 or AnimationCounter==21 or AnimationCounter==22) graph=7; end
      if (AnimationCounter==23 or AnimationCounter==24 or AnimationCounter==25) graph=8; end
      if (AnimationCounter=>26) AnimationCounter=0; end
    end
    if (PlayerFish==4)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=10; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=11; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=12; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=11; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    x+=5;
    frame;
  until(x=>240)
  flags=1;
  EndMoviePart1();
  repeat frame; until(exists(type EndMoviePart1)==0)

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"This way " + Name + "! I'm going to open up a");
  write(0,6,156,0,"stream that I've previously sealed away so");
  write(0,6,166,0,"that we can escape to the city!");
  repeat frame; until(key(_enter) or key(_space))

  flags=0;
  repeat
    AnimationCounter++;
    if (PlayerFish==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=1; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=2; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=3; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=2; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=4; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=5; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=6; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=5; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=9; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=17; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=18; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=17; end
      if (AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==16) graph=9; end
      if (AnimationCounter==17 or AnimationCounter==18 or AnimationCounter==19) graph=8; end
      if (AnimationCounter==20 or AnimationCounter==21 or AnimationCounter==22) graph=7; end
      if (AnimationCounter==23 or AnimationCounter==24 or AnimationCounter==25) graph=8; end
      if (AnimationCounter=>26) AnimationCounter=0; end
    end
    if (PlayerFish==4)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=10; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=11; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=12; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=11; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    x+=5;
    frame;
  until(x=>340)
  frame(2000);
  EndMovie2();
end



process EndMoviePart1();
begin
  graph=315; x=-20; y=80; z=4;
  repeat
    x+=4;
    frame;
  until(x=>100)
  SarkDialog1();
  frame(300);
  EndMoviePart2(x,y,z);
end



process EndMoviePart2(x,y,z);
begin
  graph=315;
  loop frame; end
end



process PlayerMovie3();
begin

  let_me_alone();
  SystemControl();
  LevelScroll(149,0,226,12);

  PlayerScene4(240,32,4,0); PlayerScene4(250,32,4,1);
  repeat
    frame;
  until(exists(type PlayerScene4)==0)
  Area42(49,571,0);
end


process PlayerMovie2();
begin

  let_me_alone();
  SystemControl();
  LevelScroll(149,0,226,12);

  PlayerScene1(); PlayerScene2();
  repeat
    frame;
  until(exists(type PlayerScene1)==0)
  SarkMemory=2; Quests=6;
  Area42(49,571,0);
end




process PlayerScene4(x,y,z,Mode);
private
  int AnimationCounter;
begin
  ctype=c_scroll; scroll.camera=id; angle=-90000;
  if (Mode==0)
    if (PlayerFish==1) graph=2; end
    if (PlayerFish==2) graph=5; end
    if (PlayerFish==3) graph=8; end
    if (PlayerFish==4) graph=11; end
  end
  if (Mode==1)
    if (FriendFish==1) graph=40; end
    if (FriendFish==2) graph=324; end
    if (FriendFish==3) graph=327; end
  end

  frame;
  if (Mode==0) WarningDialog(); PlayerScene3(-20,200,0); end
  repeat frame; until(exists(type WarningDialog)==0)

  repeat
    angle+=10000;
    frame;
  until(angle==90000)
  repeat advance(5); frame; until(y<-20)
end



process PlayerScene1();
private
  int AnimationCounter;
begin
  ctype=c_scroll; x=-20; y=240; z=4; scroll.camera=id;
  repeat

    AnimationCounter++;
    if (PlayerFish==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=1; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=2; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=3; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=2; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=4; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=5; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=6; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=5; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end
    if (PlayerFish==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=9; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=17; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=18; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=17; end
      if (AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==16) graph=9; end
      if (AnimationCounter==17 or AnimationCounter==18 or AnimationCounter==19) graph=8; end
      if (AnimationCounter==20 or AnimationCounter==21 or AnimationCounter==22) graph=7; end
      if (AnimationCounter==23 or AnimationCounter==24 or AnimationCounter==25) graph=8; end
      if (AnimationCounter=>26) AnimationCounter=0; end
    end
    if (PlayerFish==4)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=10; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=11; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=12; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=11; end
      if (AnimationCounter=>13) AnimationCounter=0; end
    end

    advance(5);
    if (x>150 and x<160)
      frame(2000);
      flags=1;
      frame(4000);
      FriendFishExpression(160,0);
      frame; y--; frame; y++; frame; y--; frame; y++; frame; y--; frame; y++; frame(700);
      PlayerScene3(-60,220,0);
      PlayerScene3(-40,260,0);
      PlayerScene3(-140,240,0);
      flags=0;
      advance(5);
    end
    if (x>160 and x<200) angle+=6300; end
    frame;
  until(y<-20)
  return;
end



process PlayerScene2();
private
  int AnimationCounter;
begin
  ctype=c_scroll; x=-60; y=240; z=4;
  repeat

    AnimationCounter++;
    if (FriendFish==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (FriendFish==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=323; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=324; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=325; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=324; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (FriendFish==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=326; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=327; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=328; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=327; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end

    advance(5);
    if (x>120 and x<130)
      frame(2000);
      flags=1;
      frame(4000);
      if (FriendFish>0) FriendFishExpression(160,0); end
      frame; y--; frame; y++; frame; y--; frame; y++; frame; y--; frame; y++; frame(700);
      flags=0;
      advance(5);
    end
    if (x>160 and x<200) angle+=6300; end
    frame;
  until(y<-20)
  return;
end



process PlayerScene3(x,y,Mode);
private
  int AnimationCounter;
begin
  ctype=c_scroll; z=4; flags=Mode;
  loop

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=367; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=368; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=369; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=368; end
    if (AnimationCounter==13) AnimationCounter=0; end

    if (Mode==0) advance(5); end
    if (Mode==1) advance(-5); end
    frame;
  end
  return;
end



process StreamPassage();
begin

  let_me_alone();
  SystemControl();

  graph=47; x=400; y=120; z=4;
  PassageBackGround(); PlayerMovie1();
  repeat
    if (rand(1,5)==1) SuckEffect(rand(0,340),rand(110,130),3,3); end
    if (rand(1,5)==1) ParticleMoveEffect(rand(-20,300),rand(90,150),3,0); end
    frame;
  until(exists(type PlayerMovie1)==0)
  Area37(75,194,1);
end



process PassageBackGround();
begin
  x=160; y=120; z=10; graph=225;
  loop frame; end
end



process PlayerMovie1();
begin
  if (PlayerFish==1) graph=2; end
  if (PlayerFish==2) graph=5; end
  if (PlayerFish==3) graph=8; end
  if (PlayerFish==4) graph=11; end
  x=-20; y=120;
  repeat
    x+=4; angle+=10000;
    frame;
  until(x>440)
  return;
end



process ParticleMoveEffect(x,y,z,Mode);
begin
  graph=248; alpha=0;
  repeat x+=2; alpha+=10; frame(50); until(alpha==100)
  repeat x+=4; alpha++; frame; until(alpha==120)
  repeat x+=2; alpha-=10; frame(50); until(alpha==0)
end




process Eye(x,y,z,Mode);
begin
  ctype=c_scroll; graph=322; size_y=0; alpha=0; flags=16;
  repeat frame; until(get_dist(PlayerID)<120)
  repeat size_y+=5; alpha+=10; frame(50); until(size_y==100)
  frame(2000);
  repeat size_y-=5; frame(25); until(size_y==10)
  frame;
  repeat size_y+=5; frame(25); until(size_y==100)
  frame(2000);
  repeat size_y-=5; alpha-=10; frame(50); until(size_y==0)
end



process JelliconPillar(StartX,y,z,Mode);
begin
  frame(700);
  ctype=c_scroll; graph=286; flags=16; alpha=200; size=200; x=StartX+((400-PlayerX)/2);
  loop
    x=StartX+((400-PlayerX)/2);
    if (rand(1,50)==1) MiniJellicon(x,rand(-150,150),z,rand(0,1)); end
    frame;
  end
end



process MiniJellicon(StartX,y,z,Mode);
begin
  ctype=c_scroll; graph=287; flags=16+Mode; alpha=0; size=200;
  repeat
    if (Mode==0) StartX++; end
    if (Mode==1) StartX--; end
    alpha+=10;
    x=StartX+((400-PlayerX)/2);
    frame;
  until(alpha==200);
  graph=288;
  repeat
    if (Mode==0) StartX+=2; end
    if (Mode==1) StartX-=2; end
    if (rand(1,20)==1) flags=18+Mode; end
    if (rand(1,20)==1) flags=16+Mode; end
    x=StartX+((400-PlayerX)/2);
    frame;
  until(x<-20 or x>1020)
end



process MiniJellicon2(x,y,z,Mode);
begin
  ctype=c_scroll; graph=287; flags=16+Mode; alpha=0;
  repeat
    if (Mode==0) x++; end
    if (Mode==1) x--; end
    alpha+=10;
    frame;
  until(alpha==200);
  graph=288;
  repeat
    if (Mode==0) x+=2; end
    if (Mode==1) x-=2; end
    if (rand(1,20)==1) flags=18+Mode; end
    if (rand(1,20)==1) flags=16+Mode; end
    frame;
  until(x<-20 or x>520)
end



process DarkVortex(x,y,z,Mode);
private
  int AnimationCounter;
begin
  ctype=c_scroll; flags=16; size=300; alpha=50;
  loop
    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2) graph=242; end
    if (AnimationCounter==3 or AnimationCounter==4) graph=243; end
    if (AnimationCounter==5 or AnimationCounter==6) graph=244; end
    if (AnimationCounter==6) AnimationCounter=0; end

    frame;
  end
end




process DarkBlock(x,y,z,Mode);
begin
  ctype=c_scroll; graph=224; alpha=75;
  if (Mode==1) size=200; end
  loop
    if (rand(1,20)==1) DarkbringerCloud(x,y,z); end
    frame;
  end
end




process DarkMotherSpawn(StartX,StartY,z,Mode);
private
  int DelayCounter;
begin
  ctype=c_scroll; graph=254; x=StartX; y=StartY;
  loop
    DelayCounter++;
    if (DelayCounter==20) x=StartX+rand(-1,1); y=StartY+rand(-1,1); DelayCounter=0; end
    if (collision(PlayerID) and SpawnItem==0)
      SpawnItem=1;
      repeat size-=10; frame; until(size==0)
      TextBox(0); frame(700);
      set_text_color(rgb(255,255,255));
      write(0,6,126,0,"You found a piece a Dark Seed!");
      repeat frame; until(key(_enter) or key(_space))
      return;
    end
    frame;
  end
end



process DarkMotherEgg(x,y,z,graph,Mode);
private
  int DelayCounter;
begin
  ctype=c_scroll;
  loop
    if (DelayCounter==0);
      if (collision(PlayerID)) Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1); DelayCounter=10; end
    end
    if (DelayCounter>0) DelayCounter--; end
    frame;
  end
end



process DarkMotherJaw(x,StartY,z,Mode);
private
  int AnimationCounter;
  int Speed;
  int SuckCounter;
begin
  ctype=c_scroll; graph=250;
  loop
    Speed=8;
    repeat
      y-=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y<=StartY-20)
    y=StartY-20;
    frame(700);
    Speed=8;
    repeat
      y+=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y=>StartY)
    y=StartY;
    frame(5000);
    Speed=8;
    repeat
      y-=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y<=StartY-20)
    y=StartY-20;
    frame(700);
    Speed=8;
    repeat
      y+=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y=>StartY)
    y=StartY;
    frame(5000);
    Speed=8;
    repeat
      y-=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y<=StartY-20)
    y=StartY-20;
    frame(700);
    Speed=8;
    repeat
      y+=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y=>StartY)
    y=StartY;
    frame(5000);
    Speed=8;
    repeat
      y-=Speed;
      if (Speed>1) Speed--; end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
      end
      frame;
    until(y<=StartY-20)
    y=StartY-20;

    Control=0; SuckCounter=0;
    Vortex(970,443,6,0);
    Vortex(1041,385,6,0);
    Vortex(1148,363,6,0);
    repeat
      SuckCounter++;
      if (rand(1,3)==1) SuckObject(1150+rand(-250,40),480+rand(-60,20),4,y+Rand(50,70),0); end
      if (rand(1,3)==1) SuckEffect(1090+rand(-60,20),483+rand(-20,0),5,0); end
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=5;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=5;
      end
      frame;
    until(SuckCounter==500);
    Control=1;

    Speed=8;
    repeat
      y+=Speed;
      if (Speed>1) Speed--; end
      frame;
    until(y=>StartY)
    y=StartY;
    frame(5000);
  end

end



process SuckObject(x,y,z,StopY,Mode);
private
  int FadeCounter;
begin
  ctype=c_scroll; flags=0; alpha=0; graph=248;
  repeat

    if (alpha<100) alpha+=5; end
    if (x>father.x+30) x-=rand(1,3); end
    if (x<father.x+30) x+=rand(1,3); end
    if (y>StopY) y-=rand(1,2); end
    if (y<StopY) y+=rand(1,2); end
    FadeCounter++;
    if (FadeCounter==500) repeat alpha-=5; frame; until(alpha==0); return; end
    frame;
  until(x==father.x+30 and y==StopY)
end



process SuckObject2(x,y,z,StopX,StopY,Mode);
private
  int FadeCounter;
begin
  ctype=c_scroll; flags=0; alpha=0; graph=248;
  repeat

    if (alpha<100) alpha+=5; end
    if (x>StopX) x-=rand(1,3); end
    if (x<StopX) x+=rand(1,3); end
    if (y>StopY) y-=rand(1,2); end
    if (y<StopY) y+=rand(1,2); end
    FadeCounter++;
    if (FadeCounter==200) repeat alpha-=5; frame; until(alpha==0); return; end
    frame;
  until(x==StopX and y==StopY)
end



process SuckEffect(StartX,StartY,z,Mode);
begin
  play_wav(Flame,0);
  ctype=c_scroll; flags=16; alpha=100; size=150; graph=251;
  if (Mode==1) angle=90000; end
  if (Mode==2) angle=65000; end
  if (Mode==3) angle=10000; end
  repeat
    x=StartX+rand(-1,1);
    y=StartY+rand(-1,1);
    x+=2;
    size-=5;
    if (Mode==2) StartX+=7; StartY-=7; end
    frame(50);
  until(size==0)
end



process Vortex(x,y,z,Mode);
private
  int AnimationCounter;
begin
  ctype=c_scroll; flags=16; size=0;
  repeat
    size+=5;
    if (alpha<250) alpha+=20; end
    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2) graph=242; end
    if (AnimationCounter==3 or AnimationCounter==4) graph=243; end
    if (AnimationCounter==5 or AnimationCounter==6) graph=244; end
    if (AnimationCounter==6) AnimationCounter=0; end
    frame(50);
  until(size==100)
  repeat
    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2) graph=242; end
    if (AnimationCounter==3 or AnimationCounter==4) graph=243; end
    if (AnimationCounter==5 or AnimationCounter==6) graph=244; end
    if (AnimationCounter==6) AnimationCounter=0; end
    if (rand(1,10)==1) VortexStorm(x+rand(-2,2),y+rand(-2,2),z+1,0); end

    frame;
  until(father.Control==1)

  repeat
    if (alpha>0) alpha-=20; end
    size-=5;
    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2) graph=242; end
    if (AnimationCounter==3 or AnimationCounter==4) graph=243; end
    if (AnimationCounter==5 or AnimationCounter==6) graph=244; end
    if (AnimationCounter==6) AnimationCounter=0; end
    frame(50);
  until(size==0)

end



process VortexStorm(x,y,z,Mode);
begin
  ctype=c_scroll; flags=16; alpha=100; size=50; graph=252;
  repeat
    size+=5;
    alpha-=5;
    angle+=5000;
    frame(50);
  until(alpha==0)
end




process FishVortex(x,y,z,Mode,Model);
private
  int AnimationCounter;
  int FishSpawn;
begin
  ctype=c_scroll; flags=16;
  loop
    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2) graph=242; end
    if (AnimationCounter==3 or AnimationCounter==4) graph=243; end
    if (AnimationCounter==5 or AnimationCounter==6) graph=244; end
    if (AnimationCounter==6) AnimationCounter=0; end
    if (rand(1,5)==1) VortexBubble(x+rand(-20,20),y+rand(-5,10),z,Mode,0); end
    if (rand(1,10)==1) VortexBubble(x+rand(-20,20),y+rand(-5,10),z,Mode,1); end

    if (Model==1)
      FishSpawn++;
      if (FishSpawn==20) VortexFish(x-22,y,4,2,Mode); end
      if (FishSpawn==40) VortexFish(x+22,y,4,3,Mode); end
      if (FishSpawn==41) FishSpawn=0; end
    end

    if (Model==2)
      FishSpawn++;
      if (FishSpawn==20) VortexFish(x-8,y,4,0,Mode); end
      if (FishSpawn==40) VortexFish(x+8,y,4,1,Mode); end
      if (FishSpawn==41) FishSpawn=0; end
    end

    frame;
  end
end



process VortexFish(x,y,z,flags,Mode);
private
  int MoveCounter;
begin
  ctype=c_scroll; graph=249; MoveCounter=255;

  repeat
    if (MoveCounter>200)
      if (Mode==0) y+=3; end
      if (Mode==1) y-=3; end
    end

    if (MoveCounter<200)
      if (Mode==0) y+=5; end
      if (Mode==1) y-=5; end
    end

    MoveCounter-=2;

    if (collision(PlayerID))
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=10;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=10;
    end

    frame;
  until(MoveCounter<60)
end



process VortexBubble(x,y,z,Mode,Model);
private
  int MoveCounter;
begin
  ctype=c_scroll; flags=16; MoveCounter=rand(0,99);
  if (Model==0) graph=245+rand(0,3); end
  if (Model==1) graph=248; end
  repeat

    if (alpha>200)
      if (Mode==0) y+=2; end
      if (Mode==1) y-=2; end
    end

    if (alpha<200)
      if (Mode==0) y+=4; end
      if (Mode==1) y-=4; end
    end

    if (alpha<100)
      if (Mode==0) y+=3; end
      if (Mode==1) y-=3; end
    end

    alpha-=2;
    frame;
  until(alpha<60)
end


process NewArea(x,y,z,graph);
begin
  alpha=0;
  repeat alpha+=5; frame(50); until(alpha=>255)
  frame(5000); frame(2000);
  repeat alpha-=5; frame(50); until(alpha<=0)
end


process ArcadeCounter();
private
  int DisplayCombo;
  int BlobID;
  int TextID1;
  int TextID2;
  int DelayCounter;
  int DelayCounter2;
begin
  ctype=c_scroll;
  if (PlayerFish==1) graph=1; end
  if (PlayerFish==2) graph=4; end
  if (PlayerFish==3) graph=7; end
  if (PlayerFish==4) graph=10; end
  alpha=0; DisplayCombo=0;
  loop

    if (collision(type BounceAmoeba) and DelayCounter==0)
      set_text_color(rgb(230,20,20));
      TextID1=write(0,135,100,0,"Combo :");
      TextID2=write_int(0,185,100,0,&DisplayCombo);
      set_text_color(rgb(255,255,255));
      DisplayCombo++;
      DelayCounter=50; DelayCounter2=4;
    end
    frame(0);
    if (collision(type BounceAmoeba) and DelayCounter2==0)
      DisplayCombo++;
      DelayCounter=50; DelayCounter2=4;
    end

    if (DelayCounter>0) DelayCounter--; end
    if (DelayCounter2>0) DelayCounter2--; end
    if (DelayCounter==1)
      DisplayCombo=0; DelayCounter=0;
      delete_text(TextID1);
      delete_text(TextID2);
    end

    x=PlayerX;
    y=PlayerY;
    angle=PlayerAngle;

    if (DisplayCombo==5 or DisplayCombo==10 or DisplayCombo==15 or DisplayCombo==20 or DisplayCombo==25 or DisplayCombo==30)
      if (exists(type TextZoom)==0) TextZoom(160,120,1,312); TextZoom(160,120,1,312); end
    end

    frame;
  end
end



process LightWave(x,y,z,Mode);
begin
  if (Mode==0 or Mode==1) ctype=c_scroll; graph=219; size=0; flags=16; alpha=200; end
  if (Mode==2) ctype=c_scroll; graph=310; size=0; flags=16; alpha=200; end
  if (Mode==3) ctype=c_scroll; graph=311; size=0; flags=16; alpha=200; end
  repeat
    alpha-=10; size+=10;
    frame(50);
  until(alpha<50)
end




process ShellItem(x,y,z,Mode);
private
  int DelayCounter;
begin
  ctype=c_scroll; graph=302;
  loop
    if (collision(PlayerID))
      ShellItem=1;
      repeat size-=10; frame; until(size==0)
      TextBox(0); frame(700);
      set_text_color(rgb(255,255,255));
      write(0,6,126,0,"You got the Glowing Shell.");
      repeat frame; until(key(_enter) or key(_space))
      return;
    end
    frame;
  end
end




process HookItem(x,y,z,Mode);
private
  int DelayCounter;
begin
  ctype=c_scroll; graph=316;
  loop
    if (collision(PlayerID))
      HookItem=1;
      TextBox(0); frame(700);
      set_text_color(rgb(255,255,255));
      write(0,6,126,0,"You found a very odd item...");
      repeat frame; until(key(_enter) or key(_space))
      repeat size-=10; frame; until(size==0)
      return;
    end
    frame;
  end
end




process Race(x,y,PlaySong);  // Raceway
private
  int BubbleCounter;
  int RaceFishID1;
  int RaceFishID2;
  int RaceFishID3;
  int RaceFishID4;
begin

  let_me_alone();
  SystemControl();

  DarkArea=0;
  RaceWon=1;
  PlayerAngle=0;

  if (PlayerFish==1) PlayerID=LightFish(x,y,4,0); LightFishAura(5,0); end
  if (PlayerFish==2) PlayerID=DashFish(x,y,4,0); end
  if (PlayerFish==3) PlayerID=ShadowFish(x,y,4,0); end
  if (PlayerFish==4) PlayerID=MysticFish(x,y,4,0); end

  FriendFishID=CompanionFish(0,0,4,0);

  LevelScroll(151,0,226,12);
  LevelCheckID=LevelCheck(1000,750,14,150);
  LevelForeground(1000,750,3,152);

  BounceAmoeba(1520,200,5,225000,18,1);
  BounceAmoeba(1635,70,5,180000,19,1);
  BounceAmoeba(1838,80,5,135000,18,1);
  BounceAmoeba(1942,193,5,75000,20,1);
  BounceAmoeba(1880,390,5,45000,17,1);

  BounceAmoeba(522,1237,5,90000,17,1);
  BounceAmoeba(519,1380,5,45000,17,1);
  BounceAmoeba(440,1420,5,0,20,1);
  BounceAmoeba(235,1410,5,325000,20,1);
  BounceAmoeba(90,1288,5,270000,18,1);

  SingleNonPlayerFish(475,150,4,8);

  StartLine(520,480,11);
  CheckPoint(1290,1385,11);

  RaceFishID1=RaceFish(500,380,4,1);
  RaceFishID2=RaceFish(500,430,4,2);
  RaceFishID3=RaceFish(500,530,4,3);
  RaceFishID4=RaceFish(500,580,4,4);

  AquaMineBall(140,400,4,0);
  AquaMineBall(982,907,4,0);
  AquaMineBall(1806,1312,4,0);
  AquaMineBall(1752,208,4,0);

  FoodFish(1350,372,3,2030,1530,0);
  FoodFish(1380,372,3,2030,1530,0);
  FoodFish(1320,372,3,2030,1530,0);
  FoodFish(1350,332,3,2030,1530,0);
  FoodFish(1350,402,3,2030,1530,0);
  FoodFish(1360,362,3,2030,1530,0);
  FoodFish(1380,382,3,2030,1530,0);

  frame(300);

  PlayerLaps=0;
  signal(PlayerID, s_freeze);

  frame(4000);
  TextZoom(160,120,1,292); play_wav(Jump,0);
  if (PlaySong==1) SongPlayer(6); end

  frame(4000);
  TextZoom(160,120,1,293); play_wav(Jump,0);

  frame(4000);
  TextZoom(160,120,1,294); play_wav(Dark,0);

  frame(300);

  CreateConfetti(500,340,3,0);
  CreateConfetti(501,340,3,1);
  CreateConfetti(502,340,3,2);

  CreateConfetti(500,605,3,3);
  CreateConfetti(501,605,3,4);
  CreateConfetti(502,605,3,5);

  frame(1000);

  RaceFishID1.Control=1;
  RaceFishID2.Control=1;
  RaceFishID3.Control=1;
  RaceFishID4.Control=1;
  signal(PlayerID, s_wakeup);  

  loop
    BubbleCounter++;
    if (BubbleCounter==120) IntroBubble(rand(10,2010),1510,100); BubbleCounter=0; end
    if (PlayerY<0 and PlayerX>149 and PlayerX<336) Area22(265,478,1); end
    if (PlayerLaps==6)
      CreateConfetti(500,340,3,0);
      CreateConfetti(501,340,3,1);
      CreateConfetti(502,340,3,2);

      CreateConfetti(500,605,3,3);
      CreateConfetti(501,605,3,4);
      CreateConfetti(502,605,3,5);
      RaceWon=2;
      if (RaceFishWin==1); RaceWon=1; end
      signal(PlayerID, s_freeze);
      frame(5000); frame(5000); frame(5000);
      fade_off();
      frame(5000);
      Area23(330,250,1);
    end
    frame;
  end
end



process StartLine(x,y,z);
begin
  ctype=c_scroll; graph=213;
  loop
    if (collision(PlayerID))
      if (PlayerLaps==1) PlayerLaps=2; TextZoom(160,120,1,346); end
      if (PlayerLaps==3) PlayerLaps=4; TextZoom(160,120,1,347); end
      if (PlayerLaps==5) PlayerLaps=6; TextZoom(160,120,1,348); end
    end
    frame;
  end
end



process CheckPoint(x,y,z);
begin
  ctype=c_scroll; graph=213;
  loop
    if (collision(PlayerID))
      if (PlayerLaps==0) PlayerLaps=1; end
      if (PlayerLaps==2) PlayerLaps=3; end
      if (PlayerLaps==4) PlayerLaps=5; end
    end
    frame;
  end
end




process RaceFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int Direction;
  int BounceCounter;
  int Speed;
  int Turning;
  int Cornering;
  int Laps;
  int DarkBallCounter;
  int DarkBallID;
begin

  ctype=c_scroll;
  if (PlayerFish!=3)
    if (Mode==1) graph=201; Speed=6; Turning=5000; Cornering=50; end
    if (Mode==2) graph=204; Speed=4; Turning=20000; Cornering=30; end
    if (Mode==3) graph=207; Speed=4; Turning=10000; Cornering=40; end
    if (Mode==4) graph=210; Speed=5; Turning=10000; Cornering=40; end
  end
  if (PlayerFish==3)
    if (Mode==1) graph=201; Speed=7; Turning=5000; Cornering=50; end
    if (Mode==2) graph=204; Speed=4; Turning=20000; Cornering=30; end
    if (Mode==3) graph=207; Speed=5; Turning=10000; Cornering=40; end
    if (Mode==4) graph=210; Speed=6; Turning=10000; Cornering=40; end
  end

  loop

    if (Direction==0) Direction=Control; end

    if (Direction==1)
      TempAngle=fget_angle(x,y,805,465);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,805,465)<Cornering) Direction++; end
    end

    if (Direction==2)
      TempAngle=fget_angle(x,y,927,382);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,927,382)<Cornering) Direction++; end
    end

    if (Direction==3)
      TempAngle=fget_angle(x,y,1105,202);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1105,202)<Cornering) Direction++; end
    end

    if (Direction==4)
      TempAngle=fget_angle(x,y,1378,356);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1378,356)<Cornering) Direction++; end
    end

    if (Direction==5)
      TempAngle=fget_angle(x,y,1619,368);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1619,368)<Cornering) Direction++; end
    end

    if (Direction==6)
      TempAngle=fget_angle(x,y,1719,584);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1719,584)<Cornering) Direction++; end
    end

    if (Direction==7)
      TempAngle=fget_angle(x,y,1708,1137);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1708,1137)<Cornering) Direction++; end
    end

    if (Direction==8)
      TempAngle=fget_angle(x,y,1446,1387);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1446,1387)<Cornering) Direction++; end
    end

    if (Direction==9)
      TempAngle=fget_angle(x,y,1063,1378);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1063,1378)<Cornering) Direction++; end
    end

    if (Direction==10)
      TempAngle=fget_angle(x,y,1013,954);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,1013,954)<Cornering) Direction++; end
    end

    if (Direction==11)
      TempAngle=fget_angle(x,y,643,862);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,643,862)<Cornering) Direction++; end
    end

    if (Direction==12)
      TempAngle=fget_angle(x,y,397,1173);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,397,1173)<Cornering) Direction++; end
    end

    if (Direction==13)
      TempAngle=fget_angle(x,y,171,1089);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,171,1089)<Cornering) Direction++; end
    end

    if (Direction==14)
      TempAngle=fget_angle(x,y,293,600);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,293,600)<Cornering) Direction++; end
    end

    if (Direction==15)
      TempAngle=fget_angle(x,y,500,478);
      if (angle<TempAngle) angle+=Turning; end
      if (angle>TempAngle) angle-=Turning; end
      if (ForwardSpeed=>0) ForwardSpeed=Speed; end
      if (fget_dist(x,y,500,478)<Cornering) Direction++; end
    end

    if (Direction==16 and Laps<3) Laps++; Direction=1; end

    if (Laps==3) RaceFishWin=1; end
    if (Direction==0 or Laps==3)
      angle=0; Direction=0; ForwardSpeed=0;
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    end

    if (Mode==1 and Direction<16)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=201; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=202; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=203; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=202; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==2 and Direction<16)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=204; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=205; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=206; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=205; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==3 and Direction<16)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=207; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=208; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=209; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=208; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==4 and Direction<16)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=210; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=211; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=212; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=211; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end

    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end

    advance(ForwardSpeed);

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    frame;
  end
end




process FoodFish(x,y,z,MaxX,MaxY,Mode);
private
  int AnimationCounter;
begin
  ctype=c_scroll; graph=142+rand(1,5); AnimationCounter=rand(0,20); flags=16; size=300;
  loop
    AnimationCounter++;
    if (AnimationCounter==5 or AnimationCounter==10 or AnimationCounter==15) y--; end
    if (AnimationCounter==20 or AnimationCounter==25 or AnimationCounter==30) y++; end
    if (AnimationCounter==31) AnimationCounter=0; end

    if (rand(1,3)==1)
      if (flags==17) x+=3; end
      if (flags==16) x-=3; end
    end

    if (x<-30 or x>MaxX or y<-30 or y>MaxY) return; end

    if (Mode==0)
      if (get_dist(PlayerID)<120)
        if (x<PlayerID.x) x-=2; flags=16; end
        if (x>PlayerID.x) x+=2; flags=17; end
        if (y<PlayerID.y) y--; end
        if (y>PlayerID.y) y++; end
        if (flags==0) if (rand(1,6)==1) SmallBubble(x+10,y+1,z+1,1); end end
        if (flags==1) if (rand(1,6)==1) SmallBubble(x-10,y+1,z+1,1); end end
      end
    end
    frame;
  end
end




process LightKrill(StartX,StartY,Range,z,Mode);
private
  int GoX;
  int GoY;
  int MoveSpeedX;
  int MoveSpeedY;
  int DelayCounter;
  int AuraID;
begin
  ctype=c_scroll; graph=97;
  x=StartX; y=StartY; AuraID=LightKrillAura(Mode);
  GoX=rand(StartX-Range,StartX+Range);
  GoY=rand(StartY-Range,StartY+Range);
  MoveSpeedX=rand(2,3);
  MoveSpeedY=rand(2,3);
  loop

    if (rand(1,20)==1)
      GoX=rand(StartX-Range,StartX+Range);
      GoY=rand(StartY-Range,StartY+Range);
      MoveSpeedX=rand(1,2);
      MoveSpeedY=rand(1,2);
    end

    if (x<GoX) x+=MoveSpeedX; end
    if (x>GoX) x-=MoveSpeedX; end
    if (y<GoY) y+=MoveSpeedY; end
    if (y>GoY) y-=MoveSpeedY; end

    DelayCounter++;
    if (DelayCounter==3)
      if (MoveSpeedX>1) MoveSpeedX--; end
      if (MoveSpeedY>1) MoveSpeedY--; end
      DelayCounter=0;
    end

    if (x<StartX-Range)
      x+=MoveSpeedX;
      GoX=rand(StartX-Range,StartX+Range);
      GoY=rand(StartY-Range,StartY+Range);
      MoveSpeedX=rand(1,2);
      MoveSpeedY=rand(1,2);
    end
    if (x>StartX+Range)
      x-=MoveSpeedX;
      GoX=rand(StartX-Range,StartX+Range);
      GoY=rand(StartY-Range,StartY+Range);
      MoveSpeedX=rand(1,2);
      MoveSpeedY=rand(1,2);
    end
    if (y<StartY-Range)
      y+=MoveSpeedY;
      GoX=rand(StartX-Range,StartX+Range);
      GoY=rand(StartY-Range,StartY+Range);
      MoveSpeedX=rand(1,2);
      MoveSpeedY=rand(1,2);
    end
    if (y>StartY+Range)
      y-=MoveSpeedY;
      GoX=rand(StartX-Range,StartX+Range);
      GoY=rand(StartY-Range,StartY+Range);
      MoveSpeedX=rand(1,2);
      MoveSpeedY=rand(1,2);
    end

    if (collision(type DarkBall)) Control=1; end

    if (Control==1)
      repeat size-=10; frame; until(size==0)
      signal(AuraID, s_kill);
      return;
    end
    frame;
  end
end



process LightKrillAura(Mode);
begin
  if (Mode==0) ctype=c_scroll; alpha=100; graph=98; flags=16; z=father.z+1; end
  if (Mode==1) ctype=c_scroll; alpha=100; graph=96; flags=16; z=father.z+1; end
  loop
    x=father.x; y=father.y;
    frame;
  end
end



process RotateEffect(x,y,z,graph,Mode);
begin
  ctype=c_scroll; alpha=50; flags=16;
  loop
    angle-=500;
    if (angle==360000) angle=0; end
    if (angle==-360000) angle=0; end
    frame;
  end
end



process LightSource(x,y,z,StartGraph,Mode);
begin
  graph=StartGraph;
  if (Mode==0 or Mode==1 or Mode==2) ctype=c_scroll; alpha=100; flags=16; end
  loop
    graph=StartGraph;
    if (Mode==1)
      if (rand(1,60)==1) graph=0; end
    end
    if (Mode==2)
      if (alpha>100) alpha-=5; end
      if (collision(type DescendingLight)) frame(3500); alpha=150; end
    end

    if (SpawnItem==1 and Mode==1)
      if (collision(type DarkBall))
        repeat alpha-=10; size-=10; frame(50); until(size<=10)
      end
    end

    frame;
  end
end



process DescendingLight(x,y,z,Range,Mode);
private
  int Counter;
begin
  if (Mode==0) ctype=c_scroll; alpha=100; flags=16; alpha=0; graph=159; end
  if (Mode==1) ctype=c_scroll; alpha=100; flags=16; alpha=0; graph=159; end
  repeat
    if (alpha<150) alpha+=10; end
    if (Mode==0) y++; end
    if (Mode==1) y--; end
    Counter++;
    frame;
  until(Counter==Range)
  repeat size-=10; alpha-=10; y++; frame(50); until(size==10)
  return;
end



process SpipAura(x,y,z);
private
  int FadeCounter;
begin
  ctype=c_scroll; alpha=rand(50,100); graph=55; flags=16;
  loop
    if (FadeCounter==0) alpha--; end
    if (FadeCounter==1) alpha++; end
    if (alpha>100) FadeCounter=0; end
    if (alpha<50) FadeCounter=1; end
    frame;
  end
end




process SpipOrb(MinX,MaxX,StartY,Mode);
private
  int Setting;
  int FadeCounter;
  int DisplaySpipOrbID;
  int SetSpeed;
  int MoveCounter;
begin
  ctype=c_scroll; alpha=0;
  x=rand(MinX,MaxX); y=StartY; angle=90000;
  DisplaySpipOrbID=DisplaySpipOrb(Mode); SetSpeed=rand(2,3);
  repeat alpha+=10; frame(50); until(alpha==200)
  repeat
    if (rand(1,8)==1) Setting=rand(0,6); end
    if (Setting==1) angle+=1000; end
    if (Setting==2) angle-=1000; end
    if (Setting==3) angle+=1500; end
    if (Setting==4) angle-=1500; end
    if (Setting==5) angle+=2000; end
    if (Setting==6) angle-=2000; end
    if (angle<55000) angle=55000; end
    if (angle>125000) angle=125000; end
    if (FadeCounter==0) alpha--; end
    if (FadeCounter==1) alpha++; end
    if (alpha>200) FadeCounter=0; end
    if (alpha<120) FadeCounter=1; end
    advance(SetSpeed);
    MoveCounter++;
    if (MoveCounter==2) y++; MoveCounter=0; end
    frame;
  until(y<0)
  signal(DisplaySpipOrbID, s_kill);
end



process DisplaySpipOrb(Mode);
begin
  ctype=c_scroll; HP=Mode;
  if (Mode==1) flags=16; graph=54; end
  if (Mode==2) flags=16; graph=345; end
  loop
    x=father.x;
    y=father.y;
    alpha=father.alpha-50;
    if (Control==1)
      signal(father, s_kill);
      return;
    end
    frame;
  end
end




process OppressiveEffect(x,y,z,graph);
begin
  ctype=c_scroll; flags=32; alpha=50;
  loop
    size=rand(100,101);
    frame;
  end
end



process LightFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempID;
  int TempAngle;
  int EatCounter;
  int LaunchCounter;
  int InspireCharge;
begin
  ctype=c_scroll; scroll.camera=id; angle=PlayerAngle; graph=1;
  HealthMeter(); TalkLine(); SelectedItem(); SelectedPower();
  ShadowCounter=0; InspireCharge=1;
  if (KnownPowers>1) PowerChargeIcon(); end
  HP=PlayerHP;

  loop
    if (key(_left))
      angle+=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle-=7000; frame(0); end
    end
    if (key(_right))
      angle-=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle+=7000; frame(0); end
    end

    if (key(_up))
      AnimationCounter++;
      if (ForwardSpeed=>0 and ForwardSpeed<7) ForwardSpeed=6; end
    end

    if (FishPower==2 and InspireCharge==1)
      if (key(_control))
        FriendFishID.HP+=50;
        if (FriendFishID.HP>1050) FriendFishID.HP=1050; end
        InspireEffect(96); frame; InspireEffect(96);
        InspireCharge=0; signal(type PowerChargeIcon, s_kill);
      end frame(0);
    end

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=1; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=2; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=3; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=2; end
    if (AnimationCounter=>13) AnimationCounter=0; end

    if (ForwardSpeed>0)
      if (TempID=collision(type DisplaySpipOrb))
        TempID.Control=1;
        HP+=100;
        if (HP>1000 and HPBoostOn==0) HP=1000; end
        if (HP>1000 and HPBoostOn==1) HP=1050; end
      end
    end

    if (OctolingOn==1) if (TempID=collision(type Octoling)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (SwarmJelliconOn==1) if (TempID=collision(type SwarmJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (NonPlayerFishOn==1) if (TempID=collision(type NonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (TempID=collision(type SingleNonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    if (TempID=collision(type BounceAmoeba)) ForwardSpeed=TempID.Control; angle=(TempID.angle-180000); TempID.HP=1; end frame(0);
    if (BlobOn==1) if (TempID=collision(type Blob)) ForwardSpeed=4; end frame(0); end

    if (DeepTribeOn==1)
      if (TempID=collision(type DeepTribeFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    end

    if (DarkMotherOn==1)
      if (TempID=collision(type VortexFish))
        if (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed; end
        if (ForwardSpeed==0 and TempID.x=>x) x-=4; end
        if (ForwardSpeed==0 and TempID.x<=x) x+=4; end
      end
      frame(0);
      if (collision(type SuckEffect))
        if (x<1280) x+=3; end
        if (y<490) y+=3; end
      end
      frame(0);
      if (TempID=collision(type Vortex))
        TempAngle=angle+180000; ForwardSpeed=ForwardSpeed*2;
        advance(ForwardSpeed);
        repeat angle+=10000; frame(50); until(angle==TempAngle);
        advance(ForwardSpeed);
      end
    end

    if (CarryOn==1) if (TempID=collision(type CarryJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end

    if (alpha<255) alpha=255; end
    if (BlobOn==1)
      if (TempID=collision(type Blob))
        if (TempID.Control==1)
          alpha=150;
          if (x>TempID.x) x--; end
          if (x<TempID.x) x++; end
          if (y>TempID.y) y--; end
          if (y<TempID.y) y++; end
          ForwardSpeed=0;
        end
      end
    end

    advance(ForwardSpeed);

    if (StreamRoomOn==1)
      if (collision(type SuckEffect))
        repeat
          x+=3;
          y-=3;
          angle+=10000;
          frame;
        until(x>830 and y<-30)
        StreamPassage();
      end
    end

    if (DarkBlockOn==1 or DarkBlockOn2==1)
      frame(0);
      if (collision(type DarkBlock)>0) ForwardSpeed=-ForwardSpeed-1; end
      frame(0);
    end

    if (collision(LevelCheckID))
      if (ForwardSpeed<0) ForwardSpeed=-ForwardSpeed+1;
      elseif (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed-1; end
      if (ForwardSpeed>7) ForwardSpeed=7; end
      if (ForwardSpeed<-7) ForwardSpeed=-7; end
    end

    PlayerX=x; PlayerY=y; PlayerAngle=angle;

    if (key(_alt))
      if (ItemSelect==4 and MapItem==1)
        Map();
      end
      if (ItemSelect==7 and EggItem==1)
        EggDialog();
      end
      if (ItemSelect==3 and SpawnItem==1)
        if (exists(type DarkBall)==0) DarkBall(x,y,z,angle,Mode); end
      end
      if (ItemSelect==2 and ShellItem==2)
        play_wav(Jump2,0); LightKrill(x,y,50,z,0); ShellItem=3; frame(700);
      end
      if (ItemSelect==2 and ShellItem==1)
        if (TempID=collision(type LightKrill)) play_wav(Jump2,0); TempID.Control=1; ShellItem=2; frame(700); end
      end
      if (ShellItem==3) ShellItem=1; end
    end

    if (angle>360000) angle=0+angle-360000; end
    if (angle<-360000) angle=0+angle+360000; end

    if (key(_i))
      ItemNumber=8;
      Inventory();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_o) and FriendFish>0)
      if (exists(type Orders)==0)
        Orders();
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_p))
      if (exists(type Orders)==0)
        if (KnownPowers==1) Powers(331); end
        if (KnownPowers==2) Powers(332); end
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_l))
      QuestLog();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_esc))
      SaveMenu();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (HP<0)
      graph=0;
      fade(255,0,80,2);
      frame(4000);
      fade(0,0,0,2);
      frame(4000);
      GameOver();
      loop frame; end
    end

    PlayerHP=HP;

    frame;
  end
end



process LightFishAura(z,Mode);
begin
  if (Mode==0 or Mode==2) ctype=c_scroll; graph=29; flags=16; alpha=100; end
  if (Mode==1 or Mode==3) ctype=c_scroll; graph=96; flags=16; alpha=100; end
  loop
    if (Mode==0 or Mode==1) x=PlayerX; y=PlayerY; end
    if (Mode==2 or Mode==3) x=father.x; y=father.y; end
    frame(10);
  end
end



process InspireEffect(graph);
begin
  ctype=c_scroll; flags=16; size=50; alpha=200; z=3;
  play_wav(Inspire,0);
  repeat
    x=father.x;
    y=father.y;
    size+=10;
    alpha-=10;
    frame(50);
  until(size=>200)
end



process DashFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempID;
  int TempAngle;
  int EatCounter;
  int Stamina;
  int DashCounter;
  int RotateCounter;
begin
  ctype=c_scroll; scroll.camera=id; angle=PlayerAngle; graph=4;
  FoodMeter(); Stamina=1000;
  HealthMeter(); TalkLine(); SelectedItem(); SelectedPower();
  ShadowCounter=0;
  HP=PlayerHP;

  loop
    if (key(_left))
      angle+=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle-=6000; frame(0); end
    end
    if (key(_right))
      angle-=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle+=6000; frame(0); end
    end

    if (key(_up))
      AnimationCounter++;
      if (ForwardSpeed=>0 and ForwardSpeed<8) ForwardSpeed=7; end
    end

    if (FishPower==1)
      if (key(_control) and Stamina>100)
        DashCounter=10;
        Control=1;
      end frame(0);
    end

    if (FishPower==2)
      if (key(_control))
        RotateCounter=0;
        repeat
          angle+=10000;
          if (angle>360000) angle=0+angle-360000; end
          if (angle<-360000) angle=0+angle+360000; end
          RotateCounter++;
          frame(50);
        until(RotateCounter==18)
        ForwardSpeed=8;
      end frame(0);
    end
    
    if (DashCounter>0)
      AnimationCounter++;
      ForwardSpeed=10;
      DashCounter--;
      Control=1;
      if (Stamina>0) Stamina-=10; end
    end
    if (DashCounter==0) Control=0; end

    if (Control==0 and Stamina<1000) Stamina++; end
    if (Stamina>1000) Stamina=1000; end
    TP=Stamina;

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=4; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=5; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=6; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=5; end
    if (AnimationCounter=>13) AnimationCounter=0; end

    if (ForwardSpeed>0)
      if (TempID=collision(type DisplaySpipOrb))
        TempID.Control=1;
        HP+=100;
        if (HP>1000 and HPBoostOn==0) HP=1000; end
        if (HP>1000 and HPBoostOn==1) HP=1050; end
        Stamina+=100;
        if (Stamina>1000) Stamina=1000; end
      end
    end

    if (OctolingOn==1) if (TempID=collision(type Octoling)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (SwarmJelliconOn==1) if (TempID=collision(type SwarmJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (NonPlayerFishOn==1) if (TempID=collision(type NonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (TempID=collision(type SingleNonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    if (TempID=collision(type BounceAmoeba)) ForwardSpeed=TempID.Control; angle=(TempID.angle-180000); TempID.HP=1; end frame(0);
    if (BlobOn==1) if (TempID=collision(type Blob)) ForwardSpeed=4; end frame(0); end

    if (DeepTribeOn==1)
      if (TempID=collision(type DeepTribeFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    end

    if (CarryOn==1) if (TempID=collision(type CarryJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end

    if (DarkMotherOn==1)
      if (TempID=collision(type VortexFish))
        if (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed; end
        if (ForwardSpeed==0 and TempID.x=>x) x-=4; end
        if (ForwardSpeed==0 and TempID.x<=x) x+=4; end
      end
      frame(0);
      if (collision(type SuckEffect))
        if (x<1280) x+=3; end
        if (y<490) y+=3; end
      end
      frame(0);
      if (TempID=collision(type Vortex))
        TempAngle=angle+180000; ForwardSpeed=ForwardSpeed*2;
        advance(ForwardSpeed);
        repeat angle+=10000; frame(50); until(angle==TempAngle);
        advance(ForwardSpeed);
      end
    end

    if (alpha<255) alpha=255; end
    if (BlobOn==1)
      if (TempID=collision(type Blob))
        if (TempID.Control==1)
          alpha=150;
          if (x>TempID.x) x--; end
          if (x<TempID.x) x++; end
          if (y>TempID.y) y--; end
          if (y<TempID.y) y++; end
          ForwardSpeed=0;
        end
      end
    end

    advance(ForwardSpeed);

    if (StreamRoomOn==1)
      if (collision(type SuckEffect))
        repeat
          x+=3;
          y-=3;
          angle+=10000;
          frame;
        until(x>830 and y<-30)
        StreamPassage();
      end
    end

    if (DarkBlockOn==1 or DarkBlockOn2==1)
      frame(0);
      if (collision(type DarkBlock)>0)
        if (ForwardSpeed<=7) ForwardSpeed=-ForwardSpeed-2; end
        if (ForwardSpeed=>8) Stamina=0; DashCounter=0; ForwardSpeed=-ForwardSpeed-2; end
      end
      frame(0);
    end

    if (collision(LevelCheckID))
      if (ForwardSpeed<0) ForwardSpeed=-ForwardSpeed+2;
      elseif (ForwardSpeed>0 and ForwardSpeed<=7) ForwardSpeed=-ForwardSpeed-2;
      elseif (ForwardSpeed=>8) Stamina=0; DashCounter=0; ForwardSpeed=-ForwardSpeed-2; end
      if (ForwardSpeed>12) ForwardSpeed=12; end
      if (ForwardSpeed<-12) ForwardSpeed=-12; end
    end

    PlayerX=x; PlayerY=y; PlayerAngle=angle;

    if (key(_alt))
      if (ItemSelect==4 and MapItem==1)
        Map();
      end
      if (ItemSelect==7 and EggItem==1)
        EggDialog();
      end
      if (ItemSelect==3 and SpawnItem==1)
        if (exists(type DarkBall)==0) DarkBall(x,y,z,angle,Mode); end
      end
      if (ItemSelect==2 and ShellItem==2)
         play_wav(Jump2,0); LightKrill(x,y,50,z,0); ShellItem=3; frame(700);
      end
      if (ItemSelect==2 and ShellItem==1)
        if (TempID=collision(type LightKrill)) play_wav(Jump2,0); TempID.Control=1; ShellItem=2; frame(700); end
      end
      if (ShellItem==3) ShellItem=1; end
    end

    if (angle>360000) angle=0+angle-360000; end
    if (angle<-360000) angle=0+angle+360000; end

    if (key(_i))
      ItemNumber=8;
      Inventory();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_o) and FriendFish>0)
      if (exists(type Orders)==0)
        Orders();
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_p))
      if (exists(type Orders)==0)
        if (KnownPowers==1) Powers(329); end
        if (KnownPowers==2) Powers(330); end
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_l))
      QuestLog();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_esc))
      SaveMenu();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (HP<0)
      graph=0;
      fade(255,0,80,2);
      frame(4000);
      fade(0,0,0,2);
      frame(4000);
      GameOver();
      loop frame; end
    end

    PlayerHP=HP;

    frame;
  end
end


process HPBoostHeart();
begin
  graph=391; x=313; y=19; z=2; HPBoostOn=1;
  repeat frame; until(PlayerID.HP<=1000)
  HPBoostOn=0;
end



process PowerChargeIcon();
begin
  graph=420; x=10; y=19; z=2;
  loop frame; end
end



process FoodMeter();
begin
  region_define(1,1,2,66,20);
  x=32; y=10; z=2; graph=393; region=1;
  FoodMeterBorder(x+2,y,z-1,graph-1);
  loop
    x=(father.TP/20)-20;
    frame;
  end
end


process FoodMeterBorder(x,y,z,graph);
begin
  region=1;
  loop frame; end
end



process ShadowFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempID;
  int TempAngle;
  int SwitchAngle;
  int EatCounter;
  int ShadowCharge;
  int Invisibility;
begin
  ctype=c_scroll; scroll.camera=id;  angle=PlayerAngle; graph=9;
  HealthMeter(); TalkLine(); ShadowMeter(); SelectedItem(); SelectedPower();
  ShadowCounter=0; ShadowCharge=1;
  if (KnownPowers>1) PowerChargeIcon(); end
  HP=PlayerHP;

  loop
    if (key(_left))
      angle+=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle-=7000; frame(0); end
    end
    if (key(_right))
      angle-=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle+=7000; frame(0); end
    end

    if (key(_up))
      AnimationCounter++;
      if (ForwardSpeed=>0 and ForwardSpeed<6) ForwardSpeed=6; end
    end

    if (FishPower==2 and ShadowCharge==1)
      if (key(_control))
        Invisibility=250;
        ShadowCharge=0; signal(type PowerChargeIcon, s_kill);
      end frame(0);
    end

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=9; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=17; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=18; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=17; end
    if (AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==16) graph=9; end
    if (AnimationCounter==17 or AnimationCounter==18 or AnimationCounter==19) graph=8; end
    if (AnimationCounter==20 or AnimationCounter==21 or AnimationCounter==22) graph=7; end
    if (AnimationCounter==23 or AnimationCounter==24 or AnimationCounter==25) graph=8; end
    if (AnimationCounter=>26) AnimationCounter=0; end

    if (ForwardSpeed>0)
      if (TempID=collision(type DisplaySpipOrb))
        TempID.Control=1;
        HP+=100;
        if (HP>1000 and HPBoostOn==0) HP=1000; end
        if (HP>1000 and HPBoostOn==1) HP=1050; end
      end
    end

    if (OctolingOn==1) if (TempID=collision(type Octoling)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (SwarmJelliconOn==1) if (TempID=collision(type SwarmJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (NonPlayerFishOn==1) if (TempID=collision(type NonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (TempID=collision(type SingleNonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    if (TempID=collision(type BounceAmoeba)) ForwardSpeed=TempID.Control; angle=(TempID.angle-180000); TempID.HP=1; end frame(0);
    if (BlobOn==1) if (TempID=collision(type Blob)) ForwardSpeed=4; end frame(0); end

    if (DeepTribeOn==1)
      if (TempID=collision(type DeepTribeFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    end

    if (CarryOn==1) if (TempID=collision(type CarryJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end

    if (DarkMotherOn==1)
      if (TempID=collision(type VortexFish))
        if (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed; end
        if (ForwardSpeed==0 and TempID.x=>x) x-=4; end
        if (ForwardSpeed==0 and TempID.x<=x) x+=4; end
      end
      frame(0);
      if (collision(type SuckEffect))
        if (x<1280) x+=3; end
        if (y<490) y+=3; end
      end
      frame(0);
      if (TempID=collision(type Vortex))
        TempAngle=angle+180000; ForwardSpeed=ForwardSpeed*2;
        advance(ForwardSpeed);
        repeat angle+=10000; frame(50); until(angle==TempAngle);
        advance(ForwardSpeed);
      end
    end

    if (alpha<255 and Invisibility==0) alpha=255; end
    if (BlobOn==1)
      if (TempID=collision(type Blob))
        if (TempID.Control==1)
          alpha=150;
          if (x>TempID.x) x--; end
          if (x<TempID.x) x++; end
          if (y>TempID.y) y--; end
          if (y<TempID.y) y++; end
          ForwardSpeed=0;
        end
      end
    end

    advance(ForwardSpeed);

    if (StreamRoomOn==1)
      if (collision(type SuckEffect))
        repeat
          x+=3;
          y-=3;
          angle+=10000;
          frame;
        until(x>830 and y<-30)
        StreamPassage();
      end
    end

    if (DarkBlockOn==1 or DarkBlockOn2==1)
      frame(0);
      if (collision(type DarkBlock)>0) ForwardSpeed=-ForwardSpeed-1; end
      frame(0);
    end

    Control=0;
    if (collision(LevelCheckID))
      if (ForwardSpeed<0) ForwardSpeed=-ForwardSpeed+1;
      elseif (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed-1; end
      if (ForwardSpeed>7) ForwardSpeed=7; end
      if (ForwardSpeed<-7) ForwardSpeed=-7; end
    end

    if (collision(type LevelForeground)) Control++; end frame(0);
    if (DarkArea==1) Control++; end
    if (SneakBoostOn==1) Control++; end
    if (collision(type LightSource)) if (Control>0) Control--; end end frame(0);
    if (collision(type LightKrillAura)) if (Control>0) Control--; end end frame(0);

    if (Invisibility>0)
      if (alpha>50) alpha-=5; end
      Control=4;
      Invisibility--;
    end
    if (Invisibility<20 and alpha<240) alpha+=10; end

    PlayerX=x; PlayerY=y; PlayerAngle=angle;

    if (key(_alt))
      if (ItemSelect==4 and MapItem==1)
        Map();
      end
      if (ItemSelect==7 and EggItem==1)
        EggDialog();
      end
      if (ItemSelect==3 and SpawnItem==1)
        if (exists(type DarkBall)==0) DarkBall(x,y,z,angle,Mode); end
      end
      if (ItemSelect==2 and ShellItem==2)
        play_wav(Jump2,0); LightKrill(x,y,50,z,0); ShellItem=3; frame(700);
      end
      if (ItemSelect==2 and ShellItem==1)
        if (TempID=collision(type LightKrill)) play_wav(Jump2,0); TempID.Control=1; ShellItem=2; frame(700); end
      end
      if (ShellItem==3) ShellItem=1; end
    end

    if (angle>360000) angle=0+angle-360000; end
    if (angle<-360000) angle=0+angle+360000; end

    if (key(_i))
      ItemNumber=8;
      Inventory();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_o) and FriendFish>0)
      if (exists(type Orders)==0)
        Orders();
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_p))
      if (exists(type Orders)==0)
        if (KnownPowers==1) Powers(333); end
        if (KnownPowers==2) Powers(334); end
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_l))
      QuestLog();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_esc))
      SaveMenu();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (HP<0)
      graph=0;
      fade(255,0,80,2);
      frame(4000);
      fade(0,0,0,2);
      frame(4000);
      GameOver();
      loop frame; end
    end

    PlayerHP=HP;

    if (Control>3) Control=3; end
    ShadowCounter=Control;

    frame;
  end
end



process ShadowMeter();
begin
  x=34; y=10; z=2;
  loop
    if (father.Control==0) graph=34; end
    if (father.Control==1) graph=35; end
    if (father.Control==2) graph=36; end
    if (father.Control==3) graph=37; end
    frame;
  end
end



process MysticFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempID;
  int TempAngle;
  int SwitchAngle;
  int EatCounter;
  int CheckFriendHP;
  int ControlCharge;
begin
  ctype=c_scroll; scroll.camera=id; angle=PlayerAngle; graph=10;
  HealthMeter(); TalkLine(); SelectedItem(); SelectedPower();
  ShadowCounter=0; ControlCharge=1;
  if (KnownPowers>1) PowerChargeIcon(); end
  HP=PlayerHP;

  loop
    if (key(_left))
      angle+=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle-=7000; frame(0); end
    end
    if (key(_right))
      angle-=5000;
      if (collision(LevelCheckID) or collision(type SingleNonPlayerFish)) angle+=7000; frame(0); end
    end

    if (key(_up))
      AnimationCounter++;
      if (ForwardSpeed=>0 and ForwardSpeed<7) ForwardSpeed=6; end
    end

    if (FishPower==1)
      if (key(_control))
        if (exists(type StigmaDisplay)==0) StigmaDisplay(); end
        if (FriendFishID.HP<CheckFriendHP)
          HP-=CheckFriendHP-FriendFishID.HP;  
          FriendFishID.HP+=CheckFriendHP-FriendFishID.HP;
          if (exists(type MindControlEffect2)==0) MindControlEffect2(FriendFishID.x,FriendFishID.y,5,1); end
        end
        CheckFriendHP=FriendFishID.HP;
      end frame(0);
    end

    if (FishPower==2 and ControlCharge==1)
      if (key(_control) and FriendFish>0)
        MindControlEffect1(x,y,z+1,0);
        if (FriendFish==1)
          MindControlFish(FriendFishID.x,FriendFishID.y,4,1);
          ControlCharge=0; signal(type PowerChargeIcon, s_kill);
          InspireEffect(282); frame; InspireEffect(282);
          frame(2000);
          repeat frame; until(exists(type MindControlFish)==0)
          scroll.camera=id;
        end
        if (FriendFish==2)
          MindControlFish(FriendFishID.x,FriendFishID.y,4,2);
          ControlCharge=0; signal(type PowerChargeIcon, s_kill);
          InspireEffect(282); frame; InspireEffect(282);
          frame(2000);
          repeat frame; until(exists(type MindControlFish)==0)
          scroll.camera=id;
        end
        if (FriendFish==3)
          MindControlFish(FriendFishID.x,FriendFishID.y,4,3);
          ControlCharge=0; signal(type PowerChargeIcon, s_kill);
          InspireEffect(282); frame; InspireEffect(282);
          frame(2000);
          repeat frame; until(exists(type MindControlFish)==0)
          scroll.camera=id;
        end
      end frame(0);
    end

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=10; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=11; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=12; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=11; end
    if (AnimationCounter=>13) AnimationCounter=0; end

    if (ForwardSpeed>0)
      if (TempID=collision(type DisplaySpipOrb))
        TempID.Control=1;
        HP+=100;
        if (HP>1000 and HPBoostOn==0) HP=1000; end
        if (HP>1000 and HPBoostOn==1) HP=1050; end
      end
    end

    if (OctolingOn==1) if (TempID=collision(type Octoling)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (SwarmJelliconOn==1) if (TempID=collision(type SwarmJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (NonPlayerFishOn==1) if (TempID=collision(type NonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (TempID=collision(type SingleNonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    if (TempID=collision(type BounceAmoeba)) ForwardSpeed=TempID.Control; angle=(TempID.angle-180000); TempID.HP=1; end frame(0);
    if (BlobOn==1) if (TempID=collision(type Blob)) ForwardSpeed=4; end frame(0); end

    if (DeepTribeOn==1)
      if (TempID=collision(type DeepTribeFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    end

    if (CarryOn==1) if (TempID=collision(type CarryJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end

    if (DarkMotherOn==1)
      if (TempID=collision(type VortexFish))
        if (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed; end
        if (ForwardSpeed==0 and TempID.x=>x) x-=4; end
        if (ForwardSpeed==0 and TempID.x<=x) x+=4; end
      end
      frame(0);
      if (collision(type SuckEffect))
        if (x<1280) x+=3; end
        if (y<490) y+=3; end
      end
      frame(0);
      if (TempID=collision(type Vortex))
        TempAngle=angle+180000; ForwardSpeed=ForwardSpeed*2;
        advance(ForwardSpeed);
        repeat angle+=10000; frame(50); until(angle==TempAngle);
        advance(ForwardSpeed);
      end
    end

    if (alpha<255) alpha=255; end
    if (BlobOn==1)
      if (TempID=collision(type Blob))
        if (TempID.Control==1)
          alpha=150;
          if (x>TempID.x) x--; end
          if (x<TempID.x) x++; end
          if (y>TempID.y) y--; end
          if (y<TempID.y) y++; end
          ForwardSpeed=0;
        end
      end
    end

    advance(ForwardSpeed);

    if (StreamRoomOn==1)
      if (collision(type SuckEffect))
        repeat
          x+=3;
          y-=3;
          angle+=10000;
          frame;
        until(x>830 and y<-30)
        StreamPassage();
      end
    end

    if (DarkBlockOn==1 or DarkBlockOn2==1)
      frame(0);
      if (collision(type DarkBlock)>0) ForwardSpeed=-ForwardSpeed-1; end
      frame(0);
    end

    if (collision(LevelCheckID))
      if (ForwardSpeed<0) ForwardSpeed=-ForwardSpeed+1;
      elseif (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed-1; end
      if (ForwardSpeed>7) ForwardSpeed=7; end
      if (ForwardSpeed<-7) ForwardSpeed=-7; end
    end

    PlayerX=x; PlayerY=y; PlayerAngle=angle;

    if (key(_alt))
      if (ItemSelect==4 and MapItem==1)
        Map();
      end
      if (ItemSelect==7 and EggItem==1)
        EggDialog();
      end
      if (ItemSelect==3 and SpawnItem==1)
        if (exists(type DarkBall)==0) DarkBall(x,y,z,angle,Mode); end
      end
      if (ItemSelect==2 and ShellItem==2)
        play_wav(Jump2,0); LightKrill(x,y,50,z,0); ShellItem=3; frame(300);
      end
      if (ItemSelect==2 and ShellItem==1)
        if (TempID=collision(type LightKrill)) play_wav(Jump2,0); TempID.Control=1; ShellItem=2; frame(300); end
      end
      if (ShellItem==3) ShellItem=1; end
    end

    if (angle>360000) angle=0+angle-360000; end
    if (angle<-360000) angle=0+angle+360000; end

    if (key(_i))
      ItemNumber=8;
      Inventory();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_o) and FriendFish>0)
      if (exists(type Orders)==0)
        Orders();
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_p))
      if (exists(type Orders)==0)
        if (KnownPowers==1) Powers(335); end
        if (KnownPowers==2) Powers(336); end
        repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
      end
    end

    if (key(_l))
      QuestLog();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (key(_esc))
      SaveMenu();
      repeat frame; until(key(_enter) or key(_space))
    end

    if (HP<0)
      graph=0;
      fade(255,0,80,2);
      frame(4000);
      fade(0,0,0,2);
      frame(4000);
      GameOver();
      loop frame; end
    end

    PlayerHP=HP;

    frame;
  end
end



process StigmaDisplay();
begin
  ctype=c_scroll; graph=158; z=5; flags=16; alpha=0;
  repeat x=PlayerX; y=PlayerY; alpha+=10; frame(50); until(alpha==100)
  repeat x=PlayerX; y=PlayerY; frame; until(key(_control)==0)
  repeat x=PlayerX; y=PlayerY; alpha-=10; frame(50); until(alpha==0)
end




process DarkBall(x,y,z,angle,Mode);
begin
  ctype=c_scroll; alpha=150; graph=282; flags=32; size=50;
  play_wav(Dark,0);
  if (rand(1,10)==1) DarkbringerCloud(x,y,z); end
  repeat
    advance(7);
    if (size<100) size+=2; end
    if (rand(1,6)==1) DarkbringerCloud(x,y,z); end
    flags=32;
    frame;
    flags=0;
    frame(0);
  until(collision(LevelCheckID))
  repeat
    if (rand(1,6)==1) DarkbringerCloud(x,y,z); end
    alpha-=5;
    advance(6);
    flags=32;
    frame;
    flags=0;
    frame(0);
  until(alpha<=0)
  return;
end



process AttachedDarkBall(StartX,StartY,z,Mode);
begin
  ctype=c_scroll; alpha=150; graph=282; flags=32;
  x=StartX; y=StartX;
  repeat
    if (rand(1,6)==1) DarkbringerCloud(x,y,z); end
    size=rand(95,105);
    x=StartX+rand(-1,1);
    y=StartY+rand(-1,1);
    frame;
  until(Control==1)
  repeat alpha-=10; frame(50); until(alpha<=20)
end



process TalkLine();
begin
  ctype=c_scroll; graph=178; z=5; alpha=0;
  loop
    x=PlayerX; y=PlayerY;
    angle=PlayerAngle; advance(40);
    frame;
  end
end



process HealthMeter();
begin
  region_define(2,252,2,310,20);
  x=283; y=10; z=2; graph=31; region=2;
  HealthMeterBorder(x+2,y,z-1,graph-1);
  loop
    x=(father.HP/20)+230;
    frame;
  end
end



process HealthMeterBorder(x,y,z,graph);
begin
  region=2;
  loop frame; end
end



process QuestLog();
private
  int SelectQuest;
  int TempRedraw;
begin
  x=160; y=120; z=1; graph=32; size=0; flags=16; alpha=0;
  repeat alpha+=3; size+=2; frame(25); until(size==100)
  SelectQuest=1;

  repeat

    if (key(_left)) SelectQuest--; frame(400); end
    if (key(_right)) SelectQuest++; frame(400); end

    if (SelectQuest==0) SelectQuest=TotalQuests; end
    if (SelectQuest==TotalQuests+1) SelectQuest=1; end

    if (TempRedraw!=SelectQuest)
      delete_text(0);
      set_text_color(rgb(255,255,255));

      if (SelectQuest==1)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 1 - Searoads Part One Mesopelagia"); end

        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,32,0,"When the spipalgea blooms in Shallow reef,"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,42,0,"when one Grand Orb changes with the next, fish"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,52,0,"from nearby communities travel there to"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,62,0,"socialize and eat in peace. The waters between"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,72,0,"Silent reef and Shallow reef are connected by"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,82,0,"a series of tunnels and the East Silent"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,92,0,"Stream. Travel to Shallow reef to meet up with"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,102,0,"the other Fish and Fishlings."); end

        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,122,0,"Gill wants you to go to Silent reef with him."); end
        
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,132,0,"Your mother told you to stay away from Badfish"); end
        if (Quests=>1) set_text_color(rgb(0,200,0)); write(0,12,142,0,"and Strangers!"); end

        if (DoIntro==3) set_text_color(rgb(0,200,0)); write(0,12,152,0,"You apparently decided that you did not want"); end
        if (DoIntro==3) set_text_color(rgb(0,200,0)); write(0,12,162,0,"to be accompanied by Gill and thus have to"); end
        if (DoIntro==3) set_text_color(rgb(0,200,0)); write(0,12,172,0,"make it there on your own."); end

        if (StrimMemory==1) set_text_color(rgb(0,200,0)); write(0,12,182,0,"On your way to Shallow reef you met a"); end
        if (StrimMemory==1) set_text_color(rgb(0,200,0)); write(0,12,192,0,"strange and powerful Fish."); end

        if (FirstStone==1) set_text_color(rgb(0,200,0)); write(0,12,202,0,"On your way to Shallow reef you found a"); end
        if (FirstStone==1) set_text_color(rgb(0,200,0)); write(0,12,212,0,"strange old rock with mystic carvings"); end
        if (FirstStone==1) set_text_color(rgb(0,200,0)); write(0,12,222,0,"on it."); end
      end


      if (SelectQuest==2)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 2"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 2 - The Darkest Parts of the Sea"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Gelatinous Depths"); end

        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,42,0,"This Guy Lim who apparently knows of my"); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,52,0,"father wants me to find his friend Blu."); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,62,0,"I don't know why he wanted me to do it"); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,72,0,"but I want to see where this is going."); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,82,0,"I don't know where to start on this one,"); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,92,0,"maybe I should ask around if anyone saw"); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,102,0,"where Blu went?"); end

        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,122,0,"Maybe I should get a friend to go along on"); end
        if (LimMemory>0) set_text_color(rgb(0,200,0)); write(0,12,132,0,"this; it might be dangerous to go alone."); end

        if (FolderMemory>0) set_text_color(rgb(0,200,0)); write(0,12,152,0,"Folder told me that Blu was asking him"); end
        if (FolderMemory>0) set_text_color(rgb(0,200,0)); write(0,12,162,0,"about those Jellicons, I don't know what"); end
        if (FolderMemory>0) set_text_color(rgb(0,200,0)); write(0,12,172,0,"that's all about but maybe I should pay a"); end
        if (FolderMemory>0) set_text_color(rgb(0,200,0)); write(0,12,182,0,"visit to the Gelatinous Caverns."); end
      end


      if (SelectQuest==3)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 3"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 3 - Searoads Part Two"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Bathypelagia"); end

        if (SunlitDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,42,0,"I have entered the sunlit Sea. The most"); end
        if (SunlitDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,52,0,"beautiful part of these waters. There"); end
        if (SunlitDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,62,0,"seems to be quite a lot of wildlife"); end
        if (SunlitDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,72,0,"here, and some dangers. Maybe I should"); end
        if (SunlitDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,82,0,"explore it?"); end

        if (RaceDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,102,0,"I have found a group of fish who engage"); end
        if (RaceDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,112,0,"in racing."); end

        if (EldaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,122,0,"Elda told me that there are dangerous"); end
        if (EldaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,132,0,"things in the west."); end
      end


      if (SelectQuest==4)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 4"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 4 - Searoads Part Three"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Gelatipelagia?!"); end

        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,42,0,"The Gelatinum Caverns is the home of the"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,52,0,"Jellicons are strange beings who always"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,62,0,"seems to be involved in their own strange"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,72,0,"affairs. If I'm careful, I might be able"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,82,0,"to explore their home."); end

        if (CavernsDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,102,0,"I have entered the Gelatinum Caverns."); end

        if (BreederDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,122,0,"I saw a large and strange Jellicon with"); end
        if (BreederDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,132,0,"a giant brain!"); end

        if (SeaRoadsDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,152,0,"I entered a strange area where there are"); end
        if (SeaRoadsDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,162,0,"several cubes with enemies in them!"); end

        if (RoadsConnectionDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,182,0,"I saw a couple of Jellicons who had"); end
        if (RoadsConnectionDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,192,0,"captured a Darkbringer!"); end
      end


      if (SelectQuest==5)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 5"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 5 - Searoads Part Four"); end
        if (Quests=>2) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Abyssalpelagia"); end

        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,42,0,"The deep roads... The darkness grows thick"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,52,0,"there, swallowing every tiny speck of light."); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,62,0,"It is also a place of beauty and wondrous"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,72,0,"sights. I will have to watch my fins while"); end
        if (Quests=>2) set_text_color(rgb(0,200,0)); write(0,12,82,0,"I explore this place."); end

        if (TribeDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,102,0,"I found the Tribe of the Deep."); end

        if (GhostFishMemory>0) set_text_color(rgb(0,200,0)); write(0,12,122,0,"I found an old Ghostfish!"); end

        if (BreedingGroundDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,142,0,"I found the Darkbringers"); end
        if (BreedingGroundDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,152,0,"breeding-ground."); end

        if (MotherDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,172,0,"I found the lair of the Dark mother."); end

        if (AbyssDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,192,0,"I discovered a crazy place in the deepest,"); end
        if (AbyssDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,202,0,"darkest part of the sea. What madness lies"); end
        if (AbyssDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,212,0,"in wait down there?"); end
      end


      if (SelectQuest==6)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 6"); end
        if (Quests=>3) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 6 - The Darkest Parts of the Sea"); end
        if (Quests=>3) set_text_color(rgb(0,255,0)); write(0,12,22,0,"How the sunlight splits upon the waves"); end

        if (Quests=>3) set_text_color(rgb(0,200,0)); write(0,12,42,0,"Lim has asked me to get a certain item for him,"); end
        if (Quests=>3) set_text_color(rgb(0,200,0)); write(0,12,52,0,"an item which he jokingly called 'a shell that"); end
        if (Quests=>3) set_text_color(rgb(0,200,0)); write(0,12,62,0,"attracts those light-krill-thingies. To find the"); end
        if (Quests=>3) set_text_color(rgb(0,200,0)); write(0,12,72,0,"item I need to travel to the Sunlit Sea and find"); end
        if (Quests=>3) set_text_color(rgb(0,200,0)); write(0,12,82,0,"a group of racing fish who currently owns it."); end

        if (RaceDiscover>0) set_text_color(rgb(0,200,0)); write(0,12,102,0,"I found the Raceway."); end

        if (EldaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,122,0,"I spoke to Elda and she told me about"); end
        if (EldaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,132,0,"various things."); end

        if (RaceWon>1) set_text_color(rgb(0,200,0)); write(0,12,152,0,"I have won the Glowing Shell!"); end
        if (PlayerFish==3 and ShellItem>0) set_text_color(rgb(0,200,0)); write(0,12,152,0,"I stole the Glowing Shell."); end
      end


      if (SelectQuest==7)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 7"); end
        if (Quests=>4) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 7 - The Darkest Parts of the Sea"); end
        if (Quests=>4) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Deep Into That Darkness"); end

        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,42,0,"I have shown Lim the Shell but he said it was"); end
        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,52,0,"a two-part mission. Now I am supposed to"); end
        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,62,0,"travel to the Deep roads and find something that"); end
        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,72,0,"is called a seed of darkness. There are supposed"); end
        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,82,0,"to be some fish who live down there, maybe they"); end
        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,92,0,"can help me. The glowing shell is supposed to"); end
        if (Quests=>4) set_text_color(rgb(0,200,0)); write(0,12,102,0,"help me find my way in the darkness."); end

        if (DrumMemory>0) set_text_color(rgb(0,200,0)); write(0,12,122,0,"I spoke with Drum of the Deep."); end

        if (EldaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,142,0,"I have found the Dark mother."); end

        if (SpawnItem>0) set_text_color(rgb(0,200,0)); write(0,12,162,0,"I managed to take a Seed of darkness; I must"); end
        if (SpawnItem>0) set_text_color(rgb(0,200,0)); write(0,12,172,0,"show it to Lim."); end
      end


      if (SelectQuest==8)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 8"); end
        if (Quests=>5) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 8 - The Darkest Parts of the Sea"); end
        if (Quests=>5) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Way Of The Predator"); end

        if (Quests=>5) set_text_color(rgb(0,200,0)); write(0,12,42,0,"Lim told me everything. About the Evolutional"); end
        if (Quests=>5) set_text_color(rgb(0,200,0)); write(0,12,52,0,"Revolutionaries, The Triumvirate and the"); end
        if (Quests=>5) set_text_color(rgb(0,200,0)); write(0,12,62,0,"Selachimorphs. Now Im supposed to head to the"); end
        if (Quests=>5) set_text_color(rgb(0,200,0)); write(0,12,72,0,"western parts of the Sunlit Sea and find a"); end
        if (Quests=>5) set_text_color(rgb(0,200,0)); write(0,12,82,0,"Selachimorph warlord named Sark. When I see him"); end
        if (Quests=>5) set_text_color(rgb(0,200,0)); write(0,12,92,0,"I will drop a cloud of Darkness upon him."); end

        if (SarkMemory>0) set_text_color(rgb(0,200,0)); write(0,12,112,0,"I dropped the darkness on Sark! Now I must"); end
        if (SarkMemory>0) set_text_color(rgb(0,200,0)); write(0,12,112,0,"get back to the Reef to tell Lim all about it!"); end
      end


      if (SelectQuest==9)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 9"); end
        if (Quests=>6) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 9 - The Darkest Parts of the Sea"); end
        if (Quests=>6) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Something Good To Die For"); end

        if (Quests=>6) set_text_color(rgb(0,200,0)); write(0,12,42,0,"Selachimorphs are everywhere! We are trapped"); end
        if (Quests=>6) set_text_color(rgb(0,200,0)); write(0,12,52,0,"in a tunnel! What's going to happen?"); end

        if (SarkMemory>3) set_text_color(rgb(0,200,0)); write(0,12,72,0,"Blu tricked some Selachimorphs to follow"); end
        if (SarkMemory>3) set_text_color(rgb(0,200,0)); write(0,12,82,0,"him so now we are free!"); end

        if (LimMemory=>11) set_text_color(rgb(0,200,0)); write(0,12,102,0,"Lim told me about Spipreef... I don't"); end
        if (LimMemory=>11) set_text_color(rgb(0,200,0)); write(0,12,112,0,"want to think about it."); end
      end


      if (SelectQuest==10)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 10"); end
        if (MoistMemory>0) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 10 - Moist"); end
        if (MoistMemory>0) set_text_color(rgb(0,255,0)); write(0,12,22,0,"The stupid fish who always gets lost."); end

        if (MoistQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,42,0,"I've encountered a strange fish who told"); end
        if (MoistQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,52,0,"me that he always gets lost. He asked me if"); end
        if (MoistQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,62,0,"I could find him when this happens so that"); end
        if (MoistQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,72,0,"he can find his way home. Maybe something"); end
        if (MoistQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,82,0,"cool will happen if I find him enough times?"); end

        if (MoistQuest=>3) set_text_color(rgb(0,200,0)); write(0,12,102,0,"I found Moist by the Road to Sunlit Sea."); end

        if (MoistQuest=>4) set_text_color(rgb(0,200,0)); write(0,12,122,0,"I found Moist by the Deep Road Dungeon."); end

        if (MoistQuest=>5) set_text_color(rgb(0,200,0)); write(0,12,142,0,"I found Moist close to the Selachimorph Sea."); end

        if (MoistQuest=>6) set_text_color(rgb(0,200,0)); write(0,12,162,0,"I found Moist by the Arturus Krill Nesting Place."); end

        if (MoistQuest=>7) set_text_color(rgb(0,200,0)); write(0,12,182,0,"I finally found Moist for the last time and he"); end
        if (MoistQuest=>7) set_text_color(rgb(0,200,0)); write(0,12,192,0,"rewarded me with a... rock that makes strange"); end
        if (MoistQuest=>7) set_text_color(rgb(0,200,0)); write(0,12,202,0,"sounds?"); end

      end


      if (SelectQuest==11)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 11"); end
        if (DrumMemory>0) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 11 - Drum's Quest"); end
        if (DrumMemory>0) set_text_color(rgb(0,255,0)); write(0,12,22,0,"The Strange Fate of the Ancient Ghostfish"); end

        if (GhostFishQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,42,0,"Drum has asked me to investigate about"); end
        if (GhostFishQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,52,0,"an old bleak fish who lives in the darkest"); end
        if (GhostFishQuest=>1) set_text_color(rgb(0,200,0)); write(0,12,62,0,"parts of the Deep Roads."); end

        if (GhostFishQuest=>2) set_text_color(rgb(0,200,0)); write(0,12,82,0,"I have spoken to the Ghostfish and I have"); end
        if (GhostFishQuest=>2) set_text_color(rgb(0,200,0)); write(0,12,92,0,"heard his story."); end

        if (GhostFishQuest=>3) set_text_color(rgb(0,200,0)); write(0,12,102,0,"I spoke to Drum about it and he asked me"); end
        if (GhostFishQuest=>3) set_text_color(rgb(0,200,0)); write(0,12,112,0,"to ask the Ghostfish if he wants to live"); end
        if (GhostFishQuest=>3) set_text_color(rgb(0,200,0)); write(0,12,132,0,"with the Tribe."); end

        if (GhostFishQuest=>4) set_text_color(rgb(0,200,0)); write(0,12,142,0,"The Ghostfish agreed to live with the Tribe"); end
        if (GhostFishQuest=>4) set_text_color(rgb(0,200,0)); write(0,12,152,0,"but wants me to find an old seed that he"); end
        if (GhostFishQuest=>4) set_text_color(rgb(0,200,0)); write(0,12,162,0,"left long ago. He hopes that his influence"); end
        if (GhostFishQuest=>4) set_text_color(rgb(0,200,0)); write(0,12,172,0,"might keep it from turning crazy."); end

        if (GhostFishQuest=>5) set_text_color(rgb(0,200,0)); write(0,12,192,0,"I have found the seed, a ghostfish named Argh!"); end

        if (GhostFishQuest=>6) set_text_color(rgb(0,200,0)); write(0,12,212,0,"I reunited Argh! with the ancient Ghostfish."); end
        if (GhostFishQuest=>6) set_text_color(rgb(0,200,0)); write(0,12,222,0,"They now live with the Tribe of the Deep."); end
      end


      if (SelectQuest==12)
        if (Quests=>1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 12"); end
        if (VeolaMemory>0) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 12 - Veola's Quest"); end
        if (VeolaMemory>0) set_text_color(rgb(0,255,0)); write(0,12,22,0,"Not so friendly "); end

        if (VeolaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,42,0,"Veola asked me to... make sure that Slug"); end
        if (VeolaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,52,0,"disappear. She wants me to lure him to the"); end
        if (VeolaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,62,0,"top of the ocean, to a place where purple"); end
        if (VeolaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,72,0,"seagrass grow. Probably where the blue"); end
        if (VeolaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,82,0,"clams nest."); end
        if (VeolaMemory>0) set_text_color(rgb(0,200,0)); write(0,12,92,0,"I don't know if I should do this however."); end

        if (SlugQuest==1) set_text_color(rgb(0,200,0)); write(0,12,112,0,"I told Slug to join me. Should I carry on"); end
        if (SlugQuest==1) set_text_color(rgb(0,200,0)); write(0,12,132,0,"with Veola's suggestion?"); end

        if (SlugQuest==2 or SlugMemory>1) set_text_color(rgb(0,200,0)); write(0,12,152,0,"I told Slug all Veola said. Now he is my"); end
        if (SlugQuest==2 or SlugMemory>1) set_text_color(rgb(0,200,0)); write(0,12,162,0,"friend and I won't leave him."); end
        if (SlugQuest==3) set_text_color(rgb(0,200,0)); write(0,12,152,0,"I left poor Slug to his fate at the place"); end
        if (SlugQuest==3) set_text_color(rgb(0,200,0)); write(0,12,162,0,"Veola suggested."); end
      end


    if (SelectQuest==13)
      set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 13");
      if (FirstStone==1 or SecondStone==1 or ThirdStone==1) set_text_color(rgb(0,255,0)); write(0,12,12,0,"Page 13 - The Mystic Stones"); end

      if (FirstStone==1 or SecondStone==1 or ThirdStone==1) set_text_color(rgb(0,200,0)); write(0,12,32,0,"Rocks are not supposed to whisper things into"); end
      if (FirstStone==1 or SecondStone==1 or ThirdStone==1) set_text_color(rgb(0,200,0)); write(0,12,42,0,"your mind. Don't trust them. Anyway,"); end
      if (FirstStone==1 or SecondStone==1 or ThirdStone==1) set_text_color(rgb(0,200,0)); write(0,12,52,0,"investigating this might prove fruitful."); end

      if (FirstStone==1) set_text_color(rgb(0,200,0)); write(0,12,72,0,"Death. We swam. The sea would not hear our"); end
      if (FirstStone==1) set_text_color(rgb(0,200,0)); write(0,12,82,0,"pleas. Would not save us. Gone, but not without"); end
      if (FirstStone==1) set_text_color(rgb(0,200,0)); write(0,12,92,0,"legacy."); end

      if (SecondStone==1) set_text_color(rgb(0,200,0)); write(0,12,112,0,"Sea and air, blue and blue. And black. From"); end
      if (SecondStone==1) set_text_color(rgb(0,200,0)); write(0,12,122,0,"one depth and into another. Another kind of"); end
      if (SecondStone==1) set_text_color(rgb(0,200,0)); write(0,12,132,0,"stream. We searched for it, but when we"); end
      if (SecondStone==1) set_text_color(rgb(0,200,0)); write(0,12,142,0,"found it, we were already lost."); end

      if (ThirdStone==1) set_text_color(rgb(0,200,0)); write(0,12,162,0,"Great orb, great orb. Fill my mind. Red sea,"); end
      if (ThirdStone==1) set_text_color(rgb(0,200,0)); write(0,12,172,0,"blood water, wicked eyes, our synergy. We"); end
      if (ThirdStone==1) set_text_color(rgb(0,200,0)); write(0,12,182,0,"were too close, too close."); end
    end

    end
    TempRedraw=SelectQuest;

  frame;
  until(key(_enter) or key(_space))

  delete_text(0);
  repeat alpha-=3; size-=2; frame(25); until(size==0)
end




process Inventory();
begin
  x=160; y=120; z=2; graph=13; alpha=0; size=0;
  ItemSelector();
  InventoryItem(1);
  InventoryItem(2);
  InventoryItem(3);
  InventoryItem(4);
  InventoryItem(5);
  InventoryItem(6);
  InventoryItem(7);
  InventoryItem(8);
  repeat alpha+=2; size+=2; frame(25); until(size==100)
  repeat frame; until(key(_enter) or key(_space))
  repeat alpha+=2; size-=2; frame(25); until(size==0)
end



process ItemSelector();
begin
  x=160; y=120; z=0; graph=14; alpha=70; size=0; flags=16;
  repeat alpha++; size+=2; frame(25); until(size==100)
  repeat frame; until(key(_enter) or key(_space))
  repeat alpha++; size-=2; frame(25); until(size==0)
end



process InventoryItem(Mode);
private
  int Counter;
  int StartRotate;
begin

  x=160; y=120; z=1; size=0;
  if (Mode==1 and GelatinumItem==0) angle=0; graph=0; end
  if (Mode==1 and GelatinumItem==1) angle=0; graph=304; end
  if (Mode==2 and ShellItem==0) angle=45000; graph=0; end
  if (Mode==2 and ShellItem==1) angle=45000; graph=300; end
  if (Mode==2 and ShellItem==2) angle=45000; graph=301; end
  if (Mode==3 and SpawnItem==0) angle=90000; graph=0; end
  if (Mode==3 and SpawnItem==1) angle=90000; graph=257; end
  if (Mode==4 and MapItem==0) angle=135000; graph=0; end
  if (Mode==4 and MapItem==1) angle=135000; graph=407; end
  if (Mode==5 and DrumItem==0) angle=180000; graph=0; end
  if (Mode==5 and DrumItem==1) angle=180000; graph=442; end
  if (Mode==6 and CollectItem==0) angle=225000; graph=0; end
  if (Mode==6 and CollectItem>0) angle=225000; graph=446+CollectItem; end
  if (Mode==7 and EggItem==0) angle=270000; graph=0; end
  if (Mode==7 and EggItem==1) angle=270000; graph=404; end
  if (Mode==8 and HookItem==0) angle=315000; graph=0; end
  if (Mode==8 and HookItem==1) angle=315000; graph=15; end
  repeat size+=2; frame(25); until(size==100)
  ItemSelect=1;

  repeat
    if (key(_left))
      Counter=0;
      repeat
        angle+=5000;
        Counter++;
        frame;
      until(Counter==9)
    end
    if (key(_right))
      Counter=0;
      repeat
        angle-=5000;
        Counter++;
        frame;
      until(Counter==9)
    end

    frame;
  until(key(_enter) or key(_space))

  if (collision(type ItemSelector))
    repeat alpha-=6; y++; frame(50); until(alpha<50)
    if (graph>0) ItemSelect=Mode; end
  end
end



process SelectedItem();
begin
  x=240; y=10; z=1;
  loop
    if (ItemSelect==0) graph=0; end
    if (ItemSelect==1 and GelatinumItem==1) graph=230; end
    if (ItemSelect==2 and ShellItem==1) graph=302; end
    if (ItemSelect==2 and ShellItem==2) graph=303; end
    if (ItemSelect==3 and SpawnItem==1) graph=258; end
    if (ItemSelect==4 and MapItem==1) graph=406; end
    if (ItemSelect==5 and DrumItem==1) graph=443; end
    if (ItemSelect==6 and CollectItem>0) graph=446; end
    if (ItemSelect==7 and EggItem==1) graph=403; end
    if (ItemSelect==8 and HookItem==1) graph=316; end
    frame;
  end
end



process Map();
begin

  signal(PlayerID, s_freeze);

  graph=227; x=160; y=120; z=2; size=0; alpha=50;
  play_wav(Open,0);

  if (OceanDiscover==0) MapBlock(145,2); MapBlock(110,-30); end
  if (DeepRoadsDiscover==0) MapBlock(212,164); MapBlock(302,164); MapBlock(153,239); end
  if (CavernsDiscover==0) MapBlock(205,65); MapBlock(265,65); end
  if (SunlitDiscover==0) MapBlock(40,70); end
  DisplayMap();
  repeat alpha+=3; size+=2; frame(25); until(size==100)

  MapDot(LocationX,LocationY);

  repeat
    frame;
  until(key(_enter) or key(_space))

  play_wav(Open,0);
  signal(type MapDot, s_kill);
  repeat alpha-=3; size-=2; frame(25); until(size==0)
  signal(PlayerID, s_wakeup);
  return;
end



process DisplayMap();
begin
  x=160; y=120; z=1; graph=405; size=0; alpha=50;
  repeat alpha+=3; size+=2; frame(25); until(size==100)

  repeat frame; until(key(_enter) or key(_space))
  repeat alpha-=3; size-=2; frame(25); until(size==0)
end


process MapDot(x,y);
private
  int Direction;
begin
  z=0; graph=91; size=90;
  loop
    if (Direction==0) size+=2; end
    if (Direction==1) size-=2; end
    if (size<=90) Direction=0; end
    if (size=>110) Direction=1; end
    frame(50);
  end
end


process MapBlock(x,y);
begin
  z=0; size=0; alpha=50; flags=32; graph=408;
  repeat alpha+=3; size+=2; frame(25); until(size==100)
  alpha=255; repeat frame; until(key(_enter) or key(_space))
  repeat alpha-=3; size-=2; frame(25); until(size==0)
end



process Orders();
begin
  x=160; y=120; z=2; graph=90; alpha=0; size=0;
  repeat alpha+=5; size+=2; frame(25); until(size==100)
  repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
  if (key(_left)) FriendFishOrder=2; FriendFishExpression2(160,0); end
  if (key(_right)) FriendFishOrder=3; FriendFishExpression2(160,0); end
  if (key(_up)) FriendFishOrder=1; FriendFishExpression2(160,0); end
  if (key(_down)) FriendFishOrder=4; FriendFishExpression2(160,0); end
  repeat alpha-=5; size-=2; frame(25); until(size==0)

  if (FriendFishOrder==4)
    TextBox(0); frame(700);
    if (FriendFish==1)
      set_text_color(rgb(160,210,0));
      write(0,6,126,0,"Gill");
    end
    if (FriendFish==2)
      set_text_color(rgb(0,70,160));
      write(0,6,126,0,"Finn");
    end
    if (FriendFish==3)
      set_text_color(rgb(200,200,0));
      write(0,6,126,0,"Slug");
    end
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Okay, I'll return once we leave this area.");
    repeat frame; until(key(_enter) or key(_space))
    FriendFish=0;
  end
end




process Powers(graph);
begin
  x=160; y=120; z=2; alpha=0; size=0;
  repeat alpha+=5; size+=2; frame(25); until(size==100)
  repeat frame; until(key(_left) or key(_right) or key(_up) or key(_down))
  if (key(_left)) FishPower=1; end
  if (KnownPowers==2 and key(_up)) FishPower=2; end
  if (KnownPowers==3 and key(_right)) FishPower=3; end
  if (KnownPowers==4 and key(_down)) FishPower=4; end
  repeat alpha-=5; size-=2; frame(25); until(size==0)
end




process SelectedPower();
begin
  x=80; y=10; z=1;
  loop
    if (FishPower==1 and PlayerFish==1) graph=339; end
    if (FishPower==2 and PlayerFish==1) graph=339; end
    if (FishPower==1 and PlayerFish==2) graph=337; end
    if (FishPower==2 and PlayerFish==2) graph=338; end
    if (FishPower==1 and PlayerFish==3) graph=343; end
    if (FishPower==2 and PlayerFish==3) graph=344; end
    if (FishPower==1 and PlayerFish==4) graph=341; end
    if (FishPower==2 and PlayerFish==4) graph=342; end
    frame;
  end
end




process FriendFishExpression(graph,Mode);
private
  int DelayCounter;
begin
  ctype=c_scroll; alpha=5; size=0;
  x=father.x; y=father.y-20; z=2; frame;
  repeat
    if (Mode==0) x=father.x; y=father.y-20; end
    if (Mode==1) x=father.x-10; y=father.y-15; end
    if (Mode==2) x=father.x+11; y=father.y-15; end
    size+=20;
    alpha+=50;
    frame;
  until(alpha=>255);
  repeat
    if (Mode==0) x=father.x; y=father.y-20; end
    if (Mode==1) x=father.x-10; y=father.y-15; end
    if (Mode==2) x=father.x+11; y=father.y-15; end
    DelayCounter++;
    frame;
  until(DelayCounter==20);
  repeat
    if (Mode==0) x=father.x; y=father.y-20; end
    if (Mode==1) x=father.x-10; y=father.y-15; end
    if (Mode==2) x=father.x+11; y=father.y-15; end
    size-=20;
    alpha-=50;
    frame;
  until(alpha<=5);
  return;
end



process FriendFishExpression2(graph,Mode);
private
  int DelayCounter;
begin
  ctype=c_scroll; alpha=5; size=0;
  x=FriendFishID.x; y=FriendFishID.y-20; z=2; frame;
  repeat
    if (Mode==0) x=FriendFishID.x; y=FriendFishID.y-20; end
    size+=20;
    alpha+=50;
    frame;
  until(alpha=>255);
  repeat
    if (Mode==0) x=FriendFishID.x; y=FriendFishID.y-20; end
    DelayCounter++;
    frame;
  until(DelayCounter==20);
  repeat
    if (Mode==0) x=FriendFishID.x; y=FriendFishID.y-20; end
    size-=20;
    alpha-=50;
    frame;
  until(alpha<=5);
  return;
end




process MindControlEffect1(x,y,z,Mode);
begin
  ctype=c_scroll; graph=115; flags=16; alpha=200;

  repeat
    angle=get_angle(FriendFishID);
    advance(3);
    MindControlEffectTrail(x,y,z+1);
    frame(50);
  until(collision(FriendFishID));

  Control=1;
  repeat
    angle=get_angle(FriendFishID);
    advance(3);
    alpha-=2;
    frame(50);
  until(alpha<40)
end



process MindControlEffect2(x,y,z,Mode);
begin
  ctype=c_scroll; graph=115; flags=16; alpha=200;
  if (Mode==1) graph=214; end
  repeat
    angle=get_angle(PlayerID);
    advance(3);
    MindControlEffectTrail(x,y,z+1);
    frame(50);
  until(collision(PlayerID));

  Control=1;
  repeat
    angle=get_angle(PlayerID);
    advance(3);
    alpha-=2;
    frame(50);
  until(alpha<40)
end



process MindControlEffectTrail(x,y,z);
begin
  ctype=c_scroll; graph=father.graph; flags=16; alpha=200;
  repeat
    alpha-=4;
    frame;
  until(alpha<40 or father.Control==1)
  repeat alpha-=10; frame(50); until(alpha<40)
end




process MindControlFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempID;
  int TempAngle;
  int SwitchAngle;
  int EatCounter;
  int AuraOn;
  int AuraID;
begin
  ctype=c_scroll; scroll.camera=id; angle=PlayerAngle; graph=10;
  HP=1000;
  signal(type FriendHealth, s_kill); FriendHealth();
  signal(FriendFishID, s_sleep_tree); signal(type TalkLine, s_sleep);
  if (FriendFish==3) AuraID=LightFishAura(5,2); AuraOn=0; end


  if (get_dist(PlayerID)>200)
    if (FriendFish==3) signal(AuraID, s_kill); end
    signal(FriendFishID, s_wakeup_tree);
    signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
    InspireEffect(282); frame; InspireEffect(282);
    FriendFishID.x=x; FriendFishID.y=y;
    graph=0; frame(1000); return;
  end

  if (collision(LevelCheckID))
    if (FriendFish==3) signal(AuraID, s_kill); end
    signal(FriendFishID, s_wakeup_tree);
    signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
    InspireEffect(282); frame; InspireEffect(282);
    FriendFishID.x=x; FriendFishID.y=y;
    graph=0; frame(1000); return;
  end

  loop
    if (key(_left))
      angle+=5000;
      if (collision(LevelCheckID)) angle-=6000; frame(0); end
    end
    if (key(_right))
      angle-=5000;
      if (collision(LevelCheckID)) angle+=6000; frame(0); end
    end

    if (key(_up))
      AnimationCounter++;
      if (ForwardSpeed=>0 and ForwardSpeed<9)
        if (FriendFish!=2) ForwardSpeed=6; end
        if (FriendFish==2) ForwardSpeed=8; end
      end
    end

    if (FriendFish==3 and key(_control))
      if (AuraOn==0)
        signal(AuraID, s_kill); AuraID=LightFishAura(5,3); AuraOn=1; frame(400);
      elseif (AuraOn==1)
        signal(AuraID, s_kill); AuraID=LightFishAura(5,2); AuraOn=0; frame(400);
      end
    end

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    AnimationCounter++;
    if (Mode==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=323; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=324; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=325; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=324; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=326; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=327; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=328; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=327; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end

    if (ForwardSpeed>0)
      if (TempID=collision(type DisplaySpipOrb))
        TempID.Control=1;
        HP+=50;
        if (HP>1000) HP=1000; end
      end
    end

    if (OctolingOn==1) if (TempID=collision(type Octoling)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (SwarmJelliconOn==1) if (TempID=collision(type SwarmJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (NonPlayerFishOn==1) if (TempID=collision(type NonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0); end
    if (TempID=collision(type SingleNonPlayerFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    if (TempID=collision(type BounceAmoeba)) ForwardSpeed=TempID.Control; angle=(TempID.angle-180000); TempID.HP=1; end frame(0);
    if (BlobOn==1) if (TempID=collision(type Blob)) ForwardSpeed=4; end frame(0); end

    if (DeepTribeOn==1)
      if (TempID=collision(type DeepTribeFish)) ForwardSpeed=-ForwardSpeed; end frame(0);
    end

    if (CarryOn==1) if (TempID=collision(type CarryJellicon)) ForwardSpeed=-ForwardSpeed; end frame(0); end

    if (DarkMotherOn==1)
      if (TempID=collision(type VortexFish))
        if (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed; end
        if (ForwardSpeed==0 and TempID.x=>x) x-=4; end
        if (ForwardSpeed==0 and TempID.x<=x) x+=4; end
      end
      frame(0);
      if (collision(type SuckEffect))
        if (x<1280) x+=3; end
        if (y<490) y+=3; end
      end
      frame(0);
      if (TempID=collision(type Vortex))
        TempAngle=angle+180000; ForwardSpeed=ForwardSpeed*2;
        advance(ForwardSpeed);
        repeat angle+=10000; frame(50); until(angle==TempAngle);
        advance(ForwardSpeed);
      end
      if (collision(type DarkMotherJaw))
        if (FriendFish==3) signal(AuraID, s_kill); end
        MindControlEffect2(x,y,z+1,0);
        signal(FriendFishID, s_wakeup_tree);
        signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
        InspireEffect(282); frame; InspireEffect(282);
        FriendFishID.x=x; FriendFishID.y=y;
        graph=0; frame(2000); return;
      end
    end

    if (alpha<255) alpha=255; end
    if (TempID=collision(type Blob))
      if (TempID.Control==1)
        alpha=150;
        if (x>TempID.x) x--; end
        if (x<TempID.x) x++; end
        if (y>TempID.y) y--; end
        if (y<TempID.y) y++; end
        ForwardSpeed=0;
      end
    end

    advance(ForwardSpeed);

    if (DarkBlockOn==1 or DarkBlockOn2==1)
      frame(0);
      if (collision(type DarkBlock)>0) ForwardSpeed=-ForwardSpeed-1; end
      frame(0);
    end

    if (collision(LevelCheckID))
      if (ForwardSpeed<0) ForwardSpeed=-ForwardSpeed+1;
      elseif (ForwardSpeed>0) ForwardSpeed=-ForwardSpeed-1; end
    end

    PlayerX=x; PlayerY=y; PlayerAngle=angle;

    if (angle>360000) angle=0+angle-360000; end
    if (angle<-360000) angle=0+angle+360000; end

    if (key(_alt))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    if (key(_i))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      graph=0; frame(2000); return;
    end

    if (key(_o))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      graph=0; frame(2000); return;
    end

    if (key(_p))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      graph=0; frame(2000); return;
    end

    if (key(_l))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      graph=0; frame(2000); return;
    end

    if (collision(PlayerID))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      graph=0; frame(2000); return;
    end

    if (get_dist(PlayerID)>500)
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      graph=0; frame(2000); return;
    end

    if (OctolingOn==1)
      if (collision(type OctoShot) or collision(type OctoShot2))
        if (FriendFish==3) signal(AuraID, s_kill); end
        MindControlEffect2(x,y,z+1,0);
        signal(FriendFishID, s_wakeup_tree);
        signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
        InspireEffect(282); frame; InspireEffect(282);
        FriendFishID.x=x; FriendFishID.y=y;
        graph=0; frame(2000); return;
      end
    end

    if (CarryOn==1)
      if (collision(type CarryJellicon))
        if (FriendFish==3) signal(AuraID, s_kill); end
        MindControlEffect2(x,y,z+1,0);
        signal(FriendFishID, s_wakeup_tree);
        signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
        InspireEffect(282); frame; InspireEffect(282);
        FriendFishID.x=x; FriendFishID.y=y;
        graph=0; frame(2000); return;
      end
    end

    if (SwarmJelliconOn==1)
      if (collision(type SwarmJellicon))
        if (FriendFish==3) signal(AuraID, s_kill); end
        MindControlEffect2(x,y,z+1,0);
        signal(FriendFishID, s_wakeup_tree);
        signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
        InspireEffect(282); frame; InspireEffect(282);
        FriendFishID.x=x; FriendFishID.y=y;
        graph=0; frame(2000); return;
      end
    end

    if (collision(type SelachiMorph2))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    if (collision(type GhostFishHunter))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    if (collision(type DarkBringer))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    if (collision(type DarkBringerLurker))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    if (collision(type GasSpirit))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    if (collision(type GhostFish2) or collision(type GhostFish3))
      if (FriendFish==3) signal(AuraID, s_kill); end
      MindControlEffect2(x,y,z+1,0);
      signal(FriendFishID, s_wakeup_tree);
      signal(type FriendHealth, s_kill); signal(type TalkLine, s_wakeup);
      InspireEffect(282); frame; InspireEffect(282);
      FriendFishID.x=x; FriendFishID.y=y;
      graph=0; frame(2000); return;
    end

    frame;
  end
end




process CompanionFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int EatCounter;
  int DriftCounter;
  int TurnAround;
  int CheckX;
  int Turn;
  int ChillCounter;
  int StartAngle;
  int AuraID;
  int AuraOn;
begin
  if (Mode==0)
    loop
      x=PlayerX;
      y=PlayerY;
      frame;
    end
  end
  ctype=c_scroll; HP=1000; FriendHealth(); FriendFishOrder=1;
  frame(200); angle=PlayerAngle;

  if (FriendFish==3) AuraID=LightFishAura(5,2); AuraOn=0; end

  loop

    if (FriendFishOrder==1 or FriendFishOrder==3  or FriendFishOrder==4)

      if (get_dist(PlayerID)>70)
        if (StartAngle==0) angle=get_angle(PlayerID); StartAngle=1; end
        DriftCounter=0; flags=0;
        TempAngle=get_angle(PlayerID);
        if (angle<TempAngle-20000) angle+=20000; end
        if (angle>TempAngle+20000) angle-=20000; end
        if (ForwardSpeed=>0) ForwardSpeed=6; end
      end
      frame(0);
      if (get_dist(PlayerID)>65 and get_dist(PlayerID)<70)
        if (x<PlayerX) DriftCounter=0; end
        if (x>PlayerX) DriftCounter=20; end
      end
      if (get_dist(PlayerID)<=65)
        StartAngle=0; DriftCounter++;
        if (angle!=0)
          ChillCounter=0;
          repeat
            ChillCounter++;
            TempAngle=get_angle(PlayerID);
            if (angle<TempAngle) angle+=10000; end
            if (angle>TempAngle) angle-=10000; end
            advance(6);
            if (HP<=100)
              FriendNoHPDialog(); flags=0;
              frame; angle=angle+180000;
              repeat advance(3); alpha-=10; frame(50); until(alpha<=10)
              if (FriendFish==3) signal(AuraID, s_kill); end
              FriendFish=0;
              FriendFishID=CompanionFish(x,y,z,0); return;
            end
            frame;
          until(get_dist(PlayerID)<=80 or get_dist(PlayerID)=>100 or collision(LevelCheckID) or ChillCounter==100)
          if (collision(LevelCheckID))
            repeat
              TurnAround++;
              advance(ForwardSpeed);
              if (collision(LevelCheckID)) advance(-ForwardSpeed*2); end
              TempAngle=get_angle(PlayerID);
              if (angle<TempAngle) angle+=10000; end
              if (angle>TempAngle) angle-=10000; end
              if (HP<=100)
                FriendNoHPDialog(); flags=0;
                frame; angle=angle+180000;
                repeat advance(3); alpha-=10; frame(50); until(alpha<=10)
                if (FriendFish==3) signal(AuraID, s_kill); end
                FriendFish=0;
                FriendFishID=CompanionFish(x,y,z,0); return;
              end
              frame;
            until(TurnAround==20)
            TurnAround=0;
          end
          angle=0;
        end
      end
    end

    if (FriendFishOrder==2) StartAngle=1; DriftCounter++; end

    if (FriendFish==3)
      if (FriendFishOrder==3 and AuraOn==0)
        signal(AuraID, s_kill); AuraID=LightFishAura(5,3); FriendFishOrder=1; AuraOn=1;
      end
      if (FriendFishOrder==3 and AuraOn==1)
        signal(AuraID, s_kill); AuraID=LightFishAura(5,2); FriendFishOrder=1; AuraOn=0;
      end
    end

    if (Mode==2 and PlayerFish==2)
        if (key(_control)) 
          if (PlayerID.TP>0)
            if (ForwardSpeed>0) ForwardSpeed=9; end
          end
        end
    end

    if (DriftCounter>0 and DriftCounter<20) ForwardSpeed=2; flags=0; end
    if (DriftCounter>20 and DriftCounter<40) ForwardSpeed=-2; flags=1; end
    if (DriftCounter>40) DriftCounter=0; end

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    AnimationCounter++;
    if (Mode==1)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=39; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=40; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=41; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=40; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==2)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=323; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=324; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=325; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=324; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==3)
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=326; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=327; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=328; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=327; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end

    if (TempID=collision(type BounceAmoeba)) ForwardSpeed=-TempID.Control; angle=TempID.angle; TempID.HP=1; end frame(0);

    if (angle>360000) angle=0+angle-360000; end
    if (angle<-360000) angle=0+angle+360000; end

    if (alpha<255) alpha=255; end
    if (TempID=collision(type Blob))
      if (TempID.Control==1)
        alpha=150;
        if (x>TempID.x) x--; end
        if (x<TempID.x) x++; end
        if (y>TempID.y) y--; end
        if (y<TempID.y) y++; end
        ForwardSpeed=0;
      end
    end

    if (ForwardSpeed>0)
      if (TempID=collision(type DisplaySpipOrb))
        TempID.Control=1;
        HP+=50;
        if (HP>1000) HP=1000; end
      end
    end

    advance(ForwardSpeed);

    if (TurnAround==1)
      if (CheckX<x) angle+=180000; end
      if (CheckX>x) angle-=180000; end
      repeat
        TurnAround++;
        advance(ForwardSpeed);
        if (collision(LevelCheckID)) advance(-ForwardSpeed*2); end
        TempAngle=get_angle(PlayerID);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (HP<=0)
          FriendNoHPDialog(); flags=0;
          frame; angle=angle+180000;
          repeat advance(3); alpha-=10; frame(50); until(alpha<=10)
          if (FriendFish==3) signal(AuraID, s_kill); end
          FriendFish=0;
          FriendFishID=CompanionFish(x,y,z,0); return;
        end
        frame;
      until(TurnAround==20)
      TurnAround=0;
    end

    if (collision(LevelCheckID)) advance(-ForwardSpeed*2); TurnAround=1; CheckX=x; end

    if (LimMemory==8);
      frame(700);
      FriendFishDialog1();
      frame(700);
      LimMemory=9;
    end

    if (HP<=100)
      FriendNoHPDialog(); flags=0;
      frame; angle=angle+180000;
      repeat advance(3); alpha-=10; frame(50); until(alpha<=10)
      if (FriendFish==3) signal(AuraID, s_kill); end
      FriendFish=0;
      FriendFishID=CompanionFish(x,y,z,0); return;
    end
    frame;
  end
end



process FriendHealth();
begin
  ctype=c_scroll; graph=85; flags=16;
  loop
    x=father.x; y=father.y-12; z=father.z;
    if (father.HP<50) return; end
    size=(father.HP/10);
    frame(50);
  end
end



process NonPlayerFish(x,y,z,Mode);
private
  int AnimationCounter;
  int DriftCounter;
  int DialogCounter;
  int DarkBallID;
  int DarkBallCounter;
begin
  ctype=c_scroll;
  DriftCounter=rand(0,149);
  loop


    DriftCounter++;
    if (DriftCounter>0 and DriftCounter<75) x--; flags=1; end
    if (DriftCounter>75 and DriftCounter<150) x++; flags=0; end
    if (DriftCounter>151) DriftCounter=0; end

    if (Mode==1)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=56; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=57; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=58; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=57; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==2) graph=59; end
    if (Mode==3)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=60; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=61; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=62; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=61; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==4)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=63; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=64; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=65; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=64; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==5)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=66; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=67; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=68; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=67; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==6)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=69; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=70; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=71; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=70; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end

    if (Mode==1)
      if (alpha<255) if (collision(type TalkLine)==0) alpha+=5; end end
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,17); end
          if (flags==1) TalkIcon(0,17); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (MoldConversation==6) if (alpha>150) alpha-=5; end end
          if (exists(type MoldDialog5)==0 and SpawnItem>0)
            if (MoldConversation==5 or MoldConversation==6 or MoldConversation==7) MoldDialog5(0); frame(5000); frame(5000); end
          end
          if (exists(type MoldDialog4)==0)
            if (MoldConversation==4 and ShellItem>0) MoldDialog4(0); frame(5000); frame(5000); end
          end
          if (exists(type MoldDialog3)==0)
            if (MoldConversation==3 and ShellItem>0) MoldDialog3(0); frame(5000); frame(5000); end
          end
          if (exists(type MoldDialog2)==0)
            if (MoldConversation==2 and ShellItem>0) MoldDialog2(0); frame(5000); frame(5000); end
          end
          if (exists(type MoldDialog)==0 and MoldConversation==0)
            if (DialogCounter==0) DialogCounter++; MoldDialog(0); frame(5000); frame(5000); end
          end
        end
      end
    end

    if (Mode==2)
      if (DialogCounter==0)
        if (collision(type TalkLine))
          if (x<PlayerX) flags=0; end
          if (x>PlayerX) flags=1; end
          frame(0);
          if (exists(type AliceIcon)==0)
            if (flags==0) AliceIcon(1,21); end
            if (flags==1) AliceIcon(0,21); end
          end
        end
      end
    end

    if (Mode==3)
      if (DialogCounter==0)
        if (collision(type TalkLine))
          if (x<PlayerX) flags=0; end
          if (x>PlayerX) flags=1; end
          frame(0);
          if (exists(type TalkIcon)==0)
            if (flags==0) TalkIcon(1,17); end
            if (flags==1) TalkIcon(0,17); end
          end
          if (key(_enter) or key(_space))
            frame(0);
            if (exists(type QuidDialog)==0) QuidDialog(0); frame(5000); frame(5000); end
          end
        end
      end
    end

    if (Mode==4)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,18); end
          if (flags==1) TalkIcon(0,18); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type GlumDialog2)==0)
            if (GlumMemory==1 and ShellItem>0) GlumDialog2(0); frame(5000); frame(5000); end
          end
          if (exists(type GlumDialog3)==0)
            if (GlumMemory==2 and ShellItem>0) GlumDialog3(0); frame(5000); frame(5000); end
          end
          if (exists(type GlumDialog)==0 and GlumMemory==0)
            if (DialogCounter==0) DialogCounter++; GlumDialog(0); frame(5000); frame(5000); end
          end
        end
      end
    end

    if (Mode==5)
      if (DialogCounter==0 or DialogCounter==1)
        if (collision(type TalkLine))
          if (x<PlayerX) flags=0; end
          if (x>PlayerX) flags=1; end
          frame(0);
          if (exists(type TalkIcon)==0)
            if (flags==0) TalkIcon(1,26); end
            if (flags==1) TalkIcon(0,26); end
          end
          if (key(_enter) or key(_space))
            frame(0);
            if (DialogCounter==0)
              if (exists(type MarLeeDialog)==0) DialogCounter++; MarLeeDialog(0); end
            end
            if (DialogCounter==1)
              if (exists(type MarLeeDialog2)==0) MarLeeDialog2(0); frame(5000); frame(5000); end
            end
          end
        end
      end
    end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    frame;
  end
end



process SingleNonPlayerFish(x,y,z,Mode);
private
  int BounceCounter;
  int DialogCounter;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll;
  if (Mode==1) graph=166; end
  if (Mode==2) graph=177; end
  if (Mode==3) graph=236; end
  if (Mode==4) graph=237; end
  if (Mode==5) graph=239; alpha=200; flags=16; end
  if (Mode==6) graph=238; flags=1; end
  if (Mode==7) graph=289; end
  if (Mode==8) graph=290; flags=1; end
  if (Mode==9) graph=211; flags=1; end
  if (Mode==10) graph=291; flags=1; end
  if (Mode==11) graph=208; end
  if (Mode==12) graph=205; end
  if (Mode==13) graph=202; end
  if (Mode==14) graph=307; end
  if (Mode==15) graph=40; end
  if (Mode==16) graph=324; end
  if (Mode==17) graph=327; end
  if (Mode==18) graph=349; flags=1; end
  if (Mode==19) graph=350; end
  if (Mode==20) graph=351; end
  if (Mode==21) graph=352; flags=1; end
  if (Mode==22) graph=353; flags=1; end
  if (Mode==23) graph=354; flags=1; end
  if (Mode==24) graph=355; end
  if (Mode==25) graph=356; end
  if (Mode==26) graph=394; end
  if (Mode==27) graph=395; flags=1; end
  if (Mode==28) graph=402; end
  if (Mode==29) graph=409; end
  if (Mode==30) graph=410; end

  loop

    BounceCounter++;
    if (BounceCounter==10 or BounceCounter==20 or BounceCounter==30 or BounceCounter==40 or BounceCounter==50) y--; end
    if (BounceCounter==60 or BounceCounter==70 or BounceCounter==80 or BounceCounter==90 or BounceCounter==100) y++; end
    if (BounceCounter==101) BounceCounter=0; end

    if (Mode==1)
      if (collision(type TalkLine))
        frame(0);
        if (exists(type TalkIcon)==0) TalkIcon(0,20); end
        if (key(_enter) or key(_space))
          frame(0);
          if (GhostFishQuest==6)
            if (exists(type DrumDialog3)==0) DrumDialog3(0); end
          end
          if (GhostFishQuest>2 and GhostFishQuest<6)
            if (exists(type DrumDialog4)==0) DrumDialog4(0); end
          end
          if (GhostFishQuest==2)
            if (exists(type DrumDialog2)==0) DrumDialog2(0); end
          end
          if (GhostFishQuest==0)
            if (exists(type DrumDialog)==0) DrumDialog(0); end
          end
        end
      end
    end

    if (Mode==2)
      if (rand(1,10)==1)
        if (flags==0) SmallBubble(x+26,y+5,5,4); end
        if (flags==1) SmallBubble(x-26,y+5,5,4); end
      end
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,30); end
          if (flags==1) TalkIcon(0,30); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type RoarkDialog)==0) RoarkDialog(0); end
        end
      end
    end

    if (Mode==3)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,18); end
          if (flags==1) TalkIcon(0,18); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type FolderDialog)==0)
            if (LimMemory>0 and FolderMemory2==0) FolderDialog2(0); FolderMemory2=1; end
          end
          if (exists(type FolderDialog)==0)
            if (LimMemory==0 or FolderMemory2==1) FolderDialog(FolderMemory); FolderMemory++; end
          end
          if (FolderMemory==3) FolderMemory=0; end
        end
      end
    end

    if (Mode==4)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,21); end
          if (flags==1) TalkIcon(0,21); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type LimDialog11)==0) if (LimMemory==9 and SarkMemory==4) LimDialog11(0); end end
          if (exists(type LimDialog10)==0) if (LimMemory==7 and SpawnItem==1) LimDialog10(0); end end
          if (exists(type LimDialog9)==0) if (LimMemory==7 and SpawnItem==0) LimDialog9(0); end end
          if (exists(type LimDialog8)==0) if (LimMemory==6 and ShellItem>0) LimDialog8(0); end end
          if (exists(type LimDialog7)==0) if (LimMemory==6 and ShellItem==0) LimDialog7(0); end end
          if (exists(type LimDialog6)==0) if (LimMemory==5) LimDialog6(0); end end
          if (exists(type LimDialog5)==0) if (LimMemory==4) LimDialog5(0); end end
          if (exists(type LimDialog4)==0) if (BluMemory==4) LimDialog4(0); end end
          if (exists(type LimDialog3)==0) if (LimMemory==2) LimDialog3(0); end end
          if (exists(type LimDialog2)==0) if (LimMemory==1) LimDialog2(0); end end
          if (exists(type LimDialog)==0) if (LimMemory==0) LimDialog(0); end end
        end
      end
    end

    if (Mode==5)
      if (ItemSelect==1)
        if (key(_alt))
          if (get_dist(PlayerID)<100)
            play_wav(Cage,0);
            repeat
              alpha-=5;
              size+=5;
              if (rand(1,2)==1) MiniJellicon2(x,y+rand(-20,20),2,rand(0,1)); end
              frame;
            until(alpha==0)
            BluMemory=2;
            signal(type TalkIcon, s_kill); return;
          end
        end
      end

      if (collision(type TalkLine))
        frame(0);
        if (exists(type TalkIcon)==0) TalkIcon(0,30); end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type BluDialog)==0 and exists(type BluDialog2)==0 and exists(type BluDialog3)==0)
            if (BluMemory==1 and GelatinumItem==1) BluDialog3(0); end
            if (BluMemory==1 and GelatinumItem==0) BluDialog2(0); end
            if (BluMemory==0) BluDialog(0); end
          end
        end
      end
    end

    if (Mode==6 and BluMemory==2)
      if (collision(type TalkLine))
        frame(0);
        if (exists(type TalkIcon)==0) TalkIcon(0,26); end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type BluDialog4)==0) BluDialog4(0); end
        end
      end
    end

    if (Mode==6 and BluMemory==3)
      flags=17; BluMemory=4;
      repeat x--; y++; alpha-=5; frame(50); until(alpha<=0)
      return;
    end

    if (Mode==6 and BluMemory==4)
      flags=1;
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,26); end
          if (flags==1) TalkIcon(0,26); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type BluDialog5)==0) BluDialog5(0); end
        end
      end
    end

    if (Mode==6 and BluMemory==5)
      flags=1;
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,26); end
          if (flags==1) TalkIcon(0,26); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type BluDialog6)==0) BluDialog6(0); end
        end
      end
    end

    if (Mode==6 and BluMemory==6)
      flags=1;
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,26); end
          if (flags==1) TalkIcon(0,26); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type BluDialog6)==0) BluDialog6(1); end
        end
      end
    end

    if (Mode==7)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,18); end
          if (flags==1) TalkIcon(0,18); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (RaceWon==2)
            if (exists(type FannDialog2)==0) FannDialog2(0); end
          end
          if (RaceWon!=2)
            if (exists(type FannDialog)==0) FannDialog(0); end
          end
        end
      end
    end

    if (Mode==8)
      if (PlayerY>125 and PlayerY<175)
        if (ShadowCounter==0 and RaceWon!=2) y=PlayerY; end
      end
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,29); end
          if (flags==1) TalkIcon(0,29); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (RaceWon==2)
            if (exists(type FlammaDialog2)==0) FlammaDialog2(0); end
          end
          if (RaceWon!=2)
            if (exists(type FlammaDialog)==0) FlammaDialog(0); end
          end
        end
      end
    end

    if (Mode==9)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,19); end
          if (flags==1) TalkIcon(0,19); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (RaceWon==2)
            if (exists(type EldaDialog4)==0) EldaDialog4(0); end
          end
          if (RaceWon!=2)
            if (EldaMemory==2)
              if (exists(type EldaDialog3)==0) EldaDialog3(0); end
            end
            if (EldaMemory==1)
              if (exists(type EldaDialog2)==0) EldaDialog2(0); end
            end
            if (EldaMemory==0)
              if (exists(type EldaDialog)==0) EldaDialog(0); end
            end
          end
        end
      end
    end

    if (Mode==10)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,18); end
          if (flags==1) TalkIcon(0,18); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (ShellItem>0)
            if (exists(type JudgeDialog5)==0) JudgeDialog5(0); end
          end
          if (RaceWon==2 or JudgeMemory==4)
            if (exists(type JudgeDialog4)==0) JudgeDialog4(0); JudgeMemory=4; end
          end
          if (RaceWon==1 or JudgeMemory==3)
            if (exists(type JudgeDialog3)==0) JudgeDialog3(0); JudgeMemory=3; end
          end
          if (JudgeMemory==2)
            if (exists(type JudgeDialog2)==0) JudgeDialog2(0); end
          end
          if (JudgeMemory==1)
            if (exists(type JudgeDialog)==0) JudgeDialog(1); end
          end
          if (JudgeMemory==0)
            if (exists(type JudgeDialog)==0) JudgeDialog(0); end
          end
        end
      end
    end

    if (Mode==11)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,20); end
          if (flags==1) TalkIcon(0,20); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (RaceWon==2)
            if (exists(type BurlDialog2)==0) BurlDialog2(0); end
          end
          if (RaceWon!=2)
            if (exists(type BurlDialog)==0) BurlDialog(BurlMemory); BurlMemory++; end
            if (BurlMemory==6) BurlMemory=0; end
          end
        end
      end
    end

    if (Mode==12)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,23); end
          if (flags==1) TalkIcon(0,23); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (RaceWon==2)
            if (exists(type ZipDialog2)==0) ZipDialog2(0); end
          end
          if (RaceWon!=2)
            if (exists(type ZipDialog)==0) ZipDialog(ZipMemory); ZipMemory++; end
            if (ZipMemory==3) ZipMemory=0; end
          end
        end
      end
    end

    if (Mode==13)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,21); end
          if (flags==1) TalkIcon(0,21); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (RaceWon==2)
            if (exists(type GlibDialog2)==0) GlibDialog2(0); end
          end
          if (RaceWon!=2)
            if (exists(type GlibDialog)==0) GlibDialog(0); end
          end
        end
      end
    end

    if (Mode==14)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,32); end
          if (flags==1) TalkIcon(0,32); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (StrimMemory==1)
            if (exists(type StrimDialog2)==0) StrimDialog2(0); end
          end
          if (StrimMemory==0)
            if (exists(type StrimDialog)==0) StrimDialog(0); StrimMemory=1; end
          end
        end
      end
    end

    if (Mode==15)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,16); end
          if (flags==1) TalkIcon(0,16); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type GillDialog)==0) GillDialog(0); end
        end
      end
    end

    if (Mode==16)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,18); end
          if (flags==1) TalkIcon(0,18); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (FinnMemory==1)
            if (exists(type FinnDialog2)==0) FinnDialog2(0); end
          end
          if (FinnMemory==0)
            if (exists(type FinnDialog)==0) FinnDialog(0); end
          end
        end
      end
    end

    if (Mode==17)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,15); end
          if (flags==1) TalkIcon(0,15); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (SlugMemory==1 or SlugMemory==2)
            if (exists(type SlugDialog2)==0) SlugDialog2(0); end
          end
          if (VeolaMemory==2 and SlugMemory==0)
            if (exists(type SlugDialog)==0) SlugDialog(0); end
          end
          if (VeolaMemory==0 or VeolaMemory==1)
            if (exists(type SlugDialog0)==0) SlugDialog0(0); end
          end
        end
      end
    end

    if (Mode==18)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,17); end
          if (flags==1) TalkIcon(0,17); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type DimmDialog)==0) DimmDialog(DialogCounter); DialogCounter++; end
          if (DialogCounter==3) DialogCounter=0; end
        end
      end
    end

    if (Mode==19)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,17); end
          if (flags==1) TalkIcon(0,17); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type MerlDialog)==0) MerlDialog(DialogCounter); DialogCounter++; end
          if (DialogCounter==5) DialogCounter=0; end
        end
      end
    end

    if (Mode==20)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,17); end
          if (flags==1) TalkIcon(0,17); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (VeolaMemory==1 or VeolaMemory==2)
            if (exists(type VeolaDialog2)==0) VeolaDialog2(0); end
          end
          if (VeolaMemory==0)
            if (exists(type VeolaDialog)==0) VeolaDialog(0); end
          end
        end
      end
    end

    if (Mode==21)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,17); end
          if (flags==1) TalkIcon(0,17); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type MumDialog2)==0) MumDialog2(0); end
        end
      end
    end

    if (Mode==22)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,24); end
          if (flags==1) TalkIcon(0,24); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type LimpDialog)==0) LimpDialog(0); end
        end
      end
    end

    if (Mode==23)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,19); end
          if (flags==1) TalkIcon(0,19); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type FlemyDialog)==0) FlemyDialog(0); end
        end
      end
    end

    if (Mode==24)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,19); end
          if (flags==1) TalkIcon(0,19); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type SpudsDialog)==0) SpudsDialog(DialogCounter); end
          if (DialogCounter<11) DialogCounter++; end
        end
      end
    end

    if (Mode==25)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,18); end
          if (flags==1) TalkIcon(0,18); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type MylostDialog)==0) MylostDialog(0); end
        end
      end
    end

    if (Mode==26)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,26); end
          if (flags==1) TalkIcon(0,26); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type LuffeDialog)==0) LuffeDialog(0); end
        end
      end
    end

    if (Mode==27)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,21); end
          if (flags==1) TalkIcon(0,21); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type TealDialog)==0) TealDialog(0); end
        end
      end
    end

    if (Mode==28)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,24); end
          if (flags==1) TalkIcon(0,24); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type MoistDialog)==0 and MoistQuest>5) MoistDialog(MoistQuest); end
          if (exists(type MoistDialog)==0 and DialogCounter==0 and MoistQuest<6) MoistDialog(MoistQuest); DialogCounter++; end
        end
      end
    end


    if (Mode==29)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,24); end
          if (flags==1) TalkIcon(0,24); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type GhostFishDialog2)==0)
            if (GhostFishMemory==1) GhostFishDialog2(0); end
          end
          if (exists(type GhostFishDialog)==0)
            if (GhostFishMemory==0) GhostFishDialog(0); end
          end
        end
      end
    end


    if (Mode==30)
      if (collision(type TalkLine))
        if (x<PlayerX) flags=0; end
        if (x>PlayerX) flags=1; end
        frame(0);
        if (exists(type TalkIcon)==0)
          if (flags==0) TalkIcon(1,20); end
          if (flags==1) TalkIcon(0,20); end
        end
        if (key(_enter) or key(_space))
          frame(0);
          if (exists(type ArghDialog)==0)
            if (GhostFishQuest==6) ArghDialog(2); end
            if (GhostFishQuest==4) ArghDialog(1); end
            if (GhostFishQuest<4) ArghDialog(0); end
          end
        end
      end
    end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    frame;
  end
end



process TalkIcon(flags,Distance);
private
  int DelayCounter;
begin
  ctype=c_scroll; alpha=5; size=0; z=2; graph=179;
  repeat
    if (flags==0) x=father.x-Distance; end
    if (flags==1) x=father.x+Distance; end
    y=father.y-2;
    size+=20;
    alpha+=50;
    frame(50);
  until(alpha=>255);
  repeat
    if (flags==0) x=father.x-Distance; end
    if (flags==1) x=father.x+Distance; end
    y=father.y-2;
    DelayCounter++;
    frame;
  until(DelayCounter==20);
  repeat
    if (flags==0) x=father.x-Distance; end
    if (flags==1) x=father.x+Distance; end
    y=father.y-2;
    size-=20;
    alpha-=50;
    frame(50);
  until(alpha<=5);
  return;
end



process AliceIcon(flags,Distance);
private
  int DelayCounter;
begin
  ctype=c_scroll; alpha=5; size=0; z=2; graph=441;
  repeat
    if (flags==0) x=father.x-Distance; end
    if (flags==1) x=father.x+Distance; end
    y=father.y-2;
    size+=20;
    alpha+=50;
    frame(50);
  until(alpha=>255);
  repeat
    if (flags==0) x=father.x-Distance; end
    if (flags==1) x=father.x+Distance; end
    y=father.y-2;
    DelayCounter++;
    frame;
  until(DelayCounter==20);
  repeat
    if (flags==0) x=father.x-Distance; end
    if (flags==1) x=father.x+Distance; end
    y=father.y-2;
    size-=20;
    alpha-=50;
    frame(50);
  until(alpha<=5);
  return;
end



process ArghDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Argh!");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"...??!!");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Argh!");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"...!!!???");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(2); frame(700);
    write(0,6,126,0,"I've spoken to... your father?");
    write(0,6,136,0,"He wants you to live with him.");

    write(0,6,166,0,"You... are weird... Goodbye!");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==2)
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Argh!");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Father!? ...live?! SWIM?!");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Maybe... I should just give you some");
    write(0,6,156,0,"directions and hope for the best...");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Argh!");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"DIRECTIONS! DIRECTIONS?! DIRECTIONS!! Eat?");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Okay... now that we have spoken about");
    write(0,6,156,0,"that... I guess I should find your father");
    write(0,6,166,0,"again.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Argh!");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"FATHER! FATHER? Eat?!");
    repeat frame; until(key(_enter) or key(_space))

    GhostFishQuest=5;
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Argh!");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"EAT? Drum? Sooks?! Ludd?!! Eat?");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process DrumDialog4(Mode);
private
  int Memory;
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(120,60,0));
  write(0,6,126,0,"Drum of the Deep");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"How is it going with the Ghostfish?");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process DrumDialog3(Mode);
private
  int Memory;
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(120,60,0));
  write(0,6,126,0,"Drum of the Deep");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Thank you " + Name + ". Your Light has grown");
  write(0,6,156,0,"stronger and with young ones such as you");
  write(0,6,166,0,"there may still be hope for this sea.");
  write(0,6,176,0,"I thank you.");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(255,255,255));
  write(0,6,126,0,"You have recieved an odd item.");
  write(0,6,136,0,"What could it be?");
  repeat frame; until(key(_enter) or key(_space))
  DrumItem=1;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process DrumDialog2(Mode);
private
  int Memory;
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);


  TextBox(0); frame(700);
  set_text_color(rgb(120,60,0));
  write(0,6,126,0,"Drum of the Deep");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hello there young one. Have you found the bleak");
  write(0,6,156,0,"one who lives in the deep?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,Name);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Yes. And he told me his story. He is an old");
  write(0,6,156,0,"Ghostfish who apparently has been 'cursed'");
  write(0,6,166,0,"with thought.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(120,60,0));
  write(0,6,126,0,"Drum of the Deep");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...A ghostfish... then it is as I suspected. I");
  write(0,6,156,0,"have been watching him for quite some time,");
  write(0,6,166,0,"making sure that he is a... peaceful being.");
  write(0,6,176,0,"I have seen his pain... Seen how he struggles.");
  write(0,6,186,0,"I think that our soothing light will do this");
  write(0,6,196,0,"dark creature a lot of good. I want to give");
  write(0,6,206,0,"him hope again. Please... ask him if he wants");
  write(0,6,216,0,"to join our tribe and live with us.");
  repeat frame; until(key(_enter) or key(_space))

  GhostFishQuest=3;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GhostFishDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"?????");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh... A... person? Please, don't be");
    write(0,6,156,0,"frightened. I will not kill you, although");
    write(0,6,166,0,"it will take some concentration to refrain");
    write(0,6,176,0,"from splitting you open. Ah. How nice to");
    write(0,6,186,0,"meet a young one. What do you call it?");
    write(0,6,196,0,"A... fishling? Is that it? What are the words?");
    write(0,6,206,0,"They just keep escaping. As long as they don't");
    write(0,6,216,0,"stray to far... I can... contain myself.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(2); frame(700);
    write(0,6,126,0,"Aren't you a... Ghostfish?");

    write(0,6,166,0,"(End dialogue without a word and swim for");
    write(0,6,176,0,"your life)");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==2)
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"A... Ghost. That is what you call dead ones.");
    write(0,6,156,0,"I am not dead. But I am what you fear me to be,");
    write(0,6,166,0,"yet not. Do not fear me, young one. I am strong");
    write(0,6,176,0,"enough too not hurt you. And too old to try even");
    write(0,6,186,0,"if I could. I remain here, waiting for death,");
    write(0,6,196,0,"alone with my great curse.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"So you are a Ghostfish. What curse are you");
    write(0,6,136,0,"speaking about?");

    write(0,6,166,0,"Cu-cu-curse!?");

    write(0,6,206,0,"(You still have time, swim for your life!)");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==3)
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end


    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The curse of speech. The curse that now....");
    write(0,6,156,0,"after all this time... words have come to me.");
    write(0,6,166,0,"Filling my head, everything I am, words. Before");
    write(0,6,176,0,"the words... there was only feeling. Sometimes");
    write(0,6,186,0,"the words drift though, and the feeling comes");
    write(0,6,196,0,"back, but I am too old... too old to take life");
    write(0,6,206,0,"again.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(2); frame(700);
  write(0,6,126,0,"Words are your curse? You mean... thought?");

  write(0,6,166,0,"Where does the words come from?");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"At first, from the deep. Deeper than this.");
    write(0,6,156,0,"Then... from inside. Another kind of depth...");
    write(0,6,166,0,"Ah... the words are trying to escape...");
    write(0,6,176,0,"Do not worry. I am fine.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); GhostFishDialog(1); return;
  end


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yes... I think. I think thought is right. I");
    write(0,6,156,0,"am cursed with thought, where once there was");
    write(0,6,166,0,"none. Maybe it is because I am old. My kin die");
    write(0,6,176,0,"young. Die as the feeling takes over... That");
    write(0,6,186,0,"is... Our life. In a way I am a failure. Cursed");
    write(0,6,196,0,"with thought as I have not died.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(2); frame(700);
  write(0,6,126,0,"I... I feel sorry for you old man. I hope you");
  write(0,6,136,0,"will find peace someday.");

  write(0,6,166,0,"This is getting to crazy for me! Good bye!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==2)
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  TextBox(0); frame(700);
  set_text_color(rgb(0,100,220));
  write(0,6,126,0,"Old Ghostfish");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Peace... Yes... Such a strange word yet it");
  write(0,6,156,0,"fills my mind with... hope? No, the words are");
  write(0,6,166,0,"wrong... That is what I lack. Swim... far away.");
  repeat frame; until(key(_enter) or key(_space))

  GhostFishMemory=1;
  if (GhostFishQuest==1) GhostFishDialog2(0); end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GhostFishDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);


  if (GhostFishQuest!=6)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Fishling... did you want something else?");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (GhostFishQuest==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Actually... The truth is I was sent here");
    write(0,6,156,0,"by Drum of The Deep to hear your story.");
    write(0,6,166,0,"He belongs to a tribe who live down here...");
    write(0,6,176,0,"I think he wonders about who you are.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Ah... Fish who share these depths...");
    write(0,6,156,0,"maybe... these words too. Ask him if he has...");
    write(0,6,166,0,"peace for me. Goodbye.");
    repeat frame; until(key(_enter) or key(_space))
    GhostFishQuest=2;
  end


  if (GhostFishQuest==3)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"It... it is you again... Please...");
    write(0,6,156,0,"The words... they are slipping... yet they");
    write(0,6,166,0,"haunt me so. What do you want?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(2); frame(700);
    write(0,6,126,0,"I have spoken to Drum, he wants you to go");
    write(0,6,136,0,"and live with him and the Tribe of");
    write(0,6,146,0,"the deep. He wants to give you some hope.");

    write(0,6,166,0,"It's nothing.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==2)
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end


    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Live... with others? Impossible...");
    write(0,6,156,0,"unthinkable... how could I... I think I");
    write(0,6,166,0,"could do that... But not unless you find");
    write(0,6,176,0,"my seed. The seed I once left as I succumbed");
    write(0,6,186,0,"to the feeling. He... he must have grown");
    write(0,6,196,0,"now... Soon it will be too late for him.");
    write(0,6,206,0,"Find my seed and I will live with the");
    write(0,6,216,0,"Tribe... Now you must go.");
    repeat frame; until(key(_enter) or key(_space))

    GhostFishQuest=4;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  if (GhostFishQuest==4)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Live... with others? Impossible...");
    write(0,6,156,0,"unthinkable... how could I... I think I");
    write(0,6,166,0,"could do that... But not unless you find");
    write(0,6,176,0,"my seed. The seed I once left as I succumbed");
    write(0,6,186,0,"to the feeling. He... he must have grown");
    write(0,6,196,0,"now... Soon it will be too late for him.");
    write(0,6,206,0,"Find my seed and I we will live with the");
    write(0,6,216,0,"Tribe... Now you must go.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (GhostFishQuest==5)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Have... you been successful?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yes. I think your... 'seed' might be");
    write(0,6,156,0,"traveling to the reef right now.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Then maybe... Peace... at last.");
    repeat frame; until(key(_enter) or key(_space))

    GhostFishQuest=6;
  end


  if (GhostFishQuest==6)
    TextBox(0); frame(700);
    set_text_color(rgb(0,100,220));
    write(0,6,126,0,"Old Ghostfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Peace... at last.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MoistDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(120,200,30));
    write(0,6,126,0,"Moist");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey! You found me!!! I always get lost!");
    write(0,6,156,0,"Always! The sea is just too confusing.");
    write(0,6,166,0,"I never seem to find my way, but now");
    write(0,6,176,0,"that you have found me I can just track");
    write(0,6,186,0,"your scent back to Spipreef! Thanks!");
    write(0,6,196,0,"There might be a chance that I will get");
    write(0,6,206,0,"lost again, so be sure to look for me!");
    repeat frame; until(key(_enter) or key(_space))
    MoistQuest++;
  end

  if (Mode>0 and Mode<6)
    TextBox(0); frame(700);
    set_text_color(rgb(120,200,30));
    write(0,6,126,0,"Moist");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey, you found me! Thanks! Help me");
    write(0,6,156,0,"again if I get lost won't you?");
    repeat frame; until(key(_enter) or key(_space))
    MoistQuest++;
  end

  if (Mode==6)
    TextBox(0); frame(700);
    set_text_color(rgb(120,200,30));
    write(0,6,126,0,"Moist");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey, it's you! I wanted to thank you for");
    write(0,6,156,0,"helping me all those times. Here, take");
    write(0,6,166,0,"this odd rock I found once when I was");
    write(0,6,176,0,"lost. I have no idea what might come");
    write(0,6,186,0,"out from it, but it sure looks nice!");
    repeat frame; until(key(_enter) or key(_space))
    MoistQuest++; EggItem=1;
  end

  if (Mode==7)
    TextBox(0); frame(700);
    set_text_color(rgb(120,200,30));
    write(0,6,126,0,"Moist");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Thanks for finding me all those times!");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process TealDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,80,210));
  write(0,6,126,0,"Teal");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hello there young Fishling! How wonderful");
  write(0,6,156,0,"it must be to be young. I remember when I");
  write(0,6,166,0,"first came here to swim on my own for a");
  write(0,6,176,0,"while. I was quite the explorer, even");
  write(0,6,186,0,"though you're not supposed to leave this");
  write(0,6,196,0,"reef! Nowadays I just tell stories about");
  write(0,6,206,0,"the different areas around this reef.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,80,210));
  write(0,6,126,0,"Teal");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"There's the Sunlit Sea to the West,");
  write(0,6,156,0,"Gelatinum Sea to the west and towards the");
  write(0,6,166,0,"surface there is of course The Ocean. If");
  write(0,6,176,0,"you head toward the east and then downwards");
  write(0,6,186,0,"you'll reach the Deep Roads.");
  write(0,6,196,0,"You want to know anything in particular?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"Tell me about the Sunlit Sea.");

  write(0,6,156,0,"Tell me about Gelatinum Sea.");

  write(0,6,186,0,"Tell me about the Ocean.");

  write(0,6,216,0,"Tell me about the Deep roads.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,80,210));
    write(0,6,126,0,"Teal");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Sunlit Sea is a beautiful place,");
    write(0,6,156,0,"blissfully  touched by the rays of the");
    write(0,6,166,0,"yellow orb, unlike all the areas down here");
    write(0,6,176,0,"in the Mesopelagic zone. There is a variety");
    write(0,6,186,0,"of life in the Sunlit Sea and an abundance");
    write(0,6,196,0,"of plant-life. I would watch it though if");
    write(0,6,206,0,"I were you, there are some dangerous");
    write(0,6,216,0,"Badfish there too.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,80,210));
    write(0,6,126,0,"Teal");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Gelatinum Sea is the home of the");
    write(0,6,156,0,"Jellicons. Jellicons are strange species");
    write(0,6,166,0,"who live where there's lots of Gelatinum.");
    write(0,6,176,0,"Gelatinum is a very special mineral which");
    write(0,6,186,0,"the Jellicons use for all sorts of strange");
    write(0,6,196,0,"things!");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,80,210));
    write(0,6,126,0,"Teal");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Jellicons are quite harmless as long as");
    write(0,6,156,0,"you don't disturb them. Watch out for the");
    write(0,6,166,0,"larger variants of their species though,");
    write(0,6,176,0,"they pack quite a punch!");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(0,80,210));
    write(0,6,126,0,"Teal");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Ocean is a large and open area with");
    write(0,6,156,0,"lots of Blobs! Blobs are those strange");
    write(0,6,166,0,"round beings which bounce you around when");
    write(0,6,176,0,"you touch them. The Ocean is also home to");
    write(0,6,186,0,"the Comli, a sort of Plankton which");
    write(0,6,196,0,"breeds by jumping from Blob to Blob,");
    write(0,6,206,0,"gathering foodstuffs on the way.");
    write(0,6,216,0,"See if you can help them to breed!");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(0,80,210));
    write(0,6,126,0,"Teal");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Deep roads are a dark and dangerous");
    write(0,6,156,0,"place, home to the nefarious darkbringers");
    write(0,6,166,0,"among other things! If you're going there");
    write(0,6,176,0,"you are probably going to need some kind");
    write(0,6,186,0,"of light-source  to scare them off.");
    write(0,6,196,0,"The Deep roads also have a very varied");
    write(0,6,206,0,"wild-life, too bad most of it is trying");
    write(0,6,216,0,"to kill you!");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process LuffeDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(60,20,230));
  write(0,6,126,0,"Luffe - The Dragonfish");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ho there young traveler! I am Luffe of the");
  write(0,6,156,0,"Dragonfish, from the far away Molten Sea.");
  write(0,6,166,0,"Won't you stay for a minute and listen to");
  write(0,6,176,0,"the words of my people?");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(2); frame(700);
  write(0,6,126,0,"Yes.");

  write(0,6,166,0,"I have no time for you right now,");
  write(0,6,176,0,"maybe later.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(60,20,230));
    write(0,6,126,0,"Luffe - The Dragonfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yes. Take wisdom from these words, they");
    write(0,6,156,0,"were once important to a lot of fish,");
    write(0,6,166,0,"now I am the only one left who knows them.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(60,20,230));
    write(0,6,126,0,"Luffe - The Dragonfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Since dawn of time");
    write(0,6,156,0,"Have I hid");
    write(0,6,166,0,"From the chime of death");
    write(0,6,176,0,"Survived the molten sea");
    write(0,6,186,0,"and from afar");
    write(0,6,196,0,"seen the birth");
    write(0,6,206,0,"of the world.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(60,20,230));
    write(0,6,126,0,"Luffe - The Dragonfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hide");
    write(0,6,156,0,"my brethren");
    write(0,6,166,0,"Hide!");
    write(0,6,176,0,"Death is coming");
    write(0,6,186,0,"Death is nigh");
    write(0,6,196,0,"Blood will flow");
    write(0,6,206,0,"sway");
    write(0,6,216,0,"with the movement of the sea");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(60,20,230));
    write(0,6,126,0,"Luffe - The Dragonfish");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"And dream");
    write(0,6,156,0,"That we will once know");
    write(0,6,166,0,"how it is");
    write(0,6,176,0,"to live once more.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process EggDialog();
begin

  signal(PlayerID, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(255,255,255));
  write(0,6,126,0,"You can hear an odd noise from inside the");
  write(0,6,136,0,"rock, but nothing happens.");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); return;
end



process StrimDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"A dark voice makes the sea tremble and its");
  write(0,6,136,0,"presence fills your mind with a mighty");
  write(0,6,146,0,"swelling motion.");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh. Small one! Do not worry; I will not");
  write(0,6,156,0,"consume you for my belly is already filled to");
  write(0,6,166,0,"its brim. You are, however, quite a long way");
  write(0,6,176,0,"from your kind and your safe reefs. I have");
  write(0,6,186,0,"companions who might not be as full as I am.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Whoa, what, what are you? I've never seen");
  write(0,6,136,0,"a fish such as you!");

  write(0,6,166,0,"...Great one, I have never seen anything like");
  write(0,6,176,0,"you. Would you mind a short conversation");
  write(0,6,186,0,"before I swim away as quickly as I can.");

  write(0,6,206,0,"That's quite some attitude you've got there");
  write(0,6,216,0,"mister! You couldn't eat me even if you");
  write(0,6,226,0,"WERE hungry!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hah! Arrogance from such a tiny one! I find");
  write(0,6,156,0,"you to be quite an amusing little critter.");
  write(0,6,166,0,"Do you not fear me at all? Know that your");
  write(0,6,176,0,"life hangs on my very whim, although I have");
  write(0,6,186,0,"no interest in taking it at this very moment.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"I guess I am a afraid, but there is no");
  write(0,6,136,0,"point in running now, is there?");

  write(0,6,166,0,"I don't fear anything.");

  write(0,6,206,0,"I do feel fear, but my curiosity is");
  write(0,6,216,0,"stronger.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"How amusing! I have decided that I like you!");
  write(0,6,156,0,"I am Strim of the Reaver Tribe. I am a");
  write(0,6,166,0,"Starkling, not a child but not yet an adult,");
  write(0,6,176,0,"so I guess we have a sort of kinship as you");
  write(0,6,186,0,"are a Fishling. Now that you know my name I");
  write(0,6,196,0,"want you to tell me yours.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"(Truth) My name is " + Name + ".");

  write(0,6,166,0,"(Lie) My name is Zink.");

  write(0,6,206,0,"(Bad Lie) My name is Frokkin Moo");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"How strange names you bear! ...As a reward");
  write(0,6,156,0,"for being such an interesting creature I");
  write(0,6,166,0,"will grant you some advice.");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"This... Sea.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"The forces which control it are grand");
  write(0,6,156,0,"indeed and your people are but a small speck");
  write(0,6,166,0,"on the great machinations that take place");
  write(0,6,176,0,"here. Know fear and you might survive so");
  write(0,6,186,0,"that you one day might father a child. The");
  write(0,6,196,0,"survival of your line depends upon fear.");
  write(0,6,206,0,"If you encounter any of my kindsmen, swim");
  write(0,6,216,0,"for your meager life.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Leave now in peace little one and do not");
  write(0,6,156,0,"disturb me again as I am getting hungry.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process StrimDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(160,160,160));
  write(0,6,126,0,"Strim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Leave now in peace little one and do not");
  write(0,6,156,0,"disturb me again as I am getting hungry.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end


process FirstStoneMessage();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"(A great vibration fills your entire being and");
  write(0,6,136,0,"for a moment it seems as if your mind is about");
  write(0,6,146,0,"to slip away from your body. When the vibration");
  write(0,6,156,0,"finally seems to slow down you hear something.");
  write(0,6,166,0,"It is a voice. It is similar to your own but");
  write(0,6,176,0,"also different, as if you are speaking from a)");
  write(0,6,186,0,"great distance...");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Death. We swam. The sea would not hear our");
  write(0,6,136,0,"pleas. Would not save us. Gone, but not without");
  write(0,6,146,0,"legacy.");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SecondStoneMessage();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"(A great vibration fills your entire being and");
  write(0,6,136,0,"for a moment it seems as if your mind is about");
  write(0,6,146,0,"to slip away from your body. When the vibration");
  write(0,6,156,0,"finally seems to slow down you hear something.");
  write(0,6,166,0,"It is a voice. It is similar to your own but");
  write(0,6,176,0,"also different, as if you are speaking from a");
  write(0,6,186,0,"great distance...");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Sea and air, blue and blue. And black. From");
  write(0,6,136,0,"one depth and into another. Another kind of");
  write(0,6,146,0,"stream. We searched for it, but when we found");
  write(0,6,156,0,"it, we were already lost.");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process ThirdStoneMessage();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"(A great vibration fills your entire being and");
  write(0,6,136,0,"for a moment it seems as if your mind is about");
  write(0,6,146,0,"to slip away from your body. When the vibration");
  write(0,6,156,0,"finally seems to slow down you hear something.");
  write(0,6,166,0,"It is a voice. It is similar to your own but");
  write(0,6,176,0,"also different, as if you are speaking from a");
  write(0,6,186,0,"great distance...");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Great orb, great orb. Fill my mind. Red sea,");
  write(0,6,136,0,"blood water, wicked eyes, our synergy. We");
  write(0,6,146,0,"were too close, too close.");
  set_text_color(rgb(255,255,255));
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SarkDialog1();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(150,150,180));
  write(0,6,126,0,"Sark");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Acursed little fishling! Who are you who dare");
  write(0,6,156,0,"challenge the mighty Sark of the Prometheus");
  write(0,6,166,0,"Tribe! What manner of toy have you discovered?");
  write(0,6,176,0,"Ah, it is not important anymore. Close your");
  write(0,6,186,0,"eyes little fishling and embrace your doom.");
  write(0,6,196,0,"I will take care to chew you slowly so that");
  write(0,6,206,0,"your final moments will teach you a lesson");
  write(0,6,216,0,"about excruciating pain.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(150,150,180));
  write(0,6,126,0,"Sark");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"KNOW YOUR PLACE!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BluEndDialog();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey, boyo! Get to the center passage! NOW!");
  write(0,6,156,0,"I'll distract them!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process TunnelDialogSlug();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Those Selachimorphs were heading for the Reef!");
  write(0,6,156,0,"Oh Spip I hope they eat Veola! Oh... Oh..");
  write(0,6,166,0,"I mean! I hope everyone is okay! I... I hope");
  write(0,6,176,0,"they don't eat Gill or Finn... I've spoken to");
  write(0,6,186,0,"them a lot while you were out on your own.");
  write(0,6,196,0,"I mean, everyone else ignored me but you");
  write(0,6,206,0,"guys... you're my friends now right?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"Of course we are Slug. Don't worry about it.");

  write(0,6,156,0,"How can you think about that now? Don't");
  write(0,6,166,0,"you realize what's going to happen?");

  write(0,6,186,0,"As long as you guys survive I couldn't care");
  write(0,6,196,0,"less about the rest.");

  write(0,6,216,0,"Meh... you're okay but don't push it.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hah... That's good to hear. I was still");
    write(0,6,156,0,"worrying about it... But I guess that it");
    write(0,6,166,0,"isn't the best of times to worry about");
    write(0,6,176,0,"such things now. But Gill is nice and...");
    write(0,6,186,0,"Finn will look after him... I think.");
    write(0,6,196,0,"They're okay. They have to be.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh... I'm sorry. I guess I'm a bit");
    write(0,6,156,0,"selfish... It's just that... well...");
    write(0,6,166,0,"now that I have friends I would like to");
    write(0,6,176,0,"keep them you know? But I shouldn't worry");
    write(0,6,186,0,"now... Gill is to nice to die and Finn...");
    write(0,6,196,0,"Well he's cool and strong, he will make it!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I didn't realize you felt that way about");
    write(0,6,156,0,"other fish... Well, I guess I do too. No");
    write(0,6,166,0,"one else has been nice to me, it's just");
    write(0,6,176,0,"you guys. And now that I finally have");
    write(0,6,186,0,"friends I would like to keep them you");
    write(0,6,196,0,"know? But I shouldn't worry now... Gill");
    write(0,6,206,0,"is too nice to die and Finn... Well");
    write(0,6,216,0,"he's cool and strong, he will make it!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh! Okay! Okay! As long as you don't");
    write(0,6,156,0,"leave me! It's just that... now that I");
    write(0,6,166,0,"finally have friends I would like to");
    write(0,6,176,0,"keep them you know? But I shouldn't");
    write(0,6,186,0,"worry now... Gill is too nice to die");
    write(0,6,196,0,"and Finn... Well he's cool and strong,");
    write(0,6,206,0,"he will make it!");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...Do you hear that " + Name + "?");
  write(0,6,156,0,"I think it might be calming down.");
  write(0,6,166,0,"Lets go up and see what's going on.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process TunnelDialogFinn();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Crud! This is exciting. I haven't felt more");
  write(0,6,156,0,"alive in my entire life! Good moves " + Name + ",");
  write(0,6,166,0,"we really managed to get away from those");
  write(0,6,176,0,"Selachimorphs! I just wish I could have");
  write(0,6,186,0,"punched one of them in the face somehow,");
  write(0,6,196,0,"but I guess that awesome cloud of darkness");
  write(0,6,206,0,"will have to make do!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey... Did it seem to you like they where");
  write(0,6,156,0,"heading for the Reef? Man... that sucks I");
  write(0,6,166,0,"guess. I hope that little pipsqueak you");
  write(0,6,176,0,"hang out with and Slug makes it. I've been");
  write(0,6,186,0,"talking to him while you did other stuff...");
  write(0,6,196,0,"He has the potential to become a bad-ass");
  write(0,6,206,0,"too.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Aren't you worried about the others?");

  write(0,6,166,0,"Yes. That was awesome... and yeah,");
  write(0,6,176,0,"I hope everyone makes it.");

  write(0,6,206,0,"What happens is what happens.");
  write(0,6,216,0,"It's a cruel sea.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Of course I am! But a real hard dude");
    write(0,6,156,0,"doesn't  show that. He just takes care of");
    write(0,6,166,0,"business. You know what we'll have to");
    write(0,6,176,0,"do if anyone gets hurt right? We will");
    write(0,6,186,0,"have to pay back the Selachimorphs!");
    write(0,6,196,0,"That's how it works.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Man... our moves were crudding");
    write(0,6,156,0,"victorious... And yeah… I also hope that");
    write(0,6,166,0,"everyone is okay, I just didn't want to");
    write(0,6,176,0,"say it out loud. ou know what we'll have");
    write(0,6,186,0,"to do if anyone gets hurt right? We will");
    write(0,6,196,0,"have to pay back the Selachimorphs!");
    write(0,6,206,0,"That's how it works.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"And you are a cruel fish I understand.");
    write(0,6,156,0,"I can respect that. But I hope youl");
    write(0,6,166,0,"understand what we'll have to do if");
    write(0,6,176,0,"anyone gets hurt. We will have to pay");
    write(0,6,186,0,"back the Selachimorphs!");
    write(0,6,196,0,"That's how it works.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey... I heard something from up there!");
  write(0,6,156,0,"Let's see if there's something dangerous");
  write(0,6,166,0,"going on!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process TunnelDialogGill();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Whoa... " + Name + ". What do you think is going");
  write(0,6,156,0,"on here? Those Selachimorphs were headed for");
  write(0,6,166,0,"the reef... You don't think that? Oh spip!");
  write(0,6,176,0,"I just hope that my granddad is okay.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"Hey... Don't worry Gill, I'm sure he's fine.");

  write(0,6,156,0,"I don't know, it might be that no one is okay");
  write(0,6,166,0,"soon.");

  write(0,6,186,0,"There's no time to talk about this, we need to");
  write(0,6,196,0,"get away somehow!");

  write(0,6,216,0,"DON'T WORRY DUDE, I'LL MESS THOSE GUYS UP!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... you're probably right. It's just...");
    write(0,6,156,0,"I don't really have anyone else back at");
    write(0,6,166,0,"Silent Reef, It's just me and him. Well, I guess");
    write(0,6,176,0,"I have you.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I... I guess. I just hope that at least my");
    write(0,6,156,0,"granddad got away. I guess that's pretty selfish");
    write(0,6,166,0,"of me. But I don't really have anyone else.");
    write(0,6,176,0,"Well, I guess I have you.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I guess youre right. It just worries me you know?");
    write(0,6,156,0,"Things are happening to fast for me.");
    write(0,6,166,0,"I'm glad that I have you with me right now.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah. Thanks " + Name + ". We'll handle this somehow!");
    write(0,6,156,0,"You always give me courage when I need it.");
    write(0,6,166,0,"I'm glad I have you as a friend.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(3); frame(700);
  write(0,6,126,0,"It's okay Gill. I'm here for you.");

  write(0,6,166,0,"Don't push it Gill, just be glad I'm still here.");

  write(0,6,206,0,"...");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I... I think things might be settling down.");
  write(0,6,156,0,"Lets see what's going on up there.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FriendNoHPDialog();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (FriendFish==1)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"OH NO! THIS IS TO MUCH FOR ME!");
    write(0,6,156,0,"I'll return to Spipreef and rest for");
    write(0,6,166,0,"a bit. Tell me if you want me to come");
    write(0,6,176,0,"with you again.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"This was a bit more action than I thought.");
    write(0,6,156,0,Name + ", I'll head back to Spipreef for a");
    write(0,6,166,0,"while. But I'm not quitting, remember that!");
    write(0,6,176,0,"You better come back for me later on.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I.. I want to continue to help you...");
    write(0,6,156,0,"But I am so tired... Sorry.");
    write(0,6,166,0,"Please come pick me up at Spipreef");
    write(0,6,176,0,"once I have rested for a while.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process WarningDialog();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);

  if (FriendFish==0)
    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"(There are stil Selachimorphs here. I");
    write(0,6,156,0,"better turn around and head up towards");
    write(0,6,166,0,"the open sea.)");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==1)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"No, we can't go this way! There are still");
    write(0,6,156,0,"Selachimorphs guarding the area. Let's try");
    write(0,6,166,0,"heading up towards the open sea.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"No, we can't go this way! There are still");
    write(0,6,156,0,"Selachimorphs guarding the area. Let's try");
    write(0,6,166,0,"heading up towards the open sea.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"No, we can't go this way! There are still");
    write(0,6,156,0,"Selachimorphs guarding the area. Let's try");
    write(0,6,166,0,"heading up towards the open sea.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process MylostDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(40,40,160));
  write(0,6,126,0,"My-lost");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Well if it isn't " + Name + ". Stupid kiss-and-tell!");
  write(0,6,156,0,"Take care out there, and look after Gill. The sea");
  write(0,6,166,0,"is full of Badfish, that's fish who are bad.");
  write(0,6,176,0,"They may not always be a smart as you are but");
  write(0,6,186,0,"some of them can do quite a lot of scary stuff.");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(40,40,160));
  write(0,6,126,0,"My-lost");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Unlike us, who are quite defenseless, Badfish");
  write(0,6,156,0,"will try to hurt others. Try to hide from them");
  write(0,6,166,0,"if you can, or just run. If that doesn't work I");
  write(0,6,176,0,"guess you'll have to avoid them, or make do with");
  write(0,6,186,0,"whatever items you have.");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(40,40,160));
  write(0,6,126,0,"My-lost");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh, and " + Name + ".");
  write(0,6,156,0,"Do you keep a log of things you do? It's good");
  write(0,6,166,0,"to keep track of what you've been up to. I do");
  write(0,6,176,0,"it every day! You can check yours with the");
  write(0,6,186,0,"'L' button.");
  write(0,6,196,0,"Take care out there!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SpudsDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey " + Name + "! I just wanted to remind you");
    write(0,6,156,0,"that it's good to speak to different people");
    write(0,6,166,0,"plenty of times! Specially after some special");
    write(0,6,176,0,"event has happened, people might have new things");
    write(0,6,186,0,"to say! Sometimes it might be good to catch up");
    write(0,6,196,0,"after you've been apart from your friends too.");
    write(0,6,206,0,"It's too easy to get disconnected to the people");
    write(0,6,216,0,"around you.");
    write(0,6,226,0,"Try speaking to me again for starters!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"See?! I have a new thing to say!");
    write(0,6,156,0,"Good luck on your journeys.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Come on! Aren't you in a hurry?");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==4)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Well who would have thought? You took me quite");
    write(0,6,156,0,"literally didn't you.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==5)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey, I'm starting to think that you're coming on");
    write(0,6,156,0,"to me.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==6)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Well as long as were speaking, let's sing a");
    write(0,6,156,0,"song!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==7)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"HOBADOBA DOOO");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==8)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"SNOOKA POOKA POO");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==9)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I AM SMALL AND SO ARE YOU");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==10)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"THIS SONG IS FINISHED, FROKING MOO");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==11)
    TextBox(0); frame(700);
    set_text_color(rgb(180,250,0));
    write(0,6,126,0,"Spuds");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"FROKKING MOO");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FlemyDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,250,0));
  write(0,6,126,0,"Flemy");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ho there " + Name + ".");
  write(0,6,156,0,"The sea is a vast and dangerous place so");
  write(0,6,166,0,"it's good to bring a friend along on your");
  write(0,6,176,0,"journeys. But don't forget to keep your friends");
  write(0,6,186,0,"close and your enemies far away! Otherwise your");
  write(0,6,196,0,"friend might... be lost. It happened to me you");
  write(0,6,206,0,"know. Lost my old buddy Snuggle that way...");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,250,0));
  write(0,6,126,0,"Flemy");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Some fishlings can join you on your travels.");
  write(0,6,156,0,"To give them orders use the 'O' button. You");
  write(0,6,166,0,"can tell them to follow you, stay and wait or");
  write(0,6,176,0,"to use their powers if they have one.");
  write(0,6,186,0,"You can also tell them to leave you, but use");
  write(0,6,196,0,"that order carefully!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimpDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(250,100,100));
  write(0,6,126,0,"Limp");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ho there " + Name + ". Heard you're going to");
  write(0,6,156,0,"Spipreef? Well then you're going to find");
  write(0,6,166,0,"plenty of uses for your pocket dimension!");
  write(0,6,176,0,"All of the Fish, that means you and the");
  write(0,6,186,0,"other members of the Fish communities, have");
  write(0,6,196,0,"one and can store items there by transferring");
  write(0,6,206,0,"them into the pocket dimension.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(250,100,100));
  write(0,6,126,0,"Limp");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"The items can then be used by transferring");
  write(0,6,156,0,"them back and temporarily equipping them!");
  write(0,6,166,0,"I don't understand how it works but isn't that");
  write(0,6,176,0,"just great?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(250,100,100));
  write(0,6,126,0,"Limp");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"To open a pocket dimension to choose an item");
  write(0,6,156,0,"press 'I' and select the one you want to use.");
  write(0,6,166,0,"You can then use it whenever you want with the");
  write(0,6,176,0,"'ALT' button.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(250,100,100));
  write(0,6,126,0,"Limp");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Also, some of us fish have special powers we");
  write(0,6,156,0,"can use. If you have one, try using it with");
  write(0,6,166,0,"the 'CTRL' button. As we grow, some of us");
  write(0,6,176,0,"can have more than one power. To select");
  write(0,6,186,0,"between different powers, use the 'P' button.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GillIntroDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Outside of Silent reef... It almost feels like");
  write(0,6,156,0,"the water is colder here, more uncaring somehow.");
  write(0,6,166,0,"Stay close to me, won't you " + Name + "?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  if (PlayerFish==1)
    write(0,6,126,0,"Don't worry my friend, I'll lead you safely");
    write(0,6,136,0,"through these tunnels.");
  end
  if (PlayerFish==2)
    write(0,6,126,0,"I better slow down then, to keep the same");
    write(0,6,136,0,"pace as you.");
  end
  if (PlayerFish==3)
    write(0,6,126,0,"You go ahead, I'll follow you shortly, in");
    write(0,6,136,0,"the shadows.");
  end
  if (PlayerFish==4)
    write(0,6,126,0,"If you say so.");
  end

  write(0,6,156,0,"Isn't it exciting? The sea is a huge and");
  write(0,6,166,0,"marvelous place.");

  write(0,6,186,0,"I will.");

  write(0,6,216,0,"...");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GillMapDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"We are finally here! Yay! Spips!");
  write(0,6,156,0,"Just a second though, " + Name + ", I have");
  write(0,6,166,0,"something to give you. I was meaning to");
  write(0,6,176,0,"give it to you earlier, but since we had");
  write(0,6,186,0,"to hurry I forgot.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"This object belonged to my father. He was");
  write(0,6,156,0,"an explorer, and mapped out a big part of");
  write(0,6,166,0,"this sea. He stored all his memories about");
  write(0,6,176,0,"it in this thing. I thought you might want");
  write(0,6,186,0,"to have it, since you always have been");
  write(0,6,196,0,"interested in what lies beyond our small");
  write(0,6,206,0,"part of the sea.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Thanks, Gill! I'll treasure it.");

  write(0,6,166,0,"I see. It might be useful. Thanks.");

  write(0,6,206,0,"Your father? Sure it's okay I take it?");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1 or Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You're welcome. Just promise you won't");
    write(0,6,156,0,"use it to do anything dangerous.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah, it's okay. I have other things he");
    write(0,6,156,0,"left behind as well and I don't have a");
    write(0,6,166,0,"use for this one.");
    repeat frame; until(key(_enter) or key(_space))
  end

  MapItem=1;

  TextBox(0); frame(700);
  set_text_color(rgb(255,255,255));
  write(0,6,126,0,"Gill gave you his fathers Memory Shell.");
  write(0,6,136,0,"Select it from your inventory and use it");
  write(0,6,146,0,"to keep track on where you are or to find ");
  write(0,6,156,0,"strange, new places to explore.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GillIntroDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ah! There you are! Sleeping for so long!!!");
  write(0,6,156,0,"We'll miss the others! WE HAVE MISSED THE");
  write(0,6,166,0,"OTHERS! There won't be any Spips left!");
  write(0,6,176,0,"WHAT IF THERE AREN'T ANY SPIPS LEFT?");
  write(0,6,186,0,"I'LL BE HUNGRY FOREVER! ;_;");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Hey, Calm down Gill! The Spips will be blooming");
  write(0,6,136,0,"just fine, and we can make it there on our own.");

  write(0,6,166,0,"Shut up.");

  write(0,6,206,0,"OH NO. NO SPIPS LEFT! WELL BE HUNGRY FOR");
  write(0,6,216,0,"EVER! ;_;");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Ahah! Yes you are right. It's nothing to worry");
    write(0,6,156,0,"about. There will be plenty of Spips for us.");
    write(0,6,166,0,"IF WE DON'T GET EATEN BY BAD FISH ON THE");
    write(0,6,176,0,"WAY. ;_; Why is everything so scary?");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"O-okay. Well, we better leave now, anyhow.");
    write(0,6,156,0,"Stay close, the sea is scary.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"OH NO OH NO OH NO! WE NEED TO HURRY!!! ;_;");
    write(0,6,156,0,"SWIM FAST MY FRIEND, LEST BAD FISH EAT");
    write(0,6,166,0,"US BEFORE WE GET TO OUR FOOD. WHY IS");
    write(0,6,176,0,"EVERYTHING SO SCARY?!");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(4); frame(700);
  write(0,6,126,0,"It's the way of the world, everything is scary.");

  write(0,6,156,0,"It's nothing, stop worrying so much or i'll");
  write(0,6,166,0,"leave without you.");

  write(0,6,186,0,"It's the way of the world, everything is scary.");
  write(0,6,196,0,"Good thing I am too.");

  write(0,6,216,0,"I'm tired of speaking to you, let's just go.");
  write(0,6,226,0,"You don't need to wait around for me you know?");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1 or Selection==2 or Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... I guess. Ha ha, sometimes I think");
    write(0,6,156,0,"someone like me needs someone like you.");
    write(0,6,166,0,"Lets go " + Name + ", the ocean is always");
    write(0,6,176,0,"waiting.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... I guess I don't. I just thought");
    write(0,6,156,0,"that, well... never mind, let's go then.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"OH! And one more thing... you haven't");
  write(0,6,156,0,"forgotten how to swim, have you " + Name + "?");
  write(0,6,166,0,"Swim forward using the UP button and turn");
  write(0,6,176,0,"around using LEFT and RIGHT. Follow me and");
  write(0,6,186,0,"you'll see how it works.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"And you can talk to other fish by looking");
  write(0,6,156,0,"at them and then press SPACE or ENTER.");
  write(0,6,166,0,"Sometimes they don't wan't to talk,");
  write(0,6,176,0,"but it could still be a good idea to try");
  write(0,6,186,0,"and talk to them again at another time.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MumDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(70,0,240));
  write(0,6,126,0,"Mom");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"On your way now!");
  write(0,6,156,0,"Don't stray from the path, don't go into the deep");
  write(0,6,166,0,"waters and stay away from badfish and strangers!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MumDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(70,0,240));
  write(0,6,126,0,"Mom");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...Wake up " + Name + ", you'll be late.");
  write(0,6,156,0,"The waters already bright enough and the other");
  write(0,6,166,0,"fishlings are leaving. It's dangerous to swim");
  write(0,6,176,0,"in a lonely sea.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Huh? Whuzzat?");

  write(0,6,166,0,"Morning mom.");

  write(0,6,206,0,"...");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(70,0,240));
    write(0,6,126,0,"Mom");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You Silly krill, you're going to be late is what");
    write(0,6,156,0,"I'm telling you.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(70,0,240));
    write(0,6,126,0,"Mom");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hurry up now.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(70,0,240));
    write(0,6,126,0,"Mom");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Just get up okay?");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(70,0,240));
  write(0,6,126,0,"Mom");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Gill is waiting for you outside. Sometimes I wish");
  write(0,6,156,0,"you wouldn't have to leave, the sea gets darker");
  write(0,6,166,0,"the further you get from our little reef.");
  write(0,6,176,0,"The light has always grown thick here, it is a");
  write(0,6,186,0,"safe place.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Okay mom, I better get going.");

  write(0,6,166,0,"Don't worry so much, I can take care of");
  write(0,6,176,0,"myself.");

  write(0,6,206,0,"Whatever, I'm leaving.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(70,0,240));
  write(0,6,126,0,"Mom");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"It's just... ");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(70,0,240));
  write(0,6,126,0,"Mom");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I'm just so lucky to have you. On your way now!");
  write(0,6,156,0,"Don't stray from the path, don't go into the deep");
  write(0,6,166,0,"waters and stay away from badfish and strangers!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process VeolaDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(240,60,60));
  write(0,6,126,0,"Veola");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"You again! How loathsome! Just go away or do");
  write(0,6,156,0,"as I have told you!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process VeolaDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(240,60,60));
  write(0,6,126,0,"Veola");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh hello. Do I know YOU? I do not think so.");
  write(0,6,156,0,"Who do you think you are who gets to swim in");
  write(0,6,166,0,"my water? I'm not from just any old reef you");
  write(0,6,176,0,"know, I'm from Heliotrope Reef. That's right,");
  write(0,6,186,0,"the Reef of Proton of the Triumvirate!");
  write(0,6,196,0,"My parents are really close to him. You better");
  write(0,6,206,0,"stay in my good graces if you don't want bad");
  write(0,6,216,0,"things to happen to you.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"What? Who do you think YOU are?!");
  write(0,6,136,0,"Shut up, right now.");

  write(0,6,156,0,"I don't know what to say. This is the stupidest");
  write(0,6,166,0,"thing I've heard all day.");

  write(0,6,186,0,"Oh sorry. I didn't know! I'll just go away...");

  write(0,6,216,0,"Hey, no need to be like that! Let's be friends!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1 or Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(240,60,60));
    write(0,6,126,0,"Veola");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You... You... It's good for you that were not");
    write(0,6,156,0,"in Heliotrope right now. It's real good for");
    write(0,6,166,0,"you... Watch your back... Although you do show");
    write(0,6,176,0,"some spunk, something that these losers seem to");
    write(0,6,186,0,"lack... Except for Finn. <3");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(240,60,60));
    write(0,6,126,0,"Veola");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Maybe i'll forgive your impudence... Maybe you");
    write(0,6,156,0,"too may serve her highness queen Veola. You");
    write(0,6,166,0,"might even be rewarded for your work! Hah,");
    write(0,6,176,0,"such wonderful inspiration. I know EXACTLY what");
    write(0,6,186,0,"someone like you must do to gain my favor.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"Yes... Well I don't care. And you've taken");
    write(0,6,136,0,"enough of my time. Goodbye.");

    write(0,6,166,0,"Ugh. It never ends. Goodbye!");

    write(0,6,206,0,"So... a reward? Must be a pretty grand one.");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1 or Selection==2)
      VeolaMemory=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(240,60,60));
      write(0,6,126,0,"Veola");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes. A grand surprise it will be. But know");
      write(0,6,156,0,"that being in the favor of the queen might");
      write(0,6,166,0,"reap you great benefits one day.");
      write(0,6,176,0,"Does this intrigue you?");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(2); frame(700);
      write(0,6,126,0,"Yes.");

      write(0,6,166,0,"Not really.");
      repeat frame; until(key(_enter) or key(_space))


      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(240,60,60));
        write(0,6,126,0,"Veola");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Then listen to this. There is a fish in");
        write(0,6,156,0,"this reef who has been a thorn in my side");
        write(0,6,166,0,"back in Heliotrope and I think its time for");
        write(0,6,176,0,"some final retribution! That stupid Slug is");
        write(0,6,186,0,"always in the way and I want him to simply");
        write(0,6,196,0,"go away!");
        repeat frame; until(key(_enter) or key(_space))

        TextBox(0); frame(700);
        set_text_color(rgb(240,60,60));
        write(0,6,126,0,"Veola");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"I want you to say that you have found it");
        write(0,6,156,0,"and then lead him to the very top of");
        write(0,6,166,0,"The Ocean, where there is a small patch of");
        write(0,6,176,0,"purple Seagrass. Say that it is hidden in");
        write(0,6,186,0,"the grass. He is not that fast a swimmer.");
        write(0,6,196,0,"This should show him who the queen is");
        write(0,6,206,0,"around here. You are allowed to speak to");
        write(0,6,216,0,"me again when the deed is done.");
        repeat frame; until(key(_enter) or key(_space))
        VeolaMemory=2;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(240,60,60));
        write(0,6,126,0,"Veola");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Then go away you foul being!");
        write(0,6,156,0,"I have grown tired of your stupid antics!");
        repeat frame; until(key(_enter) or key(_space))
        VeolaMemory=1;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end
    end
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(240,60,60));
    write(0,6,126,0,"Veola");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Ah, it is so nice when people like you know");
    write(0,6,156,0,"their place.");
    repeat frame; until(key(_enter) or key(_space))
    VeolaMemory=1;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(240,60,60));
    write(0,6,126,0,"Veola");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Friends!? Surely you must be joking. Ah ha.");
    write(0,6,156,0,"Yes, your sarcasm is almost like a nice breeze");
    write(0,6,166,0,"compared to the kind of talk I am usually");
    write(0,6,176,0,"expected to tolerate from the nimwits around");
    write(0,6,186,0,"me. Maybe you could be of service to her");
    write(0,6,196,0,"highness the Queen Veola.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(3); frame(700);
    write(0,6,126,0,"Yes... Well I don't care. And you've taken");
    write(0,6,136,0,"enough of my time. Goodbye.");

    write(0,6,166,0,"Ugh. It never ends. Goodbye!");

    write(0,6,206,0,"Perhaps a reward is involved?");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1 or Selection==2)
      VeolaMemory=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(240,60,60));
      write(0,6,126,0,"Veola");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes. A grand surprise it will be. But know");
      write(0,6,156,0,"that being in the favor of the queen might");
      write(0,6,166,0,"reap you great benefits one day.");
      write(0,6,176,0,"Does this intrigue you?");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(2); frame(700);
      write(0,6,126,0,"Yes.");

      write(0,6,166,0,"Not really.");
      repeat frame; until(key(_enter) or key(_space))


      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(240,60,60));
        write(0,6,126,0,"Veola");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Then listen to this. There is a fish in");
        write(0,6,156,0,"this reef who has been a thorn in my side");
        write(0,6,166,0,"back in Heliotrope and I think its time for");
        write(0,6,176,0,"some final retribution! That stupid Slug is");
        write(0,6,186,0,"always in the way and I want him to simply");
        write(0,6,196,0,"go away!");
        repeat frame; until(key(_enter) or key(_space))

        TextBox(0); frame(700);
        set_text_color(rgb(240,60,60));
        write(0,6,126,0,"Veola");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"I want you to say that you have found it");
        write(0,6,156,0,"and then lead him to the very top of");
        write(0,6,166,0,"The Ocean, where there is a small patch of");
        write(0,6,176,0,"purple Seagrass. Say that it is hidden in");
        write(0,6,186,0,"the grass. He is not that fast a swimmer.");
        write(0,6,196,0,"This should show him who the queen is");
        write(0,6,206,0,"around here. You are allowed to speak to");
        write(0,6,216,0,"me again when the deed is done.");
        repeat frame; until(key(_enter) or key(_space))
        VeolaMemory=2;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(240,60,60));
        write(0,6,126,0,"Veola");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Then go away you foul being!");
        write(0,6,156,0,"I have grown tired of your stupid antics!");
        repeat frame; until(key(_enter) or key(_space))
        VeolaMemory=1;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end
    end
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MerlDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(240,240,0));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey... " + Name + ". You seem like a cool");
    write(0,6,156,0,"guy? You a cool guy? That dimwit Slug is");
    write(0,6,166,0,"always in the way don't you think?");
    write(0,6,176,0,"I just wish someone... would do something");
    write(0,6,186,0,"about it. Heh he he.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(240,240,0));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Heh heh. Veola made sure that nobody speaks");
    write(0,6,156,0,"to Slug anymore back in Heliotrope Reef.");
    write(0,6,166,0,"People pick up on bad vibrations quick,");
    write(0,6,176,0,"seems like nobody speaks to him here either.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(240,240,0));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Slug used to have this pearl that he really");
    write(0,6,156,0,"really liked. It was a heirloom of his daddy");
    write(0,6,166,0,"or something. To bad for him that it");
    write(0,6,176,0,"disappeared!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==3)
    TextBox(0); frame(700);
    set_text_color(rgb(240,240,0));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey. Speak to Veola if you want to hang with");
    write(0,6,156,0,"us. She makes the decisions around here.");
    write(0,6,166,0,"Her parents know Proton of the Triumvirate.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==4)
    TextBox(0); frame(700);
    set_text_color(rgb(240,240,0));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"He he he.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process DimmDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(80,80,120));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Huh... oh.");
    write(0,6,156,0,"Don't speak to me, speak to Veola.");
    write(0,6,166,0,"Veola is the boss " + Name + ".");
    write(0,6,176,0,"You better do what she says... Uh...");
    write(0,6,186,0,"coz she is the queen around here uuh.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(80,80,120));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Uh. My parents told me to do what Veola");
    write(0,6,156,0,"says. Shes like, important and stuff.");
    write(0,6,166,0,"I guess.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(80,80,120));
    write(0,6,126,0,"Dimm");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Uh.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FriendFishDialog1();
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (FriendFish==1)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey " + Name + " I've got a bad feeling");
    write(0,6,156,0,"about this... Before you finish this");
    write(0,6,166,0,"mission, I think you better finish up");
    write(0,6,176,0,"whatever other stuff you still feel like you");
    write(0,6,186,0,"have to do around here. Just saying...");
    write(0,6,196,0,"I have a feeling things are about to change");
    write(0,6,206,0,"around here real soon.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey " + Name + " I've got a bad feeling");
    write(0,6,156,0,"about this... Before you finish this");
    write(0,6,166,0,"mission, I think you better finish up");
    write(0,6,176,0,"whatever other stuff you still feel like you");
    write(0,6,186,0,"have to do around here. Just saying...");
    write(0,6,196,0,"I have a feeling things are about to change");
    write(0,6,206,0,"around here real soon.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (FriendFish==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey " + Name + " I've got a bad feeling");
    write(0,6,156,0,"about this... Before you finish this");
    write(0,6,166,0,"mission, I think you better finish up");
    write(0,6,176,0,"whatever other stuff you still feel like you");
    write(0,6,186,0,"have to do around here. Just saying...");
    write(0,6,196,0,"I have a feeling things are about to change");
    write(0,6,206,0,"around here real soon.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end
end



process SlugQuestDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,Name);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Slug, I think this is where Veola said your");
  write(0,6,156,0,"pearl was.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh, are you sure it's around here?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"It's true. If you'll stay and look you");
  write(0,6,136,0,"will probably find it.");

  write(0,6,166,0,"No it's a lie. Veola wanted me to hurt");
  write(0,6,176,0,"you by luring you here and leaving you.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Okay. If you say so. I'll stay and");
    write(0,6,156,0,"look for it after you leave this place");
    write(0,6,166,0,"then. I really hope I will find it.");
    write(0,6,176,0,"Thanks for helping me " + Name + "!");
    repeat frame; until(key(_enter) or key(_space))
    FriendFish=0; SlugQuest=3;
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That... sounds exactly like her. She's been");
    write(0,6,156,0,"trying to get me for quite some time now,");
    write(0,6,166,0,"it's related to our parents I guess, and");
    write(0,6,176,0,"that she thinks that i'm weak. I guess I am");
    write(0,6,186,0,"pretty weak.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"We both come from Heliotrope Reef, shes been");
    write(0,6,156,0,"bullying me there for ages with her gang.");
    write(0,6,166,0,"People even stopped speaking to me after a");
    write(0,6,176,0,"while, that's the influence of her parents");
    write(0,6,186,0,"for you. But you seem different. Don't you");
    write(0,6,196,0,"care about what she might do to you?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(4); frame(700);
    write(0,6,126,0,"Nope. You want to hang out more?");

    write(0,6,156,0,"She is a cretin, I don't care much for");
    write(0,6,166,0,"cretins. You show some promise however.");

    write(0,6,186,0,"Don't worry so much! Lets have some fun");
    write(0,6,196,0,"instead!");

    write(0,6,216,0,"Not at all. Let's continue our");
    write(0,6,226,0,"adventure!");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Ah, that is so nice of you! Thanks!");
    repeat frame; until(key(_enter) or key(_space))
    SlugQuest=2;
  end


  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SlugDialog0(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Go away will you? It's no use talking,");
  write(0,6,156,0,"you'll only make it worse.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SlugDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (FriendFish==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I have some stuff to finish first.");
    write(0,6,156,0,"I'll meet you once you leave this place.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Can I come with you for a while now?");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(2); frame(700);
  write(0,6,126,0,"Sure, tag along!");

  write(0,6,166,0,"No, not right now.");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    if (FriendFish==0)
      TextBox(0); frame(700);
      set_text_color(rgb(200,200,0));
      write(0,6,126,0,"Slug");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Ah, that is so nice of you! Thanks!");
      write(0,6,156,0,"I'll meet you once you leave this place.");
      repeat frame; until(key(_enter) or key(_space))
      FriendFish=3;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish>0)
      TextBox(0); frame(700);
      set_text_color(rgb(200,200,0));
      write(0,6,126,0,"Slug");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"That is nice. But you already have a");
      write(0,6,156,0,"friend... but... tell me if you change");
      write(0,6,166,0,"your mind.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Okey. but... tell me if you change");
    write(0,6,156,0,"your mind.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SlugDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (FriendFish==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I have some stuff to finish first.");
    write(0,6,156,0,"I'll meet you once you leave this place.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Just leave me alone. Things are worse enough");
  write(0,6,156,0,"as they are.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"I spoke to Veola, she told me where your");
  write(0,6,136,0,"pearl is.");

  write(0,6,166,0,"I spoke to Veola, I think she wants me to");
  write(0,6,176,0,"lure you somewhere where you could get hurt.");
  write(0,6,186,0,"I'm " + Name + " by the way.");

  write(0,6,206,0,"I'll just leave you alone.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==3)
    if (FriendFish==1)
      TextBox(0); frame(700);
      set_text_color(rgb(0,70,160));
      set_text_color(rgb(160,210,0));
      write(0,6,126,0,"Gill");
      write(0,6,146,0,"Poor Slug! I hate bullies like that!");
      write(0,6,156,0,"THEY ARE STUPID AND WRONG,");
      write(0,6,166,0,"WHY CANT WE ALL JUST GET ALONG?");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish==2)
      TextBox(0); frame(700);
      set_text_color(rgb(0,70,160));
      write(0,6,126,0,"Finn");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Hey Slug. Veola is crazy but if you");
      write(0,6,156,0,"showed some guts she wouldn't bother you.");
      write(0,6,166,0,"Deep down she's too afraid to pick on");
      write(0,6,176,0,"anyone but the weak. Pick a fight with");
      write(0,6,186,0,"her and you'll win.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Are you sure this is not a trick?");
    write(0,6,156,0,"Who are you anyway?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(2); frame(700);
    write(0,6,126,0,"It's true. I'm " + Name + ".");

    write(0,6,166,0,"No it's a lie, I think she wants me to hurt");
    write(0,6,176,0,"you in some way by luring you somewhere");
    write(0,6,186,0,"dangerous. I'm " + Name + " by the way.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(200,200,0));
      write(0,6,126,0,"Slug");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Oh... Maybe... Maybe things is getting a");
      write(0,6,156,0,"little better then. Can I join you so that");
      write(0,6,166,0,"you can show me where the pearl is?");
      repeat frame; until(key(_enter) or key(_space))

      TextBox(2); frame(700);
      write(0,6,126,0,"It's true. I'm " + Name + ".");

      write(0,6,166,0,"Eh, I can't do this.");
      write(0,6,176,0,"I'll talk to you later slug.");
      repeat frame; until(key(_enter) or key(_space))

      if (Selection==1)
        if (FriendFish==0)
          TextBox(0); frame(700);
          set_text_color(rgb(200,200,0));
          write(0,6,126,0,"Slug");
          set_text_color(rgb(255,255,255));
          write(0,6,146,0,"Ah, that is so nice of you! Thanks!");
          write(0,6,156,0,"I'll meet you once you leave this place.");
          repeat frame; until(key(_enter) or key(_space))
          FriendFish=3; SlugMemory=1; SlugQuest=1;

          if (FriendFish==1)
            TextBox(0); frame(700);
            set_text_color(rgb(160,210,0));
            write(0,6,126,0,"Gill");
            set_text_color(rgb(255,255,255));
            write(0,6,146,0,"Poor Slug! I hate bullies like that!");
            write(0,6,156,0,"THEY ARE STUPID AND WRONG,");
            write(0,6,166,0,"WHY CANT WE ALL JUST GET ALONG?");
            repeat frame; until(key(_enter) or key(_space))
            frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
          end

          if (FriendFish==2)
            TextBox(0); frame(700);
            set_text_color(rgb(0,70,160));
            write(0,6,126,0,"Finn");
            set_text_color(rgb(255,255,255));
            write(0,6,146,0,"Hey Slug. Veola is crazy but if you");
            write(0,6,156,0,"showed some guts she wouldn't bother you.");
            write(0,6,166,0,"Deep down she's too afraid to pick on");
            write(0,6,176,0,"anyone but the weak. Pick a fight with");
            write(0,6,186,0,"her and you'll win.");
            repeat frame; until(key(_enter) or key(_space))
            frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
          end
          frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
        end

        if (FriendFish>0)
          TextBox(0); frame(700);
          set_text_color(rgb(200,200,0));
          write(0,6,126,0,"Slug");
          set_text_color(rgb(255,255,255));
          write(0,6,146,0,"That is nice. But you already have a");
          write(0,6,156,0,"friend... but... tell me if you change");
          write(0,6,166,0,"your mind.");
          repeat frame; until(key(_enter) or key(_space))
          SlugMemory=2;

          if (FriendFish==1)
            TextBox(0); frame(700);
            set_text_color(rgb(160,210,0));
            write(0,6,126,0,"Gill");
            set_text_color(rgb(255,255,255));
            write(0,6,146,0,"Poor Slug! I hate bullies like that!");
            write(0,6,156,0,"THEY ARE STUPID AND WRONG,");
            write(0,6,166,0,"WHY CANT WE ALL JUST GET ALONG?");
            repeat frame; until(key(_enter) or key(_space))
            frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
          end

          if (FriendFish==2)
            TextBox(0); frame(700);
            set_text_color(rgb(0,70,160));
            write(0,6,126,0,"Finn");
            set_text_color(rgb(255,255,255));
            write(0,6,146,0,"Hey Slug. Veola is crazy but if you");
            write(0,6,156,0,"showed some guts she wouldn't bother you.");
            write(0,6,166,0,"Deep down she's too afraid to pick on");
            write(0,6,176,0,"anyone but the weak. Pick a fight with");
            write(0,6,186,0,"her and you'll win.");
            repeat frame; until(key(_enter) or key(_space))
            frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
          end

          frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
        end
      end
    end
  end


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"That... sounds exactly like her. She's been");
  write(0,6,156,0,"trying to get me for quite some time now,");
  write(0,6,166,0,"it's related to our parents I guess, and");
  write(0,6,176,0,"that she thinks that i'm weak. I guess I am");
  write(0,6,186,0,"pretty weak.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Slug");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"We both come from Heliotrope Reef, shes been");
  write(0,6,156,0,"bullying me there for ages with her gang.");
  write(0,6,166,0,"People even stopped speaking to me after a");
  write(0,6,176,0,"while, that's the influence of her parents");
  write(0,6,186,0,"for you. But you seem different. Don't you");
  write(0,6,196,0,"care about what she might do to you?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"Nope. You want to hang out?");

  write(0,6,156,0,"She is a cretin, I don't care much for");
  write(0,6,166,0,"cretins. You show some promise however.");

  write(0,6,186,0,"Don't worry so much! Lets have some fun");
  write(0,6,196,0,"instead!");

  write(0,6,216,0,"Nope, but I gotta go. See you later.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1 or Selection==2 or Selection==3)
    if (FriendFish==0)
      TextBox(0); frame(700);
      set_text_color(rgb(200,200,0));
      write(0,6,126,0,"Slug");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Ah, that is so nice of you! Thanks!");
      write(0,6,156,0,"I'll meet you once you leave this place.");
      repeat frame; until(key(_enter) or key(_space))
      FriendFish=3; SlugMemory=2;

      if (FriendFish==1)
        TextBox(0); frame(700);
        set_text_color(rgb(160,210,0));
        write(0,6,126,0,"Gill");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Poor Slug! I hate bullies like that!");
        write(0,6,156,0,"THEY ARE STUPID AND WRONG,");
        write(0,6,166,0,"WHY CANT WE ALL JUST GET ALONG?");
        repeat frame; until(key(_enter) or key(_space))
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (FriendFish==2)
        TextBox(0); frame(700);
        set_text_color(rgb(0,70,160));
        write(0,6,126,0,"Finn");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Hey Slug. Veola is crazy but if you");
        write(0,6,156,0,"showed some guts she wouldn't bother you.");
        write(0,6,166,0,"Deep down she's too afraid to pick on");
        write(0,6,176,0,"anyone but the weak. Pick a fight with");
        write(0,6,186,0,"her and you'll win.");
        repeat frame; until(key(_enter) or key(_space))
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish>0)
      TextBox(0); frame(700);
      set_text_color(rgb(200,200,0));
      write(0,6,126,0,"Slug");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"That is nice. But you already have a");
      write(0,6,156,0,"friend... but... tell me if you change");
      write(0,6,166,0,"your mind.");
      repeat frame; until(key(_enter) or key(_space))
      SlugMemory=2;

      if (FriendFish==1)
        TextBox(0); frame(700);
        set_text_color(rgb(160,210,0));
        write(0,6,126,0,"Gill");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Poor Slug! I hate bullies like that!");
        write(0,6,156,0,"THEY ARE STUPID AND WRONG,");
        write(0,6,166,0,"WHY CANT WE ALL JUST GET ALONG?");
        repeat frame; until(key(_enter) or key(_space))
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (FriendFish==2)
        TextBox(0); frame(700);
        set_text_color(rgb(0,70,160));
        write(0,6,126,0,"Finn");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Hey Slug. Veola is crazy but if you");
        write(0,6,156,0,"showed some guts she wouldn't bother you.");
        write(0,6,166,0,"Deep down she's too afraid to pick on");
        write(0,6,176,0,"anyone but the weak. Pick a fight with");
        write(0,6,186,0,"her and you'll win.");
        repeat frame; until(key(_enter) or key(_space))
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process FinnDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (FriendFish==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I have some stuff to finish first.");
    write(0,6,156,0,"I'll meet you once you leave this place.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"So, time for some action?");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(2); frame(700);
  write(0,6,126,0,"Indeed, let's go!");

  write(0,6,166,0,"No, not right now.");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    if (FriendFish==0)
      TextBox(0); frame(700);
      set_text_color(rgb(0,70,160));
      write(0,6,126,0,"Finn");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yeah! Show me some excitement.");
      repeat frame; until(key(_enter) or key(_space))
      FriendFish=2;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish>0)
      TextBox(0); frame(700);
      set_text_color(rgb(0,70,160));
      write(0,6,126,0,"Finn");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I see you have one of THOSE guys with you,");
      write(0,6,156,0,"so I don't think I'll join you after all.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Slug");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Whatever. Tell me if you change your");
    write(0,6,156,0,"mind.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process FinnDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey guy. What do you want? You seem...");
  write(0,6,156,0,"different from this other rabble of pests.");
  write(0,6,166,0,"Man I wish there was someone here who");
  write(0,6,176,0,"wasn't such a crudding boremonger.");
  write(0,6,186,0,"I'm Finn by the way.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,Name);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Boremonger? What do you mean?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,70,160));
  write(0,6,126,0,"Finn");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Eh, nobody wants to do anything interesting.");
  write(0,6,156,0,"Hey. I just want some action you know?");
  write(0,6,166,0,"Everyone here is so weak. I just want some");
  write(0,6,176,0,"crudding danger.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Danger you say... well I am prone to finding");
  write(0,6,136,0,"some of that myself.");

  write(0,6,166,0,"Adventures can be dangerous and heroes go on");
  write(0,6,176,0,"adventures!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I like what I'm hearing. This reef is too");
    write(0,6,156,0,"small for the likes of us. I just wanna");
    write(0,6,166,0,"leave all this crud behind and test my");
    write(0,6,176,0,"mettle against the depths.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(2); frame(700);
    write(0,6,126,0,"Maybe you should join me Finn. Friends?");

    write(0,6,166,0,"I don't know. Lets talk later.");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1)
      if (FriendFish==0)
        TextBox(0); frame(700);
        set_text_color(rgb(0,70,160));
        write(0,6,126,0,"Finn");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Yeah. Show me some excitement " + Name + "!");
        write(0,6,156,0,"I'll meet you once you leave this place.");
        repeat frame; until(key(_enter) or key(_space))
        FriendFish=2; FinnMemory=1;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (FriendFish>0)
        TextBox(0); frame(700);
        set_text_color(rgb(0,70,160));
        write(0,6,126,0,"Finn");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"I see you have one of THOSE guys with you,");
        write(0,6,156,0,"so I don't think I'll join you after all.");
        repeat frame; until(key(_enter) or key(_space))
        FinnMemory=1;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end
    end
    if (Selection==2)
      FinnMemory=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,70,160));
    write(0,6,126,0,"Finn");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey... That sounds really dumb but I like");
    write(0,6,156,0,"the gist of it. You wanna go out and test");
    write(0,6,166,0,"your mettle, right?");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(2); frame(700);
    write(0,6,126,0,"Why not?! Join me Finn and let's find");
    write(0,6,136,0,"something dangerous!");

    write(0,6,166,0,"Noo... Not at all. I'll leave now.");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==2)
      FinnMemory=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish==0)
      TextBox(0); frame(700);
      set_text_color(rgb(0,70,160));
      write(0,6,126,0,"Finn");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yeah. Show me some excitement " + Name + "!");
      write(0,6,156,0,"I'll meet you once you leave this place.");
      repeat frame; until(key(_enter) or key(_space))
      FriendFish=2; FinnMemory=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish>0)
      TextBox(0); frame(700);
      set_text_color(rgb(0,70,160));
      write(0,6,126,0,"Finn");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I see you have one of THOSE guys with you,");
      write(0,6,156,0,"so I don't think I'll join you after all.");
      repeat frame; until(key(_enter) or key(_space))
      FinnMemory=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GillDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (FriendFish==1)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I have some stuff to finish first.");
    write(0,6,156,0,"I'll meet you once you leave this place.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  TextBox(0); frame(700);
  set_text_color(rgb(160,210,0));
  write(0,6,126,0,"Gill");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hi " + Name + "!");
  write(0,6,156,0,"Want me to come with you for a bit?");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(2); frame(700);
  write(0,6,126,0,"That would be nice!");

  write(0,6,166,0,"Not right now Gill.");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    if (FriendFish==0)
      TextBox(0); frame(700);
      set_text_color(rgb(160,210,0));
      write(0,6,126,0,"Gill");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Great! I'll join you once you leave this place.");
      repeat frame; until(key(_enter) or key(_space))
      FriendFish=1;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (FriendFish>0)
      TextBox(0); frame(700);
      set_text_color(rgb(160,210,0));
      write(0,6,126,0,"Gill");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I see you already have a friend with you.");
      write(0,6,156,0,"Maybe I can join you later on...");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(160,210,0));
    write(0,6,126,0,"Gill");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Okay. I'll be here if you change your mind though.");
    write(0,6,156,0,"Later.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog11(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh. Its you kid. Well you sure did it this time.");
  write(0,6,156,0,"We might have miscalculated just how angry the");
  write(0,6,166,0,"Selachimorphs would get after our little test.");
  write(0,6,176,0,"Mere moments after you left Sark gave orders to");
  write(0,6,186,0,"the Tribe to exterminate this Sphere. I was");
  write(0,6,196,0,"using my abilities so naturally me and Blu");
  write(0,6,206,0,"where where warned instantaneously. We tried to");
  write(0,6,216,0,"warn the others... but quite few believed us...");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"It was messy. Not a pretty picture, not a pretty");
  write(0,6,156,0,"picture at all. At least that old dude, Roark and");
  write(0,6,166,0,"your other companions got away. Roark and the");
  write(0,6,176,0,"old guy went ahead but we waited for you.");
  write(0,6,186,0,"Some others fled towards the Deep roads.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Hey Li-");

  write(0,6,166,0,"What the f-");

  write(0,6,206,0,"They're all de-");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Heads up now " + Name + ", here they come!");
  write(0,6,156,0,"Try to shake em of using the Blobs kid!");
  repeat frame; until(key(_enter) or key(_space))

  LimMemory=10;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog10(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)

    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey... Kid. You made it... Whoa. While I");
    write(0,6,156,0,"didn't expect you to die, I sure as depths be");
    write(0,6,166,0,"darkened didn't expect you to make it! In a");
    write(0,6,176,0,"way it would have been fine if you died");
    write(0,6,186,0,"considering how it would have hurt...");
    write(0,6,196,0,"Ah, what am I saying? I'm just rambling on!");
    write(0,6,206,0,"You made it kid, you really made it. You're ");
    write(0,6,216,0,"gonna be a hero of the revolution one day I");
    write(0,6,226,0,"tells ya!");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"Lim... I almost died out there. What the SPIP");
    write(0,6,136,0,"are you talking about?");

    write(0,6,166,0,"A breeze as always. You should come to expect");
    write(0,6,176,0,"results like this from me.");

    write(0,6,206,0,"DAMN RIGHT I AM A HERO OF THE... what?");
    write(0,6,216,0,"WELL A HERO NONETHELESS.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes... You have earned it all kid.");
      write(0,6,156,0,"It's time for the truth.");
      repeat frame; until(key(_enter) or key(_space))
    end


    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes... You have shown more promise than I ever");
      write(0,6,156,0,"could have expected. Its time you learned what's");
      write(0,6,166,0,"really going on here.");
      repeat frame; until(key(_enter) or key(_space))
    end


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Now about the information I am about to tell");
    write(0,6,156,0,"you... I need a special promise that you won't");
    write(0,6,166,0,"tell anyone, except for perhaps your companions,");
    write(0,6,176,0,"what I am going to tell you. This involves your");
    write(0,6,186,0,"father too so it is in your best interest to keep");
    write(0,6,196,0,"it a secret. So, what will it be?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(2); frame(700);
    write(0,6,126,0,"Yes, I will keep it secret. I promise.");

    write(0,6,166,0,"I don't know, do you trust me enough?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Okay... First of all, lets just say that all is");
    write(0,6,156,0,"not right in the world of fish, and everything");
    write(0,6,166,0,"that is wrong stems from the corruption that");
    write(0,6,176,0,"plagues Great Sphere City. The very foundation");
    write(0,6,186,0,"of our society is... wrong. And we are controlled");
    write(0,6,196,0,"by an outside-source of power which somehow");
    write(0,6,206,0,"tries to keep us from becoming what we were");
    write(0,6,216,0,"always meant to be.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I don't know if you have noticed how it seems");
    write(0,6,156,0,"like every other fish in this sea, at least the");
    write(0,6,166,0,"ones who are part of The Fish, are born with a");
    write(0,6,176,0,"sort of power. These powers can evolve if you");
    write(0,6,186,0,"practice them, and the consummation of Spips");
    write(0,6,196,0,"seems to speed up this process. The Triumvirate");
    write(0,6,206,0,"keeps us from achieving our full evolutional");
    write(0,6,216,0,"potential and fish who develop dangerous");
    write(0,6,226,0,"powers... disappear.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The ones who are behind the Triumvirate are the");
    write(0,6,156,0,"ones who sometimes are called the grey ones...");
    write(0,6,166,0,"The Selachimorphs. They are a powerful tribal");
    write(0,6,176,0,"species of predators who... pretty much cannot");
    write(0,6,186,0,"be defeated. Or at least that is what is said. Me");
    write(0,6,196,0,"and Lim belong to the Guild of the Evolutional");
    write(0,6,206,0,"Anarchists, a group of likeminded fish who wants");
    write(0,6,216,0,"to see where our evolutional prowess can take us.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"We have been investigating methods too hurt");
    write(0,6,156,0,"Selachimorphs, or at least confuse them or");
    write(0,6,166,0,"incapacitate them. The seed of Darkness that you");
    write(0,6,176,0,"have acquired is the answer to our questions, or");
    write(0,6,186,0,"might at least be a part of it. We believe that");
    write(0,6,196,0,"the powers of the darkbringers can blind one of");
    write(0,6,206,0,"the grey ones and thus might be useful as a");
    write(0,6,216,0,"weapon.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==0 or Mode==1)

    TextBox(4); frame(700);
    write(0,6,126,0,"Evolutional Anarchists??!!");

    write(0,6,156,0,"Selachimorphs??!!??");

    write(0,6,186,0,"Wha... nothing you said makes any sense but");
    write(0,6,196,0,"whatever. The Grey ones are the bad guys right?");

    write(0,6,216,0,"Go on Lim, tell me more.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Ah yes. Our proud and secretive guild. We believe");
      write(0,6,156,0,"in the fall of society and the complete dominance");
      write(0,6,166,0,"of Anarchy among The Fish. We want personal");
      write(0,6,176,0,"potential to be what rules this sea. And what can");
      write(0,6,186,0,"thus be more important than evolving as far as");
      write(0,6,196,0,"we can, using whatever means possible?");
      repeat frame; until(key(_enter) or key(_space))

      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"We simply want to become whatever we possibly");
      write(0,6,156,0,"can become. And the governing forces in the");
      write(0,6,166,0,"Society of fish and the dreadful and terrible");
      write(0,6,176,0,"terror-reign of the Selachimorphs are holding");
      write(0,6,186,0,"us back. Long last the Evolution of The Fish!");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog10(1); return;
    end


    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes... We do not know that much about them. What");
      write(0,6,156,0,"we do know is that they are a powerful species of");
      write(0,6,166,0,"predators and that they have allied themselves");
      write(0,6,176,0,"with the Triumvirate for reasons unknown as their");
      write(0,6,186,0,"source of destructive force. This force is the");
      write(0,6,196,0,"underlying thing which maintains the Triumvirate");
      write(0,6,206,0,"at their current position of power. Working with a");
      write(0,6,216,0,"special branch of the government... they are the");
      write(0,6,226,0,"ones who make fish disappear.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog10(1); return;
    end


    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes... they are the bad guys. If that's all you");
      write(0,6,156,0,"need to know I guess that's that.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog10(1); return;
    end


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Now that you have acquired the Seed of");
    write(0,6,156,0,"Darkness... We want you to try it out. You have");
    write(0,6,166,0,"shown yourself to be the one most suited for this");
    write(0,6,176,0,"task and if you do this me and Blu will take you");
    write(0,6,186,0,"on as an initiate in our guild and take you to");
    write(0,6,196,0,"Great Sphere City.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"It's highly unusual for us to do a thing like");
    write(0,6,156,0,"this, given that you are a Fishling and not yet");
    write(0,6,166,0,"permitted to become a full Citizen of the world");
    write(0,6,176,0,"of fish, but we have some power. It is not");
    write(0,6,186,0,"impossible for us to sneak you into the city.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==0 or Mode==1 or Mode==2)

    TextBox(3); frame(700);
    write(0,6,126,0,"Whoa. But I have family back in Silent Reef...");
    write(0,6,136,0,"And what would my companions do? They're in on");
    write(0,6,146,0,"this too.");

    write(0,6,166,0,"An initiate, what would that mean?");

    write(0,6,206,0,"Okay. So what's the plan?");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"If we leave for the city you will have to forget");
      write(0,6,156,0,"about your family for now... But trust me, it's");
      write(0,6,166,0,"for the best. Bad things are about to go down in");
      write(0,6,176,0,"all parts of this sea. Best thing you could for");
      write(0,6,186,0,"anyone you care about is to help us. Now about");
      write(0,6,196,0,"your companions, yeah you can bring them along,");
      write(0,6,206,0,"as long as they want to.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog10(2); return;
    end


    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"As an Initiate you would be introduced to the");
      write(0,6,156,0,"secrets of our Guild and the knowledge we");
      write(0,6,166,0,"possess about the potential of us of The Fish.");
      write(0,6,176,0,"You would also gain a cover so that you could");
      write(0,6,186,0,"operate in and around the Great Sphere City and");
      write(0,6,196,0,"do our noble work in undermining the structures");
      write(0,6,206,0,"of our corrupt society and looking for a final");
      write(0,6,216,0,"solution to all our problems.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog10(2); return;
    end


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The plan is a simple one. Westward, across the");
    write(0,6,156,0,"Sunlit Sea is the final border of this Sphere");
    write(0,6,166,0,"of Safety, the Sphere that is known as the");
    write(0,6,176,0,"Spipreef. What this really means is that if we");
    write(0,6,186,0,"go further into that direction we enter");
    write(0,6,196,0,"Selachimorph water.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The intel that I've gathered using my special");
    write(0,6,156,0,"methods tells me that it is the tribe of");
    write(0,6,166,0,"Prometheus who reside there. I have also learned");
    write(0,6,176,0,"that the Warlord of this tribe, a mighty");
    write(0,6,186,0,"Selachimorph known as Sark, can be found close");
    write(0,6,196,0,"to the border. He can be identified by three scars");
    write(0,6,206,0,"resembling gills on his neck.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"All you have to do is sneak by his guards and");
    write(0,6,156,0,"drop a fat blob of darkness on his ugly face kid.");
    write(0,6,166,0,"That'll show him! This might be the monumental");
    write(0,6,176,0,"moment, the moment when we finally gain means to");
    write(0,6,186,0,"strike back, to not be so desperately");
    write(0,6,196,0,"defenseless. The first fiery breath of the");
    write(0,6,206,0,"Evolutional Revolution!");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"...And hey, I realize all this might seem");
    write(0,6,156,0,"ridiculously dangerous but come on, you faced");
    write(0,6,166,0,"the Dark Mother and lived. I watched you the");
    write(0,6,176,0,"whole time. You can do this kid. If anyone can");
    write(0,6,186,0,"pull this off its you.");
    repeat frame; until(key(_enter) or key(_space))
  end

  TextBox(4); frame(700);
  write(0,6,126,0,"Yeah. Danger Smanger. I'm not afraid of");
  write(0,6,136,0,"anything. LETS RAWK!");

  write(0,6,156,0,"I've come this far, I don't see any reason not");
  write(0,6,166,0,"to see this through. ");

  write(0,6,186,0,"You gain cool stuff if you become an initiate");
  write(0,6,196,0,"right?");

  write(0,6,216,0,"Hey Lim... How come you always know all this");
  write(0,6,226,0,"stuff?");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That's the spirit! Go and show them what you're");
    write(0,6,156,0,"made of kid! Spread a little anarchy!");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yes, but this is merely the beginning. Take care");
    write(0,6,156,0,Name + ", I'll be watching your progress.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Better yet, we will make YOU cooler!");
    write(0,6,156,0,"Now go ignite the flames of resistance!");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Heh, lets just say that I've got a little friend");
    write(0,6,156,0,"called my astral self.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog10(3); return;
  end

  LimMemory=8; Quests=5;
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog9(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I'm serious, get to it!");
  write(0,6,156,0,"I really, REALLY need to concentrate right now!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end


process LimDialog8(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,Name + "! Nice to see you kiddo. And I sense that");
  write(0,6,156,0,"you've acquired the item we spoke of. That's more");
  write(0,6,166,0,"than I can say for myself... even though I have");
  write(0,6,176,0,"been trying to assist you in my own way...");
  write(0,6,186,0,"But that's another story.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"So... about the reward for this mission...");
  write(0,6,156,0,"well, it's actually a two-part mission so you'll");
  write(0,6,166,0,"have to wait a little more. You do get to keep the");
  write(0,6,176,0,"shell though; you're going to need it. The shell");
  write(0,6,186,0,"is actually something you require for the real");
  write(0,6,196,0,"mission I am about to give you, and this is the");
  write(0,6,206,0,"big one!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"What? That's not fair! I wanted stuff NOW!");

  write(0,6,166,0,"Well... I hope I'll get some real answers once");
  write(0,6,176,0,"I'm done with this one.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yes... Well deal with it. You're reward will be");
    write(0,6,156,0,"all the more great once you've completed the next");
    write(0,6,166,0,"mission. Anyway... let's get on with this.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"If you do this. I will tell you what this is");
  write(0,6,156,0,"all about. Well. On to the mission! I want you to");
  write(0,6,166,0,"go to the Deep Roads, the Abyssal Sea, and find");
  write(0,6,176,0,"something called a Dark Seed. I am not sure what");
  write(0,6,186,0,"you can do to accomplish this but I have heard");
  write(0,6,196,0,"about a small tribe of fish who live down there,");
  write(0,6,206,0,"maybe they can help you.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"The Deep roads are a really dangerous place and");
  write(0,6,156,0,"that's why you will need the Glowing Shell. In");
  write(0,6,166,0,"the Dark of the Deep, the light that those Krills");
  write(0,6,176,0,"can provide you with might just save your life.");
  write(0,6,186,0,"Blu can update you on some of the dangers that");
  write(0,6,196,0,"are down there, ask him about the Darkbringers.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Sorry to be this short with you but I have");
  write(0,6,156,0,"something I really need to concentrate on...");
  write(0,6,166,0,"So get to it! I'm really depending on ya");
  write(0,6,176,0,"this time kid.");
  repeat frame; until(key(_enter) or key(_space))

  LimMemory=7; RemoveDarkBlock=1; Quests=4;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog7(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey there kid. Sorry but since you don't seem");
  write(0,6,156,0,"to have the shell yet you must not disturb me,");
  write(0,6,166,0,"I need to focus deeply right now or I'll lose");
  write(0,6,176,0,"my concentration.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog6(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Yo. Have you decided to work for me again?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Yes.");

  write(0,6,166,0,"I'm still thinking.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
      write(0,6,146,0,"That's great! I need you to travel to the sunlit");
      write(0,6,156,0,"sea and find a place called the raceway, it");
      write(0,6,166,0,"shouldn't be too hard. My info tells me that a");
      write(0,6,176,0,"small gang of fish uses the area around that");
      write(0,6,186,0,"place to stage some kind of swimming");
      write(0,6,196,0,"competition. Apparently it can get a bit rough.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"This small gang of Racers has the Shell... find");
    write(0,6,156,0,"some way to get it. Good luck kid. Don't hesitate");
    write(0,6,166,0,"if you have to improvise to get the shell.");
    repeat frame; until(key(_enter) or key(_space))

    LimMemory=6; Quests=3;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Don't think too long kid or i'll just ask Blu to do");
    write(0,6,156,0,"it. I like you but if you want in on what we do it");
    write(0,6,166,0,"wouldn't hurt you to have a little more guts.");
    repeat frame; until(key(_enter) or key(_space))

    LimMemory=5;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process LimDialog5(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey " + Name + "... Good that you're back.");
  write(0,6,156,0,"I said that I would have more work for you,");
  write(0,6,166,0,"didn't I? Thing is... I just got some info that");
  write(0,6,176,0,"I would like to follow up upon but... I don't know.");
  write(0,6,186,0,"Can I really trust you with this, kid?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Hard to say when I don't know what you want me");
  write(0,6,136,0,"to do.");

  write(0,6,166,0,"Course you can Lim! I'm your friend!");

  write(0,6,206,0,"I think so; I proved my worth when I saved Blu");
  write(0,6,216,0,"from the Jellicons.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... Well, I guess I'll have to take a leap of");
    write(0,6,156,0,"faith and just tell you then...");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Friend?!! Well isn't that just precious.");
    write(0,6,156,0,"And here I thought I was an unlikeable guy.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I guess you did. Well let's get on to business");
    write(0,6,156,0,"then.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"The info I received concerns a special item that");
  write(0,6,156,0,"I want you to acquire. It's a sort of shell that");
  write(0,6,166,0,"attracts those Light-krill-thingies, maybe you've");
  write(0,6,176,0,"seen some of them up by the gateway? Me and Blu");
  write(0,6,186,0,"both agree that such a shell could help our cause");
  write(0,6,196,0,"greatly. Will you help us get this shell?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Yes, I will.");

  write(0,6,166,0,"No... I'll have to think about it.");

  write(0,6,206,0,"What do you need the shell for?");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
      write(0,6,146,0,"That's great! I need you to travel to the sunlit");
      write(0,6,156,0,"sea and find a place called the raceway, it");
      write(0,6,166,0,"shouldn't be too hard. My info tells me that a");
      write(0,6,176,0,"small gang of fish uses the area around that");
      write(0,6,186,0,"place to stage some kind of swimming");
      write(0,6,196,0,"competition. Apparently it can get a bit rough.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"This small gang of Racers has the Shell... find");
    write(0,6,156,0,"some way to get it. Good luck kid. Don't hesitate");
    write(0,6,166,0,"if you have to improvise to get the shell.");
    repeat frame; until(key(_enter) or key(_space))

    LimMemory=6; Quests=3;
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Don't think too long kid or i'll just ask Blu to do");
    write(0,6,156,0,"it. I like you but if you want in on what we do it");
    write(0,6,166,0,"wouldn't hurt you to have a little more guts.");
    repeat frame; until(key(_enter) or key(_space))

    LimMemory=5;
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Lets just say that I would like to shed some light");
    write(0,6,156,0,"on a certain matter that troubles me.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(2); frame(700);
    write(0,6,126,0,"Okay, I will help you.");

    write(0,6,166,0,"Hmm... I'll have to think about it.");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"That's great! I need you to travel to the sunlit");
      write(0,6,156,0,"sea and find a place called the raceway, it");
      write(0,6,166,0,"shouldn't be too hard. My info tells me that a");
      write(0,6,176,0,"small gang of fish uses the area around that");
      write(0,6,186,0,"place to stage some kind of swimming");
      write(0,6,196,0,"competition. Apparently it can get a bit rough.");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"This small gang of Racers has the Shell... find");
      write(0,6,156,0,"some way to get it. Good luck kid. Don't hesitate");
      write(0,6,166,0,"if you have to improvise to get the shell.");
      repeat frame; until(key(_enter) or key(_space))

      LimMemory=6; Quests=3;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Don't think too long kid or i'll just ask Blu to do");
      write(0,6,156,0,"it. I like you but if you want in on what we do it");
      write(0,6,166,0,"wouldn't hurt you to have a little more guts.");
      repeat frame; until(key(_enter) or key(_space))

      LimMemory=5;
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog4(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"You made it kid, good for you. Sure got me and");
  write(0,6,156,0,"Blu out of a sticky situation. And we even");
  write(0,6,166,0,"managed to get our hands on a piece of Gelatinum");
  write(0,6,176,0,"ore!  Who would have imagined. Those Jellicons");
  write(0,6,186,0,"sure are stingy when it comes to the very thing");
  write(0,6,196,0,"that gives birth to new members of their species.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"But don't worry. Theres no way they'll bear a");
  write(0,6,156,0,"grudge against you, Jellicons just don't work like");
  write(0,6,166,0,"that. Aint wired like you and me... or... for");
  write(0,6,176,0,"instance, quite a few Badfish.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"You never mentioned any Jellicons before.");
  write(0,6,136,0,"I thought you didn't know where Blu was...");

  write(0,6,166,0,"Yes, yes. Anyway, I was thinking about that");
  write(0,6,176,0,"reward you promised me...");

  write(0,6,206,0,"Yeah I did! Those Jellicons didn't have a chance!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... Well, Blu told me all about it when he");
    write(0,6,156,0,"returned. But... I might have had a clue or two");
    write(0,6,166,0,"about his actual location. But don't mind that,");
    write(0,6,176,0,"it's not really important. So anyway, you want");
    write(0,6,186,0,"that reward or what?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"Come on, I can tell that your hold-");

    write(0,6,166,0,"YES. BRING IT ON!");

    write(0,6,206,0,"We'll have to speak more about this la-");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==1 or Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yes you sure did! And now its time for...");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"BARAPBARABAAAA. Oh yes! It's! The! Reward!");
  write(0,6,156,0,"Don't be blinded now kid...");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh yes! It's a Super Spip! Use it and it will");
  write(0,6,156,0,"enhance your innate powers. These are really");
  write(0,6,166,0,"rare you know!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Thanks! This is great! Just one more thing");
  write(0,6,136,0,"though. You said that you would tell me about");
  write(0,6,146,0,"my father.");

  write(0,6,166,0,"Hmpf. That's okay I guess. Well, you said that");
  write(0,6,176,0,"you would tell me about my father too.");
  write(0,6,186,0,"Time to fess up.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Yes... I did say that. But first I'd like to ask");
  write(0,6,156,0,"you a question. Your daddy couldn't have been");
  write(0,6,166,0,"home that much while you were younger kid. And");
  write(0,6,176,0,"I'm guessing you don't see him that much");
  write(0,6,186,0,"nowadays either. Probably even less than before.");
  write(0,6,196,0,"So, from those few glimpses you have gotten of");
  write(0,6,206,0,"him, what impression has he given you?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"... I've always felt that he is a cold and");
  write(0,6,136,0,"distant person.");

  write(0,6,166,0,"While I haven't spent that much time with him,");
  write(0,6,176,0,"he has always been kind and loving.");

  write(0,6,206,0,"He seems... strong... While he doesn't say much");
  write(0,6,216,0,"his presence is like a great protecting wall.");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1) DadImpression=1; end
  if (Selection==2) DadImpression=2; end
  if (Selection==3) DadImpression=3; end


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Yes... I can see why you would feel that way. I");
  write(0,6,156,0,"can't tell you everything at once but I can say");
  write(0,6,166,0,"this. Your father is involved in a... sort of hidden");
  write(0,6,176,0,"guild. I don't know if you have heard anything");
  write(0,6,186,0,"about the Great Sphere City, but it is quite");
  write(0,6,196,0,"unlike any of the small reefs around here. It is...");
  write(0,6,206,0,"simply marvelous in many ways. Frighteningly");
  write(0,6,216,0,"cold in others. But that's not my point.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Life in the city pretty much revolves around a");
  write(0,6,156,0,"number of guilds, all regulated by the");
  write(0,6,166,0,"Triumvirate, the governing body of all life in and");
  write(0,6,176,0,"around the city and even this reef and the one");
  write(0,6,186,0,"you came from. There are many ordinary guilds");
  write(0,6,196,0,"and some... hidden guilds. Secret guilds.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Your father belongs to one of those, and me and");
  write(0,6,156,0,"Blu... well we are affiliated to a hidden guild.");
  write(0,6,166,0,"That's all I can say for now. If you work more");
  write(0,6,176,0,"for us, maybe I'll decide that you're trustworthy");
  write(0,6,186,0,"and then I can tell you more.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Whoa. What kind of business are you involved in");
  write(0,6,136,0,"really?");

  write(0,6,166,0,"It all sounds... very interesting. You'll have to");
  write(0,6,176,0,"tell me more once I've 'earned your trust'");

  write(0,6,206,0,"I don't know what to think about all this...");
  write(0,6,216,0,"I think I need some time to think.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Well... I can't really tell you... yet. For your");
    write(0,6,156,0,"own good. But continue working for me and I will");
    write(0,6,166,0,"eventually tell you. For now though, enjoy your");
    write(0,6,176,0,"prize. Take a swim around the reef. Relax for a");
    write(0,6,186,0,"moment. Speak to Blu and when you feel like it");
    write(0,6,196,0,"you can return to me and I have some more... work");
    write(0,6,206,0,"for you. Something really interesting.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I'm glad you think so. You seem like... an");
    write(0,6,156,0,"interesting fellow. I have more work for you to");
    write(0,6,166,0,"do, but before we get to it... Relax for a bit. Take");
    write(0,6,176,0,"a swim around the reef and explore. I don't know.");
    write(0,6,186,0,"Do whatever you want. When you feel like it,");
    write(0,6,196,0,"return to me and I have more work for you.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I understand how it can all feel like a bit...");
    write(0,6,156,0,"much. Take your time kid. When you feel like it;");
    write(0,6,166,0,"talk to me and I might have some more work for");
    write(0,6,176,0,"you. Such work will of course lead to new");
    write(0,6,186,0,"answers. Swim easy kid!");
    repeat frame; until(key(_enter) or key(_space))
  end

  LimMemory=4; BluMemory=5; AbilityMessage();

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BluDialog6(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Whaddap " + Name + "? I see you've spoken to Lim.");
    write(0,6,156,0,"I think this might be the beginning of a long and");
    write(0,6,166,0,"fruitful partnership. So yeah, now that you're a");
    write(0,6,176,0,"bit more 'in the know' maybe I can tell you a bit");
    write(0,6,186,0,"about myself. My full name is Professor Blu the");
    write(0,6,196,0,"Chameleonfish. Bet you thought it was cool when");
    write(0,6,206,0,"I disappeared like that! Yeah... I like to impress.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Anyway, before I got so unfortunately confined I");
    write(0,6,156,0,"was studying the Jellicons! Oh man, there sure");
    write(0,6,166,0,"are some weird fish in these waters.");
    write(0,6,176,0,"But that's what makes them wonderful, don't you");
    write(0,6,186,0,"think?");
    repeat frame; until(key(_enter) or key(_space))
    BluMemory=6;
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Whaddap " + Name + "? Want to hear more about");
    write(0,6,156,0,"the creatures of the sea? I'll gladly tell you");
    write(0,6,166,0,"more of my stories.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(4); frame(700);
  write(0,6,126,0,"I see. Mind telling me more about those");
  write(0,6,136,0,"Jellicons?");

  write(0,6,156,0,"What other strange creatures can you find in");
  write(0,6,166,0,"these waters?");

  write(0,6,186,0,"So you're a chameleonfish? How does that work?");

  write(0,6,216,0,"Keep it floating Blu!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Sure thang! Jellicons are real weird creatures.");
    write(0,6,156,0,"They don't work like you or me! Instead they are");
    write(0,6,166,0,"connected to each other in some strange way.");
    write(0,6,176,0,"They each have a small mind but form a much");
    write(0,6,186,0,"larger one together, a sort of");
    write(0,6,196,0,"hive-consciousness.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Now one really understands what the heck the");
    write(0,6,156,0,"Jellicons are up to most of the time but they");
    write(0,6,166,0,"seem to be attracted to the mineral Gelatinum");
    write(0,6,176,0,"which they use for pretty much everything.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh the wonders I have seen! Man, when you can");
    write(0,6,156,0,"turn invisible the world just opens up for you.");
    write(0,6,166,0,"Anyway. We seem to have quite a lot of");
    write(0,6,176,0,"creatures around here. Spipreef is like a central");
    write(0,6,186,0,"hub for the most varied forms of life around");
    write(0,6,196,0,"these waters. So, I've seen Darkbringers, Black");
    write(0,6,206,0,"Swallowers, Red Lurkflowers and Octolings.");
    write(0,6,216,0,"What would you like to know about?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(4); frame(700);
    write(0,6,126,0,"Darkbringers.");

    write(0,6,156,0,"Black Swallowers.");

    write(0,6,186,0,"Red Lurkflowers.");

    write(0,6,216,0,"Octolings.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(0,0,180));
      write(0,6,126,0,"Blu");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"The darkbringers are a strange and frightening");
      write(0,6,156,0,"breed of fish man. They seem to hail from the");
      write(0,6,166,0,"deepest parts of the sea, where there are barely");
      write(0,6,176,0,"any light-producing plankton, and use an ability");
      write(0,6,186,0,"called biotenebraeum to bring forth natural");
      write(0,6,196,0,"darkness.");
      repeat frame; until(key(_enter) or key(_space))

      TextBox(0); frame(700);
      set_text_color(rgb(0,0,180));
      write(0,6,126,0,"Blu");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"It is not entirely unlike the counterpart-ability");
      write(0,6,156,0,"that some of The Fish have, bioluminescence,");
      write(0,6,166,0,"which creates light. The darkbringers are");
      write(0,6,176,0,"territorial and often stick to a single nest or");
      write(0,6,186,0,"area in which they await bypassing prey.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end


    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(0,0,180));
      write(0,6,126,0,"Blu");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"The black Swallower is a real wicked creature.");
      write(0,6,156,0,"Saw one myself once, but that was a long time");
      write(0,6,166,0,"ago. No one can really describe what a black");
      write(0,6,176,0,"swallower looks like, but if I say that it's");
      write(0,6,186,0,"like its mouth is a huge cave with a maelstrom in");
      write(0,6,196,0,"it that sucks in EVERYTHING then maybe you get");
      write(0,6,206,0,"some idea. It's one of the most dangerous");
      write(0,6,216,0,"badfish in the sea but luckily there seems to");
      write(0,6,226,0,"be few of them left nowadays.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end


    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(0,0,180));
      write(0,6,126,0,"Blu");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"The Red Lurkflower is a devious kind of algae.");
      write(0,6,156,0,"It usually hides among other sorts of plant-life");
      write(0,6,166,0,"and waits for a target to swim by. Once a target");
      write(0,6,176,0,"is close enough it releases a cloud of poisonous");
      write(0,6,186,0,"spores that attach themselves to the target.");
      write(0,6,196,0,"Once the spores have begun doing their job,");
      write(0,6,206,0,"well, the Lurkflower begins to feast.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end


    if (Selection==4)
      TextBox(0); frame(700);
      set_text_color(rgb(0,0,180));
      write(0,6,126,0,"Blu");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Octolings! Stupid Octolings! They might be cute");
      write(0,6,156,0,"but don't be fooled! The will spit acid on you!");
      write(0,6,166,0,"For some reason Octolings dislike everything");
      write(0,6,176,0,"and when they dislike something they spit acid");
      write(0,6,186,0,"at it!");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That's a secret! Naw man, it's all part of my");
    write(0,6,156,0,"natural abilities. Once you learn to hide you");
    write(0,6,166,0,"soon learn how to blend in.");
    repeat frame; until(key(_enter) or key(_space))
  end


  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BluDialog5(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Good to see you made it back man!");
  write(0,6,156,0,"Now talk to Lim. You and I can have words after");
  write(0,6,166,0,"you've spoken to him.");
  write(0,6,176,0,"Mmhmmmm. These Spips suuure taste good.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BluDialog4(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ouhaaaa. That was freaky. For a moment there...");
  write(0,6,156,0,"I could feel the Gelatinum pulling at my body,");
  write(0,6,166,0,"trying to... change it. Apparently you can");
  write(0,6,176,0,"withstand its effects if you focus though. Well,");
  write(0,6,186,0,"that pretty much both prove that our theory is");
  write(0,6,196,0,"right and... makes it worthless.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Enough about this! I'll find my way back " + Name + "");
  write(0,6,156,0,"so no worries. And I'll hold on to that piece of ore");
  write(0,6,166,0,"if you don't mind! See you back at the reef!");


  TextBox(2); frame(700);
  write(0,6,126,0,"Wai-");

  write(0,6,166,0,"Wha-");
  repeat frame; until(key(_enter) or key(_space))

  GelatinumItem=0;
  BluMemory=3;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GlibDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(150,0,0));
  write(0,6,126,0,"Glib");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I don't know how you did it... but you must have");
  write(0,6,156,0,"cheated somehow. Do not think this will go");
  write(0,6,166,0,"unpunished you false champion. I'll get you...");
  write(0,6,176,0,"sooner or later.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GlibDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(150,0,0));
  write(0,6,126,0,"Glib");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"There's no one faster than me. I am the champion");
  write(0,6,156,0,"of the Sunlit Sea. Want to know how I've gotten");
  write(0,6,166,0,"so fast? Well, I use a secret method of training.");
  write(0,6,176,0,"If you train yourself hard enough maybe you'll");
  write(0,6,186,0,"be able to face me on the track some day.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Cocky bastard eh? Well I'll see you on the");
  write(0,6,136,0,"racetrack soon enough!");

  write(0,6,166,0,"SECTRET TRAINING? That's awesome.");
  write(0,6,176,0,"Come on! Tell me all about it!");

  write(0,6,206,0,"Yeah whatever. Goodbye! ");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(150,0,0));
    write(0,6,126,0,"Glib");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I see. Well it seems like you at least have the");
    write(0,6,156,0,"right spirit. That's important. Lets see if that");
    write(0,6,166,0,"spirit of yours will pull you through on the");
    write(0,6,176,0,"racetrack.");
    repeat frame; until(key(_enter) or key(_space))
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(150,0,0));
    write(0,6,126,0,"Glib");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... I don't want to give away my secret");
    write(0,6,156,0,"but lets just say that I do the same kind of");
    write(0,6,166,0,"training that Eldas father used to do. Now off");
    write(0,6,176,0,"you go. You still have a long way before you");
    write(0,6,186,0,"are a match to me.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process ZipDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(50,0,240));
    write(0,6,126,0,"Zip");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Whoa... my head seems... clearer for some reason.");
    write(0,6,156,0,"Congratz on your victory " + Name + "!");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end


process ZipDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(50,0,240));
    write(0,6,126,0,"Zip");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yo man. Racings the game and Zip is my name!");
    write(0,6,156,0,"Yeah that's right, I am the glorious Zip.");
    write(0,6,166,0,"Zip the Speedy. And don't anyone dare argue or");
    write(0,6,176,0,"I might get upset! You would not like me when");
    write(0,6,186,0,"I'm upset!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(50,0,240));
    write(0,6,126,0,"Zip");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey, Im the fastest! What else do you want");
    write(0,6,156,0,"toooooo.... OOOOH... WOoooooaaah.");
    write(0,6,166,0,"Whaaats goooing one. SZKRT ZIP ZIP. I... ");
    write(0,6,176,0,"CANNOT... CONTROL.. WHAT... IS ... hAPPENING?!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(50,0,240));
    write(0,6,126,0,"Zip");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I... Yes. I need to become the champion!");
    write(0,6,156,0,"I need to acquire the Glowing shell!");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BurlDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Damn, those were some pretty good moves.");
    write(0,6,156,0,"I wouldn't have thought you of all fish would");
    write(0,6,166,0,"teach me a couple of things...");
    write(0,6,176,0,"Maybe I'm to old for this. Maybe it's finally");
    write(0,6,186,0,"time to realize that I am growing old...");
    write(0,6,196,0,"Maybe its time to settle down.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BurlDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey Stranger. You here for the Races? Lemme");
    write(0,6,156,0,"give you a tip guy; its not all about speed.");
    write(0,6,166,0,"I am not the fastest lad in the sea but sure as");
    write(0,6,176,0,"Spips is the damned tastiest stuff in the sea I");
    write(0,6,186,0,"win quite a few times. Muscle counts, and there");
    write(0,6,196,0,"are a lot of tricks you can pull.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"We who live here by the Racetrack have formed");
    write(0,6,156,0,"an odd sort of family over the years. Yeah, we");
    write(0,6,166,0,"are rough on each other but we live here. We");
    write(0,6,176,0,"eat together. You can't help but to get to know");
    write(0,6,186,0,"someone that you share your time with.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I like the races but that's not the only reason I");
    write(0,6,156,0,"live here. The sunlit sea is beautiful. The light");
    write(0,6,166,0,"from that great yellow orb up there finds its way");
    write(0,6,176,0,"down here and is wonderful. Down there in the");
    write(0,6,186,0,"mesopelagic it's so gloomy. I know there are all");
    write(0,6,196,0,"sorts of light-krill, and some plankton too I");
    write(0,6,206,0,"guess, but it just cannot compare to the pleasant");
    write(0,6,216,0,"heat of the great orb!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==3)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"One time I saw that one of the grey ones had");
    write(0,6,156,0,"strayed into these waters. I thought they");
    write(0,6,166,0,"usually stayed away but this one... I don't know");
    write(0,6,176,0,"what he was doing here but he used stared at me...");
    write(0,6,186,0,"hungrily... I am quite a tough fish but that");
    write(0,6,196,0,"scared me half into a ghost-fish.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==4)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Did you hear about Eldas father? He used to be");
    write(0,6,156,0,"the big man around here; we all came because we");
    write(0,6,166,0,"heard his call. Then one day he disappears, dies");
    write(0,6,176,0,"off somewhere. The races just aren't the same");
    write(0,6,186,0,"nowadays.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==5)
    TextBox(0); frame(700);
    set_text_color(rgb(90,0,240));
    write(0,6,126,0,"Burl");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Sometimes I dream about swimming into dark");
    write(0,6,156,0,"unknown waters and finding myself a nice old");
    write(0,6,166,0,"fish-lady to settle down with... But I know that");
    write(0,6,176,0,"such a thing won't happen, ever. Some of us are");
    write(0,6,186,0,"just not made to find love...");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process JudgeDialog5(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Judge");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh, are you back for a new race?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Yes, bring it on!");

  write(0,6,166,0,"No... not right now.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Good. Then let the race begin!");
    repeat frame; until(key(_enter) or key(_space))
    Race(500,480,1);
    frame(300);
  end


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"As you wish. Come back if you ever want");
    write(0,6,156,0,"to race. The race-fishes will be waiting.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process JudgeDialog4(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Judge");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Congratulations! Who would have thought an");
  write(0,6,156,0,"outsider like you would win the whole thing?");
  write(0,6,166,0,"Anyway, the prize is yours! You deserved it!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process JudgeDialog3(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Judge");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Well, you didn't win this time. But perhaps");
  write(0,6,156,0,"you want to give it another try? I am sure");
  write(0,6,166,0,"the race-fishes won't mind another go.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Yes, this time I'll win!");

  write(0,6,166,0,"Not right now. I might come back later.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Good. Then let the race begin!");
    repeat frame; until(key(_enter) or key(_space))
    Race(500,480,1);
    frame(300);
  end


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"As you wish. Come back when you are ready.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process JudgeDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,180,180));
  write(0,6,126,0,"Judge");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"So you are ready to race now?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Yes, bring it on!");

  write(0,6,166,0,"No... I still need to prepare a bit.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Good. Then let the race begin!");
    repeat frame; until(key(_enter) or key(_space))
    Race(500,480,1);
    frame(300);
  end


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"As you wish. Come back when you are ready.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process JudgeDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hello fishling. I am Judge, and I handle these");
    write(0,6,156,0,"races to make sure everything is handled correct.");
    write(0,6,166,0,"You want to participate in the race perhaps?");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"So, fishling. Have you changed your mind and");
    write(0,6,156,0,"want to participate in the race now?");
    repeat frame; until(key(_enter) or key(_space))
  end

  TextBox(2); frame(700);
  write(0,6,126,0,"Yes, I do!");

  write(0,6,166,0,"No... I don't think so.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Great to hear! We could use some new participants");
    write(0,6,156,0,"to stir up things around here.");
    write(0,6,166,0,"There is still some time before the race starts.");
    write(0,6,176,0,"Come back to me when you are ready to start!");
    repeat frame; until(key(_enter) or key(_space))
    JudgeMemory=2;
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,180,180));
    write(0,6,126,0,"Judge");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That is unfortunate. But if you should change");
    write(0,6,156,0,"your mind I will still be here.");
    repeat frame; until(key(_enter) or key(_space))
    JudgeMemory=1;
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FlammaDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Flamma");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"I'm Eldas sister and I'm in charge of guarding");
  write(0,6,156,0,"our great prize: The glowing shell! This shell");
  write(0,6,166,0,"once belonged to daddy so its real precious to");
  write(0,6,176,0,"us. Elda used to be the champion but Glib stole");
  write(0,6,186,0,"that title from her pretty quickly. If you become");
  write(0,6,196,0,"the champion it will be your turn to bask in the");
  write(0,6,206,0,"glory of the shell!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FlammaDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Flamma");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Whoa. That was AW-SO-ME.");
  write(0,6,156,0,"I've never seen moves like that. Youre a natural,");
  write(0,6,166,0,"aren't you? The glowing shell is yours.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process EldaDialog4(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Elda");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hmpf. You were pretty good out there. It's");
  write(0,6,156,0,"unbelievable when you think about it...");
  write(0,6,166,0,"you've been here for... how long? And now you're");
  write(0,6,176,0,"the freaking champion! Well... You sure showed");
  write(0,6,186,0,"Glib that he isn't the only fish in the pound...");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Elda");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hmpf. Yes, you were great out there...");
  write(0,6,156,0,"You reminded me of how Brand used to swim...");
  write(0,6,166,0,"Maybe you and I could hang out... more privately");
  write(0,6,176,0,"some time... But not now. Just take your prize and");
  write(0,6,186,0,"go... I'll look for you someday to reclaim that");
  write(0,6,196,0,"prize... And perhaps give you another one.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process EldaDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Elda");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"You should talk to Judge if you decide that you");
  write(0,6,156,0,"want to race after all.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process EldaDialog3(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"So we speak again. I don't really know you");
    write(0,6,156,0,"stranger, but we do not get a lot of visitors");
    write(0,6,166,0,"out here so if you want anything, just ask away.");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(3); frame(700);
  write(0,6,126,0,"I was wondering if you could tell me more about");
  write(0,6,136,0,"Brand.");

  write(0,6,166,0,"This glowing shell... it wouldn't be a shell");
  write(0,6,176,0,"that attracted Light-krill-thingies, would it?");

  write(0,6,206,0,"Never mind, take care Elda.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Asking about my dead old man eh? You sure are");
    write(0,6,156,0,"a sensitive guy. Well, I'm not too fuzzy about");
    write(0,6,166,0,"it, at least not anymore... Brand was a...");
    write(0,6,176,0,"great person... not always a great father.");
    write(0,6,186,0,"He used to travel a lot I guess, but that's");
    write(0,6,196,0,"what eventually led him to discover this place.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Originally me, him and Flamma came from");
    write(0,6,156,0,"Murky Reef, to the far east, but when he found");
    write(0,6,166,0,"this place, we moved here instantly...");
    write(0,6,176,0,"That was quite a few years ago now.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(3); frame(700);
    write(0,6,126,0,"So how did he really die?");
    write(0,6,136,0,"Come on, you can tell me.");

    write(0,6,166,0,"Murky reef you say? How was life there?");

    write(0,6,206,0,"There was another question I wanted to ask you...");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(210,0,210));
      write(0,6,126,0,"Elda");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Now you're really pushing it. Well... he was");
      write(0,6,156,0,"eaten by something and that something left");
      write(0,6,166,0,"his corpse right by our doorstep, like some kind");
      write(0,6,176,0,"of message. We got the message:");
      write(0,6,186,0,"'don't go to the west'.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); EldaDialog3(1); return;
    end

    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(210,0,210));
      write(0,6,126,0,"Elda");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Quite different from life here, or in Spipreef");
      write(0,6,156,0,"for that matter. Murky reef is much more...");
      write(0,6,166,0,"controlled. We couldn't just do whatever we");
      write(0,6,176,0,"pleased or talk to whomever we wanted to. There");
      write(0,6,186,0,"weren't an abundance of spips either so we");
      write(0,6,196,0,"mostly ate plankton. I didn't really like it");
      write(0,6,206,0,"there so I did not mind that we moved.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); EldaDialog3(1); return;
    end

    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(210,0,210));
      write(0,6,126,0,"Elda");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yeah?");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); EldaDialog3(1); return;
    end
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Light-krill-thingies? What ARE you talking about?!");
    write(0,6,156,0,"It's a shell that my dad found. It glows in the");
    write(0,6,166,0,"dark, it seems to have some kind of light-source,");
    write(0,6,176,0,"but sometimes it doesn't work...");
    write(0,6,186,0,"Don't know why, but it's still awesome.");
    repeat frame; until(key(_enter) or key(_space))
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); EldaDialog3(1); return;
  end

  EldaMemory=1;
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process EldaDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Elda");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hello there fishling. It's rare to see anyone");
  write(0,6,156,0,"venturing here to the Sunlit Sea, even though");
  write(0,6,166,0,"it is the most beautiful part of this area if");
  write(0,6,176,0,"you ask me. Most people think it's too dangerous");
  write(0,6,186,0,"out here I guess, although, as you can see, some");
  write(0,6,196,0,"of us actually choose to live here.");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(210,0,210));
  write(0,6,126,0,"Elda");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Well as long as you don't stray too far to the");
  write(0,6,156,0,"west I guess you'll be fine...");
  write(0,6,166,0,"So, you gonna participate in the races?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Yes, I want to be in the Races!");
  write(0,6,136,0,"Could you tell me about the racetrack?");

  write(0,6,166,0,"Yes but... what's so dangerous about the west?");

  write(0,6,206,0,"No... I don't think so.");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"My father Brand was the one who discovered it");
    write(0,6,156,0,"and knew what potential it held. He always had");
    write(0,6,166,0,"a passion for fast-paced racing. Apparently his");
    write(0,6,176,0,"father used to race with his grandfather in the");
    write(0,6,186,0,"old days. That might seem a bit strange to you");
    write(0,6,196,0,"but we have always been a long lived family,");
    write(0,6,206,0,"to think that members of my line that can");
    write(0,6,216,0,"actually be remembered lived before the time of");
    write(0,6,226,0,"Safe Spheres is quite amazing.");
    repeat frame; until(key(_enter) or key(_space))  

    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Anyway, we race here. If you want to participate");
    write(0,6,156,0,"in the next race talk to Judge. If you get in first");
    write(0,6,166,0,"place after three laps... well then you've earned");
    write(0,6,176,0,"the title of champion and get to bask in the glory");
    write(0,6,186,0,"of our great prize: The glowing shell.");
    write(0,6,196,0,"See you around, and be prepared to get smashed");
    write(0,6,206,0,"on the Racetrack!");
    repeat frame; until(key(_enter) or key(_space))  
    EldaMemory=2;
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"My father Brand asked himself that question once.");
    write(0,6,156,0,"Now he is dead. Don't ask, don't go there.");
    write(0,6,166,0,"I don't know why it's so dangerous; I just know");
    write(0,6,176,0,"that if you go there you die.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Anyway, we race here. If you want to participate");
    write(0,6,156,0,"in the next race talk to Judge. If you get in first");
    write(0,6,166,0,"place after three laps... well then you've earned");
    write(0,6,176,0,"the title of champion and get to bask in the glory");
    write(0,6,186,0,"of our great prize: The glowing shell.");
    write(0,6,196,0,"See you around, and be prepared to get smashed");
    write(0,6,206,0,"on the Racetrack!");
    repeat frame; until(key(_enter) or key(_space)) 
    EldaMemory=2;
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(210,0,210));
    write(0,6,126,0,"Elda");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Too bad, you look like you have what it takes...");
    write(0,6,156,0,"Talk to Judge if you change your mind, he");
    write(0,6,166,0,"organizes the races.");
    repeat frame; until(key(_enter) or key(_space))
    EldaMemory=1;
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FannDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(240,170,0));
  write(0,6,126,0,"Fann");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Whoa! Who ARE you?!! You here for the races??!!");
  write(0,6,156,0,"Just go down the passage below me and you'll");
  write(0,6,166,0,"find the raceway. The races are so exciting,");
  write(0,6,176,0,"I can hardly contain myself!!!");
  repeat frame; until(key(_enter) or key(_space))
  
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process FannDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(240,170,0));
  write(0,6,126,0,"Fann");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"WHOA! IT'S THE CHAMPION.");
  write(0,6,156,0,"ALL HAIL THE CHAMPION!");
  repeat frame; until(key(_enter) or key(_space))
  
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process BluDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"My main fishling! You find any ore yet?");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,Name);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"No... not yet. But I'm working on it.");
  write(0,6,156,0,"See you soon Blu!");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process BluDialog3(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"My main fishling! You find any ore yet?");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,Name);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Yes, here it is.");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Great! Now let it touch my cage...");
  write(0,6,156,0,"Stand close to the cage and use it like");
  write(0,6,166,0,"you would any item.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process BluDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey, yo! Yeah you! Whatcha doing here boyo?");
  write(0,6,156,0,"Wait! Never mind! I need me some help!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Mr. Blu, I presume? I know, Lim sent me to");
  write(0,6,136,0,"find you.");

  write(0,6,166,0,"I'm here to rescue you from danger!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"So Lim sent you! My man! Boy, am I glad to see");
  write(0,6,156,0,"you. When those Jellicons got me, I thought I");
  write(0,6,166,0,"was finished for good. I've heard all kinds of");
  write(0,6,176,0,"things about what they can do to you, I dunno");
  write(0,6,186,0,"why the decided to keep me here.");
  write(0,6,196,0,"Anyway, you gots to get me out!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"I'll get you out. I don't know what to do");
  write(0,6,136,0,"though; I can't seem to do anything about");
  write(0,6,146,0,"this strange cage.");

  write(0,6,166,0,"But I can't do it! This cage is like the");
  write(0,6,176,0,"Jellicons! It just wobbles when I touch it!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Damn... Hmmm, I think I have an idea. If you");
  write(0,6,156,0,"could find a piece of Gelatinum Ore, I'm sure");
  write(0,6,166,0,"its morphing abilities will destabilize this");
  write(0,6,176,0,"cage and then maybe I could get out.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Morphing, destabilize?");
  write(0,6,136,0,"What ARE you talking about!?");

  write(0,6,166,0,"So, where can I get such a piece?");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah... you see... we figured out that these");
    write(0,6,156,0,"Jellicons use a special sort of stone to...");
    write(0,6,166,0,"I dunno... make copies of themselves.");
    write(0,6,176,0,"It's how they breed.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Gelatinum seems to have some kind of ability");
    write(0,6,156,0,"to change stuff, I don't really understand it");
    write(0,6,166,0,"enough to explain it to you but this cage was");
    write(0,6,176,0,"probably formed by shaping Gelatinum, some");
    write(0,6,186,0,"more of it should make it... dissolve... or");
    write(0,6,196,0,"change shape.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"So, where can I get such a piece?");
    repeat frame; until(key(_enter) or key(_space))
  end


  TextBox(0); frame(700);
  set_text_color(rgb(0,0,180));
  write(0,6,126,0,"Blu");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"If you can get past the Jellicons under us you");
  write(0,6,156,0,"should find the place where the Jellicons");
  write(0,6,166,0,"process the Gelatinum into a form they can use.");
  write(0,6,176,0,"If you go even further you should find a raw");
  write(0,6,186,0,"source of Gelatinum, we need a piece of raw ore.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Okay then, I'll find a piece of ore and then");
  write(0,6,136,0,"I'll get you out.");

  write(0,6,166,0,"I'm off, but this is more trouble than I");
  write(0,6,176,0,"previously anticipated. The reward better");
  write(0,6,186,0,"reflect that.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"My man! Thanks, but you better hurry.");
    write(0,6,156,0,"I'm getting hungry in here and bypassing");
    write(0,6,166,0,"krill just don't cut it!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,0,180));
    write(0,6,126,0,"Blu");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"A reward you say? Yeah I'll talk to Lim");
    write(0,6,156,0,"about it. But you better hurry. I'm");
    write(0,6,166,0,"getting hungry in here and bypassing");
    write(0,6,176,0,"Plankton just don't cut it!");
    repeat frame; until(key(_enter) or key(_space))
  end

  BluMemory=1;
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process LimDialog3(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey there. Since I don't see Blu I'm guessing");
  write(0,6,156,0,"you haven't found him yet. Just get to it");
  write(0,6,166,0,"okay? I'm trying to focus here.");
  repeat frame; until(key(_enter) or key(_space))



  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"You again? You changed your mind?");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(2); frame(700);
  write(0,6,126,0,"Yes, i'll work for you.");

  write(0,6,166,0,"I don't know yet...");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1) frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); LimDialog(1); return; end
  if (Selection==2) LimMemory=1; end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process LimDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey... you remind me of someone...");
    write(0,6,156,0,"Aren't you... hm, what was it? " + Name +"?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(4); frame(700);
    write(0,6,126,0,"Yeah, that's me.");

    write(0,6,156,0,"No, you must be thinking of somebody else.");

    write(0,6,186,0,"...");

    write(0,6,216,0,"I won't give you my name unless you give me");
    write(0,6,226,0,"yours good sir.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Hey, I knew it was you!");
      write(0,6,156,0,"I'm an... associate of your father.");
      write(0,6,166,0,"The names Lim. Hey, stay still for a moment,");
      write(0,6,176,0,"let me get a good look of you...");
      repeat frame; until(key(_enter) or key(_space))
    end

    if (Selection==2 or Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Aw, come on! Don't be like that,");
      write(0,6,156,0,"I KNOW it is you.");
      write(0,6,166,0,"I'm an... associate of your father.");
      write(0,6,176,0,"The names Lim. Hey, stay still for a moment,");
      write(0,6,186,0,"let me get a good look of you...");
      repeat frame; until(key(_enter) or key(_space))
    end

    if (Selection==4)
      TextBox(0); frame(700);
      set_text_color(rgb(180,0,180));
      write(0,6,126,0,"Lim");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I'm an... associate of your father.");
      write(0,6,156,0,"The names Lim. Hey, stay still for a moment,");
      write(0,6,166,0,"let me get a good look of you...");
      repeat frame; until(key(_enter) or key(_space))
    end


    TextBox(3); frame(700);
    write(0,6,126,0,"Wha -");

    write(0,6,166,0,"Why -");

    write(0,6,206,0,"He -");
    repeat frame; until(key(_enter) or key(_space))

  end

  TextBox(0); frame(700);
  set_text_color(rgb(180,0,180));
  write(0,6,126,0,"Lim");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Yeah, you look pretty competent.");
  write(0,6,156,0,"You probably know this area too. See, thing is,");
  write(0,6,166,0,"a friend of mine seems to have gotten lost around");
  write(0,6,176,0,"these parts. It's a guy named Blu. I've been");
  write(0,6,186,0,"asking around but people seem to dislike me for");
  write(0,6,196,0,"some strange reason. Maybe I'm just not a");
  write(0,6,206,0,"likeable guy. Anyway if you could find Blu, it");
  write(0,6,216,0,"would sure be helpful.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(4); frame(700);
  write(0,6,126,0,"Wait just a minute will you? You know my dad?");

  write(0,6,156,0,"Yeah, I could help you, but there better be");
  write(0,6,166,0,"something for me in it.");

  write(0,6,186,0,"This all seems a bit sudden,");
  write(0,6,196,0,"why should I help you?");

  write(0,6,216,0,"Mysterious guy asking me for help making vague");
  write(0,6,226,0,"references to my father? I'm ALL for that.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah I know him. See, me and Blu, we come from");
    write(0,6,156,0,"Great Sphere City. Met him there, related to");
    write(0,6,166,0,"his... work see. He is quite a big shot.");
    write(0,6,176,0,"But I cannot tell you any more. You probably");
    write(0,6,186,0,"must have guessed that there's some good");
    write(0,6,196,0,"reason why he almost never leaves the city.");
    write(0,6,206,0,"Maybe... if you do this...");
    write(0,6,216,0,"I could tell you a little about him.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Straight to the point. I like that.");
    write(0,6,156,0,"Of course you wouldn't be working for free.");
    write(0,6,166,0,"I'll make sure its worth your while.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Straight to the point. I like that.");
    write(0,6,156,0,"Of course you wouldn't be working for free.");
    write(0,6,166,0,"I'll make sure its worth your while.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You... you are a pretty funny kid aren't you?");
    write(0,6,156,0,"I can't tell if you're being serious or if");
    write(0,6,166,0,"you're pulling my fins. But yeah, find Blu and");
    write(0,6,176,0,"i'll make sure you get something good for it.");
    write(0,6,186,0,"Best thing to do is probably just to ask around.");
    write(0,6,196,0,"That old geezer Folder probably knows");
    write(0,6,206,0,"something.");
    repeat frame; until(key(_enter) or key(_space))
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Good luck kid. Talk to me again when you find");
    write(0,6,156,0,"Blu, otherwise, please don't disturb me as I");
    write(0,6,166,0,"have quite a few things to think about.");
    repeat frame; until(key(_enter) or key(_space))
    LimMemory=2; Quests=2;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  TextBox(3); frame(700);
  write(0,6,126,0,"You've convinced me, I'll help you.");
  write(0,6,136,0,"Where should I start?");

  write(0,6,166,0,"I don't think so, I've got things of my own");
  write(0,6,176,0,"to take care of.");

  write(0,6,206,0,"All this seems a bit odd to me, I think I'll pass.");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Best thing to do is probably just to ask around.");
    write(0,6,156,0,"That old geezer Folder probably knows");
    write(0,6,166,0,"something. Good luck kid.");
    write(0,6,176,0,"Talk to me again when you find Blu, otherwise,");
    write(0,6,186,0,"please don't disturb me as I have quite a few");
    write(0,6,196,0,"things to think about.");
    repeat frame; until(key(_enter) or key(_space))
    LimMemory=2; Quests=2;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end

  if (Selection==2 or Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(180,0,180));
    write(0,6,126,0,"Lim");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That's too bad. That reward would have been");
    write(0,6,156,0,"sweet. Talk to me again if you change your");
    write(0,6,166,0,"mind kid.");
    repeat frame; until(key(_enter) or key(_space))
    LimMemory=1;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FolderDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"That guy Blu sure was in a hurry. I tell you");
    write(0,6,156,0,"kid; no respect for the elderly. None at all.");
    write(0,6,166,0,"Said something about Jellicons and the");
    write(0,6,176,0,"Gelatinous Caverns. Some mission or other.");
    write(0,6,186,0,"I dunno...");
    repeat frame; until(key(_enter) or key(_space))
  end
  
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process FolderDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Whaeh, you want something bub?");
    write(0,6,156,0,"Aint got all day, I'm to busy rotting away!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode>0)
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh it's you again, if I weren't so busy");
    write(0,6,156,0,"dying I would chase you away. Suddenly I feel a");
    write(0,6,166,0,"sudden urge to wave some kind of stick around.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hey old timer, you must have seen quite a lot");
    write(0,6,156,0,"of the sea in your day. Got a story for me?");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode>0)
    TextBox(0); frame(700);
    set_text_color(rgb(0,255,0));
    write(0,6,126,0,Name);
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Got another story?");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Aye, I'll tell you a little something.");
    write(0,6,156,0,"I remember the old days, you know. When I was");
    write(0,6,166,0,"just a small fishling. We didnay have no safe");
    write(0,6,176,0,"spheres back then I'll tell you what! Damn");
    write(0,6,186,0,"badfish and bigmouthed hungereaters everywhere.");
    write(0,6,196,0,"Couldn't swim down the stream without some punk");
    write(0,6,206,0,"tryin to nip your fins off! You youngsters have");
    write(0,6,216,0,"it good, don't know the sacrifices we made");
    write(0,6,226,0,"back then for your safety!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hmm. Lemme see. Ever see one of those");
    write(0,6,156,0,"Hungereaters? Scary stuff I'll tell you what!");
    write(0,6,166,0,"Big as a big ol really big thing, maybe twice");
    write(0,6,176,0,"as big! Lots of teeth and stuff like that,");
    write(0,6,186,0,"and tentacles too! Sort of scaly I guess,");
    write(0,6,196,0,"maybe it has rocks on it.");
    write(0,6,206,0,"The stuff of nightmares bub.");

    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"They said that they don't exist anymore,");
    write(0,6,156,0,"died off, but I dunnay believe em. If you ever");
    write(0,6,166,0,"see anything really, really hungry that is trying");
    write(0,6,176,0,"to eat you, you run!");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You heard about them super-brain-jellicons?");
    write(0,6,156,0,"Those damned Jellys are enough trouble as it is");
    write(0,6,166,0,"but the Jelly-whats-their-names with");
    write(0,6,176,0,"SUPER-brains?! Aye, when I was but a wee lad them");
    write(0,6,186,0,"Jellicons at least hade the manners to have");
    write(0,6,196,0,"normal-sized brains! I tell you what!");
    
    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"An old acquaintance of mine once told me he saw");
    write(0,6,156,0,"how a group of them brainy Jellicons used some");
    write(0,6,166,0,"kind of Gelatinum to launch a Jellicon into the");
    write(0,6,176,0,"great blue emptiness up there!");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(170,170,0));
    write(0,6,126,0,"Folder");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"They're crazy I tell you, not a decent bone in");
    write(0,6,156,0,"anything that ends with a 'con' that I've ever");
    write(0,6,166,0,"met! Not any bones at all as a matter of fact...");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MarLeeDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(230,50,30));
  write(0,6,126,0,"Mar-Lee");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Ooh heeello. Why aren't you a cute little fellow?");
  write(0,6,156,0,"Exploring the reef are you? Why in my day, when");
  write(0,6,166,0,"I was the most beautiful little fishling in the");
  write(0,6,176,0,"reef I used to sneak around quite a bit too. Oh");
  write(0,6,186,0,"those where the times, but I'm still quite a beauty");
  write(0,6,196,0,"aren't I? Or am I quite the sneak?");
  write(0,6,206,0,"Oh ho ho, who knows!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"I'd say you are a beauty!");

  if (PlayerFish!=3)
    write(0,6,166,0,"I'd say you are a sneak!");
  end
  if (PlayerFish==3)
    write(0,6,166,0,"Come on. I can recognize camouflage when I");
    write(0,6,176,0,"see it. You're a sneak.");
  end

  write(0,6,206,0,"I'm just passing by, don't mind me.");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(230,50,30));
    write(0,6,126,0,"Mar-Lee");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh you flatter this old fish! I have long since");
    write(0,6,156,0,"lost most of my old flare but your kind words");
    write(0,6,166,0,"have warmed my heart. Come here wont you and");
    write(0,6,176,0,"let me give you a big ol' kiss! *smooch*");
    repeat frame; until(key(_enter) or key(_space))

    PlayerID.HP=1050; HPBoostHeart();
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(230,50,30));
    write(0,6,126,0,"Mar-Lee");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Ooooh. Arent you an awful meanie? What makes");
    write(0,6,156,0,"you say that? I'm just a regular ol' beauty queen.");
    write(0,6,166,0,"Yes, it is okay to admire my good looks. Oh ho!");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(3); frame(700);
    write(0,6,126,0,"It's your colors, you are just too bright to be");
    write(0,6,136,0,"true.");

    write(0,6,166,0,"It's your attitude! You seem to cool to be a");
    write(0,6,176,0,"beauty queen.");

    write(0,6,206,0,"YOU ARE HIDING SOMETHING, I CAN SMELL IT!");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(230,50,30));
      write(0,6,126,0,"Mar-Lee");
      set_text_color(rgb(255,255,255));
      if (PlayerFish==3)
        write(0,6,146,0,"My you are a clever one. Then let me teach you");
        write(0,6,156,0,"a trick about how to be a good sneak...");
        repeat frame; until(key(_enter) or key(_space))
        SneakBoostOn=1;
      end
      if (PlayerFish!=3)
        write(0,6,146,0,"My you are a clever one. If you were a sneak");
        write(0,6,156,0,"yourself I might have been able to teach you");
        write(0,6,166,0,"a trick or two.");
        repeat frame; until(key(_enter) or key(_space))
      end
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(230,50,30));
      write(0,6,126,0,"Mar-Lee");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I am quite cool, aren't I? I am probably the");
      write(0,6,156,0,"coolest fish around... The... cool-queen of");
      write(0,6,166,0,"the reef, if you will. Now off you go little");
      write(0,6,176,0,"one... Of you go...");
      repeat frame; until(key(_enter) or key(_space))

      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(230,50,30));
      write(0,6,126,0,"Mar-Lee");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Then your sense of smell must be most profound,");
      write(0,6,156,0,"oh my stars! I do hope that I smell good.");
      write(0,6,166,0,"How will I ever land that handsome hunk Folder");
      write(0,6,176,0,"otherwise!");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(2); frame(700);
      write(0,6,126,0,"Wait a minute... FOLDER? That old scrotum??!!");

      write(0,6,166,0,"Certainly not. While you are certainly up to");
      write(0,6,176,0,"something FISHY, you could probably bag that");
      write(0,6,186,0,"old man easily enough.");
      repeat frame; until(key(_enter) or key(_space))

      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(230,50,30));
        write(0,6,126,0,"Mar-Lee");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Oh yes... He has a certain... mysterious");
        write(0,6,156,0,"quality to him Ooooh, just thinking about him");
        write(0,6,166,0,"makes me swoon <3. Ooooh <3. OOOOOH <3.");
        repeat frame; until(key(_enter) or key(_space))

        TextBox(0); frame(700);
        set_text_color(rgb(0,255,0));
        write(0,6,126,0,NAME);
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"I think that's my cue to leave...");
        write(0,6,166,0,"(Mar-Lee's love granted you a temporary");
        write(0,6,176,0,"health bonus!)");
        repeat frame; until(key(_enter) or key(_space))

        PlayerID.HP=1050; HPBoostHeart();
      end


      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(230,50,30));
        write(0,6,126,0,"Mar-Lee");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"You think so? Oh you deary. You sure do know");
        write(0,6,156,0,"how to make an old lady happy. Oh Folder...");
        write(0,6,166,0,"just thinking about him makes me swoon <3.");
        write(0,6,176,0,"Ooooh <3. OOOOOH <3.");
        repeat frame; until(key(_enter) or key(_space))

        TextBox(0); frame(700);
        set_text_color(rgb(0,255,0));
        write(0,6,126,0,NAME);
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"I think that's my cue to leave...");
        write(0,6,166,0,"(Mar-Lee's love granted you a temporary");
        write(0,6,176,0,"health bonus!)");
        repeat frame; until(key(_enter) or key(_space))

        PlayerID.HP=1050; HPBoostHeart();
      end

      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MarLeeDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(230,50,30));
  write(0,6,126,0,"Mar-Lee");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...Oh... That folder sure is a hottie...");
  write(0,6,156,0,"I wish he would notice me! <3 <3 <3");
  write(0,6,176,0,"(Mar-Lee's love granted you a temporary");
  write(0,6,186,0,"health bonus!)");
  repeat frame; until(key(_enter) or key(_space))

  PlayerID.HP=1050;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end


process QuidDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(230,150,0));
  write(0,6,126,0,"Quid");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Mmmmhmmm, I sure love these Spips! Oh boy!");
  write(0,6,156,0,"Can't seem to get enough of them! How are");
  write(0,6,166,0,"you doing " + Name + "?");
  write(0,6,176,0,"Sure was a long time since last I saw you.");
  write(0,6,186,0,"But yeah, we were like babyfish back then");
  write(0,6,196,0,"or something, now we're big fishlings!");
  repeat frame; until(key(_enter) or key(_space))

  TextBox(3); frame(700);
  write(0,6,126,0,"Some bigger than others I guess...");

  write(0,6,166,0,"Good to see you Quid! You used to be pretty");
  write(0,6,176,0,"big back then too, didn't you?");

  write(0,6,206,0,"Yeah, nice catching up, but I really need to go.");
  write(0,6,216,0,"Good bye!");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(230,150,0));
    write(0,6,126,0,"Quid");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"No need to be rude. But I guess you always");
    write(0,6,156,0,"were like that, quite outspoken to say the");
    write(0,6,166,0,"least.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(130,60,0));
    write(0,6,126,0,"Quid");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Sure thang! I was a big boy. Remember back");
    write(0,6,156,0,"then when we snuck out to and headed for the");
    write(0,6,166,0,"City? Too bad I got stuck in that tiny cavern");
    write(0,6,176,0,"entrance..");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process GlumDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,130,0));
  write(0,6,126,0,"Glum");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Oh... It's you. Well indulge yourself and");
  write(0,6,156,0,"pester me with your presence. Things");
  write(0,6,166,0,"continue to be suuuuucky around here.");
  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GlumDialog3(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,130,0));
  write(0,6,126,0,"Glum");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hey " + Name + " I have given a lot of thought");
  write(0,6,156,0,"to what we talked about and I think I'm going");
  write(0,6,166,0,"to scram. Pretty soon I will leave this");
  write(0,6,176,0,"uninteresting reef and venture to more");
  write(0,6,186,0,"interesting waters. Thanks man! I really owe");
  write(0,6,196,0,"this to you. Life has always felt so boring and");
  write(0,6,206,0,"dull but now I am finally excited by something.");
  write(0,6,216,0,"I'll leave soon, I just need to prepare some");
  write(0,6,226,0,"stuff first.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Oh yeah? Good for you! Where are you going?");

  write(0,6,166,0,"Whatever. I didn't really care.");
  write(0,6,176,0,"Good luck I guess.");

  write(0,6,206,0,"HAVE FUN ON YOUR ADVENTURE 8D!");
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,130,0));
    write(0,6,126,0,"Glum");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"I was thinking of taking the Great Stream");
    write(0,6,156,0,"from the Ocean up there and see where I end");
    write(0,6,166,0,"up. Maybe I get to see Great Sphere City");
    write(0,6,176,0,"some day, otherwise I just want to explore");
    write(0,6,186,0,"this sea and... maybe write something about");
    write(0,6,196,0,"what I find. Something poetic I think.");
    write(0,6,206,0,"Something like a... Rhyme of an ancient");
    write(0,6,216,0,"marine animal or something... Take care now");
    write(0,6,226,0,Name + "! I have preparations to make!");
    repeat frame; until(key(_enter) or key(_space))
    GlumMemory=3;
  end


  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,130,0));
    write(0,6,126,0,"Glum");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Oh. Well thanks anyway. Maybe it was your");
    write(0,6,156,0,"striking sarcasm and ill manners that made");
    write(0,6,166,0,"me want to leave this reef... Who knows!");
    write(0,6,176,0,"But it doesn't really matter. I needed this,");
    write(0,6,186,0,"so thanks anyway. Take care now " + Name);
    write(0,6,196,0,"I have preparations to make!");
    repeat frame; until(key(_enter) or key(_space))
    GlumMemory=3;
  end


  if (Selection==3)
    TextBox(0); frame(700);
    set_text_color(rgb(0,130,0));
    write(0,6,126,0,"Glum");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"ADVENTURE THAT'S THE LIFE FOR ME");
    write(0,6,156,0,"AMONG THE FISHES OF THE SEA");
    write(0,6,186,0,"A TRAVELING FISH I WAS MEANT TO BE");
    write(0,6,196,0,"WRITING LOTS OF POETRY!");
    write(0,6,216,0,"Take care now you crazy dumbass!");
    write(0,6,226,0,"I have preparations to make!");
    repeat frame; until(key(_enter) or key(_space))
    GlumMemory=3;
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process GlumDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(0,130,0));
  write(0,6,126,0,"Glum");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Heeello. You're " + Name +" right?");
  write(0,6,156,0,"Yeah, I recognize you from Silent Reef. Pretty");
  write(0,6,166,0,"sucky place that, preeetty sucky indeed.");
  write(0,6,176,0,"Not that this place is much better. Well, yeah,");
  write(0,6,186,0,"there's the Spips, can't argue with good food,");
  write(0,6,196,0,"but... There's just something lacking here.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(3); frame(700);
  write(0,6,126,0,"Well if it isn't mister negativity. If you");
  write(0,6,136,0,"don't like it here, why don't you just leave?");
  write(0,6,146,0,"I know I intend to.");

  write(0,6,166,0,"I like it here, there's fish from other reefs");
  write(0,6,176,0,"and yeah, the Spips are great!");

  write(0,6,206,0,"Blah blah blah, life sucks, I'm leaving!");
  repeat frame; until(key(_enter) or key(_space))


  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(0,130,0));
    write(0,6,126,0,"Glum");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You're leaving? Where are you going?");
    write(0,6,156,0,"There's no point in going and there's");
    write(0,6,166,0,"nowhere to go. You might as well stay here,");
    write(0,6,176,0,"there's no better place.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"It doesn't matter where you go! Just follow a");
    write(0,6,136,0,"feeling, float upon the waves and see where");
    write(0,6,146,0,"they take you.");

    write(0,6,166,0,"I don't really know. There seems to be a lot");
    write(0,6,176,0,"going on around here. I want to explore, I want");
    write(0,6,186,0,"to see what there is to see in this strange ocean.");

    write(0,6,206,0,"This place might suck, but that doesn't mean");
    write(0,6,216,0,"that there isn't something or someplace out");
    write(0,6,226,0,"there that's worthwhile.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(0,130,0));
      write(0,6,126,0,"Glum");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Float upon the waves... Sounds careless and");
      write(0,6,156,0,"dangerous to me...  I guess that's a fine");
      write(0,6,166,0,"way to live life. Truth is, I'm just too");
      write(0,6,176,0,"frightened to do anything like that.");
      write(0,6,186,0,"I'm forever doomed by my own inadequacy to");
      write(0,6,196,0,"stay here and suffer boredom.");
      repeat frame; until(key(_enter) or key(_space))

      TextBox(2); frame(700);
      write(0,6,126,0,"Come on! If your life isn't fulfilling, what's the");
      write(0,6,136,0,"point of living then? You might as well take the");
      write(0,6,146,0,"risk if you're going to feel like this otherwise.");

      write(0,6,166,0,"You might be right. Better to be safe and bored");
      write(0,6,176,0,"than die of excitement I guess.");
      repeat frame; until(key(_enter) or key(_space))

      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(0,130,0));
        write(0,6,126,0,"Glum");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Hm, I don't know. Maybe I should just leave.");
        write(0,6,156,0,"See where I end up. I need to think about this.");
        repeat frame; until(key(_enter) or key(_space))
        GlumMemory=2;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(0,130,0));
        write(0,6,126,0,"Glum");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Yeah, I know. Might as well stay here and");
        write(0,6,156,0,"complain, at least there is some satisfaction");
        write(0,6,166,0,"in that.");
        repeat frame; until(key(_enter) or key(_space))
        GlumMemory=1;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end
    end


    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(0,130,0));
      write(0,6,126,0,"Glum");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I'd like to explore to. Silent reef always seemed");
      write(0,6,156,0,"to stale to me, and this place is no better.");
      write(0,6,166,0,"I want to see colorful corals, weird waves and");
      write(0,6,176,0,"whatever wonderful sights these depths offer.");
      write(0,6,186,0,"Maybe I should just go.");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(2); frame(700);
      write(0,6,126,0,"Quite the poet, aren't you? If that's what you");
      write(0,6,136,0,"want, you should go.");

      write(0,6,166,0,"It's okay to dream for someone like me who can");
      write(0,6,176,0,"handle it. You should just stay here.");
      repeat frame; until(key(_enter) or key(_space))


      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(0,130,0));
        write(0,6,126,0,"Glum");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"You're right! I'll think about leaving! Thanks!");
        repeat frame; until(key(_enter) or key(_space))
        GlumMemory=2;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end

      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(0,130,0));
        write(0,6,126,0,"Glum");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Yeah, I know. Might as well stay here and");
        write(0,6,156,0,"complain, at least there is some satisfaction");
        write(0,6,166,0,"in that.");
        repeat frame; until(key(_enter) or key(_space))
        GlumMemory=1;
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end
    end
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(0,130,0));
    write(0,6,126,0,"Glum");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Yeah, I know. Might as well stay here and");
    write(0,6,156,0,"complain, at least there is some satisfaction");
    write(0,6,166,0,"in that.");
    repeat frame; until(key(_enter) or key(_space))
    GlumMemory=1;
    frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
  end


  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MoldDialog5(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"...");

  repeat frame; until(key(_enter) or key(_space))

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end


process MoldDialog4(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"H-hello! I have been thinking about what");
  write(0,6,156,0,"you said and I have to keep safe! I have");
  write(0,6,166,0,"to become better at hiding so that no");
  write(0,6,176,0,"badfish could ever get me.");
  write(0,6,186,0,"I HOPE THE BADFISH WILL STAY AWAY! ;_;");
  write(0,6,196,0,"I have been watching that Blu guy since he");
  write(0,6,206,0,"arrived... he did something... I wonder if");
  write(0,6,216,0,"I could do that to. I... must learn to hide.");
  write(0,6,226,0,"To hide from everything...");
  repeat frame; until(key(_enter) or key(_space))
  MoldConversation=6;
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MoldDialog3(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Hello " + Name + ". I have been thinking");
  write(0,6,156,0,"a lot about what you told me and I think");
  write(0,6,166,0,"you are right. There is no point in being");
  write(0,6,176,0,"afraid, It's better to try to... find ways");
  write(0,6,186,0,"to protect yourself against an enemy.");
  write(0,6,196,0,"I will try to find such ways. I've been");
  write(0,6,206,0,"speaking to Merl... He seems interested in");
  write(0,6,216,0,"the subject.");
  repeat frame; until(key(_enter) or key(_space))
  MoldConversation=7;
  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MoldDialog2(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"OOOOH NOOO! It's the scary fish. ;_;");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,NAME);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"YES, I AM A VENGEFUL CLOUD OF MALIGNANT");
  write(0,6,156,0,"INTENT, HERE TO NOT ONLY NIBBLE AND");
  write(0,6,166,0,"GOBBLE ON YOUR TAIL BUT ALSO PUT A");
  write(0,6,176,0,"TERRIBLE CURSE ON YOU. OHO HOHO HO!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"OH NOOOOO! NOT A CURSE!? ;_;");


  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,NAME);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"OH YES. A CURSE. TO MAKE YOUR EYES FLOAT");
  write(0,6,156,0,"AWAY FROM YOUR BODY SO THAT TINY");
  write(0,6,166,0,"JELLICONS CAN MOVE IN AND USE YOUR");
  write(0,6,176,0,"BRAIN AS A NEST!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"NOOOOOOOOOOOOO!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,NAME);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"HO HO HO HO HO HO!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"NHOOOOOEEEEEEEEE! ;_;");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(0,255,0));
  write(0,6,126,0,NAME);
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"MWAHAHAHAR HOHOHO HI HI HI HAHAHA!!!");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(220,220,0));
  write(0,6,126,0,"Mold");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,";_;");
  repeat frame; until(key(_enter) or key(_space))

  MoldConversation=5;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process MoldDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

    TextBox(0); frame(700);
    set_text_color(rgb(220,220,0));
    write(0,6,126,0,"Mold");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Who.. who are you? Why are you speaking to me?");
    write(0,6,156,0,"Are you a badfish?");
    write(0,6,166,0,"THE SEA IS FILLED WITH BAD FISH!");
    write(0,6,176,0,"EVERYTHING IS DANGEROUS.");
    write(0,6,186,0,"WE HAVE TO HIDE BEFORE THEY GET US!");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(4); frame(700);
    write(0,6,126,0,"Whoa there! Be quiet crazy person!");

    write(0,6,156,0,"Calm down, there's no one here to get you!");

    write(0,6,186,0,"UGH! Is everyone here deranged? I'm leaving...");

    write(0,6,216,0,"I AM HERE TO FEAST UPON YOUR ENTRAILS!");
    write(0,6,226,0,"MWAHAHAHAH!");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1 or Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(220,220,0));
      write(0,6,126,0,"Mold");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Oh... Oh... Oookay. I'm sorry, I get ahead");
      write(0,6,156,0,"of myself sometimes. Its just that...");
      write(0,6,166,0,"EVERYTHING IS SO SCARY? OH WHAT SHALL WE");
      write(0,6,176,0,"DO WHEN BADFISH COME TO GET US??!!");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(3); frame(700);
      write(0,6,126,0,"If Badfish come, we'll hide of course.");

      write(0,6,166,0,"That's why you always have to be ready.");
      write(0,6,176,0,"If you get attacked, you retaliate before");
      write(0,6,186,0,"you get hurt.");

      write(0,6,206,0,"You can't be afraid of what might happen.");
      repeat frame; until(key(_enter) or key(_space))


      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(0,255,0));
        write(0,6,126,0,NAME);
        set_text_color(rgb(255,255,255));
        if (PlayerFish==3)
          write(0,6,146,0,"You hide in the tall grass, in the shadows,");
          write(0,6,156,0,"and then you watch and wait.");
        end
        if (PlayerFish!=3)
          write(0,6,146,0,"There should be some good place...");
          write(0,6,156,0,"I don't know, maybe it's better to run.");
        end
        repeat frame; until(key(_enter) or key(_space))

        if (PlayerFish==3)
          TextBox(0); frame(700);
          set_text_color(rgb(220,220,0));
          write(0,6,126,0,"Mold");
          set_text_color(rgb(255,255,255));
          write(0,6,146,0,"You... you are right. It is better to hide");
          write(0,6,156,0,"than to be afraid. I must learn how to do this.");
          write(0,6,166,0,"AND IF I FAIL I WILL SURELY DIE!");
          MoldConversation=4;
          repeat frame; until(key(_enter) or key(_space))
        end
        frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
      end


      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(220,220,0));
        write(0,6,126,0,"Mold");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Retaliate?! You mean.. like.. attack the badfish?");
        repeat frame; until(key(_enter) or key(_space))

        TextBox(3); frame(700);
        write(0,6,126,0,"Yes. You have to kill it somehow.");

        write(0,6,166,0,"You have to hurt it so that you can get away.");

        write(0,6,206,0,"If you hurt it, it will know that it is YOU who");
        write(0,6,216,0,"is the badfish and it that needs to be afraid.");
        repeat frame; until(key(_enter) or key(_space))

        if (Selection==1)
          TextBox(0); frame(700);
          set_text_color(rgb(220,220,0));
          write(0,6,126,0,"Mold");
          set_text_color(rgb(255,255,255));
          write(0,6,146,0,"KILL IT? I can't kill something!");
          write(0,6,156,0,"THAT'S TO SCARY! Anyway, that's impossible.");
          write(0,6,166,0,"There is no way for for one of the fish to");
          write(0,6,176,0,"hurt a Badfish! Badfish are the ones that");
          write(0,6,186,0,"can hurt YOU!");
          repeat frame; until(key(_enter) or key(_space))

          TextBox(2); frame(700);
          write(0,6,126,0,"I don't know. But there has to be some way.");
          write(0,6,136,0,"We can't be utterly defenseless... Can we?");

          write(0,6,166,0,"There must be away. Even fish like us has to have");
          write(0,6,176,0,"some way to destroy things.");
          repeat frame; until(key(_enter) or key(_space))
          MoldConversation=3;
          frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
        end

        if (Selection==2)
          TextBox(0); frame(700);
          set_text_color(rgb(220,220,0));
          write(0,6,126,0,"Mold");
          set_text_color(rgb(255,255,255));
          write(0,6,146,0,"It makes.. sense. But how can you hurt something?");
          write(0,6,156,0,"I don't know how to!");
          repeat frame; until(key(_enter) or key(_space))
          MoldConversation=3;
          frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
        end

        if (Selection==3)
          TextBox(0); frame(700);
          set_text_color(rgb(220,220,0));
          write(0,6,126,0,"Mold");
          set_text_color(rgb(255,255,255));
          write(0,6,146,0,"I... should be the Badfish?!");
          write(0,6,156,0,"THEN I WOULD BE THE SCARY ONE!");
          write(0,6,166,0,"THAT'S TOO SCARY!");
          repeat frame; until(key(_enter) or key(_space))

          TextBox(2); frame(700);
          write(0,6,126,0,"You are quite impossible to get anywhere");
          write(0,6,136,0,"with aren't you? I'm done here.");

          write(0,6,166,0,"That's the whole point, be scary to scare");
          write(0,6,176,0,"of the scary fish!");
          repeat frame; until(key(_enter) or key(_space))
          frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;

          if (Selection==1) frame(700); signal(PlayerID, s_wakeup); return; end

          if (Selection==2)
            TextBox(0); frame(700);
            set_text_color(rgb(220,220,0));
            write(0,6,126,0,"Mold");
            set_text_color(rgb(255,255,255));
            write(0,6,146,0,"Maybe you don't really have to be scary...");
            write(0,6,156,0,"or dangerous. Maybe you just have to look");
            write(0,6,166,0,"scary...");
            repeat frame; until(key(_enter) or key(_space))
            MoldConversation=3;
            frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
          end
        end
      end
    end


    if (Selection==3) frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return; end


    if (Selection==4)
      TextBox(0); frame(700);
      set_text_color(rgb(220,220,0));
      write(0,6,126,0,"Mold");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"OH NO! NOT MY ENTRAILS!");
      write(0,6,156,0,"I NEED THOSE TO LIVE!");
      repeat frame; until(key(_enter) or key(_space))

      TextBox(2); frame(700);
      write(0,6,126,0,"AND WHEN I AM DONE I WILL SLURP DOWN YOUR");
      write(0,6,136,0,"EYEBALLS AND HIDE TREASURE IN YOUR");
      write(0,6,146,0,"EYE SOCKETS! OHOHOHO!");

      write(0,6,166,0,"...You fell for that?");
      write(0,6,176,0,"Boy, I really do feel sorry for you.");
      repeat frame; until(key(_enter) or key(_space))

      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(220,220,0));
        write(0,6,126,0,"Mold");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"NOOOO. SCAAAAARYYY. GOOOO AWAAAAAY...");
        repeat frame; until(key(_enter) or key(_space))
        MoldConversation=2;
      end
      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(220,220,0));
        write(0,6,126,0,"Mold");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"You... You are!!!");
        write(0,6,156,0,"THE MEANEST FISH I HAVE EVER MET.");
        repeat frame; until(key(_enter) or key(_space))
        MoldConversation=2;
      end
      if (FriendFish==2)
        TextBox(0); frame(700);
        set_text_color(rgb(170,170,0));
        write(0,6,126,0,"Finn");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Heh, that's hilarious. Good one "+ Name +".");
        write(0,6,156,0,"Someone this weak deserves some hassle.");
        write(0,6,166,0,"No other way to get stronger.");
        repeat frame; until(key(_enter) or key(_space))
      end
      frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
    end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process RoarkDialog(Mode);
begin

  signal(PlayerID, s_freeze);

    TextBox(0); frame(700);
    set_text_color(rgb(120,120,120));
    write(0,6,126,0,"Roark");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Hello. Don't think I've seen you here before.");
    write(0,6,156,0,"Anyway, I'm Roark and I'm in charge of this here");
    write(0,6,166,0,"passage, and I also do a little peacekeeping in");
    write(0,6,176,0,"the reef, not that it's ever necessary.");
    write(0,6,186,0,"You planning on going up to the Gateway?");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(4); frame(700);
    write(0,6,126,0,"Yes, and beyond I guess.");

    write(0,6,156,0,"Yeah I am! I'm on an adventure!");

    write(0,6,186,0,"No, not really, I'm just checking around.");

    write(0,6,216,0,"None of your business. If you don't mind, I'll");
    write(0,6,226,0,"just swim right through 'this here passage'.");
    repeat frame; until(key(_enter) or key(_space))


    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I see. Well, you can go to the Gateway,");
      write(0,6,156,0,"it's quite a sight, but you cannot go any");
      write(0,6,166,0,"further than that. I absolutely forbid it.");
      repeat frame; until(key(_enter) or key(_space))
    end

    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Oh, I see. I hate your kind, youngsters who do");
      write(0,6,156,0,"not know anything about how the world works.");
      write(0,6,166,0,"Oh well. You may take a look at the gateway,");
      write(0,6,176,0,"it's quite a sight it is, but you cannot travel");
      write(0,6,186,0,"any further than that. I absolutely forbid it. ");
      repeat frame; until(key(_enter) or key(_space))
    end

    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"The gateway in itself is quite a sight. You");
      write(0,6,156,0,"are permitted to go there, if you wish too.");
      repeat frame; until(key(_enter) or key(_space))
      frame(700); signal(PlayerID, s_wakeup); return;
    end

    if (Selection==4)
      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I don't like your attitude, sonny. Better drop");
      write(0,6,156,0,"it before someone takes an ill liking to you.");
      write(0,6,166,0,"You just swim right through, as you said, but");
      write(0,6,176,0,"don't go any further than that,");
      write(0,6,186,0,"I absolutely forbid it.");
      repeat frame; until(key(_enter) or key(_space))
    end


    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"As long as you understand. It's a rule, and");
      write(0,6,156,0,"it's meant to be followed for good reason.");
      repeat frame; until(key(_enter) or key(_space))

      TextBox(2); frame(700);
      write(0,6,126,0,"Okay then, good bye.");

      write(0,6,146,0,"What good reason, why do we have to stay");
      write(0,6,166,0,"by the reef?");

      if (Selection==1) frame(700); signal(PlayerID, s_wakeup); return; end

      if (Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(120,120,120));
        write(0,6,126,0,"Roark");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"It's dangerous out there! You will die!");
        write(0,6,156,0,"This here reef, like other reefs and the");
        write(0,6,166,0,"Great Sphere City, is a Sphere of Safety.");
        write(0,6,176,0,"It is a special area where we are safe and");
        write(0,6,186,0,"on the penalty of death, to exit a sphere.");
        write(0,6,196,0,"Granted that no fish will ever actually");
        write(0,6,206,0,"punish you if you leave, the sea itself");
        write(0,6,216,0,"will take care of that.");
        repeat frame; until(key(_enter) or key(_space))

        TextBox(0); frame(700);
        set_text_color(rgb(120,120,120));
        write(0,6,126,0,"Roark");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"It's something you will understand when you");
        write(0,6,156,0,"get older. Now off you go, but keep safe!");
        repeat frame; until(key(_enter) or key(_space))

        frame(700); signal(PlayerID, s_wakeup); return;
      end

    end


    if (Selection==1 or Selection==2 or Selection==4)
      TextBox(3); frame(700);
      write(0,6,126,0,"Forbid it? I don't think so, I do whatever I want.");

      write(0,6,166,0,"No way, I need to go out there!");

      write(0,6,206,0,"Well, if it's forbidden,");
      write(0,6,216,0,"I guess I'll just stay away then.");
      repeat frame; until(key(_enter) or key(_space))

      if (Selection==3) frame(700); signal(PlayerID, s_wakeup); return; end
      if (Selection==1 or Selection==2)
        TextBox(0); frame(700);
        set_text_color(rgb(120,120,120));
        write(0,6,126,0,"Roark");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"You must not!");
        write(0,6,156,0,"The penalty for leaving the reef is death!");
        repeat frame; until(key(_enter) or key(_space))
      end


      TextBox(3); frame(700);
      write(0,6,126,0,"Death!?");
      write(0,6,136,0,"You'll actually kill me if I leave the reef?");
      write(0,6,146,0,"That's horrifying!");

      write(0,6,166,0,"That's insane and I don't believe you.");

      repeat frame; until(key(_enter) or key(_space))
 
 
      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Of course I won't kill you! That would be...");
      write(0,6,156,0,"ugh, I wouldn't even know how to. We of the");
      write(0,6,166,0,"fish cannot harm anything. We are practically");
      write(0,6,176,0,"defenseless! The rule is a formal one,");
      write(0,6,186,0,"the sea itself is what will actually punish");
      write(0,6,196,0,"you. The sea is what is insane and");
      write(0,6,206,0,"horrifying! There's more badfish out there");
      write(0,6,216,0,"than you can possibly imagine.");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(0); frame(700);
      set_text_color(rgb(120,120,120));
      write(0,6,126,0,"Roark");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"This here reef is one of the Spheres of Safety,");
      write(0,6,156,0,"just as whichever reef you hail from.");
      write(0,6,166,0,"You must keep safe!");
      repeat frame; until(key(_enter) or key(_space))


      TextBox(3); frame(700);
      write(0,6,126,0,"Oh, I did not realize that.");
      write(0,6,136,0,"I will try to keep safe.");

      write(0,6,166,0,"Well, if you can't punish me i'll think I'll");
      write(0,6,176,0,"just go ahead.");

      write(0,6,206,0,"Sorry old man, there's just too much");
      write(0,6,216,0,"excitement out there.");
      repeat frame; until(key(_enter) or key(_space))

      if (Selection==1)
        TextBox(0); frame(700);
        set_text_color(rgb(120,120,120));
        write(0,6,126,0,"Roark");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"Okay then, I'm glad that you finally");
        write(0,6,156,0,"understood. Take care, young fishling.");
        repeat frame; until(key(_enter) or key(_space))
      end

      if (Selection==2 or Selection==3)
        TextBox(0); frame(700);
        set_text_color(rgb(120,120,120));
        write(0,6,126,0,"Roark");
        set_text_color(rgb(255,255,255));
        write(0,6,146,0,"I guess some never learn. The sea will");
        write(0,6,156,0,"teach you that what I've said is the truth.");
        write(0,6,166,0,"Goodbye, may the streams spare you from");
        write(0,6,176,0,"suffering.");
        repeat frame; until(key(_enter) or key(_space))
      end
    end

  frame(700); signal(PlayerID, s_wakeup); return;
end



process DrumDialog(Mode);
private
  int Memory;
begin

  signal(PlayerID, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    write(0,6,126,0,"Mysterious Fish");
    write(0,6,146,0,"Hello there young one. I am Drum. Who are you");
    write(0,6,156,0,"who ventures into the abyss? No Krills will light");
    write(0,6,166,0,"your way here. Only the");
    set_text_color(rgb(255,255,0));
    write(0,160,166,0,"inner light.");
    set_text_color(rgb(255,255,255));
    if (PlayerFish!=1)
      write(0,6,176,0,"This is no place for one such as you, the");
      write(0,6,186,0,"darkness will swallow you.");
    end
    if (PlayerFish==1)
      write(0,6,176,0,"I see you too carry the light, may it guide");
      write(0,6,186,0,"you through the thick of the dark.");
    end
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"I am " + Name + " the bold adventurer!");
    write(0,6,136,0,"What is this place?");

    write(0,6,166,0,"No need to get concerned about who I am.");
    write(0,6,176,0,"Young as I may be I have business in these");
    write(0,6,186,0,"waters. Where am I?");

    write(0,6,206,0,"You live down here?");
    write(0,6,216,0,"I didn't know people lived down here.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"This is our cave, where the Luminal Algae grows,");
    write(0,6,156,0,"and we, who live here, are the Tribe of the Deep.");
    write(0,6,166,0,"We stay close to the dark so that our light will");
    write(0,6,176,0,"shine all the brighter.");
    repeat frame; until(key(_enter) or key(_space))
  end

  TextBox(4); frame(700);
  write(0,6,126,0,"The");
  set_text_color(rgb(0,150,255));
  write(0,32,126,0,"Luminal Algae?");
  set_text_color(rgb(255,255,255));
  write(0,128,126,0,"Is that those light thingies");
  write(0,6,136,0,"that hangs from the ceiling?");

  write(0,6,156,0,"Tell me more about your Tribe. How come you");
  write(0,6,166,0,"dont live up by in the Mesopelagic?");

  if (Mode==0 or Mode==1)
    write(0,6,186,0,"Then you must know much about the deep roads.");
    write(0,6,196,0,"Can you tell me anything particular about them?");
  end
  if (Mode==2)
    write(0,6,186,0,"If... I ever encounter this Dark Mother,");
    write(0,6,196,0,"what should I do?");
  end

  if (Mode==0)
    write(0,6,216,0,"I too can talk in a deep and cryptic manner! May");
    write(0,6,226,0,"dying krill swim towards the light in your arse!");
  end
  if (Mode==1 or Mode==2)
    write(0,6,216,0,"Thank you, I better get going.");
    write(0,6,226,0,"I'll come see you some other time Drum.");
  end
  repeat frame; until(key(_enter) or key(_space))

  if (Selection==1)
    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Luminal Algae is indeed the splendid source");
    write(0,6,156,0,"of light that you see all around you. These");
    write(0,6,166,0,"algae are what the the Artarus Krill feast upon");
    write(0,6,176,0,"to gain their inner light source, in turn the");
    write(0,6,186,0,"Luminous Flat-fish feast upon the krill, gaining");
    write(0,6,196,0,"light themselves. We too, partake in that light.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    write(0,6,126,0,Name);
    write(0,6,146,0,"Artarus krill, Luminous Flat-fish?");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Artarus Krill are a certain kind of large");
    write(0,6,156,0,"Light-Krill, they travel around in our part of");
    write(0,6,166,0,"the sea, but their birthing place is just beyond");
    write(0,6,176,0,"this cave. Luminous flat-fish live everywhere");
    write(0,6,186,0,"down here in the Deep Roads; you can see them as");
    write(0,6,196,0,"they cling to the rocks while they wait for");
    write(0,6,206,0,"Small light-krill to approach them.");
    repeat frame; until(key(_enter) or key(_space))
    DrumDialog(1); return;
  end

  if (Selection==2)
    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"We have lived here since long before my time.");
    write(0,6,156,0,"Sometimes one dies, sometimes a new one comes");
    write(0,6,166,0,"to join us. Maybe you are such a person?");
    write(0,6,176,0,"As we live in the light, the light grows within us.");
    write(0,6,186,0,"Either our bodies adapt to the light, or the light");
    write(0,6,196,0,"changes our bodies. We do not know.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"This is our way of life; it is a purpose beyond");
    write(0,6,156,0,"feeding or mating.");
    if (PlayerFish!=1)
      write(0,6,166,0,"It is... hard to explain to one who does not know");
      write(0,6,176,0,"the light.");
    end
    if (PlayerFish==1)
      write(0,6,166,0,"Surely you must have felt it.");
      write(0,6,176,0,"You too may someday be one of us... but I see it");
      write(0,6,186,0,"in your eyes that such a day is yet far away.");
    end
    repeat frame; until(key(_enter) or key(_space))

    TextBox(3); frame(700);
    if (PlayerFish==3)
      write(0,6,126,0,"Personally, I feel that the shadows are much");
      write(0,6,136,0,"more comfortable. You don't need any light to");
      write(0,6,146,0,"survive in these waters.");
    end
    if (PlayerFish==1)
      write(0,6,126,0,"Perhaps.");
    end
    if (PlayerFish==2 or PlayerFish==4)
      write(0,6,126,0,"I am not sure I follow you there...");
    end

    write(0,6,166,0,"Thats... interesting.");
    write(0,6,176,0,"I had another question though.");

    write(0,6,206,0,"Before your time you said...");
    write(0,6,216,0,"How come you came here?");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(120,60,0));
      write(0,6,126,0,"Drum of the Deep");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I heard a voice. It was the voice of the deep");
      write(0,6,156,0,"ocean, a mighty voice trembling with power,");
      write(0,6,166,0,"humbling me, frightening me.");
      write(0,6,176,0,"It said: 'change'."); 
      write(0,6,186,0,"I followed this strange sensation and ended up");
      write(0,6,196,0,"here. The Elder at that time, a great fish named");
      write(0,6,206,0,"Maol, taught me about the light and I decided");
      write(0,6,216,0,"to follow it.");
      repeat frame; until(key(_enter) or key(_space))
    end
    DrumDialog(1); return;
  end

  if (Selection==3 and Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"You run, or you hide. And if that does not work...");
    write(0,6,156,0,"Maybe you could... try sneaking around somehow.");
    write(0,6,166,0,"Or move really fast. Or use some other kind of");
    write(0,6,176,0,"trickery. But better yet, don't go there in the");    
    write(0,6,186,0,"first place!");
    repeat frame; until(key(_enter) or key(_space))
    DrumDialog(2); return;
  end

  if (Selection==3 and Mode==0 or Selection==3 and Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"The Deep Roads are a dangerous place. If you go any");
    write(0,6,156,0,"further than this, be wary of the Dark Mother, the");
    write(0,6,166,0,"grand Mother of those who carry the Darkness.");
    write(0,6,176,0,"She lives in a garden of red poisonous flowers.");
    write(0,6,186,0,"Flowers connected to that place which lies even");
    write(0,6,196,0,"further down, below the Roads.");
    repeat frame; until(key(_enter) or key(_space))


    TextBox(3); frame(700);
    write(0,6,126,0,"And what place is that?");

    write(0,6,166,0,"The Dark... Mother?");

    write(0,6,206,0,"I will remember this.");
    write(0,6,216,0,"I have another question for you.");
    repeat frame; until(key(_enter) or key(_space))

    if (Selection==1)
      TextBox(0); frame(700);
      set_text_color(rgb(120,60,0));
      write(0,6,126,0,"Drum of the Deep");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"...The abyss. Don't go there. ");
      repeat frame; until(key(_enter) or key(_space))
    end

    if (Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(120,60,0));
      write(0,6,126,0,"Drum of the Deep");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Yes. The Darkbringers go to her to get the seeds");
      write(0,6,156,0,"which give them the darkness.");
      write(0,6,166,0,"Maybe you saw their eggs on the way here?");
      write(0,6,176,0,"They plant the dark seed with the darkling in an");
      write(0,6,186,0,"egg and it becomes a Darkbringer.");
      Memory=1;
      repeat frame; until(key(_enter) or key(_space))
    end

    if (Memory==1) DrumDialog(2); return; end
    DrumDialog(1); return;
  end    

  if (Selection==4)
    TextBox(0); frame(700);
    set_text_color(rgb(120,60,0));
    write(0,6,126,0,"Drum of the Deep");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Wait... Before you go, I have something to ask.");
    write(0,6,156,0,"Below the garden, not yet in the domain of living");
    write(0,6,166,0,"darkness and insane waters, there is an old white");
    write(0,6,176,0,"fish. I have watched him from afar, but it seems");
    write(0,6,186,0,"that he cannot deal with the special light that");
    write(0,6,196,0,"these Algae grant us. Could you ask him his");
    write(0,6,206,0,"story? I have some suspicions... but... Yes.");
    write(0,6,216,0,"If you have to venture towards the deepest");
    write(0,6,226,0,"depths, ask him who he is.");
    repeat frame; until(key(_enter) or key(_space))

    TextBox(4); frame(700);
    write(0,6,126,0,"I cannot make any promises,");
    write(0,6,136,0,"but if I meet him, I will ask.");

    write(0,6,156,0,"Yeah, I'll do it. I'm not afraid of the deep.");
    write(0,6,166,0,"But there better be some reward for it.");

    write(0,6,186,0,"No, I don't think so.");

    write(0,6,216,0,"Of course, you've been a help to me drum,");
    write(0,6,226,0,"and I'll gladly help you.");
    repeat frame; until(key(_enter) or key(_space))

    GhostFishQuest=1;

    if (Selection==1 or Selection==2)
      TextBox(0); frame(700);
      set_text_color(rgb(120,60,0));
      write(0,6,126,0,"Drum of the Deep");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I'm sure you'll do your best,");
      write(0,6,156,0,"let me know if you find him... and I will find");
      write(0,6,166,0,"a reward for you.");
      repeat frame; until(key(_enter) or key(_space))
    end
    if (Selection==3)
      TextBox(0); frame(700);
      set_text_color(rgb(120,60,0));
      write(0,6,126,0,"Drum of the Deep");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"I hope you will get a chance to change your mind.");
      repeat frame; until(key(_enter) or key(_space))
    end
    if (Selection==4)
      TextBox(0); frame(700);
      set_text_color(rgb(120,60,0));
      write(0,6,126,0,"Drum of the Deep");
      set_text_color(rgb(255,255,255));
      write(0,6,146,0,"Thank you... You are a friend of our tribe.");
      repeat frame; until(key(_enter) or key(_space))
    end
  end

  TextBox(0); frame(700);
  set_text_color(rgb(120,60,0));
  write(0,6,126,0,"Drum of the Deep");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Swim safely, young Fishling, and may the light");
  write(0,6,156,0,"hidden in the currents guide your way.");
  repeat frame; until(key(_enter) or key(_space))

  DrumMemory=1;
  frame(700); signal(PlayerID, s_wakeup);

end




process LuddDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  if (Mode==0)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Ludd");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"May you find your way in these strange tunnels.");
    write(0,6,156,0,"The sea is a vast and often strange place but");
    write(0,6,166,0,"there is true wonder in these waters. Someday");
    write(0,6,176,0,"maybe you too will see a wonder and find your");
    write(0,6,186,0,"own way.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==1)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Ludd");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Before I came here I used to live in Great");
    write(0,6,156,0,"Sphere City. I belonged to the Dashers Guild.");
    write(0,6,166,0,"They called me Strike, as I was the one who");
    write(0,6,176,0,"Struck whenever it was needed. That was a long");
    write(0,6,186,0,"time ago, now I follow the Light.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==2)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Ludd");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"Drum used to live in the city too he once told");
    write(0,6,156,0,"me. Before he found the light he had quite a past,");
    write(0,6,166,0,"but I guess we all do. Strange how those who");
    write(0,6,176,0,"need it the most find their way here.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==3)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Ludd");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"When I was in the Dashers guild we often had");
    write(0,6,156,0,"run-ins with the Shades, that was what we called");
    write(0,6,166,0,"the guild of the Shadow fish. Their motives are");
    write(0,6,176,0,"too murky for my liking.");
    repeat frame; until(key(_enter) or key(_space))
  end

  if (Mode==4)
    TextBox(0); frame(700);
    set_text_color(rgb(200,200,0));
    write(0,6,126,0,"Ludd");
    set_text_color(rgb(255,255,255));
    write(0,6,146,0,"There were many guilds in the city. If you ever");
    write(0,6,156,0,"go there be wary of their politics, allying");
    write(0,6,166,0,"yourself with one guild can get you alienated");
    write(0,6,176,0,"from another... It's all so... complicated.");
    write(0,6,186,0,"I like it better here.");
    repeat frame; until(key(_enter) or key(_space))
  end

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SooksDialog(Mode);
begin

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Sooks");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"Feel welcomed, you who are young but wary. I");
  write(0,6,156,0,"feel that you have already seen and felt much of");
  write(0,6,166,0,"these waters. Strange place, this 'Spipreef'. As");
  write(0,6,176,0,"I have traversed the deepest places around here");
  write(0,6,186,0,"I have seen how the Spips bloom, and where their");
  write(0,6,196,0,"deepest roots grow.");
  repeat frame; until(key(_enter) or key(_space))


  TextBox(0); frame(700);
  set_text_color(rgb(200,200,0));
  write(0,6,126,0,"Sooks");
  set_text_color(rgb(255,255,255));
  write(0,6,146,0,"This place is unlike any other I have seen in this");
  write(0,6,156,0,"sea and yet, all of the fish, travel to where the");
  write(0,6,166,0,"Spips grow so that they can feast. I think...");
  write(0,6,176,0,"that we may be a very odd species.");
  repeat frame; until(key(_enter) or key(_space))


  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process SpawnItemWarning();
begin
  frame(5000);

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(255,255,255));
  write(0,6,126,0,"It's power spent, the Seed of Darkness dissipated");
  write(0,6,136,0,"into the water.");
  repeat frame; until(key(_enter) or key(_space))
  SpawnItem=0; ItemSelect=0;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end



process AbilityMessage();
begin
  frame(5000);

  signal(PlayerID, s_freeze);
  signal(father, s_freeze);

  TextBox(0); frame(700);
  set_text_color(rgb(255,255,255));
  write(0,6,126,0,"As you eat the Super Spip, you can feel");
  write(0,6,136,0,"something change within you.");
  write(0,6,156,0,"- Gained new ability! -");
  repeat frame; until(key(_enter) or key(_space))
  KnownPowers=2;

  frame(700); signal(PlayerID, s_wakeup); signal(father, s_wakeup); return;
end




process DeepTribeFish(x,y,z,Mode);
private
  int AnimationCounter;
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int Direction;
  int WaitCounter;
  int BounceCounter;
begin
  ctype=c_scroll;
  if (Mode==1) Direction=1; graph=168; end
  if (Mode==2) Direction=8; graph=171; end
  loop

    if (Mode==1)
      if (Direction==1)
        TempAngle=fget_angle(x,y,650,377);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,650,377)<20) Direction++; end
      end

      if (Direction==2)
        TempAngle=fget_angle(x,y,570,115);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,570,115)<20) Direction++; end
      end

      if (Direction==3)
        TempAngle=fget_angle(x,y,250,207);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,250,207)<20) Direction++; end
      end

      if (Direction==4)
        TempAngle=fget_angle(x,y,138,385);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,138,385)<20) Direction++; end
      end

      if (Direction==5)
        TempAngle=fget_angle(x,y,300,324);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,300,324)<20) Direction++; end
      end

      if (Direction==6)
        TempAngle=fget_angle(x,y,480,110);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,480,110)<20) Direction++; end
      end

      if (Direction==7)
        TempAngle=fget_angle(x,y,740,300);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,740,300)<20) Direction++; end
      end

      if (Direction==8)
        TempAngle=fget_angle(x,y,518,419);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,518,419)<20) Direction++; end
      end

      if (Direction>8)
        angle=0;
        repeat
          BounceCounter++;
          if (BounceCounter==1 or BounceCounter==5 or BounceCounter==10) y--; end
          if (BounceCounter==15 or BounceCounter==20 or BounceCounter==25) y++; end
          if (BounceCounter==30) BounceCounter=0; end
          WaitCounter++;
          if (collision(type TalkLine))
            if (x<PlayerX) flags=0; end
            if (x>PlayerX) flags=1; end
            frame(0);
            if (exists(type TalkIcon)==0)
              if (flags==0) TalkIcon(1,20); end
              if (flags==1) TalkIcon(0,20); end
            end
            if (key(_enter) or key(_space))
              frame(0);
              if (exists(type LuddDialog)==0) LuddDialog(LuddMemory); LuddMemory++; end
              if (LuddMemory==5) LuddMemory=0; end
            end
          end
          frame;
        until(WaitCounter==600)
        WaitCounter=0; Direction=1;
      end
    end

 
    if (Mode==2)
      if (Direction==1)
        TempAngle=fget_angle(x,y,317,129);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,317,129)<20) Direction++; end
      end

      if (Direction==2)
        TempAngle=fget_angle(x,y,668,136);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,668,136)<20) Direction++; end
      end

      if (Direction==3)
        TempAngle=fget_angle(x,y,677,305);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,677,305)<20) Direction++; end
      end

      if (Direction==4)
        TempAngle=fget_angle(x,y,609,145);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,609,145)<20) Direction++; end
      end

      if (Direction==5)
        TempAngle=fget_angle(x,y,375,153);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,375,153)<20) Direction++; end
      end

      if (Direction==6)
        TempAngle=fget_angle(x,y,288,344);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,288,344)<20) Direction++; end
      end

      if (Direction==7)
        TempAngle=fget_angle(x,y,190,177);
        if (angle<TempAngle) angle+=10000; end
        if (angle>TempAngle) angle-=10000; end
        if (ForwardSpeed=>0) ForwardSpeed=5; end
        if (fget_dist(x,y,190,177)<20) Direction++; end
      end

      if (Direction>7)
        angle=0;
        repeat
          BounceCounter++;
          if (BounceCounter==1 or BounceCounter==5 or BounceCounter==10) y--; end
          if (BounceCounter==15 or BounceCounter==20 or BounceCounter==25) y++; end
          if (BounceCounter==30) BounceCounter=0; end
          WaitCounter++;
          if (collision(type TalkLine))
            if (x<PlayerX) flags=0; end
            if (x>PlayerX) flags=1; end
            frame(0);
            if (exists(type TalkIcon)==0)
              if (flags==0) TalkIcon(1,24); end
              if (flags==1) TalkIcon(0,24); end
            end
            if (key(_enter) or key(_space))
              frame(0);
              if (exists(type SooksDialog)==0) SooksDialog(0); end
            end
          end
          frame;
        until(WaitCounter==600)
        WaitCounter=0; Direction=1;
      end
    end

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    if (Mode==1 and Direction<9)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=167; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=168; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=169; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=168; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end
    if (Mode==2 and Direction<8)
      AnimationCounter++;
      if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=170; end
      if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=171; end
      if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=172; end
      if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=171; end
      if (AnimationCounter==13) AnimationCounter=0; end
    end

    if (angle>360000) angle=0; end
    if (angle<-360000) angle=0; end

    advance(ForwardSpeed);

    frame;
  end
end



process BeamFish(x,y,z,Mode);
private
  int AnimationCounter;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll; graph=295; flags=Mode;
  loop
    if (get_dist(PlayerID)<100) Control=1; end
    if (get_dist(PlayerID)>100) Control=0; end
    if (Control==1 and exists(type BeamFishBeam)==0 and ShadowCounter<1) BeamFishBeam(1); BeamFishBeam(2); BeamFishBeam(3); end
    if (Control==1 and AnimationCounter<7) AnimationCounter++; end
    if (Control==0 and AnimationCounter>0) AnimationCounter--; end
    if (AnimationCounter==0) graph=295; end
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=296; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=297; end
    if (AnimationCounter==7) graph=298; end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    frame;
  end
end



process BeamFishBeam(Mode);
private
  int MoveCounter;
begin
  ctype=c_scroll; graph=299; size=0; alpha=0; z=11; flags=16+father.flags;
  frame(1000);
  if (Mode==1)
    if (flags==16) x=father.x-8; y=father.y-9; end
    if (flags==17) x=father.x+12; y=father.y-9; end
  end
  if (Mode==2)
    if (flags==16) x=father.x-4; y=father.y+2; end
    if (flags==17) x=father.x+14; y=father.y+2; angle=+20000; end
  end
  if (Mode==3)
    if (flags==16) x=father.x-4; y=father.y-12; end
    if (flags==17) x=father.x+4; y=father.y-12; angle=-20000; end
  end
  play_wav(BeamFishSound,0);
  repeat 
    alpha+=10;
    size+=5;
    if (collision(PlayerID))
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=2;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=2;
    end
    frame(50);
  until(size==100)
  repeat
    MoveCounter++;
    if (MoveCounter>0 and MoveCounter<=40) angle-=1000; end
    if (MoveCounter>40 and MoveCounter<=120) angle+=1000; end
    if (MoveCounter>120 and MoveCounter<=160) angle-=1000; end
    if (MoveCounter==81) play_wav(BeamFishSound,0); MoveCounter=0; end
    if (alpha>200) alpha-=2; end
    if (rand(1,20)==1) alpha=240; end
    if (collision(PlayerID))
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=2;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=2;
    end
    frame;
  until(father.Control==0)
  repeat 
    alpha-=10;
    size-=5;
    if (collision(PlayerID))
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=2;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=2;
    end
    frame(50);
  until(size==0)
end




process SpinePlant(StartX,StartY,z,Mode);
private
  int Part1ID;
  int Part2ID;
  int Part3ID;
  int Part4ID;
  int Part5ID;
  int Part6ID;
begin
  ctype=c_scroll; graph=228; x=StartX; y=StartY; flags=Mode;
  Part1ID=SpinePlantPart(x,y+9,z,Mode);
  Part2ID=SpinePlantPart(x,y+17,z,Mode);
  Part3ID=SpinePlantPart(x,y+25,z,Mode);
  Part4ID=SpinePlantPart(x,y+33,z,Mode);
  Part5ID=SpinePlantPart(x,y+41,z,Mode);
  Part6ID=SpinePlantPart(x,y+49,z,Mode);
  loop
    if (get_dist(PlayerID)<100)
      Control=1;
      Part1ID.Control=1;
      Part2ID.Control=1;
      Part3ID.Control=1;
      Part4ID.Control=1;
      Part5ID.Control=1;
      Part6ID.Control=1;
    end
    if (get_dist(PlayerID)>100)
      Control=0;
      Part1ID.Control=0;
      Part2ID.Control=0;
      Part3ID.Control=0;
      Part4ID.Control=0;
      Part5ID.Control=0;
      Part6ID.Control=0;
    end
    if (PlayerX<x) flags=0; end
    if (PlayerX>x) flags=1; end
    frame;
    if (rand(1,30)==1) x=StartX+rand(-1,1); end
    if (Control==1 and y>StartY-50) y--; end
    if (Control==0 and y<StartY) y++; end
  end
end



process SpinePlantPart(StartX,StartY,z,Mode);
begin
  ctype=c_scroll; graph=229; x=StartX; y=StartY;
  loop
    if (rand(1,30)==1) x=StartX+rand(-1,1); end
    if (Control==1 and y>StartY-50) y--; end
    if (Control==0 and y<StartY) y++; end
    frame;
  end
end



process GhostFish3(x,y,z,Mode);
private
  int MoveCounter;
  int MoveUpDown;
  int AnimationCounter;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll; graph=221;

  loop

    if (Mode==0)
      MoveCounter++;
      if (MoveCounter>0 and MoveCounter<=200) x++; flags=0; end
      if (MoveCounter>200 and MoveCounter<=400) x--; flags=1; end
      if (MoveCounter==401) MoveCounter=0; end
    end

    if (rand(0,100)==1 and MoveUpDown==0) MoveUpDown=30; end
    if (rand(0,100)==1 and MoveUpDown==0) MoveUpDown=60; end
    if (MoveUpDown>0) MoveUpDown--; end
    if (MoveUpDown>45 and MoveUpDown<60) y-=4; end
    if (MoveUpDown>30 and MoveUpDown<45) y+=4; end
    if (MoveUpDown==30) if (rand(1,2)==1) MoveUpDown=0; end end
    if (MoveUpDown>15 and MoveUpDown<30) y+=4; end
    if (MoveUpDown>0 and MoveUpDown<15) y-=4; end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=10;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=10;
    end

    if (flags==0 and rand(1,6)==1) GhostFishTrail(x-12,y,z+1); end
    if (flags==1 and rand(1,6)==1) GhostFishTrail(x+12,y,z+1); end

    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3 or AnimationCounter==4) graph=221; end
    if (AnimationCounter==5 or AnimationCounter==6 or AnimationCounter==7 or AnimationCounter==8) graph=222; end
    if (AnimationCounter==9 or AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=223; end
    if (AnimationCounter==13 or AnimationCounter==14 or AnimationCounter==15 or AnimationCounter==6) graph=222; end
    if (AnimationCounter==17) AnimationCounter=0; end

    frame;
  end
end




process GhostFish2(x,y,z,Mode);
private
  int MoveCounter;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll; graph=220;

  loop

    if (Mode==0)
      MoveCounter++;
      if (MoveCounter>0 and MoveCounter<=200) x++; y++; flags=0; end
      if (MoveCounter>200 and MoveCounter<=400) x++; y--; flags=0; end
      if (MoveCounter>400 and MoveCounter<=600) x--; y--; flags=1; end
      if (MoveCounter>600 and MoveCounter<=800) x--; y++; flags=1; end
      if (MoveCounter==801) MoveCounter=0; end
    end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=10;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=10;
    end

    if (flags==0 and rand(1,6)==1) GhostFishTrail(x-12,y,z+1); end
    if (flags==1 and rand(1,6)==1) GhostFishTrail(x+12,y,z+1); end

    frame;
  end
end




process BroodFish(x,y,z,Mode);
private
  int AnimationCounter;
  int DriftCounter;
  int DelayCounter;
begin
  ctype=c_scroll; graph=194;

  BroodFishBrood(x-15,y,5,0,1);
  BroodFishBrood(x,y+15,5,30,2);
  BroodFishBrood(x+15,y,5,60,3);
  BroodFishBrood(x,y-15,5,90,4);

  repeat
    DriftCounter++;
    if (DriftCounter>0 and DriftCounter<40) x++; flags=1; end
    if (DriftCounter>40 and DriftCounter<80) x--; flags=0; end
    if (DriftCounter>80) DriftCounter=0; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=194; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=195; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=196; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=195; end
    if (AnimationCounter==13) AnimationCounter=0; end

    frame;
  until(get_dist(PlayerID)<100 and ShadowCounter<1)


  if (PlayerX<X) flags=0; end
  if (PlayerX>X) flags=1; end

  DriftCounter=0;
  Control=1;
  repeat
    if (PlayerX<X) flags=0; end
    if (PlayerX>X) flags=1; end
    frame;
  until(HP==1)
  Control=2;
  repeat
    if (PlayerX<X) flags=0; end
    if (PlayerX>X) flags=1; end
    frame;
  until(HP==2)
  Control=3;
  repeat
    if (PlayerX<X) flags=0; end
    if (PlayerX>X) flags=1; end
    frame;
  until(HP==3)
  Control=4;

  repeat
    DriftCounter++;
    if (DriftCounter>0 and DriftCounter<10) if (DriftCounter%2==0) y++; end end
    if (DriftCounter>10 and DriftCounter<20) if (DriftCounter%2==0) y--; end end
    if (DriftCounter>20) DriftCounter=0; end
    if (PlayerX<X) flags=0; end
    if (PlayerX>X) flags=1; end
    frame;
  until(HP==4)

  FriendFishExpression(160,0);
  frame(1000);
  if (PlayerX<X) flags=1; frame; x+=3; SmallBubble(x-10,y+1,z+1,1); frame; x+=6; SmallBubble(x-10,y+1,z+1,1); frame; end
  if (PlayerX>X) flags=0; frame; x-=3; SmallBubble(x+10,y+1,z+1,1); frame; x-=6; SmallBubble(x+10,y+1,z+1,1); frame; end
  repeat
    if (flags==1) x+=9; end
    if (flags==0) x-=9; end
    if (flags==0) SmallBubble(x+10,y+1,z+1,1); end
    if (flags==1) SmallBubble(x-10,y+1,z+1,1); end
    frame;
  until(x<0 or x>1200)
  return;
end



process BroodFishBrood(x,y,z,MoveCounter1,Mode);
private
  int DriftCounter;
  int Ready;
begin
  ctype=c_scroll; graph=197;

  repeat

    if (father.Control==0)
      DriftCounter++;
      if (DriftCounter>0 and DriftCounter<40) x++; end
      if (DriftCounter>40 and DriftCounter<80) x--; end
      if (DriftCounter>80) DriftCounter=0; end
    end

    MoveCounter1++;
    if (MoveCounter1>0 and MoveCounter1<=30) x++; y++; end
    if (MoveCounter1>30 and MoveCounter1<=60) x++; y--; end
    if (MoveCounter1>60 and MoveCounter1<=90) x--; y--; end
    if (MoveCounter1>90 and MoveCounter1<=120) x--; y++; end
    if (MoveCounter1==121) MoveCounter1=0; end

    flags=father.flags;

    if (flags==0 and x<father.x) Ready=1; end
    if (flags==1 and x>father.x) Ready=1; end

    frame;
  until(father.Control==Mode and Ready==1)

  angle=get_angle(PlayerID);
  advance(1); frame; advance(2); frame; advance(3); frame;
  repeat
    advance(4);

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=20; father.HP++;
      if (PlayerFish==3) SneakBoostOn=0; end
      return;
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=20; father.HP++;
      return;
    end

    if (flags==0 and rand(1,6)==1) SmallBubble(x+5,y+1,z+1,3); end
    if (flags==1 and rand(1,6)==1) SmallBubble(x-5,y+1,z+1,3); end

    frame;
  until(x<-10 or y<-10 or x>1500 or y>1500 or collision(LevelCheckID))
  father.HP++; PoisonGas(x,y,z,0); return;
end



process PoisonTricker(x,y,z,Mode);
private
  int ExpressionID;
begin
  ctype=c_scroll; graph=185; flags=Mode;
  repeat
    if (rand(1,100)==1) graph=185; end
    if (rand(1,100)==1) graph=192; end
    if (rand(1,100)==1) graph=193; end
    frame;
  until(get_dist(PlayerID)<50);
  graph=186;
  if (flags==0) ExpressionID=FriendFishExpression(160,1); end
  if (flags==1) ExpressionID=FriendFishExpression(160,2); end
  repeat
    if (rand(1,2)==1)
      if (flags==0) PoisonGas(x+rand(7,9),y-rand(15,17),6,rand(1,3)); end
      if (flags==1) PoisonGas(x-rand(7,9),y-rand(15,17),6,rand(4,6)); end
      
      if (exists(type Confetti)==0)
        if (flags==0) CreateConfetti(x+8,y-16,3,8); end
        if (flags==1) CreateConfetti(x-8,y-16,3,8); end
      end
    end
    frame;
  until(get_dist(PlayerID)>50);
  signal(ExpressionID, s_kill); PoisonTricker(x,y,z,Mode); return;
end



process PoisonGas(x,y,z,Mode);
begin
  ctype=c_scroll; size=50; flags=16+rand(0,3);
  alpha=rand(150,250);
  repeat
    if (size<100) size+=10; end
    if (alpha>200 and alpha<250) graph=187; end
    if (alpha>150 and alpha<200) graph=188; end
    if (alpha>100 and alpha<150) graph=189; end
    if (alpha>50 and alpha<100) graph=190; end
    if (alpha>0 and alpha<50) graph=191; end
    alpha-=10;

    if (Mode==1) x+=2; y-=3; end
    if (Mode==2) x+=2; y-=2; end
    if (Mode==3) x+=3; y-=3; end
    if (Mode==4) x-=2; y-=3; end
    if (Mode==5) x-=2; y-=2; end
    if (Mode==6) x-=3; y-=3; end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=10;
      if (PlayerFish==3) SneakBoostOn=0; end
      return;
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=10;
      return;
    end

    frame;
  until(alpha<20)
end



process ConfuseAmoeba(x,y,z,Mode);
begin
  ctype=c_scroll; graph=444+rand(0,1); flags=rand(0,3); alpha=200;
  loop
    if (key(_up))
      if (collision(PlayerID))
        if (Mode==1) PlayerID.angle-=20000; end
        if (Mode==2) PlayerID.angle+=20000; end
      end
    end
    if (rand(1,20)==1) ConfuseAmoebaAura(x,y,z,Mode); end
    frame; 
  end
end




process ConfuseAmoebaAura(x,y,z,Mode);
begin
  ctype=c_scroll; graph=father.graph; flags=father.flags+16; alpha=200;
  repeat alpha-=10; frame; until(alpha<50)
end




process AquaMineBall(x,y,z,Mode);
private
  int BounceCounter;
begin
  ctype=c_scroll; graph=164;
  repeat
    BounceCounter++;
    if (BounceCounter>0 and BounceCounter<8) y--; end
    if (BounceCounter>8 and BounceCounter<16) y++; end
    if (BounceCounter==16) BounceCounter=0; end
    frame(300);
  until(get_dist(PlayerID)<70)
  play_wav(Mine2,0);
  AquaMine(x-5,y-6,z,1); AquaMine(x+8,y-2,z,2); AquaMine(x-3,y+7,z,3);
  graph=165;
  repeat size+=5; alpha-=10; frame(50); until(alpha<20)
end



process AquaMine(x,y,z,Mode);
private
  int BounceCounter;
  int Speed;
  int DelayCounter;
begin
  ctype=c_scroll; graph=129;

  if (Mode==1 or Mode==2 or Mode==3)
    Speed=3;
    repeat
      BounceCounter++;
      if (BounceCounter>0 and BounceCounter<8) y--; end
      if (BounceCounter>8 and BounceCounter<16) y++; end
      if (BounceCounter==16) BounceCounter=0; end
      if (Mode==1) x-=Speed; y-=Speed; end
      if (Mode==2) x+=Speed; y-=Speed; end
      if (Mode==3) x-=Speed; y+=Speed; end
      DelayCounter++;
      if (DelayCounter==4) Speed--; DelayCounter=0; end
      frame;
    until(get_dist(PlayerID)<50 or Speed==0)
  end

  repeat
    BounceCounter++;
    if (BounceCounter>0 and BounceCounter<8) y--; end
    if (BounceCounter>8 and BounceCounter<16) y++; end
    if (BounceCounter==16) BounceCounter=0; end
    frame(200);
  until(get_dist(PlayerID)<50)
  play_wav(Mine2,0);
  AquaMinePart(x+6,y+6,z,1); AquaMinePart(x+6,y-6,z,2); AquaMinePart(x-6,y+6,z,3); AquaMinePart(x-6,y-6,z,4);
  AquaMineShot(x,y,z,1); AquaMineShot(x,y,z,2); AquaMineShot(x,y,z,3); AquaMineShot(x,y,z,4);
  AquaMineShot(x,y,z,5); AquaMineShot(x,y,z,6); AquaMineShot(x,y,z,7); AquaMineShot(x,y,z,8);
end




process AquaMinePart(x,y,z,Mode);
private
  int UpSpeed;
  int SideSpeed;
begin
  ctype=c_scroll; graph=131;
  if (Mode==1) flags=0; SideSpeed=-2; end
  if (Mode==2) flags=2; SideSpeed=1; end
  if (Mode==3) flags=1; SideSpeed=2; end
  if (Mode==4) flags=3; SideSpeed=-1; end
  UpSpeed=3;
  repeat
    if (UpSpeed>-2) UpSpeed--; end
    y+=UpSpeed; x+=SideSpeed;
    alpha-=10;
    frame;
  until(alpha<10)
end



process AquaMineShot(x,y,z,Mode);
private
  int FadeCounter;
begin
  ctype=c_scroll; graph=130;
  if (Mode==9 or Mode==10) graph=232; end

  repeat
    FadeCounter++;
    if (Mode==1) x-=2; y+=rand(-1,1); end
    if (Mode==2) x-=2+rand(-1,1); y-=2+rand(-1,1); end
    if (Mode==3) y-=2; x+=rand(-1,1); end
    if (Mode==4) x+=2+rand(-1,1); y-=2+rand(-1,1); end
    if (Mode==5) x+=2; y+=rand(-1,1); end
    if (Mode==6) x+=2+rand(-1,1); y+=2+rand(-1,1); end
    if (Mode==7) y+=2; x+=rand(-1,1); end
    if (Mode==8) x-=2+rand(-1,1); y+=2+rand(-1,1);end

    if (Mode==9) x+=2; y-=3; y+=rand(-1,1); end
    if (Mode==10) x-=2; y-=3; y+=rand(-1,1); end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=50;
      if (PlayerFish==3) SneakBoostOn=0; end
      return;
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=50;
      return;
    end

    frame;
  until(collision(LevelCheckID) or FadeCounter==1000);
  if (Mode==9 or Mode==10)
    repeat size+=3; alpha-=10; frame(40); until(alpha<50);
    return;
  end
  AquaMineShotBounce(x,y,z,Mode);
end




process AquaMineShotBounce(x,y,z,Mode);
begin
  ctype=c_scroll; graph=130;
  repeat
    alpha-=20;
    if (Mode==5) x-=1; y+=rand(-1,1); end
    if (Mode==6) x-=1+rand(-1,1); y-=1+rand(-1,1); end
    if (Mode==7) y-=1; x+=rand(-1,1); end
    if (Mode==8) x+=1+rand(-1,1); y-=1+rand(-1,1); end
    if (Mode==1) x+=1; y+=rand(-1,1); end
    if (Mode==2) x+=1+rand(-1,1); y+=1+rand(-1,1); end
    if (Mode==3) y+=1; x+=rand(-1,1); end
    if (Mode==4) x-=1+rand(-1,1); y+=1+rand(-1,1);end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=20;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=20;
    end

    frame;
  until(alpha<20);
end



process CarryJellicon(x,y,z,Mode);
private
  int AnimationCounter;
  int AnimationDelay;
  int GelatinumCubeID;
  int DelayCounter;
begin
  ctype=c_scroll;

  loop
    if (Mode==1)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>310) x--; end if (x<310) x++; end
        if (y>290) y--; end if (y<290) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==310 and y==290)
      GelatinumCubeID=GelatinumCube();
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>310) x--; end if (x<310) x++; end
        if (y>210) y--; end if (y<210) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==310 and y==210)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>120) x--; end if (x<120) x++; end
        if (y>320) y--; end if (y<320) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==120 and y==320)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>-70) x--; end if (x<-70) x++; end
        if (y>320) y--; end if (y<320) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==-70 and y==320)
      signal(GelatinumCubeID, s_kill);
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>120) x--; end if (x<120) x++; end
        if (y>320) y--; end if (y<320) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==120 and y==320)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>310) x--; end if (x<310) x++; end
        if (y>200) y--; end if (y<200) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==310 and y==200)
    end

    if (Mode==2)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>480) x--; end if (x<480) x++; end
        if (y>260) y--; end if (y<260) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==480 and y==260)
      GelatinumCubeID=GelatinumCube();
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>480) x--; end if (x<480) x++; end
        if (y>300) y--; end if (y<300) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==480 and y==300)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>480) x--; end if (x<480) x++; end
        if (y>260) y--; end if (y<260) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==480 and y==260)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>230) x--; end if (x<230) x++; end
        if (y>260) y--; end if (y<260) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==230 and y==260)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>210) x--; end if (x<210) x++; end
        if (y>320) y--; end if (y<320) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==210 and y==320)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>-50) x--; end if (x<-50) x++; end
        if (y>320) y--; end if (y<320) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==-50 and y==320)
      signal(GelatinumCubeID, s_kill);
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>210) x--; end if (x<210) x++; end
        if (y>320) y--; end if (y<320) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==210 and y==320)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>230) x--; end if (x<230) x++; end
        if (y>260) y--; end if (y<260) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==230 and y==260)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>480) x--; end if (x<480) x++; end
        if (y>260) y--; end if (y<260) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,0); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==480 and y==260)
    end

    if (Mode==3)
      GelatinumCubeID=GelatinumCube();
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>455) x--; end if (x<455) x++; end
        if (y>205) y--; end if (y<205) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==455 and y==205)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>455) x--; end if (x<455) x++; end
        if (y>300) y--; end if (y<300) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==455 and y==300)
      signal(GelatinumCubeID, s_kill); DroppedGelatinumCube();
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>455) x--; end if (x<455) x++; end
        if (y>205) y--; end if (y<205) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==455 and y==205)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>850) x--; end if (x<850) x++; end
        if (y>205) y--; end if (y<205) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==850 and y==205)
      repeat DelayCounter++; frame; until(DelayCounter=>500); DelayCounter=0;
    end

    if (Mode==4)
      GelatinumCubeID=GelatinumCube();
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>235) x--; end if (x<235) x++; end
        if (y>205) y--; end if (y<205) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==235 and y==205)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>235) x--; end if (x<235) x++; end
        if (y>300) y--; end if (y<300) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==235 and y==300)
      signal(GelatinumCubeID, s_kill); DroppedGelatinumCube();
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>235) x--; end if (x<235) x++; end
        if (y>205) y--; end if (y<205) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==235 and y==205)
      repeat
        AnimationDelay++;
        if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=99; end
        if (AnimationCounter==2) graph=100; end
        if (AnimationCounter==3) graph=101; end
        if (AnimationCounter==4) graph=100; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>900) x--; end if (x<900) x++; end
        if (y>205) y--; end if (y<205) y++; end
        if (rand(1,500)==1) JelliconSignal(x,y,z+2,2); end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame;
      until(x==900 and y==205)
    end

    if (Mode==5)
      repeat
        AnimationDelay++;
        if (AnimationDelay==12) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=233; end
        if (AnimationCounter==2) graph=234; end
        if (AnimationCounter==3) graph=235; end
        if (AnimationCounter==4) graph=234; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>670) x--; end if (x<670) x++; end
        if (y>420) y--; end if (y<420) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(1000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,0);
          frame(1000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(200);
      until(x==670 and y==420)
      repeat
        AnimationDelay++;
        if (AnimationDelay==12) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=233; end
        if (AnimationCounter==2) graph=234; end
        if (AnimationCounter==3) graph=235; end
        if (AnimationCounter==4) graph=234; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>670) x--; end if (x<670) x++; end
        if (y>360) y--; end if (y<360) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(1000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,0);
          frame(1000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(200);
      until(x==670 and y==360)
    end

    if (Mode==6)
      repeat
        AnimationDelay++;
        if (AnimationDelay==12) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=233; end
        if (AnimationCounter==2) graph=234; end
        if (AnimationCounter==3) graph=235; end
        if (AnimationCounter==4) graph=234; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>585) x--; end if (x<585) x++; end
        if (y>350) y--; end if (y<350) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,2);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(200);
      until(x==585 and y==350)
      repeat
        AnimationDelay++;
        if (AnimationDelay==12) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=233; end
        if (AnimationCounter==2) graph=234; end
        if (AnimationCounter==3) graph=235; end
        if (AnimationCounter==4) graph=234; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>585) x--; end if (x<585) x++; end
        if (y>260) y--; end if (y<260) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,2);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(200);
      until(x==585 and y==260)
    end

    if (Mode==7)
      repeat
        AnimationDelay++;
        if (AnimationDelay==12) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=233; end
        if (AnimationCounter==2) graph=234; end
        if (AnimationCounter==3) graph=235; end
        if (AnimationCounter==4) graph=234; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>173) x--; end if (x<173) x++; end
        if (y>165) y--; end if (y<165) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,1);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(200);
      until(x==173 and y==165)
      repeat
        AnimationDelay++;
        if (AnimationDelay==12) AnimationCounter++; AnimationDelay=0; end
        if (AnimationCounter==1) graph=233; end
        if (AnimationCounter==2) graph=234; end
        if (AnimationCounter==3) graph=235; end
        if (AnimationCounter==4) graph=234; end
        if (AnimationCounter==5) AnimationCounter=0; end
        if (x>173) x--; end if (x<173) x++; end
        if (y>95) y--; end if (y<95) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,1);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(200);
      until(x==173 and y==95)
    end


    if (Mode==8)
      repeat
        graph=375;
        if (x>195) x--; end if (x<195) x++; end
        if (y>150) y--; end if (y<150) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,1);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(300);
      until(x==195 and y==150)
      repeat
        graph=375;
        if (x>195) x--; end if (x<195) x++; end
        if (y>140) y--; end if (y<140) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(300);
      until(x==195 and y==140)
    end


    if (Mode==9)
      repeat
        graph=376;
        if (x>195) x--; end if (x<195) x++; end
        if (y>110) y--; end if (y<110) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,1);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(300);
      until(x==195 and y==110)
      repeat
        graph=376;
        if (x>195) x--; end if (x<195) x++; end
        if (y>115) y--; end if (y<115) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(300);
      until(x==195 and y==115)
    end


    if (Mode==10)
      repeat
        graph=377;
        if (x>195) x--; end if (x<195) x++; end
        if (y>185) y--; end if (y<185) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          JelliconSignal(x,y-15,z+2,1);
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(300);
      until(x==195 and y==185)
      repeat
        graph=377;
        if (x>195) x--; end if (x<195) x++; end
        if (y>190) y--; end if (y<190) y++; end
        if (rand(1,50)==1) JelliconLight(x,y,z-1); end
        if (rand(1,100)==1)
          frame(2000);
          JelliconLight(x,y,z-1);
          if (exists(type JelliconAttack)==0) JelliconAttack(x,y-15,z+2,0); end
          frame(2000);
        end
        if (collision(type JelliconSignal)) JelliconLight(x,y,z-1); end
        frame(300);
      until(x==195 and y==190)
    end


    frame;
  end
end



process GelatinumCube();
begin
  ctype=c_scroll; graph=230; flags=16; alpha=105; EelLightning();
  repeat
    alpha+=10;
    x=father.x; y=father.y+15;
    frame(50);
  until(alpha=>255)
  loop
    x=father.x; y=father.y+15;
    if (GelatinumItem==0)
      if (collision(PlayerID))
        repeat frame; size-=10; until(size==0)
        GelatinumItem=1;
        TextBox(0); frame(700);
        set_text_color(rgb(255,255,255));
        write(0,6,126,0,"You found a piece of Gelatinum Ore.");
        repeat frame; until(key(_enter) or key(_space))
        return;
      end
    end
    frame;
  end
end



process DroppedGelatinumCube();
begin
  ctype=c_scroll; graph=230; flags=16;
  x=father.x; y=father.y+15;
  repeat
    y+=2;
    if (GelatinumItem==0)
      if (collision(PlayerID))
        repeat frame; size-=10; until(size==0)
        GelatinumItem=1;
        TextBox(0); frame(700);
        set_text_color(rgb(255,255,255));
        write(0,6,126,0,"You found a piece of Gelatinum Ore.");
        repeat frame; until(key(_enter) or key(_space))
        return;
      end
    end
    frame;
  until(collision(LevelCheckID))
  z=9;
  Particle_Splash(x,y,3,2); Particle_Splash(x,y,3,2);
  Particle_Splash(x-5,y,3,2); Particle_Splash(x+5,y,3,2);
  Particle_Splash(x-10,y,3,2); Particle_Splash(x+10,y,3,2);
  repeat
    y+=2;
    alpha-=10;
    frame;
  until(alpha<50)
end



process SwarmJellicon(x,y,z,MoveCounter1,MoveCounter2,Sort,Mode);
private
  int DelayCounter;
  int AnimationCounter;
  int AnimationDelay;
begin
  ctype=c_scroll;

  loop

    MoveCounter1++;
    if (MoveCounter1>0 and MoveCounter1<=50) x++; y++; end
    if (MoveCounter1>50 and MoveCounter1<=100) x++; y--; end
    if (MoveCounter1>100 and MoveCounter1<=150) x--; y--; end
    if (MoveCounter1>150 and MoveCounter1<=200) x--; y++; end
    if (MoveCounter1==201) MoveCounter1=0; end

    if (Mode==1 or Mode==2)
      DelayCounter++;
      if (DelayCounter==4)
        DelayCounter=0;
        MoveCounter2++;
        if (MoveCounter2>0 and MoveCounter2<=150) x++; y++; end
        if (MoveCounter2>150 and MoveCounter2<=300) x++; y--; end
        if (MoveCounter2>300 and MoveCounter2<=450) x--; y--; end
        if (MoveCounter2>450 and MoveCounter2<=600) x--; y++; end
        if (MoveCounter2==601) MoveCounter2=0; end
      end
    end

    AnimationDelay++;
    if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end
    if (Sort==0)
      if (AnimationCounter==1) graph=99; end
      if (AnimationCounter==2) graph=100; end
      if (AnimationCounter==3) graph=101; end
      if (AnimationCounter==4) graph=100; end
      if (AnimationCounter==5) AnimationCounter=0; end
    end
    if (Sort==1)
      if (AnimationCounter==1) graph=102; end
      if (AnimationCounter==2) graph=103; end
      if (AnimationCounter==3) graph=104; end
      if (AnimationCounter==4) graph=104; end
      if (AnimationCounter==5) AnimationCounter=0; end
    end
    if (Sort==2)
      if (AnimationCounter==1) graph=105; end
      if (AnimationCounter==2) graph=106; end
      if (AnimationCounter==3) graph=107; end
      if (AnimationCounter==4) graph=106; end
      if (AnimationCounter==5) AnimationCounter=0; end
    end

    if (Mode==2 and alpha!=0)
      if (get_dist(PlayerID)<250)
        alpha=0; SeekerJellicon(x,y,z,1);
      end
    end

    if (Mode==2 and alpha==0)
      if (son.Control==1) Mode=1; alpha=255; signal(type SeekerJellicon, s_kill); end
    end

    if (collision(type JelliconSignal))
      if (alpha>0) JelliconLight(x,y,z-1); end
    end
    if (rand(1,500)==1)
      if (alpha>0) JelliconSignal(x,y,z+2,Mode); end
    end

    frame;
  end
end



process SeekerJellicon(x,y,z,Mode);
private
  int AnimationCounter;
  int AnimationDelay;
  int Direction;
begin
  ctype=c_scroll; AnimationCounter=1; Direction=1;

  loop
    AnimationDelay++;
    if (AnimationDelay==10) AnimationCounter++; AnimationDelay=0; end

    if (Mode==1)
      if (AnimationCounter==1) graph=102; end
      if (AnimationCounter==2) graph=103; end
      if (AnimationCounter==3) graph=104; end
      if (AnimationCounter==4) graph=104; end
      if (AnimationCounter==5) AnimationCounter=0; end
    end

    if (Direction==1)
      if (get_dist(PlayerID)<30)
        Direction=2;
        JelliconLight(x,y,z-1);
        JelliconSignal(x,y,z+2,1);
        JelliconSignal(x,y,z+2,1);
        JelliconSignal(x,y,z+2,1);
        frame(2000);
      end
      if (x<PlayerX) x++; end
      if (x>PlayerX) x--; end
      if (y>PlayerY) y--; end
      if (y<PlayerY) y++; end
    end
    if (Direction==2) 
      if (x<father.x) x++; end
      if (x>father.x) x--; end
      if (y>father.y) y--; end
      if (y<father.y) y++; end
    end
    if (x==father.x and y==father.y) Control=1; end
    frame;
  end
end



process JelliconLight(x,y,z);
begin
  ctype=c_scroll; graph=father.graph; flags=16; alpha=100;
  repeat
    alpha-=10;
    x=father.x; y=father.y;
    frame(50);
  until(alpha<40)
end



process JelliconSignal(x,y,z,Mode);
private
  int TempID;
  int SearchCounter;
  int StopSearch;
  int TrailCounter;
begin
  ctype=c_scroll; graph=115; flags=16; alpha=200;
  play_wav(MindSignal,0);

  if (Mode==0) StopSearch=rand(1,8); end
  if (Mode==1) StopSearch=rand(1,16); end
  if (Mode==2) StopSearch=rand(1,4); end
  repeat
    TempID=get_id(type SwarmJellicon);
    advance(1);
    SearchCounter++;
  until(SearchCounter==StopSearch)

  repeat
    angle=get_angle(TempID);
    advance(2);
    JelliconSignalTrail(x,y,z+1);
    frame(50);
  until(collision(TempID));
  Control=1;
  repeat
    angle=get_angle(TempID);
    advance(2);
    alpha-=2;
    frame(50);
  until(alpha<40)
end



process JelliconSignalTrail(x,y,z);
begin
  ctype=c_scroll; graph=115; flags=16; alpha=200;
  repeat
    alpha-=4;
    frame;
  until(alpha<40 or father.Control==1)
  repeat alpha-=10; frame(50); until(alpha<40)
end




process JelliconAttack(x,y,z,Mode);
begin
  ctype=c_scroll; graph=214; flags=16; alpha=200;

  repeat
    angle=get_angle(PlayerID);
    advance(2);
    JelliconAttackTrail(x,y,z+1);
    frame(50);
  until(collision(PlayerID));

  Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
  PlayerID.HP-=50;
  if (PlayerFish==3) SneakBoostOn=0; end

  Control=1;
  repeat
    angle=get_angle(PlayerID);
    advance(2);
    alpha-=2;
    frame(50);
  until(alpha<40)
end



process JelliconAttackTrail(x,y,z);
begin
  ctype=c_scroll; graph=214; flags=16; alpha=200;
  repeat
    alpha-=4;
    frame;
  until(alpha<40 or father.Control==1)
  repeat alpha-=10; frame(50); until(alpha<40)
end



process GhostfishHunter(StartX,StartY,z,RangeX,RangeY,Mode);
private
  int ForwardSpeed;
  int BounceCounter;
  int TurnAround;
  int DelayCounter;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll; graph=122; x=StartX; y=StartY;

  loop

    if (ShadowCounter<1) Control=1; end

    if (get_dist(FriendFishID)<200) Control=2; end
    if (get_dist(PlayerID)<200) Control=1; end

    if (Mode==0)
      if (ShadowCounter>0)
        Control=0;
        if (get_dist(FriendFishID)<200) Control=2; end
      end
    end

    if (Mode==1)
      if (ShadowCounter>1)
        Control=0;
        if (get_dist(FriendFishID)<200) Control=2; end
      end
    end

    if (x<StartX-RangeX) Control=0; end
    if (x>StartX+RangeX) Control=0; end
    if (y<StartY-RangeY) Control=0; end
    if (y>StartY+RangeY) Control=0; end

    if (Control==0)
      repeat
        DelayCounter++;
        if (y<StartY) flags=0; y+=1; end
        if (y>StartY) flags=0; y-=1; end
        if (x<StartX) flags=0; x+=1; end
        if (x>StartX) flags=1; x-=1; end
        frame(50);
      until(DelayCounter==120 or x==StartX and y==StartY)
      DelayCounter=0;
    end

    if (Control==1)
      if (y<PlayerY-3) flags=0; y+=3; end
      if (y>PlayerY+3) flags=0; y-=3; end
      if (x<PlayerX-10) flags=0; x+=5; end
      if (x>PlayerX+10) flags=1; x-=5; end
      if (flags==0) GhostFishTrail(x-14,y,z); end
      if (flags==1) GhostFishTrail(x+14,y,z); end
    end

    if (Control==2)
      if (y<FriendFishID.y-3) flags=0; y+=3; end
      if (y>FriendFishID.y+3) flags=0; y-=3; end
      if (x<FriendFishID.x-10) flags=0; x+=5; end
      if (x>FriendFishID.x+10) flags=1; x-=5; end
      if (flags==0) GhostFishTrail(x-14,y,z); end
      if (flags==1) GhostFishTrail(x+14,y,z); end
    end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=10;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=10;
    end

    frame;
  end
end



process GhostFishTrail(x,y,z);
begin
  ctype=c_scroll; graph=123; flags=16; alpha=150;
  repeat
    alpha-=10;
    frame;
  until(alpha<30)
end



process DarkBringer(StartX,StartY,z,Mode);
private
  int ForwardSpeed;
  int BounceCounter;
  int TurnAround;
  int DelayCounter;
  int RangeX;
  int RangeY;
  int AnimationCounter;
  int AuraID;
begin
  ctype=c_scroll; graph=112; x=StartX; y=StartY;
  RangeX=200; RangeY=150; AuraID=DarkbringerAura();
  loop

    if (ShadowCounter<1) Control=1; end

    if (get_dist(FriendFishID)<200) Control=2; end
    if (get_dist(PlayerID)<200) Control=1; end

    if (Mode==0)
      if (ShadowCounter>0)
        Control=0;
        if (get_dist(FriendFishID)<200) Control=2; end
      end
    end

    if (Mode==1)
      if (ShadowCounter>1)
        Control=0;
        if (get_dist(FriendFishID)<200) Control=2; end
      end
    end

    if (collision(type LightSource) or collision(type LightKrillAura) or collision(type LightFishAura))
      play_wav(MindSignal,0);
      repeat
        angle=get_angle(PlayerID)+180000;
        advance(7);
        alpha-=10;
        frame;
      until(alpha<50)
      signal(AuraID, s_kill); DarkBringersDone=1; return;
    end

    if (x<StartX-RangeX) Control=0; end
    if (x>StartX+RangeX) Control=0; end
    if (y<StartY-RangeY) Control=0; end
    if (y>StartY+RangeY) Control=0; end

    if (Control==0)
      repeat
        DelayCounter++;
        if (y<StartY) flags=0; y+=1; end
        if (y>StartY) flags=0; y-=1; end
        if (x<StartX) flags=0; x+=1; end
        if (x>StartX) flags=1; x-=1; end
        frame(50);
      until(DelayCounter==120 or x==StartX and y==StartY)
      DelayCounter=0;
    end

    if (Control==1)
      if (y<PlayerY-3) flags=0; y+=4; end
      if (y>PlayerY+3) flags=0; y-=4; end
      if (x<PlayerX-10) flags=0; x+=5; end
      if (x>PlayerX+10) flags=1; x-=5; end
      if (flags==0) GhostFishTrail(x-14,y,z); end
      if (flags==1) GhostFishTrail(x+14,y,z); end
    end

    if (Control==2)
      if (y<FriendFishID.y-3) flags=0; y+=4; end
      if (y>FriendFishID.y+3) flags=0; y-=4; end
      if (x<FriendFishID.x-10) flags=0; x+=5; end
      if (x>FriendFishID.x+10) flags=1; x-=5; end
      if (flags==0) GhostFishTrail(x-14,y,z); end
      if (flags==1) GhostFishTrail(x+14,y,z); end
    end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=112; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=113; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=114; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=113; end
    if (AnimationCounter==13) AnimationCounter=0; end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=50;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=50;
    end

    frame;
  end
end



process DarkbringerLurker(StartX,StartY,z,Range,Mode);
private
  int ForwardSpeed;
  int AnimationCounter;
  int BounceCounter;
  int TempAngle;
  int GiveUpCounter;
  int AuraID;
  int GoCounter;
begin
  ctype=c_scroll; AuraID=DarkbringerAura();
  x=StartX; y=StartY; graph=112;

  repeat
    angle=get_angle(PlayerID);
    if (Mode==1 and get_dist(PlayerID)<Range and y<PlayerY and x>PlayerX-20 and x<PlayerX+20) GoCounter=1; end
    if (Mode==2 and get_dist(PlayerID)<Range and y>PlayerY and x>PlayerX-20 and x<PlayerX+20) GoCounter=1; end
    if (Mode==3 and get_dist(PlayerID)<Range and x<PlayerX and y>PlayerY-20 and y<PlayerY+20) GoCounter=1; end
    if (Mode==4 and get_dist(PlayerID)<Range and x>PlayerX and y>PlayerY-20 and y<PlayerY+20) GoCounter=1; end
    if (collision(type LightSource) or collision(type LightKrillAura) or collision(type LightFishAura))
      repeat
        angle=get_angle(PlayerID)+180000;
        advance(7);
        alpha-=10;
        frame;
      until(alpha<50)
      signal(AuraID, s_kill); return;
    end
    frame;
  until(GoCounter==1)

  play_wav(Dark,0);
  DarknessBall(x,y+30,3,0); DarknessBall(x+30,y,3,0); DarknessBall(x,y,3,0);
  frame(1000);

  loop

    GiveUpCounter++;
    if (GiveUpCounter==200)
      repeat
        angle=get_angle(PlayerID)+180000;
        advance(6);
        alpha-=10;
        frame;
      until(alpha<50)
      signal(AuraID, s_kill); return;
    end

    if (ShadowCounter<2)
      if (get_dist(PlayerID)<Range)
        TempAngle=get_angle(PlayerID);
        if (angle<TempAngle) angle+=20000; end
        if (angle>TempAngle) angle-=20000; end
        if (ForwardSpeed=>0) ForwardSpeed=6; end
      end
    end

    if (collision(type LightSource) or collision(type LightKrillAura) or collision(type LightFishAura))
      play_wav(MindSignal,0);
      repeat
        angle=get_angle(PlayerID)+180000;
        advance(7);
        alpha-=10;
        frame;
      until(alpha<50)
      signal(AuraID, s_kill); return;
    end


    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=112; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=113; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=114; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=113; end
    if (AnimationCounter==13) AnimationCounter=0; end

    advance(ForwardSpeed);

    if (ForwardSpeed>0) ForwardSpeed--; end
    if (ForwardSpeed<0) ForwardSpeed++; end

    if (angle>360000) angle=0; end
    if (angle<-360000) angle=360000; end

    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=50;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=50;
    end

    frame;
  end
end



process DarknessBall(x,y,z,Mode);
begin
  ctype=c_scroll; alpha=75; graph=96; flags=32; angle=father.angle;
  repeat
    if (rand(1,15)==1) DarkbringerCloud(x,y,z); end
    advance(7);
    frame;
  until(collision(LevelCheckID))
  repeat
    if (rand(1,15)==1) DarkbringerCloud(x,y,z); end
    alpha-=5;
    advance(6);
    frame;
  until(alpha<=0)
  return;
end



process DarkbringerAura();
begin
  ctype=c_scroll; alpha=75; graph=96; flags=32; z=3;
  loop
    x=father.x; y=father.y;
    if (rand(1,15)==1) DarkbringerCloud(x,y,z); end
    frame;
  end
end



process DarkbringerCloud(x,y,z);
begin
  ctype=c_scroll; alpha=0; graph=rand(116,117); flags=32; z=3;
  angle=rand(1,36)*100000; advance(50);
  repeat alpha+=10; advance(1); frame(50); until(alpha==110)
  repeat
    advance(2);
    alpha-=2;
    frame;
  until(alpha<10)
end




process Eelhost(x,y,z,Mode);
private
  int MoveCounter;
  int AnimationCounter;
  int Direction;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll;
  loop
    MoveCounter++;
    if (MoveCounter>0 and MoveCounter<=100) x+=2; Direction=1; end
    if (MoveCounter>100 and MoveCounter<=200) x-=2; Direction=2; end
    if (MoveCounter==201) MoveCounter=0; end
    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2)
      graph=48;
      if (Direction==1) flags=1; end
      if (Direction==2) flags=0; end
    end
    if (AnimationCounter==3 or AnimationCounter==4) graph=49; end
    if (AnimationCounter==5 or AnimationCounter==6) graph=50; end
    if (AnimationCounter==7 or AnimationCounter==8) graph=49; end
    if (AnimationCounter==9 or AnimationCounter==10)
      graph=48;
      if (Direction==1) flags=3; end
      if (Direction==2) flags=2; end
    end
    if (AnimationCounter==11 or AnimationCounter==12) graph=49; end
    if (AnimationCounter==13 or AnimationCounter==14) graph=50; end
    if (AnimationCounter==15 or AnimationCounter==16) graph=49; end
    if (AnimationCounter==17) AnimationCounter=0; end

    if (rand(1,30)==1) play_wav(Zap,0); EelLightning(); end

    if (SpawnItem==1)
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
    end

    if (collision(PlayerID))
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=10; if (rand(1,2)==1) EelLightning(); end
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=10; if (rand(1,2)==1) EelLightning(); end
    end

    frame;
  end
end



process EelLightning();
begin
  ctype=c_scroll; graph=51; alpha=0; flags=16+rand(0,3); z=father.z-1;
  repeat
    x=father.x;
    y=father.y;
    alpha+=10;
    frame(20);
  until(alpha=>100)
  repeat
    x=father.x;
    y=father.y;
    alpha-=10;
    frame(20);
  until(alpha<=0)  
end



process Octoling(x,y,z,Mode,ShotCounter);
private
  int DelayCounter;
begin

  if (Mode==0 or Mode==1 or Mode==2 or Mode==3)
    ctype=c_scroll; graph=82; flags=Mode;
    loop
      ShotCounter++;
      if (ShotCounter==100)
        if (Mode==0 or Mode==1) OctoShot(x,y-4,z+1,Mode); end
        if (Mode==2 or Mode==3) OctoShot(x,y+5,z+1,Mode); end
        ShotCounter=0;
      end
      frame;
    end
  end

  if (Mode==4)
    ctype=c_scroll; graph=125;
    loop
      DelayCounter++;
      if (DelayCounter==90) frame(2000); DelayCounter=0; end
      ShotCounter++;
      if (ShotCounter==2) OctoShot2(x-1,y+8,z+1,0); ShotCounter=0; end
      frame;
    end
  end
end



process OctoShot(x,y,z,Mode);
begin
  ctype=c_scroll; graph=83; flags=16; size=75;
  play_wav(Splash,0);
  repeat
    if (Mode==0) x+=5; y-=5; end
    if (Mode==1) x-=5; y-=5; end
    if (Mode==2) x+=5; y+=5; end
    if (Mode==3) x-=5; y+=5; end
    if (size<100) size++; end
    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=50; z++;
      if (PlayerFish==3) SneakBoostOn=0; end
      repeat size+=3; alpha-=10; frame(40); until(alpha<50);
      return;
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=50; z++;
      repeat size+=3; alpha-=10; frame(40); until(alpha<50);
      return;
    end
    frame;
  until(collision(LevelCheckID))
  repeat size+=3; alpha-=10; frame(40); until(alpha<50);
end



process OctoShot2(x,y,z,Mode);
begin
  ctype=c_scroll; graph=126; flags=16+rand(0,3); size_y=70;
  repeat
    y+=2;
    if (size_y<100) size_y++; end
    if (collision(PlayerID))
      play_wav(Hurt,0);
      Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
      PlayerID.HP-=2;
      if (PlayerFish==3) SneakBoostOn=0; end
    end
    if (collision(FriendFishID))
      Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
      FriendFishID.HP-=2;
    end
    frame;
  until(collision(LevelCheckID))
  repeat size+=5; alpha-=10; frame(40); until(alpha<50);
end



process Crab(x,y,z,Mode);
private
  int Direction;
  int AnimationCounter,
begin
  ctype=c_scroll; graph=364;
  loop
    Direction++;
    if (Direction>0 and Direction<=80) x+=2; flags=0; end
    if (Direction>80 and Direction<=160) x-=2; flags=1; end
    if (Direction==161) Direction=0; end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=364; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=365; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=366; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=365; end
    if (AnimationCounter==13) AnimationCounter=0; end
    frame;
  end
end



process GasSpawner(x,y,z,Mode);
private
  int SpawnCounter;
begin
  loop
    SpawnCounter++;
    if (SpawnCounter==20) GasSpirit(x+rand(-10,10),y+rand(-3,3),z,10,Mode); end
    if (SpawnCounter==40) GasSpirit(x+rand(-10,10),y+rand(-3,3),z,20,Mode); end
    if (SpawnCounter==60) GasSpirit(x+rand(-10,10),y+rand(-3,3),z,30,Mode); end
    if (SpawnCounter==120) SpawnCounter=0; end
    frame;
  end
end



process GasSpirit(x,y,z,MoveCounter,Mode);
begin
  ctype=c_scroll; graph=84; flags=16; alpha=0;
  if (Mode==1) graph=140; end
  repeat alpha+=10; y--; frame; until(alpha==150)
  repeat
    MoveCounter++;
    if (MoveCounter>0 and MoveCounter<30) if (MoveCounter%2==0) x--; end end
    if (MoveCounter>30 and MoveCounter<60) if (MoveCounter%2==0) x++; end end
    if (MoveCounter==66) MoveCounter=0; end
    y--;
    if (collision(PlayerID))
      play_wav(Mine,0);
      if (Mode==0) PlayerID.HP-=50; if (PlayerFish==3) SneakBoostOn=0; end z++; end
      if (Mode==1) PlayerID.HP-=75; if (PlayerFish==3) SneakBoostOn=0; end z++; end
      repeat size+=3; alpha-=10; frame(40); until(alpha<50);
      return;
    end
    if (collision(FriendFishID))
      play_wav(Mine,0);
      if (Mode==0) FriendFishID.HP-=50; z++; end
      if (Mode==1) FriendFishID.HP-=75; z++; end
      repeat size+=3; alpha-=10; frame(40); until(alpha<50);
      return;
    end
    frame;
  until(collision(LevelCheckID))
  repeat size+=3; alpha-=10; frame(40); until(alpha<50);
end




process Selachimorph(StartX,StartY,z,RangeY,RangeX,AreaEffect,Mode);
private
  int ForwardSpeed;
  int BounceCounter;
  int DelayCounter;
  int AnimationCounter;
begin
  ctype=c_scroll; graph=315; x=StartX; y=StartY;
  loop

    if (ShadowCounter<1) Control=1; end

    if (get_dist(FriendFishID)<AreaEffect) Control=2; end
    if (get_dist(PlayerID)<AreaEffect) Control=1; end

    if (Mode==0)
      if (ShadowCounter>0)
        Control=0;
        if (get_dist(FriendFishID)<AreaEffect) Control=2; end
      end
    end

    if (Mode==1)
      if (ShadowCounter>1)
        Control=0;
        if (get_dist(FriendFishID)<AreaEffect) Control=2; end
      end
    end

    if (x<StartX-RangeX) Control=0; end
    if (x>StartX+RangeX) Control=0; end
    if (y<StartY-RangeY) Control=0; end
    if (y>StartY+RangeY) Control=0; end

    if (Control==0)
      repeat
        DelayCounter++;
        if (y<StartY) flags=0; y+=1; end
        if (y>StartY) flags=0; y-=1; end
        if (x<StartX) flags=0; x+=1; end
        if (x>StartX) flags=1; x-=1; end
        frame(50);
      until(DelayCounter==120 or x==StartX and y==StartY)
      DelayCounter=0;
    end

    if (Control==1)
      if (Mode==0)
        if (y<PlayerY-3) flags=0; y+=4; end
        if (y>PlayerY+3) flags=0; y-=4; end
        if (x<PlayerX-10) flags=0; x+=5; end
        if (x>PlayerX+10) flags=1; x-=5; end
      end
      if (Mode==1)
        if (y<PlayerY-3) flags=0; y+=3; end
        if (y>PlayerY+3) flags=0; y-=3; end
        if (x<PlayerX-10) flags=0; x+=4; end
        if (x>PlayerX+10) flags=1; x-=4; end
      end
    end

    if (Control==2)
      if (Mode==0)
        if (y<FriendFishID.y-3) flags=0; y+=4; end
        if (y>FriendFishID.y+3) flags=0; y-=4; end
        if (x<FriendFishID.x-10) flags=0; x+=5; end
        if (x>FriendFishID.x+10) flags=1; x-=5; end
      end
      if (Mode==1)
        if (y<FriendFishID.y-3) flags=0; y+=3; end
        if (y>FriendFishID.y+3) flags=0; y-=3; end
        if (x<FriendFishID.x-10) flags=0; x+=4; end
        if (x>FriendFishID.x+10) flags=1; x-=4; end
      end
    end

    AnimationCounter++;
    if (AnimationCounter==1 or AnimationCounter==2 or AnimationCounter==3) graph=367; end
    if (AnimationCounter==4 or AnimationCounter==5 or AnimationCounter==6) graph=368; end
    if (AnimationCounter==7 or AnimationCounter==8 or AnimationCounter==9) graph=369; end
    if (AnimationCounter==10 or AnimationCounter==11 or AnimationCounter==12) graph=368; end
    if (AnimationCounter==13) AnimationCounter=0; end

    if (Control==0)
      BounceCounter++;
      if (BounceCounter>0 and BounceCounter<100) x--; flags=1; end
      if (BounceCounter>100 and BounceCounter<200) x++; flags=0; end
      if (BounceCounter==201) BounceCounter=0; end
    end

    if (Mode==0)
      if (collision(PlayerID))
        play_wav(Hurt,0);
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=50;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=50;
      end
    end
    if (Mode==1)
      if (collision(PlayerID))
        play_wav(Hurt,0);
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=5;
        if (PlayerFish==3) SneakBoostOn=0; end
      end
    end

    frame;
  end
end




process Selachimorph2(x,y,z,Mode);
private
  int ForwardSpeed;
  int MoveCounter;
  int DelayCounter;
  int AnimationCounter;
  int AnimationDelay;
  int DarkBallCounter;
  int DarkBallID;
begin
  ctype=c_scroll; graph=315;
  loop

  if (Mode==1)
    repeat
      flags=0;
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>850) x--; end if (x<850) x++; end
      if (y>140) y--; end if (y<140) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==850 and y==140)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>1070) x--; end if (x<1070) x++; end
      if (y>200) y--; end if (y<200) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==1070 and y==200)

    repeat
      flags=1;
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>1022) x--; end if (x<1022) x++; end
      if (y>410) y--; end if (y<410) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==1022 and y==410)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>815) x--; end if (x<815) x++; end
      if (y>431) y--; end if (y<431) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==815 and y==431)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>688) x--; end if (x<688) x++; end
      if (y>234) y--; end if (y<234) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==688 and y==234)
   end


  if (Mode==2)
    flags=1;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>875) x--; end if (x<875) x++; end
      if (y>403) y--; end if (y<403) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==875 and y==403)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>704) x--; end if (x<704) x++; end
      if (y>455) y--; end if (y<455) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==704 and y==455)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>665) x--; end if (x<665) x++; end
      if (y>479) y--; end if (y<479) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==665 and y==479)

    repeat
      flags=0;
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>734) x--; end if (x<734) x++; end
      if (y>584) y--; end if (y<584) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==734 and y==584)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>809) x--; end if (x<809) x++; end
      if (y>622) y--; end if (y<622) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==809 and y==622)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>1011) x--; end if (x<1011) x++; end
      if (y>670) y--; end if (y<670) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==1011 and y==670)

    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>1030) x--; end if (x<1030) x++; end
      if (y>553) y--; end if (y<553) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==1030 and y==553)
  end


  if (Mode==3)
    flags=1;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>418) x--; end if (x<418) x++; end
      if (y>510) y--; end if (y<510) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==418 and y==510)
    flags=0;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>550) x--; end if (x<550) x++; end
      if (y>510) y--; end if (y<510) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==550 and y==510)
  end


  if (Mode==4)
    flags=1;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>200) x--; end if (x<200) x++; end
      if (y>700) y--; end if (y<700) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==200 and y==700)
    flags=0;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>480) x--; end if (x<480) x++; end
      if (y>700) y--; end if (y<700) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==480 and y==700)
  end


  if (Mode==5)
    flags=1;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>190) x--; end if (x<190) x++; end
      if (y>335) y--; end if (y<335) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==190 and y==335)
    flags=0;
    repeat
      AnimationDelay++;
      if (AnimationDelay==3) AnimationCounter++; AnimationDelay=0; end
      if (AnimationCounter==1) graph=367; end
      if (AnimationCounter==2) graph=368; end
      if (AnimationCounter==3) graph=369; end
      if (AnimationCounter==4) graph=368; end
      if (AnimationCounter==5) AnimationCounter=0; end
      if (x>460) x--; end if (x<460) x++; end
      if (y>335) y--; end if (y<335) y++; end
      if (get_dist(PlayerID)<80 and ShadowCounter==0)
        signal(PlayerID, s_freeze);
        repeat
          if (x<PlayerX) x++; flags=0; end
          if (x>PlayerX) x--; flags=1; end
          if (y<PlayerY) y++; end
          if (y>PlayerY) y--; end
          frame(25);
        until(get_dist(PlayerID)<20)
        fade(0,0,0,16);
        frame(5000); frame(2000);
        Area34(1162,475,0);
      end
      if (collision(type DarkBall))
        DarkBallCounter=150;
        DarkBallID=AttachedDarkBall(x,y,z,0);
        repeat
          if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
          DarkBallCounter--;
          frame;
        until(DarkBallCounter==0)
        DarkBallID.Control=1;
      end
      frame(50);
    until(x==460 and y==335)
  end

    frame;
  end
end



process Selachimorph3(x,y,z,Mode);
private
  int BounceCounter;
  int DarkBallID;
begin
  ctype=c_scroll; graph=315;
  loop
    BounceCounter++;
    if (BounceCounter>0 and BounceCounter<100) x--; flags=1; end
    if (BounceCounter>100 and BounceCounter<200) x++; flags=0; end
    if (BounceCounter==201) BounceCounter=0; end

    if (collision(type DarkBall))
      SarkMemory=1; SpawnItemWarning();
      DarkBallID=AttachedDarkBall(x,y,z,0);
      loop
        if (exists(type FriendFishExpression)==0) FriendFishExpression(370,0); end
        frame;
      end
    end

    frame;
  end
end



process BlackLurkerBaby(x,y,z,Mode);
begin
  ctype=c_scroll; graph=396; alpha=0;
  repeat alpha+=5; frame(25); until(alpha=>255)

  loop
    if (x<PlayerX) x++; end
    if (x>PlayerX) x--; end
    if (y>PlayerY-10) y--; end
    if (y<PlayerY+10) y++; end

    if (x<PlayerX) flags=1; end
    if (x>PlayerX) flags=0; end

    if (collision(PlayerID))
      if (x<PlayerX) Control=1; end
      if (x>PlayerX) Control=2; end
    end

    if (collision(LevelCheckID))
      repeat alpha-=10; frame(50); until(alpha<=0)
      BlackLurkerBaby(210,240,3,0); return;
    end

    if (Control==1)
      flags=1;
      x=PlayerX-60;
      y=PlayerY-10;
      HP++;
    end

    if (Control==2)
      flags=0;
      x=PlayerX+60;
      y=PlayerY-10;
      HP++;
    end

    if (HP==100)
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=397; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=398; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=399; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=400; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=401; frame(200);
      if (Control==1) x+=5; end
      if (Control==2) x-=5; end

      graph=400; frame(200);
      if (Control==1) x+=5; end
      if (Control==2) x-=5; end
      graph=399; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=398; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=397; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      graph=396; frame(100);
      if (Control==1) x+=4; end
      if (Control==2) x-=4; end
      loop
        play_wav(Hurt,0);
        if (Control==1) PlayerID.x=x+30; end
        if (Control==2) PlayerID.x=x-30; end
        PlayerID.y=y-10;
        if (PlayerID.HP=>0) PlayerID.HP-=25; end
        frame;
      end
    end
    frame;
  end
end







process DirectionBlob(StartX,StartY,z,Mode);
private
  int ForwardSpeed;
  int TempAngle;
  int TempID;
  int BounceCounter;
begin
  ctype=c_scroll; graph=159; flags=16;
  x=StartX; y=StartY;

  repeat
    BounceCounter++;
    if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
    if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
    if (BounceCounter==11) BounceCounter=0; end
    frame;
  until(get_dist(PlayerID)<70)

  if (Mode==1)
    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,980,956);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,980,956)<15)
    angle=0; x=980; y=956;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,978,638);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,978,638)<15)
    angle=0; x=978; y=638;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)
  end


  if (Mode==2)
    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,736,810);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,736,810)<15)
    angle=0; x=736; y=810;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,594,715);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,594,715)<15)
    angle=0; x=594; y=715;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,444,572);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,444,572)<15)
    angle=0; x=444; y=572;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,298,670);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,298,670)<15)
    angle=0; x=298; y=670;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,304,468);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,304,468)<15)
    angle=0; x=304; y=468;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,450,362);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,450,362)<15)
    angle=0; x=450; y=362;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,590,470);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,590,470)<15)
    angle=0; x=590; y=470;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)
  end


  if (Mode==3)
    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1248,812);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1248,812)<15)
    angle=0; x=1248; y=812;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1434,626);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1434,626)<15)
    angle=0; x=1434; y=626;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1544,504);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1544,504)<15)
    angle=0; x=1544; y=504;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1674,378);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1674,378)<15)
    angle=0; x=1674; y=378;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1794,516);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1794,516)<15)
    angle=0; x=1794; y=516;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1860,318);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1860,318)<15)
    angle=0; x=1860; y=318;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1682,194);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1682,194)<15)
    angle=0; x=1682; y=194;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1494,310);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1494,310)<15)
    angle=0; x=1494; y=310;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)
  end

  if (Mode==4)
    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,884,418);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,884,418)<15)
    angle=0; x=884; y=418;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,788,312);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,788,312)<15)
    angle=0; x=788; y=312;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,754,168);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,754,168)<15)
    angle=0; x=754; y=168;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,846,46);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,846,46)<15)
    angle=0; x=846; y=46;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1012,46);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1012,46)<15)
    angle=0; x=1012; y=46;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1124,138);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1124,138)<15)
    angle=180000; x=1124; y=138;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,1090,265);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=11; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,1090,265)<50)
    angle=0; x=1090; y=265;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,978,310);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,978,310)<15)
    angle=0; x=978; y=310;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,892,238);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,892,238)<15)
    angle=0; x=892; y=238;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

    play_wav(Jump,0);
    repeat
      TempAngle=fget_angle(x,y,960,156);
      if (angle<TempAngle) angle+=20000; end
      if (angle>TempAngle) angle-=20000; end
      if (ForwardSpeed=>0) ForwardSpeed=12; end
      advance(ForwardSpeed);
      if (angle>360000) angle=0; end
      if (angle<-360000) angle=0; end
      DirectionBlobTrail(x,y,z);
      frame;
    until (fget_dist(x,y,960,156)<15)
    angle=0; x=960; y=156;
    repeat
      BounceCounter++;
      if (BounceCounter==1 or BounceCounter==2 or BounceCounter==3 or BounceCounter==4 or BounceCounter==5) y--; end
      if (BounceCounter==6 or BounceCounter==7 or BounceCounter==8 or BounceCounter==9 or BounceCounter==10) y++; end
      if (BounceCounter==11) BounceCounter=0; end
      frame;
    until(get_dist(PlayerID)<90)

  end

  CreateBlobSpread(x,y,z);
  DirectionBlob(StartX,StartY,z,Mode);
  repeat alpha-=10; frame; until(alpha<50)
  return;
end


process DirectionBlobTrail(x,y,z);
begin
  ctype=c_scroll; graph=159; flags=16; alpha=250;
  repeat alpha-=50; frame; until(alpha<=0)
end



function CreateBlobSpread(x,y,z);
begin
  play_wav(Jump2,0);
  BlobSpread(x,y,z); BlobSpread(x,y,z);
  BlobSpread(x,y,z); BlobSpread(x,y,z);
  BlobSpread(x,y,z); BlobSpread(x,y,z);
  BlobSpread(x,y,z); BlobSpread(x,y,z);
  BlobSpread(x,y,z); BlobSpread(x,y,z);
end



process BlobSpread(x,y,z);
private
  int Speed;
begin
  ctype=c_scroll; graph=159; flags=16; alpha=200; angle=(rand(1,360)*1000); Speed=rand(10,12);
  repeat
    advance(Speed);
    if (rand(1,2)==1) if (Speed>3) Speed--; end end
    alpha-=5;
    frame;
    until(alpha<=30)
  return;
end



process Gelollynoms(x,y,z,StopX,Mode);
private
  int SpeedCounter;
  int DelayCounter;
  int DriftCounter;
  int AnimationCounter;
begin
  ctype=c_scroll; graph=86; flags=16; alpha=200;
  if (Mode==2) size=250; end
  if (Mode==3) size=500; end
  repeat
    DelayCounter++;
    if (DelayCounter==12) SpeedCounter--; DelayCounter=0; AnimationCounter++; end
    if (SpeedCounter>0) x+=SpeedCounter; y+=SpeedCounter/2; end
    if (SpeedCounter==-1) SpeedCounter=1+Mode; end
    DriftCounter++;
    if (DriftCounter>0 and DriftCounter<30) if (DriftCounter%2==0) y--; end end
    if (DriftCounter>30 and DriftCounter<60) if (DriftCounter%2==0) y++; end end
    if (DriftCounter==61) DriftCounter=0; end
    if (AnimationCounter==1) graph=86; end
    if (AnimationCounter==2) graph=87; end
    if (AnimationCounter==3) graph=88; end
    if (AnimationCounter==4) graph=87; end
    if (AnimationCounter==5) AnimationCounter=0; end
    if (rand(0,20)==1) alpha=250; end
    if (alpha>200) alpha-=2; end
    frame;
  until(x>StopX)
end



process Gelollynoms2(x,y,z,Mode);
private
  int SpeedCounter;
  int DelayCounter;
  int DriftCounter;
  int AnimationCounter;
begin
  ctype=c_scroll; graph=198; flags=16; alpha=200;
  if (Mode==2) size=250; end
  if (Mode==3) size=500; end
  repeat
    DelayCounter++;
    if (DelayCounter==12) SpeedCounter--; DelayCounter=0; AnimationCounter++; end
    if (SpeedCounter>0) x+=SpeedCounter/2; y-=SpeedCounter; end
    if (SpeedCounter==-1) SpeedCounter=1+Mode; end
    DriftCounter++;
    if (DriftCounter>0 and DriftCounter<30) if (DriftCounter%2==0) x--; end end
    if (DriftCounter>30 and DriftCounter<60) if (DriftCounter%2==0) x++; end end
    if (DriftCounter==61) DriftCounter=0; end
    if (AnimationCounter==1) graph=198; end
    if (AnimationCounter==2) graph=199; end
    if (AnimationCounter==3) graph=200; end
    if (AnimationCounter==4) graph=199; end
    if (AnimationCounter==5) AnimationCounter=0; end
    if (rand(0,20)==1) alpha=250; end
    if (alpha>200) alpha-=2; end
    frame;
  until(y<-100)
end



process StingRay(x,y,z,StopX,Mode);
private
  int SpeedCounter;
  int DelayCounter;
  int DriftCounter;
  int AnimationCounter;
begin
  ctype=c_scroll; graph=283; flags=16;
  if (Mode==1) size=200; end
  repeat
    DelayCounter++;
    if (DelayCounter==12) SpeedCounter--; DelayCounter=0; AnimationCounter++; end
    if (SpeedCounter>0) x+=SpeedCounter; y+=SpeedCounter/2; end
    if (SpeedCounter==-1) SpeedCounter=4+Mode; end
    DriftCounter++;
    if (DriftCounter>0 and DriftCounter<30) if (DriftCounter%2==0) y--; end end
    if (DriftCounter>30 and DriftCounter<60) if (DriftCounter%2==0) y++; end end
    if (DriftCounter==61) DriftCounter=0; end
    if (AnimationCounter==1) graph=284; end
    if (AnimationCounter==2) graph=283; end
    if (AnimationCounter==3) graph=285; end
    if (AnimationCounter==4) graph=283; end
    if (AnimationCounter==5) AnimationCounter=0; end
    frame;
  until(x>StopX)
end



process SmallBubble(x,y,z,Mode);
begin
  ctype=c_scroll; graph=25; flags=16;
  if (Mode==1) alpha=200; end
  if (Mode==2) alpha=100; end
  if (Mode==3) size=50; alpha=100; end
  if (Mode==4) size=20; alpha=100; end
  repeat
    if (Mode==1 or Mode==4) y-=rand(1,2); alpha-=10; end
    if (Mode==2 or Mode==3) alpha-=10; end
    frame;
  until(alpha<30)
end



process BounceAmoeba(x,y,z,angle,Control,Mode);
private
  int BounceCounter;
begin
  if (Mode==0 or Mode==1) ctype=c_scroll; graph=38; flags=16; end
  if (Mode==2) ctype=c_scroll; graph=308; flags=16; end
  if (Mode==3) ctype=c_scroll; graph=309; flags=16; end
  loop
    if (BounceCounter==19) play_wav(Boing,0); end
    if (HP==1) BounceCounter=20; HP=0; end
    if (BounceCounter>0) BounceCounter--; size=rand(90,110); end
    if (BounceCounter==0) size=100; end
    if (ArcadeSeaOn==1)
      if (collision(type ArcadeCounter)) LightWave(x,y,3,Mode); frame(200); LightWave(x,y,3,Mode); frame(200); LightWave(x,y,3,Mode); frame(200); end
    end
    frame;
  end
end



process Microbe(x,Start_Y,z,Mode);
private
  int SpeedCounter;
  int DelayCounter;
  int MoveCounter;
begin
  ctype=c_scroll; graph=33; y=Start_Y; MicrobeGlow();

  if (Mode==1)
    loop
      SpeedCounter=0;
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter<6) SpeedCounter++; end
          DelayCounter=0;
        end
        y-=SpeedCounter;
        MoveCounter++;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y<=Start_Y-100)
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter>1) SpeedCounter--; end
          DelayCounter=0;
        end
        y-=SpeedCounter;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y<=Start_Y-200)
      SpeedCounter=0;
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter<6) SpeedCounter++; end
          DelayCounter=0;
        end
        y+=SpeedCounter;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y=>Start_Y-100)
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter>1) SpeedCounter--; end
          DelayCounter=0;
        end
        y+=SpeedCounter;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y=>Start_Y)
      frame;
    end
  end

  if (Mode==2)
    loop
      SpeedCounter=0;
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter<6) SpeedCounter++; end
          DelayCounter=0;
        end
        y+=SpeedCounter;
        MoveCounter++;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y=>Start_Y+100)
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter>1) SpeedCounter--; end
          DelayCounter=0;
        end
        y+=SpeedCounter;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y=>Start_Y+200)
      SpeedCounter=0;
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter<6) SpeedCounter++; end
          DelayCounter=0;
        end
        y-=SpeedCounter;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y<=Start_Y+100)
      repeat
        DelayCounter++;
        if (DelayCounter==4)
          if (SpeedCounter>1) SpeedCounter--; end
          DelayCounter=0;
        end
        y-=SpeedCounter;
        if (MoveCounter>0 and MoveCounter<=5) x++; end
        if (MoveCounter>5 and MoveCounter<=10) x--; end
        if (MoveCounter>10) MoveCounter=0; end
        frame;
      until(y<=Start_Y)
      frame;
    end
  end
end



process MicrobeGlow();
begin
  ctype=c_scroll; graph=29; z=father.z+1;
  loop
    x=father.x;
    y=father.y;
    alpha=rand(50,150);
    frame;
  end
end



process Blob(x,y,z);
private
  int Counter;
  int TouchPlayer;
  int DelayCounter;
begin
  ctype=c_scroll; graph=26; alpha=100; size=100; frame(5000);
  loop
    Control=1;
    Counter=0;
    repeat
      Counter++;
      size+=Counter;
      alpha+=Counter;
      frame;
    until(alpha>200)
    BlobLight();
    repeat
      if (TouchPlayer==0 and collision(PlayerID))
        play_wav(Jump2,0); TouchPlayer=1;
      end frame(0);
      if (collision(PlayerID)==0) TouchPlayer=0; end frame(0);
      DelayCounter++;
      frame;
    until(DelayCounter==100); DelayCounter=0;
    repeat
      size-=3;
      if (alpha>100) alpha-=3; end
      if (TouchPlayer==0 and collision(PlayerID))
        play_wav(Jump2,0); TouchPlayer=1;
      end frame(0);
      if (collision(PlayerID)==0) TouchPlayer=0; end frame(0);
      frame;
    until(size<=100)
    size=100; alpha=100;
    Control=0;
    frame(12000);
  end
end



process BlobLight();
begin
  ctype=c_scroll; graph=26; x=father.x; y=father.y; z=father.z-1; flags=16; size=father.size+10; alpha=0;
  repeat
    alpha+=10;
    frame(50);
  until(alpha>200)
  frame(7000);
  repeat alpha-=5; size=father.size+10; frame; until(alpha<20)
end



process MiniBlob(x,y,z,graph);
private
  int Direction;
  int BlobID;
begin
  ctype=c_scroll; Direction=rand(-5000,5000); DisplayMiniBlob(z,graph); alpha=0;
  loop
    if (rand(1,40)==1) Direction=rand(-5000,5000); end
    angle+=Direction;
    advance(2);
    if (y<5 or y>1000 or x<5 or x>1915) angle-=180000; end
    if (BlobID=collision(type Blob))
      angle=(get_angle(BlobID)+180000);
      advance(2);
    end frame(0);

    if (angle>720000) angle=0+angle-720000; end
    if (angle<-720000) angle=0+angle+720000; end

    frame;
  end
end


process DisplayMiniBlob(z,graph);
begin
  ctype=c_scroll;
  loop
    x=father.x; y=father.y; alpha=150;
    if (rand(1,20)==1) MiniBlobLight(z-1); end
    frame;
  end
end



process MiniBlobLight(z);
begin
  ctype=c_scroll; graph=father.graph; flags=16; alpha=0;
  repeat
    x=father.x; y=father.y;
    alpha+=10;
    frame(50);
  until(alpha>200)
  repeat alpha-=5; x=father.x; y=father.y; frame(50); until(alpha<40)
end



process IntroBubble(x,y,size);
begin
  ctype=c_scroll; z=1; graph=25; alpha=200; flags=16;
  if (size==100) IntroBubble(x,y+11,80); end
  if (size==80) IntroBubble(x,y+17,60); end
  repeat
    y-=2;
    if (rand(1,3)==1) x+=rand(-1,1); end
    frame;
  until(y<-10)
end



process TextBox(Selections);
begin
  graph=173; x=160; y=180; z=1; size_y=10; alpha=0;
  delete_text(0);
  repeat
    alpha+=15;
    size_y+=10;
    frame;
  until(size_y==100)

  if (Selections>0) Selector(Selections); end
  repeat frame; until(key(_enter) or key(_space))
  if (exists(type Selector)) signal(type Selector, s_kill); end

  delete_text(0);
  repeat
    alpha-=15;
    size_y-=10;
    frame;
  until(size_y==10)
end



process Selector(Selections);
private
  int State;
begin
  graph=174; x=160; flags=16; alpha=100; Selection=0;
  if (Selections==2)
    graph=174; y=140; State=1;
    repeat
      if (key(_up) or key(_w)) State--; frame; end
      if (key(_down) or key(_s)) State++; frame; end
      if (State==0) State=2; end
      if (State==3) State=1; end
      if (State==1 and y>140) repeat y--; frame(20); until(y==140) end
      if (State==2 and y<180) repeat y++; frame(20); until(y==180) end
      frame;
    until(key(_enter) or key(_space))
    Selection=State;
    repeat alpha-=10; size_y-=5; frame(50); until(alpha<20)
    return;
  end
  if (Selections==3)
    graph=174; y=140; State=1;
    repeat
      if (key(_up) or key(_w)) State--; frame; end
      if (key(_down) or key(_s)) State++; frame; end
      if (State==0) State=3; end
      if (State==4) State=1; end
      if (State==1 and y>140) repeat y--; frame(20); until(y==140) end
      if (State==2 and y>180) repeat y--; frame(20); until(y==180) end
      if (State==2 and y<180) repeat y++; frame(20); until(y==180) end
      if (State==3 and y<220) repeat y++; frame(20); until(y==220) end
      frame;
    until(key(_enter) or key(_space))
    Selection=State;
    repeat alpha-=10; size_y-=5; frame(50); until(alpha<20)
    return;
  end
  if (Selections==4)
    graph=176; y=135; State=1;
    repeat
      if (key(_up) or key(_w)) State--; frame; end
      if (key(_down) or key(_s)) State++; frame; end
      if (State==0) State=4; end
      if (State==5) State=1; end
      if (State==1 and y>135) repeat y--; frame(20); until(y==135) end
      if (State==2 and y>165) repeat y--; frame(20); until(y==165) end
      if (State==2 and y<165) repeat y++; frame(20); until(y==165) end
      if (State==3 and y>195) repeat y--; frame(20); until(y==195) end
      if (State==3 and y<195) repeat y++; frame(20); until(y==195) end
      if (State==4 and y<225) repeat y++; frame(20); until(y==225) end
      frame;
    until(key(_enter) or key(_space))
    Selection=State;
    repeat alpha-=10; size_y-=5; frame(50); until(alpha<20)
    return;
  end
end



process CollectItem(x,y,z,Mode);
begin
  ctype=c_scroll; graph=446;
  loop
    if (collision(PlayerID))
      repeat size-=10; frame; until(size<=10)
      CollectItem++;
      CollectItemList[Mode]=1;
      return;
    end
    frame;
  end
end



process CharacterExpression(x,y,z,graph);
begin
  ctype=c_scroll;
  repeat
    y--;
    alpha-=20;
    frame;
  until(alpha<20)
end



process FallingTrail(x,y,z,alpha,Mode);
begin
  ctype=c_scroll;
  if (Mode==1) graph=2+rand(0,1); flags=16; end
  if (Mode==2) graph=1; x+=rand(-3,3); end
  repeat
    alpha-=10;
    x+=rand(-1,1);
    y--;
    frame;
  until(alpha<30)
end



process GreySmoke(x,y,z,Mode);
begin
  ctype=c_scroll; size=20; flags=16+rand(0,3);
  alpha=rand(150,250);
  repeat
    if (size<100) size+=10; end
    if (alpha>200 and alpha<250) graph=64; end
    if (alpha>150 and alpha<200) graph=65; end
    if (alpha>100 and alpha<150) graph=66; end
    if (alpha>50 and alpha<100) graph=67; end
    if (alpha>0 and alpha<50) graph=68; end
    alpha-=10;
    if (Mode==1) x+=2; end
    if (Mode==2) x-=2; end
    frame;
  until(alpha<10)
end




process Explode(x,y,z,size);
private
  int Animation;
begin
  ctype=c_scroll; alpha=200;
  repeat
    Animation=Animation+1;
    graph=42+Animation;
    frame;
  until (Animation==13)
end



process ShockWave(x,y,z,graph);
begin
  ctype=c_scroll; alpha=200; size=20; flags=16;
  repeat
    size+=10;
    alpha-=10;
    frame;
  until(size>170)
end



process CreateConfetti(x,y,z,Mode);
begin
  Confetti(x,y,z,Mode);
  Confetti(x,y,z,Mode);
  Confetti(x,y,z,Mode);
  Confetti(x,y,z,Mode);
  Confetti(x,y,z,Mode);
  Confetti(x,y,z,Mode);
end



process Confetti(x,y,z,Mode);
private
  int Speed;
  int DownSpeed;
begin
  ctype=c_scroll;
  graph=216; DownSpeed=rand(-4,-1); Speed=rand(-2,2);
  if (Mode==6 or Mode==7) graph=216; DownSpeed=rand(3,5); Speed=rand(-1,1); size=50; alpha=200; end
  if (Mode==8) graph=91; DownSpeed=rand(-10,-4); Speed=rand(-1,1); size=20; end

  repeat
    x+=Speed;
    if (DownSpeed<4 and Mode!=8) DownSpeed++; end
    if (DownSpeed<2 and Mode==8) DownSpeed++; end
 
    if (Mode==0 or Mode==1 or Mode==2 or Mode==6 or Mode==8) y+=DownSpeed; end
    if (Mode==3 or Mode==4 or Mode==5 or Mode==7) y-=DownSpeed; end
    alpha-=5;

    if (Mode==8)
      if (collision(PlayerID))
        Particle_Splash(PlayerID.x,PlayerID.y-5,z+1,1);
        PlayerID.HP-=10;
        if (PlayerFish==3) SneakBoostOn=0; end
        return;
      end
      if (collision(FriendFishID))
        Particle_Splash(FriendFishID.x,FriendFishID.y-5,z+1,1);
        FriendFishID.HP-=10;
        return;
      end
    end

    frame;
  until(alpha<100)
  if (Mode==0 or Mode==1 or Mode==2) CreateConfetti(x,y,z,6); end
  if (Mode==3 or Mode==4 or Mode==5) CreateConfetti(x,y,z,7); end
end



process Particle_Splash(x,y,z,Mode);
private
  int Speed;
  int DownSpeed;
begin
  ctype=c_scroll;
  if (Mode==1) graph=124; flags=16; alpha=150; end
  if (Mode==2) graph=84; flags=16; alpha=150; end
  DownSpeed=rand(2,1); Speed=rand(-1,1);
  repeat
    x+=Speed;
    y+=DownSpeed;
    if (rand(1,10)==1) if (DownSpeed>-1) DownSpeed--; end end
    alpha-=10;
    frame;
  until(alpha<20)
end



process TextZoom(x,y,z,graph);
begin
  size=50; alpha=255; flags=16;
  repeat
    size+=10;
    alpha-=10;
    frame;
  until(alpha<20)
end



process AreaTextDisplay(x,y,z,graph,Mode);
begin
  alpha=50; size_y=0;
  repeat
    size_y+=5;
    alpha+=20;
    frame;
  until(size_y==100)
  frame(3000);
  repeat
    size_y-=5;
    alpha+=20;
    frame;
  until(size_y==0)
end




process LevelScroll(Gfx,Gfx2,Gfx3,z);
private
  int Start_Y;
begin
  if (Gfx2>0) start_scroll(0,0,Gfx,Gfx2,0,0); end
  if (Gfx2==0) start_scroll(0,0,Gfx,0,0,0); end
  Scroll[0].z=z;
  x=160; y=120; z=258; graph=Gfx3;
  loop frame; end
end



process LevelCheck(x,y,z,graph);
begin
  ctype=c_scroll;
  loop frame; end
end


process LevelForeground(x,y,z,graph);
begin
  ctype=c_scroll;
  loop frame; end
end


process LevelBackground(x,y,z,graph);
begin
  ctype=c_scroll;
  loop frame; end
end



process SongPlayer(Number);
private
  int VolumeCounter;
begin

  SongNumber=Number;
  VolumeCounter=Volume;
  repeat
    set_song_volume(VolumeCounter);
    VolumeCounter--;
    frame(50);
  until(VolumeCounter==0);
  stop_song();
  set_song_volume(Volume);

  loop
    if (is_playing_song()==0)
      if (Number==1) Song=load_song("Music/SpipReef.ogg"); play_song(Song,1); end
      if (Number==2) Song=load_song("Music/Gelatinum_Caverns.ogg"); play_song(Song,1); end
      if (Number==3) Song=load_song("Music/Deep_Roads.ogg"); play_song(Song,1); end
      if (Number==4) Song=load_song("Music/Tribe_Of_The_Deep.ogg"); play_song(Song,1); end
      if (Number==5) Song=load_song("Music/Sunlit_Sea.ogg"); play_song(Song,1); end
      if (Number==6) Song=load_song("Music/Race.ogg"); play_song(Song,1); end
      if (Number==7) Song=load_song("Music/Menu.ogg"); play_song(Song,1); end
      if (Number==8) Song=load_song("Music/Ending_Theme.ogg"); play_song(Song,1); end
      if (Number==9) Song=load_song("Music/Ending_Credits.ogg"); play_song(Song,1); end
      if (Number==10) Song=load_song("Music/Arcade_Sea.ogg"); play_song(Song,1); end
      if (Number==11) Song=load_song("Music/Silent_Reef.ogg"); play_song(Song,1); end
      if (Number==12) Song=load_song("Music/Arturus_Krill.ogg"); play_song(Song,1); end
      if (Number==13) Song=load_song("Music/Intro.ogg"); play_song(Song,1); end
      if (Number==14) Song=load_song("Music/Start.ogg"); play_song(Song,1); end
    end
    frame;
  end
end



process SongPlayer2(Number);
private
  int VolumeCounter;
begin

  if (exists(type SongPlayer)) return; end
  loop
    if (is_playing_song()==0)
      if (Number==1) Song=load_song("Music/SpipReef.ogg"); play_song(Song,1); end
      if (Number==2) Song=load_song("Music/Gelatinum_Caverns.ogg"); play_song(Song,1); end
      if (Number==3) Song=load_song("Music/Deep_Roads.ogg"); play_song(Song,1); end
      if (Number==4) Song=load_song("Music/Tribe_Of_The_Deep.ogg"); play_song(Song,1); end
      if (Number==5) Song=load_song("Music/Sunlit_Sea.ogg"); play_song(Song,1); end
      if (Number==6) Song=load_song("Music/Race.ogg"); play_song(Song,1); end
      if (Number==7) Song=load_song("Music/Menu.ogg"); play_song(Song,1); end
      if (Number==8) Song=load_song("Music/Ending_Theme.ogg"); play_song(Song,1); end
      if (Number==9) Song=load_song("Music/Ending_Credits.ogg"); play_song(Song,1); end
      if (Number==10) Song=load_song("Music/Arcade_Sea.ogg"); play_song(Song,1); end
      if (Number==11) Song=load_song("Music/Silent_Reef.ogg"); play_song(Song,1); end
      if (Number==12) Song=load_song("Music/Arturus_Krill.ogg"); play_song(Song,1); end
      if (Number==13) Song=load_song("Music/Intro.ogg"); play_song(Song,1); end
      if (Number==14) Song=load_song("Music/Start.ogg"); play_song(Song,1); end
    end
    frame;
  end
end



process SystemControl();
private
  int DisplayVolume;
  int TextID;
begin
  set_song_volume(Volume);
  frame(500); SongPlayer2(SongNumber);

  loop

    if (key(_pgup))
      if (DisplayVolume==0) TextID=write_int(0,2,230,0,&Volume); DisplayVolume=40; end
      Volume+=5;
      if (Volume>128) Volume=128; End
      if (Volume>20) set_song_volume(Volume-20); end
      if (Volume<=20) set_song_volume(Volume); end
      set_wav_volume(MindSignal,Volume);
      set_wav_volume(BeamFishSound,Volume);
      set_wav_volume(Boing,Volume);
      set_wav_volume(Flame,Volume);
      set_wav_volume(Inspire,Volume);
      set_wav_volume(Jump,Volume);
      set_wav_volume(Jump2,Volume);
      set_wav_volume(Mine,Volume);
      set_wav_volume(Mine2,Volume);
      set_wav_volume(Open,Volume);
      set_wav_volume(Dark,Volume);
      set_wav_volume(Splash,Volume);
      set_wav_volume(Zap,Volume);
      set_wav_volume(Cage,Volume);
      set_wav_volume(Hurt,Volume);
 
    end
    if (key(_pgdn))
      if (DisplayVolume==0) TextID=write_int(0,2,230,0,&Volume); DisplayVolume=40; end
      Volume-=5;
      if (Volume<1) Volume=1; End
      if (Volume>20) set_song_volume(Volume-20); end
      if (Volume<=20) set_song_volume(Volume); end
      set_wav_volume(MindSignal,Volume);
      set_wav_volume(BeamFishSound,Volume);
      set_wav_volume(Boing,Volume);
      set_wav_volume(Flame,Volume);
      set_wav_volume(Inspire,Volume);
      set_wav_volume(Jump,Volume);
      set_wav_volume(Jump2,Volume);
      set_wav_volume(Mine,Volume);
      set_wav_volume(Mine2,Volume);
      set_wav_volume(Open,Volume);
      set_wav_volume(Dark,Volume);
      set_wav_volume(Splash,Volume);
      set_wav_volume(Zap,Volume);
      set_wav_volume(Cage,Volume);
      set_wav_volume(Hurt,Volume);
    end

    if (DisplayVolume>0) DisplayVolume--; end
    if (DisplayVolume==1) delete_text(TextID); end

    if (key(_f) and ScreenFull==1) Full_Screen=true; set_mode(320,240,16,256); frame(700); ScreenFull=2; end
    if (key(_f) and ScreenFull==2) Full_Screen=false; set_mode(320,240,16,256); frame(700); ScreenFull=1; end
    frame;

  end
end
