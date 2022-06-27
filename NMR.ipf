#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=1

Macro AppMNR_Macro(line_num)
	variable line_num, i, j
	string line_name
	
	PauseUpdate; Silent 1
	
	Display /L=q_1 /W=(295,102,667,345) wave0 vs ppm  // 生データをwave0とする
	
	AppendToGraph /L=q_2 Model vs ppm
	
	i = 0
	Do
		i = i + 1
		
		line_name = "Line_" + num2str(i)
		
		AppendToGraph /L=q_3 $line_name vs ppm
		
	While (i < line_num)
	
	// グラフの体裁を整える
	ModifyGraph font="Arial"
	Label bottom "\Z18chemical shift (ppm)"
	ModifyGraph axisEnab(q_1)={0.7,0.95},noLabel(q_1)=2,axThick(q_1)=0,lsize=2,rgb=(0,0,0)
	ModifyGraph axisEnab(q_2)={0.4,0.65},noLabel(q_2)=2,axThick(q_2)=0,lsize=2,rgb=(0,0,0)
	ModifyGraph axisEnab(q_3)={0.1,0.35},noLabel(q_3)=2,axThick(q_3)=0,lsize=2,lstyle=0
	ModifyGraph lstyle(Model)=3
	ModifyGraph tick(bottom)=2
	SetAxis bottom 2000,-2000
	
	// フィッティングした各グラフの色を編集
	j = 0
	Do
		j = j + 1
		line_name = "Line_" + num2str(j)
		if (j==1)
			ModifyGraph rgb(Line_1)=(65535,0,0)
		endif
		if (j==2)
			ModifyGraph rgb(Line_2)=(19675,39321,1)
		endif
		if (j==3)
			ModifyGraph rgb(Line_3)=(1,16019,65535)
		endif
		if (j==4)
			ModifyGraph rgb(Line_4)=(65535,43690,0)
		endif
		if (j==5)
			ModifyGraph rgb(Line_5)=(26411,1,52428)
		endif	
		if (j>=6)
			ModifyGraph rgb($line_name)=(0,0,0) // 6個以上のグラフがある場合は黒色に
		endif	
		
	While (j < line_num)
	
End
