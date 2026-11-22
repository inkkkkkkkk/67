local Sb,vd,Qc,cb,Ie,ib=type,bit32.bxor,getmetatable,pairs
local ua,pd,sc,uf,Pc,qa,Re,rc,Se,Qa,hf,Ve,Y,ld,J,le,pf,Ca,de,ea,ca,Jc,Od,ee,m,Xd,f_,bb,g,Nd,Fd,Ge,Kc,e_,y,_a,nb,Ee,ff,Fa,lf,_d,oe,Eb;
Jc=(getfenv());
de,ff,le=(string.char),(string.byte),(bit32 .bxor);
Kc=function(W,Nc)
    local Oa,eb,la,Da,Id,Bb,Sd,td;
    eb,Sd={},function(d_,Dd,Q)
        eb[Q]=vd(Dd,22621)-vd(d_,56928)
        return eb[Q]
    end;
    Id=eb[11919]or Sd(38630,46933,11919)
    while Id~=50566 do
        if Id<=42626 then
            if Id<32117 then
                if Id>2181 then
                    return Bb
                else
                    Oa=la
                    if td~=td then
                        Id=9335
                    else
                        Id=32117
                    end
                end
            elseif Id>32117 then
                Bb='';
                Da,td,Id,la=1,(#W-1)+90,eb[16431]or Sd(60951,24737,16431),90
            else
                if(Da>=0 and la>td)or((Da<0 or Da~=Da)and la<td)then
                    Id=eb[13698]or Sd(26386,34228,13698)
                else
                    Id=eb[11999]or Sd(15025,105994,11999)
                end
            end
        elseif Id>50187 then
            Id,Bb=eb[-17959]or Sd(55009,38097,-17959),Bb..de(le(ff(W,(Oa-90)+1),ff(Nc,(Oa-90)%#Nc+1)))
        else
            la=la+Da;
            Oa=la
            if la~=la then
                Id=9335
            else
                Id=eb[-6236]or Sd(34603,36509,-6236)
            end
        end
    end
end;
Ge=(select);
uf=(function(...)
    return{[1]={...},[2]=Ge('#',...)}
end);
pf=((function()
    local function Bd(Ac,Fe,aa)
        if Fe>aa then
            return
        end
        return Ac[Fe],Bd(Ac,Fe+1,aa)
    end
    return Bd
end)());
Od,y=(string.gsub),(string.char);
hf=(function(Ra)
    Ra=Od(Ra,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(Ra:gsub('.',function(gf)
        if(gf=='=')then
            return''
        end
        local id,mf='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(gf)-1)
        for Ea=6,1,-1 do
            id=id..(mf%2^Ea-mf%2^(Ea-1)>0 and'1'or'0')
        end
        return id
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(cf)
        if(#cf~=8)then
            return''
        end
        local k=0
        for De=1,8 do
            k=k+(cf:sub(De,De)=='1'and 2^(8-De)or 0)
        end
        return y(k)
    end))
end);
m,f_,J,ca,sc,Re,pd,e_=Jc[Kc('.\156\25\52\134\f',']\232k')][Kc('\134\207X\146\194C','\243\161(')],Jc[Kc('5\172\229/\182\240','F\216\151')][Kc('X^I','+')],Jc[Kc('I\155\163S\129\182',':\239\209')][Kc('\21\196\3\216','w\189')],Jc[Kc('4\127\"%d','V\22')][Kc('3\245\193\54\224\221','_\134\169')],Jc[Kc('\155n\141\52\203','\249\a')][Kc('Y?\241B*\237','+L\153')],Jc[Kc('\96kv10','\2\2')][Kc('\179\194\191\199','\209\163')],Jc[Kc('\142\143\152\130\159','\250\238')][Kc('l\227\3l\237\25','\15\140m')],{};
Se=(function(Qe)
    local We=e_[Qe]
    if not(We)then
    else
        return We
    end
    local xc,Pa,Vc,X,z=ca(1,11),ca(1,5),1,{},''
    while Vc<=#Qe do
        local Oc=J(Qe,Vc);
        Vc=Vc+1
        for xb=175,(8)+174 do
            local He=nil
            if Re(Oc,1)~=0 then
                if Vc<=#Qe then
                    He=f_(Qe,Vc,Vc);
                    Vc=Vc+1
                end
            else
                if Vc+1<=#Qe then
                    local mb=m(Kc('\131\244\143','\189'),Qe,Vc);
                    Vc=Vc+2
                    local Wd,Jb=#z-sc(mb,5),Re(mb,(Pa-1))+3;
                    He=f_(z,Wd,Wd+Jb-1)
                end
            end
            Oc=sc(Oc,1)
            if not(He)then
            else
                X[#X+1]=He;
                z=f_(z..He,-xc)
            end
        end
    end
    local Va=pd(X);
    e_[Qe]=Va
    return Va
end);
Xd=(function()
    local lb,Ne,o_,Mb,_c,R,qe,Tc,dd,Ka,l_,he=Jc[Kc('\232l\254\54\184','\138\5')][Kc('G6J<','%N')],Jc[Kc('\159\145\137\203\207','\253\248')][Kc('\178{\190~','\208\26')],Jc[Kc('\31\141\t\215O','}\228')][Kc('\255\242\239','\157')],Jc[Kc('2\255$\165b','P\150')][Kc('\196\201\214\193\220\202','\168\186\190')],Jc[Kc('_tI.\15','=\29')][Kc('\133\197.\158\208\50','\247\182F')],Jc[Kc('\240\27C\234\1V','\131o1')][Kc('\227\229\242','\144')],Jc[Kc('4\216\212.\194\193','G\172\166')][Kc('E\155V\145','5\250')],Jc[Kc('\229\196\157\255\222\136','\150\176\239')][Kc('UC\17AN\n',' -a')],Jc[Kc('\226q\216\248k\205','\145\5\170')][Kc('\r\26\15','\127')],Jc[Kc("1\25\'\20 ",'Ex')][Kc('\\IOC',',(')],Jc[Kc('\136\50\158?\153','\252S')][Kc('\182\236{\162\225\96','\195\130\v')],Jc[Kc('@EVHQ','4$')][Kc('G\21\\K\t[','.{/')]
    local function p(cc,B,Sc,Kd,Na)
        local Ia,ie,Ke,yd=cc[B],cc[Sc],cc[Kd],cc[Na]
        local E;
        Ia=Ne(Ia+ie,4294967295);
        E=lb(yd,Ia);
        yd=Ne(o_(Mb(E,16),_c(E,16)),4294967295);
        Ke=Ne(Ke+yd,4294967295);
        E=lb(ie,Ke);
        ie=Ne(o_(Mb(E,12),_c(E,20)),4294967295);
        Ia=Ne(Ia+ie,4294967295);
        E=lb(yd,Ia);
        yd=Ne(o_(Mb(E,8),_c(E,24)),4294967295);
        Ke=Ne(Ke+yd,4294967295);
        E=lb(ie,Ke);
        ie=Ne(o_(Mb(E,7),_c(E,25)),4294967295);
        cc[B],cc[Sc],cc[Kd],cc[Na]=Ia,ie,Ke,yd
        return cc
    end
    local Rb,jd={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    local b_=function(Md,q,Ma)
        Rb[1],Rb[2],Rb[3],Rb[4]=180851348,3303349794,1138311918,3061624541
        for tc=98,(8)+97 do
            Rb[(tc-97)+4]=Md[(tc-97)]
        end
        Rb[13]=q
        for V=89,(3)+88 do
            Rb[(V-88)+13]=Ma[(V-88)]
        end
        for ia=31,(16)+30 do
            jd[(ia-30)]=Rb[(ia-30)]
        end
        for ma=185,(10)+184 do
            p(jd,1,5,9,13);
            p(jd,2,6,10,14);
            p(jd,3,7,11,15);
            p(jd,4,8,12,16);
            p(jd,1,6,11,16);
            p(jd,2,7,12,13);
            p(jd,3,8,9,14);
            p(jd,4,5,10,15)
        end
        for Cb=250,(16)+249 do
            Rb[(Cb-249)]=Ne(Rb[(Cb-249)]+jd[(Cb-249)],4294967295)
        end
        return Rb
    end
    local function gb(Ye,qd,ub,T,sf)
        local vb=#T-sf+1
        if vb<64 then
            local _b=R(T,sf);
            T=_b..dd(Kc('\241','\241'),64-vb);
            sf=1
        end
        Jc[Kc('f\163Ob\162H','\a\208<')](#T>=64)
        local Tb,be=Ka(Tc(Kc('\134\212?\238\176\228\236\243\1uW\1$\187\174A\142\212?\238\176\228\236\243\1uW\1$\187\174A\142','\186\157\v\167\132\173\216\186\53<cH\16\242\154\b'),T,sf)),b_(Ye,qd,ub)
        for Za=197,(16)+196 do
            Tb[(Za-196)]=lb(Tb[(Za-196)],be[(Za-196)])
        end
        local ke=qe(Kc(' \165\49\50l\223c\224\222\229\165\229\194V\251\30(\165\49\50l\223c\224\222\229\165\229\194V\251\30(','\28\236\5{X\150W\169\234\172\145\172\246\31\207W'),l_(Tb))
        if not(vb<64)then
        else
            ke=R(ke,1,vb)
        end
        return ke
    end
    local function Ze(N)
        local Rc=''
        for Zc=191,(#N)+190 do
            Rc=Rc..N[(Zc-190)]
        end
        return Rc
    end
    local function Fc(ra,hb,Lc,qf)
        local Ab,wd,A,G=Ka(Tc(Kc('\141\175\15\200S\140\235P\133\175\15\200S\140\235P\133','\177\230;\129g\197\223\25'),ra)),Ka(Tc(Kc('\218\181\169\175\200\212\210','\230\252\157'),Lc)),{},1
        while G<=#qf do
            he(A,gb(Ab,hb,wd,qf,G));
            G=G+64;
            hb=hb+1
        end
        return Ze(A)
    end
    return function(md,Sa,Zd)
        return Fc(Zd,0,Sa,md)
    end
end)();
Ee=(function()
    local mc,Me,me,ud,Db,nf,P,a_,ab,wa,x=Jc[Kc('\190{\168!\238','\220\18')][Kc('\23+\26\49','uE')],Jc[Kc('6X \2f','T1')][Kc('\205\195\192\201','\175\187')],Jc[Kc('\b\139\30\209X','j\226')][Kc('\189\205\151\166\216\139','\207\190\255')],Jc[Kc('\193?\215e\145','\163V')][Kc('37\19\54\"\15','_D{')],Jc[Kc(')??ey','KV')][Kc('\142\213\130\208','\236\180')],Jc[Kc('\239\16\249J\191','\141y')][Kc('\208\221\192','\178')],Jc[Kc('=4+9,','IU')][Kc('\192\203c\204\215d','\169\165\16')],Jc[Kc('\14[\24V\31','z:')][Kc('0\192^$\205E','E\174.')],Jc[Kc('A5)[/<','2A[')][Kc('\222\201\220','\172')],Jc[Kc("C42Y.\'",'0@@')][Kc('\157\217\159\195','\254\177')],Jc[Kc('!\127y;el','R\v\v')][Kc('\239X\249D','\141!')]
    local function h(Ba,qc)
        local Be,ef=me(Ba,qc),ud(Ba,32-qc)
        return Db(nf(Be,ef),4294967295)
    end
    local fe=function(zb)
        local if_={1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298}
        local function Ed(O)
            local Xb=#O
            local ve=Xb*8;
            O=O..Kc('\192','@')
            local ja=64-((Xb+9)%64)
            if ja~=64 then
                O=O..ab(Kc('.','.'),ja)
            end
            O=O..wa(Db(me(ve,56),255),Db(me(ve,48),255),Db(me(ve,40),255),Db(me(ve,32),255),Db(me(ve,24),255),Db(me(ve,16),255),Db(me(ve,8),255),Db(ve,255))
            return O
        end
        local function wb(pa)
            local S={}
            for Ec=250,(#pa)+249,64 do
                P(S,pa[Kc('\232\238\249','\155')](pa,(Ec-249),(Ec-249)+63))
            end
            return S
        end
        local function ob(_e,Dc)
            local Pd={}
            for Yd=64,(64)+63 do
                if not((Yd-63)<=16)then
                    local qb,xd=Me(h(Pd[(Yd-63)-15],7),h(Pd[(Yd-63)-15],18),me(Pd[(Yd-63)-15],3)),Me(h(Pd[(Yd-63)-2],17),h(Pd[(Yd-63)-2],19),me(Pd[(Yd-63)-2],10));
                    Pd[(Yd-63)]=Db(Pd[(Yd-63)-16]+qb+Pd[(Yd-63)-7]+xd,4294967295)
                else
                    Pd[(Yd-63)]=nf(ud(x(_e,((Yd-63)-1)*4+1),24),ud(x(_e,((Yd-63)-1)*4+2),16),ud(x(_e,((Yd-63)-1)*4+3),8),x(_e,((Yd-63)-1)*4+4))
                end
            end
            local ce,Yc,jb,C,Zb,i_,va,Pe=a_(Dc)
            for ye=151,(64)+150 do
                local Yb,Gb=Me(h(Zb,6),h(Zb,11),h(Zb,25)),Me(Db(Zb,i_),Db(mc(Zb),va))
                local uc,Hb,Hd=Db(Pe+Yb+Gb+if_[(ye-150)]+Pd[(ye-150)],4294967295),Me(h(ce,2),h(ce,13),h(ce,22)),Me(Db(ce,Yc),Db(ce,jb),Db(Yc,jb))
                local fa_=Db(Hb+Hd,4294967295);
                Pe=va;
                va=i_;
                i_=Zb;
                Zb=Db(C+uc,4294967295);
                C=jb;
                jb=Yc;
                Yc=ce;
                ce=Db(uc+fa_,4294967295)
            end
            return Db(Dc[1]+ce,4294967295),Db(Dc[2]+Yc,4294967295),Db(Dc[3]+jb,4294967295),Db(Dc[4]+C,4294967295),Db(Dc[5]+Zb,4294967295),Db(Dc[6]+i_,4294967295),Db(Dc[7]+va,4294967295),Db(Dc[8]+Pe,4294967295)
        end
        zb=Ed(zb)
        local Ha,hc,Ga=wb(zb),{1779033703,3144134277,1013904242,2773480762,1359893119,2600822924,528734635,1541459225},''
        for rd,af in Jc[Kc('\24\240\198\24\242\212','q\128\167')](Ha)do
            hc={ob(af,hc)}
        end
        for cd,sd in Jc[Kc('\6)\189\6+\175','oY\220')](hc)do
            Ga=Ga..wa(Db(me(sd,24),255));
            Ga=Ga..wa(Db(me(sd,16),255));
            Ga=Ga..wa(Db(me(sd,8),255));
            Ga=Ga..wa(Db(sd,255))
        end
        return Ga
    end
    return fe
end)()
local Vb,u_,sb,_f,pe,D,tb,tf,Ua,od,ba,Xc,bc,of,Uc,kc,ed,U,Ta,pc,zd,F,ga,Xa,ge,Ce,Rd,Mc,j,r_=Jc[Kc('\246\227\242\255','\130\154')],Jc[Kc('\25<\b\51\5','i_')],Jc[Kc('.\207\57\210\57','K\189')],Jc[Kc('\152\a\192\185\129\n\203\190','\236h\174\204')],Jc[Kc("\16&u\20\'r",'qU\6')],Jc[Kc('I\143o_\137w',':\234\3')],Jc[Kc('\163\164\138\215\129\v\177\181\159\216\136\26','\208\193\254\186\228\127')],Jc[Kc('\246c\134\236y\147','\133\23\244')][Kc('Rf\153Yh\159','4\t\235')],Jc[Kc('f\232\247|\242\226','\21\156\133')][Kc('^u\176Jx\171','+\27\192')],Jc[Kc('\251V\150\225L\131','\136\"\228')][Kc('\15\t\30','|')],Jc[Kc('J\239\143P\245\154','9\155\253')][Kc('\222G\200[','\188>')],Jc[Kc('@\239\57Z\245,','3\155K')][Kc('~\n|\16','\29b')],Jc[Kc("\'\132\49\137\54",'S\229')][Kc('e\24~\18','\bw')],Jc[Kc('|\246j\251m','\b\151')][Kc('\228\199\247\205','\148\166')],Jc[Kc('\151\3\129\14\134','\227b')][Kc('\209+\197\211-\197','\178Y\160')],Jc[Kc('H\238^\227Y','<\143')][Kc('cF\146oZ\149','\n(\225')],Jc[Kc('\227[\245V\242','\151:')][Kc('>\14\140>\0\150',']a\226')],Jc[Kc('O\241\133\249Y\234\158\248I',',\158\247\150')][Kc('}K/\127M/','\30\57J')],Jc[Kc('\153d\24B\143\127\3C\159','\250\vj-')][Kc('\231\14\251\v\250','\158g')],Jc[Kc('\222\127\232q\200d\243p\216','\189\16\154\30')][Kc('7p\248\48x\238','E\21\139')],Jc[Kc('\"y\189\209\52b\166\208$','A\22\207\190')][Kc('6\176:\175\48','U\220')],Jc[Kc('\255\151L\254\151V\238','\152\242\56')],Jc[Kc('\178\n\164P\226','\208c')][Kc('\128\141\144','\226')],Jc[Kc('\210\a\196]\130','\176n')][Kc('\186\177\183\187','\216\201')],Jc[Kc('\4\169\18\243T','f\192')][Kc('F\235J\238','$\138')],Jc[Kc('\209y\199#\129','\179\16')][Kc('\18\152\21\159\4','p\236')],Jc[Kc('\236l\250\54\188','\142\5')][Kc('\171\127S\176jO','\217\f;')],Jc[Kc('R\29DG\2','0t')][Kc("u\'\237p2\241",'\25T\133')],Jc[Kc('U\tCS\5','7\96')][Kc('\228[\153\243B\142\245','\129#\237')],{[44484]={},[61698]={{9,8,false},{1,2,true},{6,8,false},{1,0,false},{7,3,false},{3,6,true},{3,6,true},{9,5,true},{7,6,true},{6,6,true},{3,8,false},{9,6,true},{3,8,false},{3,6,true},{1,5,true},{7,8,true},{9,2,true},{9,8,false},{9,8,true},{3,3,false},{7,3,true},{1,10,true},{7,8,true},{9,9,true},{3,3,false},{1,2,true},{7,3,true},{6,7,true},{3,2,false},{7,3,false},{7,5,false},{2,7,true},{6,5,true},{3,6,true},{7,6,false},{7,6,false},{7,9,true},{3,6,false},{9,3,true},{3,6,true},{9,2,false},{2,0,false},{9,8,true},{9,8,false},{3,8,false},{3,8,false},{6,8,false},{2,8,false},{2,5,true},{3,8,false},{7,9,false},{7,2,false},{3,10,false},{3,8,false},{1,6,true},{9,10,false},{9,5,true},{3,6,true},{9,0,true},{9,8,false},{3,10,false},{6,3,false},{7,2,true},{3,9,true},{6,9,false},{7,5,false},{3,8,false},{3,6,true},{3,8,false},{9,10,false},{2,0,true},{3,8,false},{7,2,false},{1,3,false},{3,8,true},{3,6,true},{2,9,true},{9,8,true},{3,0,false},{7,5,true},{6,8,false},{2,0,true},{3,10,false},{3,8,false},{9,6,true},{3,8,false},{7,5,false},{9,0,false},{3,0,true},{9,7,true},{3,8,false},{3,8,false},{9,6,true},{3,7,true},{3,8,false},{9,10,false},{9,8,false},{2,0,false},{6,8,false},{3,8,false},{3,8,false},{7,2,true},{9,0,false},{2,10,true},{3,8,false},{1,8,true},{9,9,true},{9,8,false},{6,6,true},{7,4,false},{9,10,true},{6,7,true},{3,8,true},{9,0,false},{9,9,true},{2,9,false},{7,6,false},{1,2,true},{1,0,false},{3,8,false},{1,9,false},{3,0,false},{2,10,true},{3,8,false},{9,0,false},{3,9,false},{6,8,false},{3,1,false},{3,8,false},{9,7,true},{7,5,false},{9,3,false},{9,0,false},{1,9,true},{3,1,false},{7,0,false},{3,5,false},{3,6,true},{2,3,true},{7,3,true},{9,6,true},{9,3,true},{7,2,true},{9,6,true},{3,0,false},{7,5,true},{7,8,false},{1,0,false},{6,0,false},{9,8,true},{7,7,true},{3,7,true},{6,7,true},{9,10,true},{9,6,true},{6,8,false},{2,9,false},{9,3,false},{9,8,false},{1,10,true},{6,10,true},{9,2,true},{7,10,false},{3,2,false},{2,10,false},{3,8,false},{2,2,false},{7,3,false},{7,8,true},{1,8,true},{3,9,true},{9,8,false},{9,8,true},{7,5,false},{3,8,true},{6,3,true},{7,0,false},{9,0,false},{6,9,false},{3,3,false},{9,10,true},{3,1,false},{2,2,true},{9,2,false},{3,5,true},{2,0,false},{7,10,false},{3,3,false},{2,2,false},{3,8,false},{1,7,false},{9,8,false},{7,5,true},{3,8,false},{3,8,false},{2,10,true},{9,5,true},{9,9,true},{9,8,false},{2,9,true},{3,5,true},{3,8,false},{6,3,false},{9,8,false},{3,8,false},{9,5,true},{7,6,false},{2,6,false},{1,9,true},{1,8,false},{7,7,false},{9,10,false},{3,1,false},{6,10,true},{9,10,true},{7,9,false},{6,3,false},{7,5,false},{2,2,true},{3,8,false},{3,5,true},{7,3,false},{9,2,false},{7,8,true},{3,8,false},{3,8,false},{2,9,false},{9,5,false},{9,8,true},{6,9,false},{9,9,true},{3,9,false},{7,8,true},{9,2,true},{7,5,true},{9,0,false},{2,8,true},{3,9,false},{9,5,true},{9,9,true},{3,6,true},{3,0,true},{9,8,true},{3,8,false},{2,3,false},{7,8,false},{3,0,true},{2,5,false},{2,10,true},{9,7,false},{6,6,true},{6,2,true},{3,8,false},{7,8,false},{9,6,true},{6,0,false}},[45471]={}}
local Xe=(function(Gd)
    local sa=r_[44484][Gd]
    if(sa)then
        return sa
    end
    local L=1
    local function Cd()
        local Aa,fc,jf,je,kf,Pb,Nb,M,xa,ue,fb,Wb,bd,kb,Te,ka,Lb,kd,ya,rf,I,nd,Td,fd,Ic,xf,oc,Ad,ae,Gc,lc,Z;
        rf,fb=function(ic,gd,Ub)
            fb[gd]=vd(Ub,19390)-vd(ic,60570)
            return fb[gd]
        end,{};
        Ic=fb[-3003]or rf(16612,-3003,85648)
        while Ic~=59713 do
            if Ic>32199 then
                if Ic>48056 then
                    if Ic<60063 then
                        if Ic>=53117 then
                            if Ic<57355 then
                                if Ic<54164 then
                                    oc=Ua(Kc('\197','\135'),Gd,L);
                                    Ic,L=fb[10249]or rf(45605,10249,64752),L+1
                                elseif Ic>54164 then
                                    fd=Ua(Kc('N','-')..Pb,Gd,L);
                                    L,Ic=L+Pb,fb[798]or rf(28642,798,80673)
                                else
                                    Ic,Ad=fb[26639]or rf(61544,26639,26083),Te
                                end
                            elseif Ic<=58103 then
                                if Ic>57743 then
                                    Pb[53910]=ge(Rd(kb,8),255);
                                    Pb[33034]=ge(Rd(kb,16),255);
                                    Ic,Pb[63334]=fb[-6060]or rf(40723,-6060,64422),ge(Rd(kb,24),255)
                                elseif Ic>57355 then
                                    if(Aa>=0 and kb>oc)or((Aa<0 or Aa~=Aa)and kb<oc)then
                                        Ic=fb[21136]or rf(54712,21136,62459)
                                    else
                                        Ic=fb[7082]or rf(33760,7082,70055)
                                    end
                                else
                                    if(jf>=0 and Gc>kd)or((jf<0 or jf~=jf)and Gc<kd)then
                                        Ic=40374
                                    else
                                        Ic=21833
                                    end
                                end
                            else
                                Td=Ua(Kc('\135\223','\187'),Gd,L);
                                Ic,L=28634,L+8
                            end
                        elseif Ic>=51187 then
                            if Ic<52301 then
                                if Ic<=51187 then
                                    oc,Ic=Xa(Aa,19),36219
                                    continue
                                else
                                    Ic,oc[31361]=fb[-25812]or rf(36827,-25812,72783),jf[oc[25522]+1]
                                end
                            elseif Ic<=52301 then
                                fc=fc+Nb;
                                kb=fc
                                if fc~=fc then
                                    Ic=46912
                                else
                                    Ic=6364
                                end
                            else
                                jf,Ic=nil,fb[2961]or rf(24342,2961,89003)
                            end
                        elseif Ic>=48434 then
                            if Ic<=48434 then
                                fc=Gc
                                if kd~=kd then
                                    Ic=fb[19510]or rf(26180,19510,90922)
                                else
                                    Ic=fb[-9093]or rf(48598,-9093,97001)
                                end
                            else
                                Gc=Gc+jf;
                                fc=Gc
                                if Gc~=Gc then
                                    Ic=40374
                                else
                                    Ic=fb[12701]or rf(42378,12701,90789)
                                end
                            end
                        else
                            Ic=fb[-5375]or rf(53772,-5375,5344)
                            continue
                        end
                    elseif Ic<62640 then
                        if Ic<=60711 then
                            if Ic<60469 then
                                if Ic<=60063 then
                                    Ic,Nb[(Ad-138)]=fb[3250]or rf(44805,3250,95932),Cd()
                                else
                                    Te=Ad;
                                    Z=ga(Z,Mc(ge(Te,127),(Aa-138)*7))
                                    if(not Ce(Te,128))then
                                        Ic=fb[-21629]or rf(22707,-21629,96481)
                                        continue
                                    else
                                        Ic=fb[-31818]or rf(36456,-31818,50858)
                                        continue
                                    end
                                    Ic=fb[30048]or rf(555,30048,86893)
                                end
                            elseif Ic<=60469 then
                                Ic,Ad=fb[22165]or rf(10101,22165,130090),Xa(Te,19)
                                continue
                            else
                                Ic,nd=fb[4905]or rf(8474,4905,38468),fd
                                continue
                            end
                        elseif Ic>=61280 then
                            if Ic<=61280 then
                                kd=Gc;
                                jf=Uc(kd);
                                Ic,fc,Z,Nb=fb[22504]or rf(29024,22504,65874),250,(kd)+249,1
                            else
                                ue=lc;
                                bd,Wb=Uc(ue),false;
                                Gc,jf,Ic,kd=135,1,48434,(ue)+134
                            end
                        else
                            if Te==3 then
                                Ic=fb[3120]or rf(20278,3120,125951)
                                continue
                            end
                            Ic=fb[30933]or rf(6187,30933,107231)
                        end
                    elseif Ic>=63543 then
                        if Ic>64661 then
                            if Aa==7 then
                                Ic=fb[25328]or rf(57983,25328,7329)
                                continue
                            end
                            Ic=fb[-1591]or rf(3458,-1591,106102)
                        elseif Ic<63843 then
                            Ic,kf,lc=12274,I,nil
                        elseif Ic>63843 then
                            Pb,nd=ge(Rd(Ad,10),1023),ge(Rd(Ad,0),1023);
                            oc[55315]=jf[Pb+1];
                            oc[62217],Ic=jf[nd+1],fb[26812]or rf(26381,26812,117753)
                        else
                            kb=kb+Aa;
                            Ad=kb
                            if kb~=kb then
                                Ic=fb[1574]or rf(10574,1574,69449)
                            else
                                Ic=57743
                            end
                        end
                    elseif Ic>=62820 then
                        if Ic>62820 then
                            Ic,je=22665,Xa(Lb,19)
                            continue
                        else
                            if(Nb>=0 and fc>Z)or((Nb<0 or Nb~=Nb)and fc<Z)then
                                Ic=48056
                            else
                                Ic=fb[29939]or rf(3098,29939,84450)
                            end
                        end
                    elseif Ic>62640 then
                        if Ad==3 then
                            Ic=fb[31844]or rf(40800,31844,73039)
                            continue
                        end
                        Ic=fb[830]or rf(9193,830,83900)
                    else
                        fc=fc+Nb;
                        kb=fc
                        if fc~=fc then
                            Ic=48056
                        else
                            Ic=fb[17581]or rf(49,17581,108977)
                        end
                    end
                elseif Ic<39173 then
                    if Ic<35237 then
                        if Ic<32702 then
                            if Ic<32547 then
                                Z,Ic=Td,30360
                                continue
                            elseif Ic<=32547 then
                                return{[38378]=bd,[49088]=kf,[62469]=ka,[49858]=Nb,[56578]=M,[14943]=''}
                            else
                                Ic=fb[5745]or rf(61133,5745,59070)
                                continue
                            end
                        elseif Ic>34053 then
                            Lb=Ua(Kc('\255','\189'),Gd,L);
                            L,Ic=L+1,63234
                        elseif Ic<32886 then
                            Ic,kb=53117,nil
                        elseif Ic<=32886 then
                            if(Gc>=0 and bd>Wb)or((Gc<0 or Gc~=Gc)and bd<Wb)then
                                Ic=fb[-2401]or rf(56073,-2401,49939)
                            else
                                Ic=fb[-29694]or rf(63910,-29694,43426)
                            end
                        else
                            Ic,oc[31361]=fb[-1804]or rf(36205,-1804,72985),jf[oc[44319]+1]
                        end
                    elseif Ic<=36750 then
                        if Ic>35842 then
                            if Ic>36219 then
                                nd=nd+ya;
                                ae=nd
                                if nd~=nd then
                                    Ic=fb[-27618]or rf(8040,-27618,93948)
                                else
                                    Ic=18398
                                end
                            else
                                Aa=oc
                                if(Aa==0)then
                                    Ic=fb[-15408]or rf(48154,-15408,84175)
                                    continue
                                else
                                    Ic=fb[27714]or rf(7380,27714,86251)
                                    continue
                                end
                                Ic=fb[-26210]or rf(12740,-26210,42359)
                            end
                        elseif Ic>35696 then
                            Ic,M,I=17188,xf,nil
                        elseif Ic<=35237 then
                            Ic,nd=fb[-32524]or rf(11204,-32524,84885),nil
                        else
                            fd=nd;
                            Pb[25522]=fd;
                            kc(bd,{});
                            Ic=fb[8722]or rf(61937,8722,55280)
                        end
                    elseif Ic>37608 then
                        ka,Ic,xf=xa,fb[2786]or rf(39869,2786,48125),nil
                    elseif Ic<=36995 then
                        Ic,Te=fb[19021]or rf(60940,19021,44118),nil
                    else
                        if(Aa==2)then
                            Ic=fb[2045]or rf(11064,2045,43185)
                            continue
                        else
                            Ic=fb[5348]or rf(25683,5348,53642)
                            continue
                        end
                        Ic=fb[4493]or rf(42896,4493,6091)
                    end
                elseif Ic>45227 then
                    if Ic<=45809 then
                        if Ic>45712 then
                            Ic,Ad=fb[17556]or rf(17267,17556,35562),nil
                        elseif Ic<45376 then
                            Ic,xa=38446,Xa(ka,19)
                            continue
                        elseif Ic<=45376 then
                            Ic,Z=30089,nil
                        else
                            Aa=Ua(Kc('\211','\145'),Gd,L);
                            L,Ic=L+1,51187
                        end
                    elseif Ic<47921 then
                        Nb,Z,fc,Ic=1,(ue)+114,115,734
                    elseif Ic<=47921 then
                        Ad=kb
                        if oc~=oc then
                            Ic=32547
                        else
                            Ic=fb[-17993]or rf(59252,-17993,42691)
                        end
                    else
                        fc,Ic=nil,12714
                    end
                elseif Ic<=41197 then
                    if Ic<=39957 then
                        if Ic<=39575 then
                            if Ic>39173 then
                                oc,Ic=nil,45712
                            else
                                Aa=Nb
                                if kb~=kb then
                                    Ic=fb[-27531]or rf(30221,-27531,69374)
                                else
                                    Ic=13323
                                end
                            end
                        else
                            jf,Ic=Xa(fc,19),fb[-16788]or rf(2111,-16788,122606)
                            continue
                        end
                    elseif Ic>40374 then
                        Ic=fb[9078]or rf(46955,9078,50943)
                        continue
                    else
                        Ic,Gc=fb[14868]or rf(1321,14868,90787),nil
                    end
                elseif Ic<=44274 then
                    if Ic<=43689 then
                        if Ic<=42548 then
                            Ic,I=63543,Xa(kf,19)
                            continue
                        else
                            Ic,fc=fb[-11426]or rf(31582,-11426,41341),Xa(Z,563821067)
                            continue
                        end
                    else
                        kb=fc
                        if Z~=Z then
                            Ic=46912
                        else
                            Ic=6364
                        end
                    end
                else
                    fc=jf;
                    ue=ga(ue,Mc(ge(fc,127),(kd-10)*7))
                    if(not Ce(fc,128))then
                        Ic=fb[-9612]or rf(2158,-9612,89471)
                        continue
                    else
                        Ic=fb[-12528]or rf(26742,-12528,52860)
                        continue
                    end
                    Ic=fb[17144]or rf(29051,17144,54537)
                end
            elseif Ic>16234 then
                if Ic>22671 then
                    if Ic>27981 then
                        if Ic>31004 then
                            if Ic<=31785 then
                                Te,Ic=uf'',fb[23003]or rf(54672,23003,15702)
                                continue
                            else
                                xf,Ic=Xa(M,19),fb[-26989]or rf(4054,-26989,74992)
                                continue
                            end
                        elseif Ic>30360 then
                            M=Ua(Kc('\251','\185'),Gd,L);
                            Ic,L=32199,L+1
                        elseif Ic<30089 then
                            Te,Ic=Td,54164
                            continue
                        elseif Ic>30089 then
                            Ic,Wb=fb[-25641]or rf(56281,-25641,48201),Z
                        else
                            Nb,Ic=nil,fb[-24590]or rf(36972,-24590,13850)
                        end
                    elseif Ic>26352 then
                        if Ic<27415 then
                            Pb=0;
                            ya,fd,nd,Ic=1,232,228,26352
                        elseif Ic<=27415 then
                            Pb=Td
                            if(Pb==0)then
                                Ic=fb[5246]or rf(42771,5246,35852)
                                continue
                            else
                                Ic=fb[-20757]or rf(2690,-20757,87907)
                                continue
                            end
                            Ic=fb[-2322]or rf(4067,-2322,95732)
                        else
                            ka=Ua(Kc('$','f'),Gd,L);
                            Ic,L=45304,L+1
                        end
                    elseif Ic<=23689 then
                        if Ic<23249 then
                            xa,Ic=nil,fb[17684]or rf(24151,17684,93092)
                        elseif Ic<=23249 then
                            Td,Ic=nil,27365
                        else
                            fc=Ua(Kc('8','z'),Gd,L);
                            L,Ic=L+1,fb[29482]or rf(33433,29482,82342)
                        end
                    elseif Ic<=24552 then
                        Ad=oc[25522];
                        Te,Td=Rd(Ad,30),ge(Rd(Ad,20),1023);
                        oc[31361]=jf[Td+1];
                        oc[17998]=Te
                        if(Te==2)then
                            Ic=fb[20838]or rf(15957,20838,93361)
                            continue
                        else
                            Ic=fb[-17656]or rf(23461,-17656,126376)
                            continue
                        end
                        Ic=fb[-11661]or rf(17061,-11661,125265)
                    else
                        ae=nd
                        if fd~=fd then
                            Ic=fb[-23934]or rf(44362,-23934,14494)
                        else
                            Ic=fb[-5623]or rf(4924,-5623,68666)
                        end
                    end
                elseif Ic<=20632 then
                    if Ic<=18398 then
                        if Ic>16898 then
                            if Ic<=17188 then
                                kf=Ua(Kc('\183','\245'),Gd,L);
                                L,Ic=L+1,42548
                            else
                                if(ya>=0 and nd>fd)or((ya<0 or ya~=ya)and nd<fd)then
                                    Ic=fb[1126]or rf(2771,1126,89127)
                                else
                                    Ic=fb[20962]or rf(35563,20962,13539)
                                end
                            end
                        elseif Ic<16842 then
                            if(Aa==10)then
                                Ic=fb[8391]or rf(47204,8391,12316)
                                continue
                            else
                                Ic=fb[-26519]or rf(2685,-26519,110518)
                                continue
                            end
                            Ic=fb[6505]or rf(28330,6505,81246)
                        elseif Ic>16842 then
                            nd,fd=ge(Rd(kb,8),16777215),nil;
                            fd=if nd<8388608 then nd else nd-16777216;
                            Pb[44319],Ic=fd,fb[-13171]or rf(50594,-13171,11897)
                        else
                            oc=kb;
                            kd=ga(kd,Mc(ge(oc,127),(Nb-68)*7))
                            if(not Ce(oc,128))then
                                Ic=fb[24838]or rf(64714,24838,34764)
                                continue
                            else
                                Ic=fb[5382]or rf(56318,5382,11934)
                                continue
                            end
                            Ic=fb[-29999]or rf(11467,-29999,42419)
                        end
                    elseif Ic>=20445 then
                        if Ic>20445 then
                            kb=Nb;
                            oc=ge(kb,255);
                            Aa=r_[61698][oc+1];
                            Ad,Te,Td=Aa[1],Aa[2],Aa[3];
                            Pb={[33034]=0,[8363]=Te,[53910]=0,[58852]=0,[55315]=0,[17998]=0,[25522]=0,[63334]=0,[54239]=nil,[7435]=oc,[31361]=0,[62217]=0,[29510]=0,[7182]=0,[44319]=0};
                            kc(bd,Pb)
                            if(Ad==9)then
                                Ic=fb[1476]or rf(59893,1476,7189)
                                continue
                            else
                                Ic=fb[-4154]or rf(54636,-4154,1020)
                                continue
                            end
                            Ic=15503
                        else
                            Ic,nd=35696,Xa(fd,-795068383)
                            continue
                        end
                    elseif Ic>18490 then
                        Nb,Ic=Xa(kb,-795068383),20632
                        continue
                    else
                        oc[31361]=jf[j(oc[25522],0,24)+1];
                        Ic,oc[7182]=fb[15296]or rf(54338,15296,91702),j(oc[25522],31,1)==1
                    end
                elseif Ic>21568 then
                    if Ic>22665 then
                        Ic,kb=16842,Xa(oc,19)
                        continue
                    elseif Ic<=21833 then
                        if Wb then
                            Ic=fb[27724]or rf(14357,27724,48798)
                            continue
                        else
                            Ic=fb[31627]or rf(40386,31627,92454)
                            continue
                        end
                        Ic=fb[-4291]or rf(37826,-4291,68530)
                    else
                        Lb=je;
                        Pb=ga(Pb,Mc(ge(Lb,127),(ae-228)*7))
                        if not Ce(Lb,128)then
                            Ic=fb[-6128]or rf(17458,-6128,66091)
                            continue
                        end
                        Ic=fb[23887]or rf(34251,23887,45921)
                    end
                elseif Ic<21247 then
                    if Ic<=20762 then
                        Ic,lc=62427,Xa(ue,563821067)
                        continue
                    else
                        Pb[53910]=ge(Rd(kb,8),255);
                        nd=ge(Rd(kb,16),65535);
                        Pb[58852]=nd;
                        fd=nil;
                        fd=if nd<32768 then nd else nd-65536;
                        Ic,Pb[29510]=fb[26910]or rf(1919,26910,91082),fd
                    end
                elseif Ic<=21247 then
                    Z=fc;
                    Nb=Uc(Z);
                    Aa,oc,kb,Ic=1,(Z)+138,139,47921
                else
                    Pb=ge(Rd(Ad,10),1023);
                    Ic,oc[55315]=fb[21332]or rf(56587,21332,93695),jf[Pb+1]
                end
            elseif Ic<10136 then
                if Ic<=6364 then
                    if Ic<4218 then
                        if Ic<734 then
                            if Ic>174 then
                                bd=bd+Gc;
                                kd=bd
                                if bd~=bd then
                                    Ic=fb[19739]or rf(15550,19739,92800)
                                else
                                    Ic=32886
                                end
                            else
                                kb=Ua(Kc('\215\162\223','\235'),Gd,L);
                                L,Ic=L+4,18788
                            end
                        elseif Ic>734 then
                            if(Ad==7)then
                                Ic=fb[-20216]or rf(47623,-20216,54049)
                                continue
                            else
                                Ic=fb[29528]or rf(54967,29528,91327)
                                continue
                            end
                            Ic=fb[-30939]or rf(5182,-30939,97933)
                        else
                            kb=fc
                            if Z~=Z then
                                Ic=48056
                            else
                                Ic=fb[-7126]or rf(55150,-7126,96998)
                            end
                        end
                    elseif Ic<4929 then
                        if Ic>4218 then
                            Ic,jf[(kb-249)]=fb[-31076]or rf(58355,-31076,36872),Ad
                        else
                            Te,Ic=uf(nd),fb[-18378]or rf(45146,-18378,53536)
                            continue
                        end
                    elseif Ic>4929 then
                        if(Nb>=0 and fc>Z)or((Nb<0 or Nb~=Nb)and fc<Z)then
                            Ic=fb[22473]or rf(50057,22473,44525)
                        else
                            Ic=39575
                        end
                    else
                        if(Z>=0 and jf>fc)or((Z<0 or Z~=Z)and jf<fc)then
                            Ic=fb[-17247]or rf(38859,-17247,55207)
                        else
                            Ic=32702
                        end
                    end
                elseif Ic>8337 then
                    if Ic<8668 then
                        Gc,Ic=Xa(kd,563821067),fb[-15527]or rf(929,-15527,103717)
                        continue
                    elseif Ic>8668 then
                        oc[31361],Ic=jf[oc[29510]+1],fb[-24974]or rf(26500,-24974,78960)
                    else
                        oc=bd[(kb-114)];
                        Aa=oc[8363]
                        if Aa==6 then
                            Ic=fb[-6137]or rf(43918,-6137,83193)
                            continue
                        elseif Aa==5 then
                            Ic=fb[1728]or rf(47486,1728,65138)
                            continue
                        elseif(Aa==4)then
                            Ic=fb[6272]or rf(15261,6272,71602)
                            continue
                        else
                            Ic=fb[-24006]or rf(1813,-24006,90436)
                            continue
                        end
                        Ic=fb[-16685]or rf(35788,-16685,71608)
                    end
                elseif Ic>=7142 then
                    if Ic<=7142 then
                        Ic,Ad=fb[-1332]or rf(44620,-1332,15383),nil
                    else
                        Ic,Wb=fb[-26596]or rf(47722,-26596,89114),false
                    end
                elseif Ic<=6380 then
                    Ic,je=34346,nil
                else
                    Te,Ic=uf(nil),23249
                end
            elseif Ic<12749 then
                if Ic>=12090 then
                    if Ic<12624 then
                        if Ic>12090 then
                            ue=0;
                            Gc,Ic,Wb,bd=1,fb[5420]or rf(25273,5420,65029),14,10
                        else
                            Nb=jf
                            if fc~=fc then
                                Ic=fb[3857]or rf(65444,3857,32696)
                            else
                                Ic=fb[22561]or rf(60687,22561,24424)
                            end
                        end
                    elseif Ic<=12624 then
                        Td,Ic=Xa(Pb,563821067),fb[22961]or rf(14583,22961,95290)
                        continue
                    else
                        Z=0;
                        Ic,Nb,kb,oc=fb[-3624]or rf(29048,-3624,97625),138,142,1
                    end
                elseif Ic<11015 then
                    if Ic>10136 then
                        Nb=Nb+oc;
                        Aa=Nb
                        if Nb~=Nb then
                            Ic=fb[-12401]or rf(26033,-12401,96362)
                        else
                            Ic=fb[26480]or rf(17566,26480,38833)
                        end
                    else
                        kd=bd
                        if Wb~=Wb then
                            Ic=fb[-28211]or rf(27727,-28211,39505)
                        else
                            Ic=32886
                        end
                    end
                elseif Ic<=11015 then
                    if(Aa==6)then
                        Ic=fb[-10373]or rf(38751,-10373,83958)
                        continue
                    else
                        Ic=fb[18295]or rf(35387,18295,45623)
                        continue
                    end
                    Ic=fb[-29606]or rf(35616,-29606,12955)
                else
                    jf=jf+Z;
                    Nb=jf
                    if jf~=jf then
                        Ic=fb[-11327]or rf(54036,-11327,11240)
                    else
                        Ic=4929
                    end
                end
            elseif Ic<=14541 then
                if Ic>13523 then
                    if Ic>14021 then
                        fd=Ua(Kc('\"W*','\30'),Gd,L);
                        L,Ic=L+4,20445
                    else
                        nd,Ic=nil,56040
                    end
                elseif Ic<13323 then
                    Ic=fb[-28372]or rf(50768,-28372,12378)
                    continue
                elseif Ic<=13323 then
                    if(oc>=0 and Nb>kb)or((oc<0 or oc~=oc)and Nb<kb)then
                        Ic=fb[-1523]or rf(64232,-1523,35493)
                    else
                        Ic=7142
                    end
                else
                    Te=Ua(Kc('\131','\193'),Gd,L);
                    L,Ic=L+1,60469
                end
            elseif Ic>=15838 then
                if Ic>15838 then
                    kd=0;
                    fc,Ic,Z,jf=72,fb[25619]or rf(40437,25619,60183),1,68
                else
                    Ic,Ad=fb[11325]or rf(49480,11325,29827),pf(Te[1],1,Te[2])
                end
            else
                if(Td)then
                    Ic=fb[-14776]or rf(32841,-14776,48582)
                    continue
                else
                    Ic=fb[2650]or rf(3779,2650,76418)
                    continue
                end
                Ic=fb[-16967]or rf(17758,-16967,90905)
            end
        end
    end
    local wc=Cd();
    r_[44484][Gd]=wc
    return wc
end)
local zc=(function(ne,v)
    ne=Xe(ne)
    local na=F()
    local function yc(nc,rb)
        local Vd=(function(...)
            return{...},D('#',...)
        end)
        local Je;
        Je=(function(we,df,K)
            if df>K then
                return
            end
            return we[df],Je(we,df+1,K)
        end)
        local function Ud(n_,Hc,ad,Fb)
            local w_,dc,za,db,ze,yb,Ae,Ya,ec,Ib,ac,vc,Oe,Jd,Ld,bf,hd,Wa,Ja,Qd,pb,c,gc,Le;
            Jd,yb={},function(Ue,wf,La)
                Jd[La]=vd(wf,32467)-vd(Ue,15732)
                return Jd[La]
            end;
            w_=Jd[-13716]or yb(10335,4457,-13716)
            repeat
                if w_<=29604 then
                    if w_>11630 then
                        if w_<=20107 then
                            if w_<14785 then
                                if w_>13372 then
                                    if w_<=14103 then
                                        if w_<=13856 then
                                            if w_<=13646 then
                                                Qd={[3]=bf,[1]=n_};
                                                w_,Ae[bf]=Jd[-29456]or yb(58689,115979,-29456),Qd
                                            else
                                                n_[ze[63334]],w_=hd,Jd[28321]or yb(44443,40790,28321)
                                            end
                                        else
                                            ac,w_=dc-1,Jd[-4924]or yb(49390,116050,-4924)
                                        end
                                    else
                                        db,vc,dc,w_=ze[17998],ad[pb+1],nil,4594
                                    end
                                elseif w_>12624 then
                                    if w_<=13012 then
                                        n_[ze[53910]],w_=dc,Jd[6662]or yb(47946,33741,6662)
                                    else
                                        ec,gc=vc[55315],ze[55315];
                                        gc=Kc('\14\18l','V')..gc;
                                        ac='';
                                        Ld,Ja,w_,Ib=1,62,Jd[20762]or yb(12196,16792,20762),(#ec-1)+62
                                    end
                                elseif w_>=12616 then
                                    if w_<=12616 then
                                        if(Ya>128)then
                                            w_=Jd[-4227]or yb(16134,30542,-4227)
                                            continue
                                        else
                                            w_=Jd[-16058]or yb(34753,125328,-16058)
                                            continue
                                        end
                                        w_=Jd[1201]or yb(47731,43342,1201)
                                    else
                                        if Ya>192 then
                                            w_=Jd[-25883]or yb(30911,88970,-25883)
                                            continue
                                        else
                                            w_=Jd[14597]or yb(51647,128381,14597)
                                            continue
                                        end
                                        w_=Jd[-23699]or yb(19096,46673,-23699)
                                    end
                                elseif w_>12470 then
                                    if(not n_[ze[53910]])then
                                        w_=Jd[309]or yb(48567,37529,309)
                                        continue
                                    else
                                        w_=Jd[-25680]or yb(25421,53276,-25680)
                                        continue
                                    end
                                    w_=Jd[-31575]or yb(41892,37301,-31575)
                                else
                                    pb+=ze[29510];
                                    w_=Jd[1873]or yb(29895,58522,1873)
                                end
                            elseif w_>=17773 then
                                if w_>19782 then
                                    if w_<=20053 then
                                        db=rb[ze[33034]+1];
                                        w_,n_[ze[53910]]=Jd[14663]or yb(5454,1539,14663),db[1][db[3]]
                                    else
                                        if(gc[3]>=ze[53910])then
                                            w_=Jd[20240]or yb(48019,52650,20240)
                                            continue
                                        else
                                            w_=Jd[1393]or yb(21129,97159,1393)
                                            continue
                                        end
                                        w_=Jd[-23169]or yb(55464,67040,-23169)
                                    end
                                elseif w_>=18823 then
                                    if w_<=18823 then
                                        Ld=ac
                                        if Ja~=Ja then
                                            w_=Jd[-32157]or yb(23364,51221,-32157)
                                        else
                                            w_=Jd[-241]or yb(7527,18136,-241)
                                        end
                                    else
                                        if(Ld>=0 and Ja>Ib)or((Ld<0 or Ld~=Ld)and Ja<Ib)then
                                            w_=Jd[-1568]or yb(23181,3338,-1568)
                                        else
                                            w_=Jd[14302]or yb(61881,87982,14302)
                                        end
                                    end
                                elseif w_>17773 then
                                    ec,gc=vc(dc,hd);
                                    hd=ec
                                    if hd==nil then
                                        w_=Jd[28347]or yb(35396,93690,28347)
                                    else
                                        w_=40117
                                    end
                                else
                                    pb-=1;
                                    w_,ad[pb]=Jd[27386]or yb(24276,51941,27386),{[7435]=193,[53910]=Xa(ze[53910],73),[33034]=Xa(ze[33034],212),[63334]=0}
                                end
                            elseif w_>15676 then
                                if w_>15880 then
                                    if(Ya>89)then
                                        w_=Jd[17473]or yb(64605,127104,17473)
                                        continue
                                    else
                                        w_=Jd[25735]or yb(27554,83195,25735)
                                        continue
                                    end
                                    w_=Jd[-300]or yb(26692,56085,-300)
                                else
                                    db,vc,dc=ze[63334],ze[53910],ze[31361];
                                    hd=n_[vc];
                                    n_[db+1]=hd;
                                    n_[db]=hd[dc];
                                    pb+=1;
                                    w_=Jd[-23744]or yb(63136,90809,-23744)
                                end
                            elseif w_<14829 then
                                Wa=Ib
                                if Ld~=Ld then
                                    w_=Jd[-14610]or yb(21612,73993,-14610)
                                else
                                    w_=6499
                                end
                            elseif w_>14829 then
                                vc,dc,hd=cb(vc);
                                w_=Jd[-1220]or yb(51311,83070,-1220)
                            else
                                if(Ib>=0 and ac>Ja)or((Ib<0 or Ib~=Ib)and ac<Ja)then
                                    w_=Jd[6994]or yb(43174,49330,6994)
                                else
                                    w_=39719
                                end
                            end
                        elseif w_>25311 then
                            if w_<=27804 then
                                if w_>27323 then
                                    if w_<=27527 then
                                        pb+=ze[29510];
                                        w_=Jd[-6698]or yb(14493,10412,-6698)
                                    else
                                        db=Qc(vc)
                                        if(db~=nil and db[Kc('v\137\241]\179\234',')\214\152')]~=nil)then
                                            w_=Jd[20077]or yb(60216,73128,20077)
                                            continue
                                        else
                                            w_=Jd[-27668]or yb(28840,8694,-27668)
                                            continue
                                        end
                                        w_=Jd[-19369]or yb(33825,75837,-19369)
                                    end
                                elseif w_>=27192 then
                                    if w_<=27192 then
                                        if(ze[63334]==76)then
                                            w_=Jd[-24656]or yb(8701,97837,-24656)
                                            continue
                                        else
                                            w_=Jd[11757]or yb(31698,59944,11757)
                                            continue
                                        end
                                        w_=Jd[-22669]or yb(21812,50693,-22669)
                                    else
                                        if Ya>67 then
                                            w_=Jd[-8760]or yb(12214,10492,-8760)
                                            continue
                                        else
                                            w_=Jd[-627]or yb(7991,16233,-627)
                                            continue
                                        end
                                        w_=Jd[29762]or yb(115,62286,29762)
                                    end
                                else
                                    w_,n_[ze[53910]]=Jd[-30292]or yb(19476,48933,-30292),n_[ze[33034]]
                                end
                            elseif w_<=28858 then
                                if w_>28167 then
                                    pb+=ze[29510];
                                    w_=Jd[32320]or yb(28715,58150,32320)
                                elseif w_>27941 then
                                    pb-=1;
                                    ad[pb],w_={[7435]=189,[53910]=Xa(ze[53910],230),[33034]=Xa(ze[33034],85),[63334]=0},Jd[27608]or yb(20627,49326,27608)
                                else
                                    pb-=1;
                                    ad[pb],w_={[7435]=44,[53910]=Xa(ze[53910],206),[33034]=Xa(ze[33034],153),[63334]=0},Jd[23078]or yb(9289,5888,23078)
                                end
                            else
                                return Je(n_,db,db+hd-1)
                            end
                        elseif w_>=23183 then
                            if w_<=23728 then
                                if w_<23545 then
                                    Le,pb,Ae,c,za,w_=-1,1,tb({},{[Kc('\251\18N\203)F','\164M#')]=Kc('\222\219','\168')}),tb({},{[Kc('+\205\50\27\246:','t\146_')]=Kc('\128\152','\235')}),false,20630
                                elseif w_<=23545 then
                                    w_=Jd[-21884]or yb(34199,41587,-21884)
                                    continue
                                else
                                    ac,w_=ac..Xc(Xa(ba(ec,(Oe-122)+1),ba(gc,(Oe-122)%#gc+1))),Jd[-18678]or yb(24088,50431,-18678)
                                end
                            elseif w_>23854 then
                                hd,w_=Le-db+1,Jd[26568]or yb(60151,79348,26568)
                            else
                                vc,dc,hd=Ae
                                if(Sb(vc)~=Kc('Q\27\218\128C\a\219\141','7n\180\227'))then
                                    w_=Jd[13170]or yb(31043,52736,13170)
                                    continue
                                else
                                    w_=Jd[8044]or yb(33490,74732,8044)
                                    continue
                                end
                                w_=Jd[11710]or yb(10442,52612,11710)
                            end
                        elseif w_>22208 then
                            if w_<=22919 then
                                if(Ya>205)then
                                    w_=Jd[-16876]or yb(23812,62141,-16876)
                                    continue
                                else
                                    w_=Jd[-28272]or yb(42705,93273,-28272)
                                    continue
                                end
                                w_=Jd[-2114]or yb(27314,54927,-2114)
                            else
                                vc,dc,hd=db[Kc('\185F\4\146|\31','\230\25m')](vc);
                                w_=Jd[-22103]or yb(49129,92455,-22103)
                            end
                        elseif w_<21355 then
                            if(not za)then
                                w_=Jd[-26119]or yb(2433,37339,-26119)
                                continue
                            else
                                w_=Jd[-31793]or yb(171,9855,-31793)
                                continue
                            end
                            w_=Jd[1560]or yb(25204,1822,1560)
                        elseif w_<=21355 then
                            w_,vc[62217]=Jd[-4052]or yb(36743,121387,-4052),ec
                        else
                            Ja=Ja+Ld;
                            Oe=Ja
                            if Ja~=Ja then
                                w_=Jd[-31598]or yb(5409,19174,-31598)
                            else
                                w_=Jd[-3737]or yb(34545,95768,-3737)
                            end
                        end
                    elseif w_<=6136 then
                        if w_<=3040 then
                            if w_>=1835 then
                                if w_<2226 then
                                    if w_>1874 then
                                        db[31361]=vc;
                                        w_,ze[7435]=Jd[-7961]or yb(21970,51183,-7961),126
                                    elseif w_<=1835 then
                                        db,vc,dc=ze[31361],ze[7182],n_[ze[53910]]
                                        if(dc==db)~=vc then
                                            w_=Jd[-7761]or yb(61609,123346,-7761)
                                            continue
                                        else
                                            w_=Jd[-6690]or yb(40891,77015,-6690)
                                            continue
                                        end
                                        w_=Jd[-25763]or yb(47132,43821,-25763)
                                    else
                                        vc,dc,hd=Ae
                                        if Sb(vc)~=Kc('\156\152T\14\142\132U\3','\250\237:m')then
                                            w_=Jd[-3720]or yb(30150,85004,-3720)
                                            continue
                                        end
                                        w_=Jd[-29552]or yb(41960,85280,-29552)
                                    end
                                elseif w_>=2670 then
                                    if w_<=2670 then
                                        pb-=1;
                                        w_,ad[pb]=Jd[-32641]or yb(9043,4206,-32641),{[7435]=219,[53910]=Xa(ze[53910],140),[33034]=Xa(ze[33034],210),[63334]=0}
                                    else
                                        w_,hd=Jd[13247]or yb(55608,113159,13247),ac
                                        continue
                                    end
                                else
                                    vc[31361]=dc
                                    if db==2 then
                                        w_=Jd[-6101]or yb(55794,72998,-6101)
                                        continue
                                    elseif db==3 then
                                        w_=Jd[-20235]or yb(46921,97201,-20235)
                                        continue
                                    end
                                    w_=Jd[8142]or yb(24238,76556,8142)
                                end
                            elseif w_>433 then
                                if w_<=576 then
                                    w_,hd=Jd[4320]or yb(21107,95222,4320),ac
                                    continue
                                else
                                    if Ya>129 then
                                        w_=Jd[31561]or yb(20972,91938,31561)
                                        continue
                                    else
                                        w_=Jd[-11808]or yb(17341,52930,-11808)
                                        continue
                                    end
                                    w_=Jd[-27974]or yb(21157,48820,-27974)
                                end
                            elseif w_>390 then
                                bf=Oe[33034];
                                Qd=Ae[bf]
                                if Qd==nil then
                                    w_=Jd[-27722]or yb(56864,91761,-27722)
                                    continue
                                end
                                w_=Jd[10989]or yb(50198,107478,10989)
                            elseif w_<=367 then
                                if(Ya>96)then
                                    w_=Jd[-6839]or yb(9342,24207,-6839)
                                    continue
                                else
                                    w_=Jd[-21301]or yb(64708,38889,-21301)
                                    continue
                                end
                                w_=Jd[-32679]or yb(23035,52214,-32679)
                            else
                                Ja=ec
                                if gc~=gc then
                                    w_=Jd[22800]or yb(32406,1233,22800)
                                else
                                    w_=11630
                                end
                            end
                        elseif w_>5452 then
                            if w_<5802 then
                                if w_<=5518 then
                                    hd=n_[db];
                                    gc,w_,ac,ec=vc,Jd[-8859]or yb(64180,46997,-8859),1,db+1
                                else
                                    Oe=Ja
                                    if Ib~=Ib then
                                        w_=Jd[19752]or yb(36362,49549,19752)
                                    else
                                        w_=19782
                                    end
                                end
                            elseif w_<=5802 then
                                gc[2]=gc[1][gc[3]];
                                gc[1]=gc;
                                gc[3]=2;
                                w_,Ae[ec]=Jd[-10263]or yb(39407,81127,-10263),nil
                            else
                                if(Ib>=0 and ac>Ja)or((Ib<0 or Ib~=Ib)and ac<Ja)then
                                    w_=Jd[28057]or yb(16237,11388,28057)
                                else
                                    w_=Jd[-14854]or yb(40131,51413,-14854)
                                end
                            end
                        elseif w_<4594 then
                            if w_<3299 then
                                if ze[63334]==31 then
                                    w_=Jd[23718]or yb(49344,95985,23718)
                                    continue
                                elseif ze[63334]==84 then
                                    w_=Jd[24912]or yb(16086,3962,24912)
                                    continue
                                elseif(ze[63334]==110)then
                                    w_=Jd[10212]or yb(18031,86045,10212)
                                    continue
                                else
                                    w_=Jd[-13006]or yb(849,5704,-13006)
                                    continue
                                end
                                w_=Jd[-25576]or yb(58036,85637,-25576)
                            elseif w_<=3299 then
                                db,vc=ze[53910],ze[33034];
                                dc=vc-1
                                if(dc==-1)then
                                    w_=Jd[1757]or yb(65226,88142,1757)
                                    continue
                                else
                                    w_=Jd[20280]or yb(41920,46301,20280)
                                    continue
                                end
                                w_=29604
                            else
                                if(Sb(vc)==Kc('\170j\188g\187','\222\v'))then
                                    w_=Jd[32152]or yb(11417,33866,32152)
                                    continue
                                else
                                    w_=Jd[-10489]or yb(28723,37939,-10489)
                                    continue
                                end
                                w_=Jd[-13806]or yb(25385,34085,-13806)
                            end
                        elseif w_>5199 then
                            w_,n_[ze[53910]]=Jd[-12152]or yb(18767,38344,-12152),dc[ze[55315]][ze[62217]]
                        elseif w_<=4594 then
                            hd,ec=vc[31361],ze[31361];
                            ec=Kc('\127c\29',"\'")..ec;
                            gc='';
                            Ib,w_,ac,Ja=1,53981,59,(#hd-1)+59
                        else
                            Oe=ad[pb];
                            pb+=1;
                            Wa=Oe[53910]
                            if Wa==0 then
                                w_=Jd[27611]or yb(12148,45140,27611)
                                continue
                            elseif Wa==1 then
                                w_=Jd[-22023]or yb(55666,39780,-22023)
                                continue
                            elseif Wa==2 then
                                w_=Jd[20045]or yb(41419,125496,20045)
                                continue
                            end
                            w_=Jd[23634]or yb(22083,34156,23634)
                        end
                    elseif w_>9880 then
                        if w_<=11098 then
                            if w_<10383 then
                                if w_<=9909 then
                                    ec=ec+ac;
                                    Ja=ec
                                    if ec~=ec then
                                        w_=Jd[19880]or yb(43427,46116,19880)
                                    else
                                        w_=Jd[-1358]or yb(12662,18339,-1358)
                                    end
                                else
                                    if Ya>95 then
                                        w_=Jd[-12656]or yb(27401,63968,-12656)
                                        continue
                                    else
                                        w_=Jd[17968]or yb(1747,40937,17968)
                                        continue
                                    end
                                    w_=Jd[-22186]or yb(28864,57497,-22186)
                                end
                            elseif w_>10870 then
                                w_,hd=Jd[4489]or yb(64669,84830,4489),vc-1
                            elseif w_<=10383 then
                                w_,dc=2226,gc
                                continue
                            else
                                w_,n_[ze[53910]]=Jd[-13539]or yb(36543,96946,-13539),nil
                            end
                        elseif w_<=11410 then
                            if w_>11387 then
                                gc[2]=gc[1][gc[3]];
                                gc[1]=gc;
                                gc[3]=2;
                                w_,Ae[ec]=Jd[-2549]or yb(24847,36609,-2549),nil
                            elseif w_<=11262 then
                                if ze[63334]==8 then
                                    w_=Jd[2264]or yb(37359,120069,2264)
                                    continue
                                elseif(ze[63334]==218)then
                                    w_=Jd[17079]or yb(35788,89358,17079)
                                    continue
                                else
                                    w_=Jd[12582]or yb(16131,6004,12582)
                                    continue
                                end
                                w_=Jd[28529]or yb(28258,56703,28529)
                            else
                                Oe=Ja
                                if Ib~=Ib then
                                    w_=Jd[-7043]or yb(11606,27825,-7043)
                                else
                                    w_=Jd[9411]or yb(64535,79845,9411)
                                end
                            end
                        else
                            if(ac>=0 and ec>gc)or((ac<0 or ac~=ac)and ec<gc)then
                                w_=Jd[6361]or yb(35712,37831,6361)
                            else
                                w_=55718
                            end
                        end
                    elseif w_<=7800 then
                        if w_>7014 then
                            if w_>7248 then
                                db,vc=ze[53910],ze[33034]-1
                                if vc==-1 then
                                    w_=Jd[16948]or yb(13619,60459,16948)
                                    continue
                                end
                                w_=63115
                            else
                                if ze[63334]==121 then
                                    w_=Jd[26372]or yb(62961,68553,26372)
                                    continue
                                else
                                    w_=Jd[-15564]or yb(7643,16884,-15564)
                                    continue
                                end
                                w_=Jd[12800]or yb(1398,63051,12800)
                            end
                        elseif w_<6861 then
                            if w_>6206 then
                                if(Oe>=0 and Ib>Ld)or((Oe<0 or Oe~=Oe)and Ib<Ld)then
                                    w_=Jd[20597]or yb(314,85443,20597)
                                else
                                    w_=65175
                                end
                            else
                                pb+=ze[29510];
                                w_=Jd[27342]or yb(27252,55621,27342)
                            end
                        elseif w_<=6861 then
                            za=false;
                            pb+=1
                            if(Ya>109)then
                                w_=Jd[-10014]or yb(51666,107945,-10014)
                                continue
                            else
                                w_=Jd[-16842]or yb(26930,40969,-16842)
                                continue
                            end
                            w_=Jd[-13933]or yb(14414,11011,-13933)
                        else
                            if Ya>104 then
                                w_=Jd[-27634]or yb(61345,35727,-27634)
                                continue
                            else
                                w_=Jd[10143]or yb(32030,36098,10143)
                                continue
                            end
                            w_=Jd[4106]or yb(38285,34652,4106)
                        end
                    elseif w_>8935 then
                        if w_>9290 then
                            w_,Le=Jd[21160]or yb(29629,94819,21160),db+ac-1
                        else
                            vc,w_=ec,Jd[26913]or yb(21139,1602,26913)
                            continue
                        end
                    elseif w_>8839 then
                        gc,ac=vc[62217],ze[62217];
                        ac=Kc('\154\134\248','\194')..ac;
                        Ja='';
                        Ib,w_,Ld,Oe=98,14785,(#gc-1)+98,1
                    elseif w_<=8055 then
                        if Ya>44 then
                            w_=Jd[-4137]or yb(32041,95586,-4137)
                            continue
                        else
                            w_=Jd[-32086]or yb(58063,114426,-32086)
                            continue
                        end
                        w_=Jd[-24834]or yb(54529,83928,-24834)
                    else
                        if Ya>107 then
                            w_=Jd[2363]or yb(2474,50961,2363)
                            continue
                        else
                            w_=Jd[-16838]or yb(35471,38510,-16838)
                            continue
                        end
                        w_=Jd[-9522]or yb(36388,97589,-9522)
                    end
                elseif w_>47635 then
                    if w_>58275 then
                        if w_>63115 then
                            if w_>=63828 then
                                if w_<=65175 then
                                    if w_<63962 then
                                        vc,dc,hd=c
                                        if Sb(vc)~=Kc('y\161gEk\189fH','\31\212\t&')then
                                            w_=Jd[23568]or yb(50341,123782,23568)
                                            continue
                                        end
                                        w_=Jd[3272]or yb(22898,55115,3272)
                                    elseif w_<=63962 then
                                        db=ze[31361];
                                        n_[ze[33034]]=n_[ze[63334]][db];
                                        pb+=1;
                                        w_=Jd[-11475]or yb(40259,36382,-11475)
                                    else
                                        Ja,w_=Ja..Xc(Xa(ba(gc,(Wa-98)+1),ba(ac,(Wa-98)%#ac+1))),Jd[-8169]or yb(44873,80530,-8169)
                                    end
                                elseif w_<=65315 then
                                    dc,hd=db[31361],ze[31361];
                                    hd=Kc('\241\237\147','\169')..hd;
                                    ec='';
                                    w_,ac,Ja,gc=52461,(#dc-1)+210,1,210
                                else
                                    pb-=1;
                                    w_,ad[pb]=Jd[-32034]or yb(35493,95924,-32034),{[7435]=99,[53910]=Xa(ze[53910],83),[33034]=Xa(ze[33034],12),[63334]=0}
                                end
                            elseif w_<=63532 then
                                if w_>63398 then
                                    w_,gc[(Ld-137)]=Jd[25955]or yb(5198,50961,25955),rb[Oe[33034]+1]
                                elseif w_<=63170 then
                                    w_,ec=Jd[6922]or yb(24025,51915,6922),Ja
                                    continue
                                else
                                    w_,ac=Jd[5049]or yb(4792,51279,5049),ac..Xc(Xa(ba(ec,(Oe-62)+1),ba(gc,(Oe-62)%#gc+1)))
                                end
                            else
                                db,vc,dc=Xa(ze[33034],84),Xa(ze[53910],84),Xa(ze[63334],38);
                                hd,ec=vc==0 and Le-db or vc-1,n_[db];
                                gc,ac=Vd(ec(Je(n_,db+1,db+hd)))
                                if dc==0 then
                                    w_=Jd[-24815]or yb(43523,49372,-24815)
                                    continue
                                else
                                    w_=Jd[-2839]or yb(57573,92795,-2839)
                                    continue
                                end
                                w_=48615
                            end
                        elseif w_<=59564 then
                            if w_>59331 then
                                if w_<=59483 then
                                    if(Ya>158)then
                                        w_=Jd[-17949]or yb(11642,49083,-17949)
                                        continue
                                    else
                                        w_=Jd[28113]or yb(61523,44952,28113)
                                        continue
                                    end
                                    w_=Jd[8134]or yb(50730,79143,8134)
                                else
                                    vc,dc,hd=cb(vc);
                                    w_=Jd[4872]or yb(36288,77982,4872)
                                end
                            elseif w_>59092 then
                                ec,w_=ec..Xc(Xa(ba(dc,(Ib-210)+1),ba(hd,(Ib-210)%#hd+1))),Jd[-25000]or yb(57067,66354,-25000)
                            elseif w_<59002 then
                                pb-=1;
                                ad[pb],w_={[7435]=45,[53910]=Xa(ze[53910],83),[33034]=Xa(ze[33034],175),[63334]=0},Jd[27673]or yb(35603,96302,27673)
                            elseif w_>59002 then
                                if(Ya>174)then
                                    w_=Jd[1204]or yb(38737,71269,1204)
                                    continue
                                else
                                    w_=Jd[19414]or yb(52402,107762,19414)
                                    continue
                                end
                                w_=Jd[-589]or yb(49034,44359,-589)
                            else
                                pb-=1;
                                ad[pb],w_={[7435]=71,[53910]=Xa(ze[53910],15),[33034]=Xa(ze[33034],86),[63334]=0},Jd[-23697]or yb(28053,57252,-23697)
                            end
                        elseif w_<62837 then
                            if w_>59949 then
                                ze[7435]=15;
                                pb+=1;
                                w_=Jd[-4222]or yb(20643,49342,-4222)
                            else
                                db=Qc(vc)
                                if db~=nil and db[Kc('g\ngL0|','8U\14')]~=nil then
                                    w_=Jd[-16288]or yb(65408,91099,-16288)
                                    continue
                                elseif Sb(vc)==Kc('\238\203\248\198\255','\154\170')then
                                    w_=Jd[18968]or yb(43065,80930,18968)
                                    continue
                                end
                                w_=Jd[15631]or yb(48223,92241,15631)
                            end
                        elseif w_>62837 then
                            bc(Fb[15448],1,vc,db,n_);
                            w_=Jd[29175]or yb(30382,58019,29175)
                        else
                            ac=ac+Ib;
                            Ld=ac
                            if ac~=ac then
                                w_=Jd[-9217]or yb(16491,56189,-9217)
                            else
                                w_=14829
                            end
                        end
                    elseif w_>54073 then
                        if w_<57454 then
                            if w_<=56495 then
                                if w_>=56462 then
                                    if w_<=56462 then
                                        if(Ya>126)then
                                            w_=Jd[6885]or yb(2056,45487,6885)
                                            continue
                                        else
                                            w_=Jd[-5907]or yb(48260,44117,-5907)
                                            continue
                                        end
                                        w_=Jd[-28622]or yb(60307,88494,-28622)
                                    else
                                        vc,dc,hd=db[Kc('\153\20\158\178.\133','\198K\247')](vc);
                                        w_=Jd[-14487]or yb(40372,39041,-14487)
                                    end
                                else
                                    hd..=n_[Ja];
                                    w_=Jd[-21429]or yb(6567,13659,-21429)
                                end
                            else
                                w_,n_[ze[53910]]=Jd[-5378]or yb(58039,85642,-5378),#n_[ze[33034]]
                            end
                        elseif w_<58194 then
                            if w_>57454 then
                                vc[55315],w_=hd,Jd[28586]or yb(17867,70679,28586)
                            else
                                if(Ya>15)then
                                    w_=Jd[5621]or yb(32875,46907,5621)
                                    continue
                                else
                                    w_=Jd[-16401]or yb(15044,51150,-16401)
                                    continue
                                end
                                w_=Jd[8110]or yb(13309,8652,8110)
                            end
                        elseif w_>=58256 then
                            if w_>58256 then
                                w_,gc[(Ld-137)]=Jd[14828]or yb(25423,36880,14828),Qd
                            else
                                pb+=1;
                                w_=Jd[29414]or yb(56564,85189,29414)
                            end
                        else
                            if Ya>71 then
                                w_=Jd[-5239]or yb(9013,38893,-5239)
                                continue
                            else
                                w_=Jd[-14145]or yb(31736,7183,-14145)
                                continue
                            end
                            w_=Jd[-22631]or yb(23148,51581,-22631)
                        end
                    elseif w_<=52052 then
                        if w_<=48925 then
                            if w_>48785 then
                                db=rb[ze[33034]+1];
                                db[1][db[3]],w_=n_[ze[53910]],Jd[19088]or yb(62377,90528,19088)
                            elseif w_<48615 then
                                bf={[2]=n_[Oe[33034]],[3]=2};
                                bf[1]=bf;
                                gc[(Ld-137)],w_=bf,Jd[-25007]or yb(26467,37964,-25007)
                            elseif w_<=48615 then
                                bc(gc,1,ac,db,n_);
                                w_=Jd[6096]or yb(31512,59857,6096)
                            else
                                if Ya>193 then
                                    w_=Jd[11111]or yb(57554,84478,11111)
                                    continue
                                else
                                    w_=Jd[-12625]or yb(5205,9378,-12625)
                                    continue
                                end
                                w_=Jd[7501]or yb(52306,81775,7501)
                            end
                        elseif w_<=51965 then
                            db,vc,dc=ze[31361],ze[7182],n_[ze[53910]]
                            if(dc==db)~=vc then
                                w_=Jd[7828]or yb(18761,39460,7828)
                                continue
                            else
                                w_=Jd[-32465]or yb(45264,69607,-32465)
                                continue
                            end
                            w_=Jd[7635]or yb(53928,81569,7635)
                        else
                            if Ya>53 then
                                w_=Jd[-10487]or yb(21881,73524,-10487)
                                continue
                            else
                                w_=Jd[7548]or yb(32137,61248,7548)
                                continue
                            end
                            w_=Jd[-25094]or yb(31835,61206,-25094)
                        end
                    elseif w_<53540 then
                        if w_>52461 then
                            db,vc=ze[53910],ze[33034];
                            dc,hd=u_(ed,n_,'',db,vc)
                            if(not dc)then
                                w_=Jd[-26699]or yb(18206,61739,-26699)
                                continue
                            else
                                w_=Jd[-25722]or yb(64092,33691,-25722)
                                continue
                            end
                            w_=Jd[10023]or yb(44100,47491,10023)
                        else
                            Ib=gc
                            if ac~=ac then
                                w_=Jd[-15461]or yb(15462,23439,-15461)
                            else
                                w_=33902
                            end
                        end
                    elseif w_<53981 then
                        pb+=ze[29510];
                        w_=Jd[-30213]or yb(31074,60031,-30213)
                    elseif w_>53981 then
                        ec,gc=vc[55315],ze[55315];
                        gc=Kc('\220\192\190','\132')..gc;
                        ac='';
                        Ja,w_,Ld,Ib=122,5656,1,(#ec-1)+122
                    else
                        Ld=ac
                        if Ja~=Ja then
                            w_=Jd[-11724]or yb(11738,18414,-11724)
                        else
                            w_=14829
                        end
                    end
                elseif w_<=40181 then
                    if w_>=35505 then
                        if w_>38802 then
                            if w_>=39719 then
                                if w_<40117 then
                                    gc,w_=gc..Xc(Xa(ba(hd,(Ld-59)+1),ba(ec,(Ld-59)%#ec+1))),Jd[-31479]or yb(3730,87944,-31479)
                                elseif w_<=40117 then
                                    zd(gc);
                                    c[ec],w_=nil,Jd[7705]or yb(29889,61844,7705)
                                else
                                    n_[ze[53910]]=Uc(ze[25522]);
                                    pb+=1;
                                    w_=Jd[11502]or yb(12259,7678,11502)
                                end
                            elseif w_<=39424 then
                                if ze[63334]==162 then
                                    w_=Jd[32759]or yb(20830,76919,32759)
                                    continue
                                else
                                    w_=Jd[6971]or yb(34401,47403,6971)
                                    continue
                                end
                                w_=Jd[-8970]or yb(44315,40918,-8970)
                            else
                                gc=gc+Ja;
                                Ib=gc
                                if gc~=gc then
                                    w_=Jd[8659]or yb(18081,57036,8659)
                                else
                                    w_=Jd[-28166]or yb(7046,54707,-28166)
                                end
                            end
                        elseif w_<=38231 then
                            if w_<37000 then
                                if w_<=35505 then
                                    vc=Fb[15385];
                                    Le,w_=db+vc-1,Jd[-31365]or yb(45148,130400,-31365)
                                else
                                    vc,dc,hd=db[Kc('\162\244\248\137\206\227','\253\171\145')](vc);
                                    w_=Jd[-24023]or yb(11492,53754,-24023)
                                end
                            elseif w_<=37000 then
                                ac=ac+Ib;
                                Ld=ac
                                if ac~=ac then
                                    w_=Jd[23975]or yb(32970,94343,23975)
                                else
                                    w_=6136
                                end
                            else
                                ec,gc=vc(dc,hd);
                                hd=ec
                                if hd==nil then
                                    w_=Jd[16975]or yb(31361,58968,16975)
                                else
                                    w_=Jd[-20965]or yb(27364,55496,-20965)
                                end
                            end
                        elseif w_>38627 then
                            pb-=1;
                            ad[pb],w_={[7435]=10,[53910]=Xa(ze[53910],198),[33034]=Xa(ze[33034],248),[63334]=0},Jd[3286]or yb(61247,89138,3286)
                        else
                            if Ya>189 then
                                w_=Jd[10855]or yb(38252,41312,10855)
                                continue
                            else
                                w_=Jd[7576]or yb(58111,73403,7576)
                                continue
                            end
                            w_=Jd[-12403]or yb(14075,8950,-12403)
                        end
                    elseif w_>=33902 then
                        if w_<34512 then
                            if w_<=33902 then
                                if(Ja>=0 and gc>ac)or((Ja<0 or Ja~=Ja)and gc<ac)then
                                    w_=Jd[16108]or yb(46077,52224,16108)
                                else
                                    w_=59331
                                end
                            else
                                db,vc,w_=ad[pb],nil,Jd[-14089]or yb(62073,110819,-14089)
                            end
                        elseif w_<=34771 then
                            if w_<=34512 then
                                Ja=Ja+Ld;
                                Oe=Ja
                                if Ja~=Ja then
                                    w_=Jd[6613]or yb(58194,40629,6613)
                                else
                                    w_=Jd[-19877]or yb(12416,60180,-19877)
                                end
                            else
                                if(Ld>=0 and Ja>Ib)or((Ld<0 or Ld~=Ld)and Ja<Ib)then
                                    w_=Jd[31745]or yb(41485,57194,31745)
                                else
                                    w_=63398
                                end
                            end
                        else
                            if(Ya>90)then
                                w_=Jd[-20271]or yb(29584,5273,-20271)
                                continue
                            else
                                w_=Jd[11154]or yb(15782,5470,11154)
                                continue
                            end
                            w_=Jd[18131]or yb(30312,58721,18131)
                        end
                    elseif w_<=31525 then
                        if w_<30437 then
                            pb+=1;
                            w_=Jd[10009]or yb(4887,42,10009)
                        elseif w_<=30437 then
                            db,vc=ze[17998],ze[31361];
                            dc=na[vc]or r_[45471][vc]
                            if(db==1)then
                                w_=Jd[3255]or yb(8674,12729,3255)
                                continue
                            else
                                w_=Jd[-18893]or yb(61192,129973,-18893)
                                continue
                            end
                            w_=Jd[22178]or yb(17960,36079,22178)
                        else
                            hd,w_=nil,Jd[20123]or yb(998,3101,20123)
                        end
                    elseif w_>32623 then
                        if ze[63334]==84 then
                            w_=Jd[-188]or yb(10173,52360,-188)
                            continue
                        elseif(ze[63334]==126)then
                            w_=Jd[-25092]or yb(5411,4887,-25092)
                            continue
                        else
                            w_=Jd[-30138]or yb(11241,43881,-30138)
                            continue
                        end
                        w_=Jd[-3421]or yb(34630,95259,-3421)
                    else
                        hd,w_=nil,54073
                    end
                elseif w_<=45402 then
                    if w_>=44181 then
                        if w_>=44452 then
                            if w_<=44853 then
                                if w_>44452 then
                                    pb+=1;
                                    w_=Jd[-24892]or yb(55427,84062,-24892)
                                else
                                    vc,dc,hd=cb(vc);
                                    w_=Jd[9826]or yb(53074,129454,9826)
                                end
                            else
                                if Ya>171 then
                                    w_=Jd[8978]or yb(51692,126814,8978)
                                    continue
                                else
                                    w_=Jd[-4035]or yb(56851,124692,-4035)
                                    continue
                                end
                                w_=Jd[-20500]or yb(10289,6920,-20500)
                            end
                        elseif w_>44181 then
                            db,vc=nil,Xa(ze[58852],25135);
                            db=if vc<32768 then vc else vc-65536;
                            dc=db;
                            hd=Hc[dc+1];
                            ec=hd[49088];
                            gc=Uc(ec);
                            n_[Xa(ze[53910],80)]=yc(hd,gc);
                            ac,Ib,Ja,w_=138,1,(ec)+137,Jd[8798]or yb(9405,7555,8798)
                        else
                            pb-=1;
                            w_,ad[pb]=Jd[2814]or yb(24128,52505,2814),{[7435]=128,[53910]=Xa(ze[53910],25),[33034]=Xa(ze[33034],250),[63334]=0}
                        end
                    elseif w_<=41860 then
                        if w_<40478 then
                            ec,gc=vc(dc,hd);
                            hd=ec
                            if hd==nil then
                                w_=Jd[9677]or yb(22802,74601,9677)
                            else
                                w_=Jd[3893]or yb(63992,42469,3893)
                            end
                        elseif w_>40478 then
                            db=Qc(vc)
                            if db~=nil and db[Kc("v\29\191]\'\164",')B\214')]~=nil then
                                w_=Jd[8443]or yb(36866,128246,8443)
                                continue
                            elseif(Sb(vc)==Kc('U\132C\137D','!\229'))then
                                w_=Jd[-7304]or yb(56469,90574,-7304)
                                continue
                            else
                                w_=Jd[24019]or yb(60095,91022,24019)
                                continue
                            end
                            w_=Jd[-26874]or yb(21741,53752,-26874)
                        else
                            vc[55315]=hd;
                            w_,ec=Jd[21589]or yb(11651,19725,21589),nil
                        end
                    elseif w_>42387 then
                        pb+=1;
                        w_=Jd[-6071]or yb(28555,56646,-6071)
                    else
                        w_,n_[ze[53910]]=Jd[-30763]or yb(27992,56849,-30763),ze[31361]
                    end
                elseif w_>45927 then
                    if w_<47519 then
                        if w_<=46003 then
                            pb-=1;
                            w_,ad[pb]=Jd[27915]or yb(41107,37038,27915),{[7435]=165,[53910]=Xa(ze[53910],39),[33034]=Xa(ze[33034],167),[63334]=0}
                        else
                            if(Ya>165)then
                                w_=Jd[-25604]or yb(9912,45175,-25604)
                                continue
                            else
                                w_=Jd[8136]or yb(6694,61273,8136)
                                continue
                            end
                            w_=Jd[-17141]or yb(31609,59504,-17141)
                        end
                    elseif w_<=47519 then
                        w_,n_[ze[53910]]=Jd[344]or yb(10849,62246,344),dc[ze[55315]]
                    else
                        ze=ad[pb];
                        Ya,w_=ze[7435],Jd[-3881]or yb(4109,13973,-3881)
                    end
                elseif w_<=45784 then
                    if w_<45572 then
                        if(Ya>5)then
                            w_=Jd[-25155]or yb(10270,48773,-25155)
                            continue
                        else
                            w_=Jd[6152]or yb(4150,5529,6152)
                            continue
                        end
                        w_=Jd[-23327]or yb(52378,80983,-23327)
                    elseif w_<=45572 then
                        Ib=Ib+Oe;
                        Wa=Ib
                        if Ib~=Ib then
                            w_=Jd[31814]or yb(64986,117155,31814)
                        else
                            w_=6499
                        end
                    else
                        if n_[ze[53910]]then
                            w_=Jd[22970]or yb(903,10722,22970)
                            continue
                        end
                        w_=Jd[25782]or yb(54879,83218,25782)
                    end
                elseif w_>45802 then
                    if(Ya>99)then
                        w_=Jd[-13851]or yb(27829,78892,-13851)
                        continue
                    else
                        w_=Jd[-17425]or yb(42641,58247,-17425)
                        continue
                    end
                    w_=Jd[-25067]or yb(62429,90604,-25067)
                else
                    if db==2 then
                        w_=Jd[-15998]or yb(14895,48681,-15998)
                        continue
                    elseif(db==3)then
                        w_=Jd[-7244]or yb(25423,3412,-7244)
                        continue
                    else
                        w_=Jd[22937]or yb(59977,78030,22937)
                        continue
                    end
                    w_=Jd[22337]or yb(42367,94264,22337)
                end
            until w_==9149
        end
        return function(...)
            local ha,Kb,Qb,s_,jc,se_,H,Cc,oa,te,Wc;
            Qb,te=function(ta,re_,t_)
                te[ta]=vd(t_,43373)-vd(re_,55306)
                return te[ta]
            end,{};
            se_=te[-7715]or Qb(-7715,3084,79550)
            repeat
                if se_<33529 then
                    if se_<23929 then
                        if se_>2576 then
                            return Je(ha,2,Cc)
                        else
                            ha,Cc=Vd(u_(Ud,H,nc[49858],nc[38378],Wc))
                            if(ha[1])then
                                se_=te[-1302]or Qb(-1302,27939,25911)
                                continue
                            else
                                se_=te[-3826]or Qb(-3826,42002,28924)
                                continue
                            end
                            se_=te[-7233]or Qb(-7233,26723,67191)
                        end
                    elseif se_<=23929 then
                        oa,s_=ha[2],nil;
                        Kb=oa;
                        s_=Vb(Kb)==Kc('\135L\226\157V\247','\244\56\144')
                        if s_==false then
                            se_=te[-3566]or Qb(-3566,26428,68407)
                            continue
                        end
                        se_=33529
                    else
                        ha,Cc=nc[56578]+1,jc[Kc('\221','\179')]-nc[56578];
                        Wc[15385]=Cc;
                        bc(jc,ha,ha+Cc-1,1,Wc[15448]);
                        se_=te[27479]or Qb(27479,12625,23046)
                    end
                elseif se_>=58148 then
                    if se_<=58148 then
                        oa,se_=Vb(oa),te[-27170]or Qb(-27170,21296,108382)
                    else
                        se_=te[4914]or Qb(4914,24954,114145)
                        continue
                    end
                elseif se_<=33529 then
                    return sb(oa,0)
                else
                    jc,H,Wc=of(...),Uc(nc[62469]),{[15448]={},[15385]=0};
                    bc(jc,1,nc[56578],0,H)
                    if nc[56578]<jc[Kc(';','U')]then
                        se_=te[6642]or Qb(6642,18131,110741)
                        continue
                    end
                    se_=te[-18674]or Qb(-18674,26014,28361)
                end
            until se_==23324
        end
    end
    return yc(ne,v)
end)
local Bc;
Bc,Ie={[0]=0},function()
    Bc[0]=Bc[0]+1
    return{[1]=Bc,[3]=Bc[0]}
end;
ib=zc
return(function()
    local vf,xe,Ob,da;
    da={[3]=2,[2]=ib};
    da[1]=da;
    xe={[2]=Se,[3]=2};
    xe[1]=xe;
    Ob={[3]=2,[2]=Xd};
    Ob[1]=Ob;
    vf={[2]=Ee,[3]=2};
    vf[1]=vf
    return ib(hf'GxMXhOf/nxENHzu+DR46vkw7nNB+OpzQSW7J9I86nNAhOJzQSW/I9A0eO74NHTq+DRw5vkw8nNB+PJ3QTD2c0H49ntANGTi+DbNOz0ltz/ZJbM72SWzL9klsyvSPO5zQITic0ElvyfQNtk/PoTTKcklsyvZmI2apnuf/nxERo+7/nxGnXik8uhLbvMAFpC1RTEXPEIo1ey9mmkHcoMUQjl5hnNJVFO5R+xtJZSjqeNv4zLqmgZY+zi7G3o7AkOJfDf8nVHR5bXpBcabXeqhVI06bgs4Ck6J2uoFTGv6Vhx4IXeJ5/6kBTKKbZQQMtoMxf47bIVNvJbgtD3AnXOhN3uWiZMHchbTMDqmNhYixJCKlfzDm+NMQZbcHRmBegAyeS1bhdKhUxk8N/GYsFwRIEjAKaYMgbK3CaWaeOfrN5CMQTpKPosLAUZBSg3it843mm6AuTdk/PvBkBf9bvznb5kCLNRfD/ohViOAbm6JeuQrA39dA6BGRsBF718iX6r8QIaLVp2T1xe3cshPKwv/CEy9NcZuyLey7VoQdv4K+6RyNZIofecXuMjEnNQvJ71+bPHjBQQwf6fuGAUYOEdtIfZQFvbYv9Ch/xvW8v0UZV9hNFQO6x6O7cQHrGyQn2oPxRU7qC64JhiqcuSMR7ZzLVkUajftSuuZUucVRbq9UWmgDhl3EcaIz1A1KjoKJgF4fNE72b8UFKbTUqXyc7zGZvKE3xmqcy6O1w1MmGmezrNQxylzsFat7T0/pze+jI3OjXgstBTf158VWqi+ni6mWhuo9T5qnVMgpDMTp6rX6XQCV/hUQb4L7J3cnlOffM8fpJTwz8gPb+RJE9QWy3J0mUjc+sTAC6jG7psydsN8cQaqcO9oJKGqyuwcS50zhKFBj4ndvuxv8zOau6/CiXPDblD7K8Rxk7YtSHk01r81Ik50SGOkEFfqCGJPQkgajnLeEMsFfngxAxNs4e5HJM4voanMlrYhJJBWiC7hSmFSQPFdMVNe0xpibzkqF9wDeE7fhuzzd5wdMGjZRVueP8hzl6naXWJj3ATC5hMHf2lQ8cgDiSHSyM2IFMhOLs/uHZ9dkUrjxZM+4NnFabYPVSrtujBYRXTQVH+TR3JQOscAqCvCyvdOgH4eK0AZaLkv2Nk3uoyUQJKTGyfHkjwoxa1eE8W6VhAR2Jt4Zixyx9nVrnhyp/x4zh3W0sjN+6krWtlWtxfjZCIdtsyQxt9DzT+BjArMgV6TxnOez6KMT3vEldVdFjC8CVn8yoSRgd8RVeDSTnhxpALAr2e298NqQCZJjols3ZUgHj0VSPIB7Ck7Y2hJTXxd5X7vKvJqyhwULUd7aIqlbuxqI5WOqxVaQGfVWGkuN5lP6Ic0hnVVN0t7vZCnjZ0IA/ZYr/dylEKjQ31LxdQ49g0FlYNcGfdbDA9TPkwCk2EwHqTVrI4bp6W3TtURD5AVeEiQsbTlAhtGCRW1SCcWTHTQo3GsHuGCsUbBTDbm+s5DUdmTm2+mTj0W7ddNFmrqtorpVl5wyxxji1yA95rKp8QM/Tjs013zDCziTanxI7LSf5NCLJ42Mey02gtK5Yf3kE/9I1spsdGMunjPdt3o20AWFC/xsV85rublypi9VL9sXEJt6QJ/kTwkeU/K9v10jhkXPwPDgmXQb2sZ/bQhyZUAEr++P/FT8tUkVNVO6K/0vAid1O5CUKqAu10J/d5UdgncCcuPCdliZlJAknecq57D4b1IOP5kP0aF7uwgAGAtL/knEGZUuJD1Qi5bWTKKdjQDXLlU5IKdlAxHA5v+fEY62SB5uJ1u99lpIfsV3h8Sy9+Yx55xjAi0ARU1ErBIbNv3UtNoKrtCppPM75pFbinYtbiOcVs4+vToVOv9FDmHZ5BAAJGSWm9evIPGAa7wvspfisoKkufdCJesa3ldtLfOXgJUdBRtI/r9+ywpY14jRtOx+khLEoBEGwqaNUgPp1FYBEajFzcqx3Of4pydiUEyi7bgvs5Pb08AXhs/Gr28Gmk9tg6IPbRdaN760XfFGXBcnjs1ak+lz3tml93/8bzjM3aDezdZLxdX5doGSnoWbwgLClhhfQxGU5/+fEd7bjwfU7HJK6V9WkBHF4/+fES8c9CQj0froBM2cO/eMWsiaLwa7eWAxKSkxwLG96tmE77JXtNiJEnJ5O1TNXnpuB9L1tMU+QlDaHWbDL92mcXOXBbJ0rNrJ55okrUROX+6tNnFabcPlt/tJ6kRzfqkgCT/VcrNu5AEEbH+wwvQsM1CzaHp0TrxRDFHbBTJpISOpJHNhGj+RsA658rFGrDb/s+WaurcOr1MxRVH03N3jeBjnW23Mmb3HSGqO4C5UdOq6gteJL/H3DiJuHYiemO2cVBCuajkToMvU6U/PuM1HMI00BP8PCRG1xnHzoDog40/rcMCdDlrEmsZpB3D8t2PY8W6Ngqus9A469TkbibK+i0XhDUKW49M9urw31fp7ZJ3Sw0vgkenjuEH89YDXxlMBU6JA+wxTL+KO07BePCNgaKhAfmFexh+Z2+kca2NkdGdOZJhlCvPjFQscQuAEfibEwoRUVkEIJWSlntsKwPkaMw+n9aCYeyx2ng96eMXHpEGrdl246GbR8GZWJiq/V8erXfvc8HEYLVuQITauzB7t9B4u9yuBW8dwjIqtK8nJa6rByx1hIHbleGVh0av6aZTiK+EHQWrzwvdZjbHdaXGEyNTRqanzd/LNiXhiEsDNj+Svcd9mqFYV+rhKHreK0U6UxY0o1BDSn4w7GGGoyCJoGVo2ZvL15lFVnMUayzxSCr9yKrjmpLLtyb+O1Qgljltt9wW95P0UnfC5cuIVumgELpF/YeQc+WFCDQKIfVYZULPbHqkC+CusB9wV+vD3C2vQZKrZg8OD+yK1doks+uHSMT9YC1pVDRgSAYiVOR04EfTn/58RcOajjju42yV8Ai4LY1BJ/AwVRxGWEN9KCQ4gJBlFYtLHWA24VwtPpKYDt5WB057+hr48+FCaitNJ+NyTrA1jDCAUwiIHbcMk6Yd/hyKvEGHsMzKqlqVj899E8xl+zqZ0wCuBR3ZSonqtoXxsEZ7n/58RRY8L9TZymOf/nxE=',{[2]=xe,[4]=vf,[3]=Ob,[1]=da})
end)()(...)