{Trabalho Algoritmo
 Professor: Frank
 Alunos:    Nelson Matheus G. De Toledo        RA: 56358
	        Renan Eidy Takahashi               RA: 55240
 Exercício: U- Sockdye; }
 
Program sockdye;
Uses
	crt;
Var
	mapa: array[0..11,0..16] of integer;
	i, j, x, tentativas, troca, verif, aux: integer;
	quebrar: boolean;
	score: real;

Procedure identificar(aux,troca:integer);
Begin
	if aux = mapa[i+1,j] then begin
        i := i + 1;
		identificar(mapa[i,j],troca);
        mapa[i,j] := troca
        end
        else
            i := i + 1;
            mapa[i-1,j] := troca;
            i := i - 1;
	if aux = mapa[i,j+1] then begin
        j := j + 1;
		identificar(mapa[i,j],troca);
        mapa[i,j] := troca
        end
        else
            j := j + 1;
            mapa[i,j-1] := troca;
            j := j - 1;
	if aux = mapa[i,j-1] then begin
        j := j - 1;
		identificar(mapa[i,j],troca);
        mapa[i,j] := troca
        end
        else
            j := j - 1;
            mapa[i,j+1] := troca;
            j := j + 1;
	if aux = mapa[i-1,j] then begin
        i := i - 1;
		identificar(mapa[i,j],troca);
        mapa[i,j] := troca
        end
        else
            i := i - 1;
            mapa[i+1,j] := troca;
            i := i + 1;
End;

Procedure jogo;
Begin
	clrscr;
	randomize;
	tentativas := 25;
	x := x + 1;
	For i:= 1 to 10 do begin
		For j:= 1 to 15 do begin
			mapa[i,j] := random(x)+1;
		End;
	End;
	Repeat
		For i:=1 to 10 do Begin
			Writeln;
			Writeln;
			For j:=1 to 15 do Begin
				textcolor(mapa[i,j]);
				Write('  ',mapa[i,j]);
			End;
		End;
		Writeln;
		Writeln;
		Writeln('Score: ',score:1:1);
		Writeln('Voce tem ',tentativas,' movimentos restantes');
		i := 1;
		j := 1;
		aux := mapa[i,j];
		Read(troca);
		If troca = 00 then
			tentativas := tentativas + 10;		
		if (troca = mapa[1,1]) or (troca > x) or (troca <= 0) then begin
			Repeat
				Writeln('Esta cor ja esta selecionada ou nao existe! Selecione outra: ');
				Read(troca);
			Until (troca <> mapa[1,1]) and (troca < x+1) and (troca > 0);
		End;	
		identificar(aux,troca);
		tentativas := tentativas - 1;
		score := score + (tentativas * 1.1);
		clrscr;
		quebrar := true;
		verif := mapa[i,j];
		For i := 1 to 10 do Begin
			For j := 1 to 15 do Begin
				If mapa[i,j] <> verif then
					quebrar := false;
			End;
		End;
	Until (tentativas = 0) or (quebrar = true);
	score := score + (tentativas * 15);
	While (quebrar = true) and (x <= 7) do begin
		If x = 7 then begin
			Writeln('Congratz! Chegou ao final!');
			Writeln;
			textcolor(4);
			Writeln('CHEAT LIBERADO');
			textcolor(7);
			Writeln('Para usar o cheat tecle "00" e enter, vai ganhar 10 movimentos!')
		end
		Else
			Writeln('Parabens! Avancou para o nivel ',x-1);
			Writeln('Score total : ',score:1:1,'!');
		readkey;
		jogo;
	End;
End;

Begin
	score := 0;
	x := 2;
	jogo;
	Writeln('Game Over.');
	Writeln('Seu score foi de: ',score:1:1);
	Writeln('Nivel: ',x-2);
	Readkey;
End.