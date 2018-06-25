# https://projecteuler.net/problem=66
def cfes(n)
  found = []
  Enumerator.new do |y|
    loop do
      a = n.floor
      found << a
      n -= a
      n = 1 / n
      y << found.dup
    end
  end
end

def convergents(cfes)
  Enumerator.new do |y|
    cfes.each do |first, *rest|
      y << first + rest.reverse.reduce(0r) { |c, a| 1r/(c+a) }
    end
  end
end

def solution(d)
  precision = 0
  cutoff    = 1000
  cs = convergents cfes Math.sqrt d
  loop do
    cs.find.with_index do |rational, i|
      break nil if i > cutoff
      x = rational.numerator
      y = rational.denominator
      if x*x == 1 + d*y*y
        soln = {x: x, y: y, d: d, iterations: i+1, precision: precision, cutoff: cutoff}
        p soln unless precision.zero?
        return soln
      end
    end
    precision += d
    cutoff    *= 2
    cs = convergents cfes BigDecimal.new(d.to_s).sqrt(precision)
  end
end

def time
  start  = Time.now
  result = yield
  stop   = Time.now
  printf "%0.2f seconds\n", stop-start
  result
end

require 'bigdecimal'
1.upto(1000)
 .reject { |d| d == Math.sqrt(d).to_i**2 }
 .map    { |d| solution d }
 .max_by { |s| s[:x] }
 .tap    { |s| p s }

# this is what was printed:
__END__
{:x=>1766319049, :y=>226153980, :d=>61, :iterations=>22, :precision=>122, :cutoff=>4000}
{:x=>158070671986249, :y=>15140424455100, :d=>109, :iterations=>30, :precision=>218, :cutoff=>4000}
{:x=>25801741449, :y=>2113761020, :d=>149, :iterations=>18, :precision=>149, :cutoff=>2000}
{:x=>1728148040, :y=>140634693, :d=>151, :iterations=>20, :precision=>151, :cutoff=>2000}
{:x=>46698728731849, :y=>3726964292220, :d=>157, :iterations=>34, :precision=>314, :cutoff=>4000}
{:x=>1700902565, :y=>132015642, :d=>166, :iterations=>22, :precision=>166, :cutoff=>2000}
{:x=>2469645423824185801, :y=>183567298683461940, :d=>181, :iterations=>42, :precision=>362, :cutoff=>4000}
{:x=>6224323426849, :y=>448036604040, :d=>193, :iterations=>26, :precision=>193, :cutoff=>2000}
{:x=>16266196520, :y=>1153080099, :d=>199, :iterations=>20, :precision=>199, :cutoff=>2000}
{:x=>278354373650, :y=>19162705353, :d=>211, :iterations=>26, :precision=>211, :cutoff=>2000}
{:x=>695359189925, :y=>47533775646, :d=>214, :iterations=>26, :precision=>214, :cutoff=>2000}
{:x=>1072400673, :y=>70255304, :d=>233, :iterations=>22, :precision=>233, :cutoff=>2000}
{:x=>10085143557001249, :y=>649641205044600, :d=>241, :iterations=>34, :precision=>241, :cutoff=>2000}
{:x=>1766319049, :y=>113076990, :d=>244, :iterations=>26, :precision=>244, :cutoff=>2000}
{:x=>3222617399, :y=>202604220, :d=>253, :iterations=>22, :precision=>253, :cutoff=>2000}
{:x=>4771081927, :y=>291440214, :d=>268, :iterations=>20, :precision=>268, :cutoff=>2000}
{:x=>115974983600, :y=>7044978537, :d=>271, :iterations=>24, :precision=>271, :cutoff=>2000}
{:x=>159150073798980475849, :y=>9562401173878027020, :d=>277, :iterations=>42, :precision=>277, :cutoff=>2000}
{:x=>2262200630049, :y=>134951575480, :d=>281, :iterations=>26, :precision=>281, :cutoff=>2000}
{:x=>335473872499, :y=>19433479650, :d=>298, :iterations=>22, :precision=>298, :cutoff=>2000}
{:x=>5883392537695, :y=>339113108232, :d=>301, :iterations=>26, :precision=>301, :cutoff=>2000}
{:x=>64202725495, :y=>3652365444, :d=>309, :iterations=>26, :precision=>309, :cutoff=>2000}
{:x=>32188120829134849, :y=>1819380158564160, :d=>313, :iterations=>34, :precision=>313, :cutoff=>2000}
{:x=>248678907849, :y=>13967198980, :d=>317, :iterations=>22, :precision=>317, :cutoff=>2000}
{:x=>2785589801443970, :y=>153109862634573, :d=>331, :iterations=>34, :precision=>331, :cutoff=>2000}
{:x=>63804373719695, :y=>3491219999244, :d=>334, :iterations=>28, :precision=>334, :cutoff=>2000}
{:x=>2063810353129713793, :y=>112422913565764752, :d=>337, :iterations=>38, :precision=>337, :cutoff=>2000}
{:x=>10157115393, :y=>540608704, :d=>353, :iterations=>30, :precision=>353, :cutoff=>2000}
{:x=>176579805797, :y=>9332532726, :d=>358, :iterations=>26, :precision=>358, :cutoff=>2000}
{:x=>19019995568, :y=>992835687, :d=>367, :iterations=>20, :precision=>367, :cutoff=>2000}
{:x=>12941197220540690, :y=>664744650125541, :d=>379, :iterations=>30, :precision=>379, :cutoff=>2000}
{:x=>164998439999, :y=>8442054600, :d=>382, :iterations=>24, :precision=>382, :cutoff=>2000}
{:x=>312086396361222451, :y=>15722685507826110, :d=>394, :iterations=>42, :precision=>394, :cutoff=>2000}
{:x=>838721786045180184649, :y=>42094239791738433660, :d=>397, :iterations=>42, :precision=>397, :cutoff=>2000}
{:x=>25052977273092427986049, :y=>1238789998647218582160, :d=>409, :iterations=>42, :precision=>409, :cutoff=>2000}
{:x=>103537981567, :y=>5100950232, :d=>412, :iterations=>20, :precision=>412, :cutoff=>2000}
{:x=>3879474045914926879468217167061449, :y=>189073995951839020880499780706260, :d=>421, :iterations=>74, :precision=>842, :cutoff=>4000}
{:x=>104564907854286695713, :y=>5025068784834899736, :d=>433, :iterations=>42, :precision=>433, :cutoff=>2000}
{:x=>158070671986249, :y=>7570212227550, :d=>436, :iterations=>30, :precision=>436, :cutoff=>2000}
{:x=>71798771299708449, :y=>3388393513402120, :d=>449, :iterations=>34, :precision=>449, :cutoff=>2000}
{:x=>16916040084175685, :y=>793909098494766, :d=>454, :iterations=>34, :precision=>454, :cutoff=>2000}
{:x=>6983244756398928218113, :y=>326662411570389853632, :d=>457, :iterations=>50, :precision=>457, :cutoff=>2000}
{:x=>1182351890184201, :y=>55067617520620, :d=>461, :iterations=>30, :precision=>461, :cutoff=>2000}
{:x=>247512720456368, :y=>11502891625161, :d=>463, :iterations=>32, :precision=>463, :cutoff=>2000}
{:x=>938319425, :y=>43466808, :d=>466, :iterations=>22, :precision=>466, :cutoff=>2000}
{:x=>8777860001, :y=>401910600, :d=>477, :iterations=>20, :precision=>477, :cutoff=>2000}
{:x=>1617319577991743, :y=>73974475657896, :d=>478, :iterations=>36, :precision=>478, :cutoff=>2000}
{:x=>1859131879201, :y=>84769117080, :d=>481, :iterations=>26, :precision=>481, :cutoff=>2000}
{:x=>51906073840568, :y=>2352088722477, :d=>487, :iterations=>28, :precision=>487, :cutoff=>2000}
{:x=>7592629975, :y=>343350596, :d=>489, :iterations=>22, :precision=>489, :cutoff=>2000}
{:x=>93628044170, :y=>4225374483, :d=>491, :iterations=>22, :precision=>491, :cutoff=>2000}
{:x=>935662752649, :y=>42140131020, :d=>493, :iterations=>18, :precision=>493, :cutoff=>2000}
{:x=>11242731902975, :y=>502288218432, :d=>501, :iterations=>28, :precision=>501, :cutoff=>2000}
{:x=>3832352837, :y=>171046278, :d=>502, :iterations=>14, :precision=>502, :cutoff=>2000}
{:x=>44757606858751, :y=>1985797689600, :d=>508, :iterations=>32, :precision=>508, :cutoff=>2000}
{:x=>313201220822405001, :y=>13882400040814700, :d=>509, :iterations=>38, :precision=>509, :cutoff=>2000}
{:x=>4188548960, :y=>185290497, :d=>511, :iterations=>20, :precision=>511, :cutoff=>2000}
{:x=>590968985399, :y=>25990786260, :d=>517, :iterations=>22, :precision=>517, :cutoff=>2000}
{:x=>32961431500035201, :y=>1444066532654320, :d=>521, :iterations=>38, :precision=>521, :cutoff=>2000}
{:x=>81810300626, :y=>3577314675, :d=>523, :iterations=>22, :precision=>523, :cutoff=>2000}
{:x=>84056091546952933775, :y=>3665019757324295532, :d=>526, :iterations=>40, :precision=>526, :cutoff=>2000}
{:x=>9536081203, :y=>411129654, :d=>538, :iterations=>14, :precision=>538, :cutoff=>2000}
{:x=>3707453360023867028800645599667005001, :y=>159395869721270110077187138775196900, :d=>541, :iterations=>78, :precision=>1082, :cutoff=>4000}
{:x=>160177601264642, :y=>6848699678673, :d=>547, :iterations=>26, :precision=>547, :cutoff=>2000}
{:x=>1766319049, :y=>75384660, :d=>549, :iterations=>18, :precision=>549, :cutoff=>2000}
{:x=>624635837407, :y=>26562217704, :d=>553, :iterations=>26, :precision=>553, :cutoff=>2000}
{:x=>60756099699, :y=>2581279330, :d=>554, :iterations=>22, :precision=>554, :cutoff=>2000}
{:x=>12032115501124999, :y=>510275358434250, :d=>556, :iterations=>36, :precision=>556, :cutoff=>2000}
{:x=>435259412378569, :y=>18311501103948, :d=>565, :iterations=>26, :precision=>565, :cutoff=>2000}
{:x=>16760473211643448449, :y=>702635588524014320, :d=>569, :iterations=>38, :precision=>569, :cutoff=>2000}
{:x=>181124355061630786130, :y=>7579818350628982587, :d=>571, :iterations=>42, :precision=>571, :cutoff=>2000}
{:x=>152071153975, :y=>6308974548, :d=>581, :iterations=>24, :precision=>581, :cutoff=>2000}
{:x=>33867877212256207699, :y=>1399069112058008310, :d=>586, :iterations=>46, :precision=>586, :cutoff=>2000}
{:x=>41423166067036218751, :y=>1706811823063746000, :d=>589, :iterations=>40, :precision=>589, :cutoff=>2000}
{:x=>721517598849, :y=>29629176560, :d=>593, :iterations=>26, :precision=>593, :cutoff=>2000}
{:x=>25801741449, :y=>1056880510, :d=>596, :iterations=>22, :precision=>596, :cutoff=>2000}
{:x=>463287093751, :y=>18961078500, :d=>597, :iterations=>22, :precision=>597, :cutoff=>2000}
{:x=>24686379794520, :y=>1008658133851, :d=>599, :iterations=>28, :precision=>599, :cutoff=>2000}
{:x=>38902815462492318420311478049, :y=>1586878942101888360258625080, :d=>601, :iterations=>62, :precision=>601, :cutoff=>2000}
{:x=>5972991296311683199, :y=>243037569063951720, :d=>604, :iterations=>44, :precision=>604, :cutoff=>2000}
{:x=>164076033968, :y=>6659640783, :d=>607, :iterations=>24, :precision=>607, :cutoff=>2000}
{:x=>10323982819, :y=>418005846, :d=>610, :iterations=>18, :precision=>610, :cutoff=>2000}
{:x=>464018873584078278910994299849, :y=>18741545784831997880308784340, :d=>613, :iterations=>66, :precision=>613, :cutoff=>2000}
{:x=>348291186245, :y=>14055888354, :d=>614, :iterations=>26, :precision=>614, :cutoff=>2000}
{:x=>3363593612801313, :y=>135413180018248, :d=>617, :iterations=>30, :precision=>617, :cutoff=>2000}
{:x=>517213510553282930, :y=>20788566180548739, :d=>619, :iterations=>38, :precision=>619, :cutoff=>2000}
{:x=>13804370063, :y=>553504812, :d=>622, :iterations=>20, :precision=>622, :cutoff=>2000}
{:x=>46698728731849, :y=>1863482146110, :d=>628, :iterations=>26, :precision=>628, :cutoff=>2000}
{:x=>48961575312998650035560, :y=>1949129537575151036427, :d=>631, :iterations=>48, :precision=>631, :cutoff=>2000}
{:x=>8711856945587257031251, :y=>345992039259400361250, :d=>634, :iterations=>46, :precision=>634, :cutoff=>2000}
{:x=>1419278889601, :y=>56233877040, :d=>637, :iterations=>22, :precision=>637, :cutoff=>2000}
{:x=>2609429220845977814049, :y=>103066257550962737720, :d=>641, :iterations=>42, :precision=>641, :cutoff=>2000}
{:x=>1988960193026, :y=>78436933185, :d=>643, :iterations=>22, :precision=>643, :cutoff=>2000}
{:x=>1123593226162199, :y=>44104892095380, :d=>649, :iterations=>30, :precision=>649, :cutoff=>2000}
{:x=>8212499464321351, :y=>321626301297510, :d=>652, :iterations=>36, :precision=>652, :cutoff=>2000}
{:x=>10499986568677299849, :y=>410896226494013260, :d=>653, :iterations=>38, :precision=>653, :cutoff=>2000}
{:x=>737709209, :y=>28824684, :d=>655, :iterations=>16, :precision=>655, :cutoff=>2000}
{:x=>16421658242965910275055840472270471049, :y=>638728478116949861246791167518480580, :d=>661, :iterations=>78, :precision=>661, :cutoff=>2000}
{:x=>1718102501, :y=>66775950, :d=>662, :iterations=>22, :precision=>662, :cutoff=>2000}
{:x=>1700902565, :y=>66007821, :d=>664, :iterations=>22, :precision=>664, :cutoff=>2000}
{:x=>14226117859054135, :y=>550013492618436, :d=>669, :iterations=>38, :precision=>669, :cutoff=>2000}
{:x=>4765506835465395993032041249, :y=>183696788896587421699032600, :d=>673, :iterations=>62, :precision=>673, :cutoff=>2000}
{:x=>17792625320, :y=>682818291, :d=>679, :iterations=>16, :precision=>679, :cutoff=>2000}
{:x=>10743166003415, :y=>411679015748, :d=>681, :iterations=>24, :precision=>681, :cutoff=>2000}
{:x=>95592800063517769, :y=>3652413145693884, :d=>685, :iterations=>30, :precision=>685, :cutoff=>2000}
{:x=>10850138895, :y=>414260228, :d=>686, :iterations=>16, :precision=>686, :cutoff=>2000}
{:x=>31138100617500578690, :y=>1184549173291009383, :d=>691, :iterations=>38, :precision=>691, :cutoff=>2000}
{:x=>38782105445014642382885, :y=>1472148590903997672114, :d=>694, :iterations=>46, :precision=>694, :cutoff=>2000}
{:x=>665782673992201, :y=>25003993164540, :d=>709, :iterations=>30, :precision=>709, :cutoff=>2000}
{:x=>35115719688199, :y=>1312336060110, :d=>716, :iterations=>28, :precision=>716, :cutoff=>2000}
{:x=>8933399183036079503, :y=>333391496474140716, :d=>718, :iterations=>40, :precision=>718, :cutoff=>2000}
{:x=>403480310400, :y=>15047276489, :d=>719, :iterations=>28, :precision=>719, :cutoff=>2000}
{:x=>18632176943292415, :y=>693898530122112, :d=>721, :iterations=>40, :precision=>721, :cutoff=>2000}
{:x=>2469645423824185801, :y=>91783649341730970, :d=>724, :iterations=>42, :precision=>724, :cutoff=>2000}
{:x=>98015661073616742153890, :y=>3605564376516452758671, :d=>739, :iterations=>46, :precision=>739, :cutoff=>2000}
{:x=>61268974069299, :y=>2243216519470, :d=>746, :iterations=>26, :precision=>746, :cutoff=>2000}
{:x=>1084616384895, :y=>39631020176, :d=>749, :iterations=>26, :precision=>749, :cutoff=>2000}
{:x=>7293318466794882424418960, :y=>266136970677206024456793, :d=>751, :iterations=>52, :precision=>751, :cutoff=>2000}
{:x=>308526027863, :y=>11243313484, :d=>753, :iterations=>24, :precision=>753, :cutoff=>2000}
{:x=>836977699, :y=>30480930, :d=>754, :iterations=>18, :precision=>754, :cutoff=>2000}
{:x=>3750107388553, :y=>136299971388, :d=>757, :iterations=>22, :precision=>757, :cutoff=>2000}
{:x=>719724601, :y=>26055780, :d=>763, :iterations=>22, :precision=>763, :cutoff=>2000}
{:x=>161784071999999, :y=>5853142302000, :d=>764, :iterations=>32, :precision=>764, :cutoff=>2000}
{:x=>145933611945744638015, :y=>5272795728865625208, :d=>766, :iterations=>44, :precision=>766, :cutoff=>2000}
{:x=>535781868388881310859702308423201, :y=>19320788325040337217824455505160, :d=>769, :iterations=>74, :precision=>769, :cutoff=>2000}
{:x=>2989136930, :y=>107651137, :d=>771, :iterations=>22, :precision=>771, :cutoff=>2000}
{:x=>6224323426849, :y=>224018302020, :d=>772, :iterations=>30, :precision=>772, :cutoff=>2000}
{:x=>3607394696649, :y=>129748968980, :d=>773, :iterations=>22, :precision=>773, :cutoff=>2000}
{:x=>5964562960504723, :y=>213839942395674, :d=>778, :iterations=>26, :precision=>778, :cutoff=>2000}
{:x=>34625394242, :y=>1234262007, :d=>787, :iterations=>18, :precision=>787, :cutoff=>2000}
{:x=>16116667272575, :y=>573768548496, :d=>789, :iterations=>24, :precision=>789, :cutoff=>2000}
{:x=>6616066879, :y=>235389096, :d=>790, :iterations=>20, :precision=>790, :cutoff=>2000}
{:x=>1828310451, :y=>64884310, :d=>794, :iterations=>22, :precision=>794, :cutoff=>2000}
{:x=>529178298454520220799, :y=>18756227493635055480, :d=>796, :iterations=>44, :precision=>796, :cutoff=>2000}
{:x=>1221759532448649, :y=>43276943002540, :d=>797, :iterations=>22, :precision=>797, :cutoff=>2000}
{:x=>500002000001, :y=>17666702000, :d=>801, :iterations=>20, :precision=>801, :cutoff=>2000}
{:x=>1514868641, :y=>53392104, :d=>805, :iterations=>18, :precision=>805, :cutoff=>2000}
{:x=>376455160998025676163201, :y=>13235458622462202510640, :d=>809, :iterations=>42, :precision=>809, :cutoff=>2000}
{:x=>1382072163578616410, :y=>48531117622921197, :d=>811, :iterations=>38, :precision=>811, :cutoff=>2000}
{:x=>4206992174549, :y=>147454999410, :d=>814, :iterations=>28, :precision=>814, :cutoff=>2000}
{:x=>9000987377460935993101449, :y=>314136625452886403879740, :d=>821, :iterations=>58, :precision=>821, :cutoff=>2000}
{:x=>235170474903644006168, :y=>8197527430497636651, :d=>823, :iterations=>44, :precision=>823, :cutoff=>2000}
{:x=>222239304685, :y=>7732694382, :d=>826, :iterations=>24, :precision=>826, :cutoff=>2000}
{:x=>479835713751049, :y=>16665383182260, :d=>829, :iterations=>34, :precision=>829, :cutoff=>2000}
{:x=>6552578705, :y=>226897244, :d=>834, :iterations=>22, :precision=>834, :cutoff=>2000}
{:x=>34336355806, :y=>1188258591, :d=>835, :iterations=>26, :precision=>835, :cutoff=>2000}
{:x=>42112785797, :y=>1454762046, :d=>838, :iterations=>14, :precision=>838, :cutoff=>2000}
{:x=>154962314660167628644999, :y=>5334022845973817148450, :d=>844, :iterations=>48, :precision=>844, :cutoff=>2000}
{:x=>1501654712948695, :y=>51536656330476, :d=>849, :iterations=>30, :precision=>849, :cutoff=>2000}
{:x=>215454135724113414336120649, :y=>7377009103065498851032020, :d=>853, :iterations=>46, :precision=>853, :cutoff=>2000}
{:x=>695359189925, :y=>23766887823, :d=>856, :iterations=>26, :precision=>856, :cutoff=>2000}
{:x=>131822292741249, :y=>4502963741200, :d=>857, :iterations=>34, :precision=>857, :cutoff=>2000}
{:x=>2058844771979643060124010, :y=>70246877103894937291269, :d=>859, :iterations=>46, :precision=>859, :cutoff=>2000}
{:x=>358022566147312125503, :y=>12194296994921665128, :d=>862, :iterations=>40, :precision=>862, :cutoff=>2000}
{:x=>18524026608, :y=>630565199, :d=>863, :iterations=>20, :precision=>863, :cutoff=>2000}
{:x=>242688628535063329, :y=>8251660923733224, :d=>865, :iterations=>38, :precision=>865, :cutoff=>2000}
{:x=>60192738698751, :y=>2041898807200, :d=>869, :iterations=>28, :precision=>869, :cutoff=>2000}
{:x=>19442812076, :y=>658794555, :d=>871, :iterations=>24, :precision=>871, :cutoff=>2000}
{:x=>116476476553, :y=>3933131148, :d=>877, :iterations=>30, :precision=>877, :cutoff=>2000}
{:x=>22606256615916825861249, :y=>761624136944072910800, :d=>881, :iterations=>50, :precision=>881, :cutoff=>2000}
{:x=>34878475759617272473442, :y=>1173754162936357802169, :d=>883, :iterations=>46, :precision=>883, :cutoff=>2000}
{:x=>7743524593057655851637765, :y=>260148796464024194850378, :d=>886, :iterations=>54, :precision=>886, :cutoff=>2000}
{:x=>13231974717803657215, :y=>443786188413453504, :d=>889, :iterations=>42, :precision=>889, :cutoff=>2000}
{:x=>6091434999, :y=>203842100, :d=>893, :iterations=>22, :precision=>893, :cutoff=>2000}
{:x=>123823410343073497682, :y=>4111488857741309517, :d=>907, :iterations=>42, :precision=>907, :cutoff=>2000}
{:x=>371832584927520, :y=>12319363142953, :d=>911, :iterations=>24, :precision=>911, :cutoff=>2000}
{:x=>515734243080407, :y=>17068312251564, :d=>913, :iterations=>32, :precision=>913, :cutoff=>2000}
{:x=>823604599, :y=>27197820, :d=>917, :iterations=>16, :precision=>917, :cutoff=>2000}
{:x=>4481603010937119451551263720, :y=>147834442396536759781499589, :d=>919, :iterations=>60, :precision=>919, :cutoff=>2000}
{:x=>2522057712835735, :y=>83104627139412, :d=>921, :iterations=>34, :precision=>921, :cutoff=>2000}
{:x=>351605368773852499, :y=>11579506138834350, :d=>922, :iterations=>38, :precision=>922, :cutoff=>2000}
{:x=>304560297142335, :y=>10008472361032, :d=>926, :iterations=>28, :precision=>926, :cutoff=>2000}
{:x=>768555217, :y=>25229061, :d=>928, :iterations=>16, :precision=>928, :cutoff=>2000}
{:x=>13224937103288377430049, :y=>433896111669844912840, :d=>929, :iterations=>38, :precision=>929, :cutoff=>2000}
{:x=>6681448801, :y=>218975640, :d=>931, :iterations=>22, :precision=>931, :cutoff=>2000}
{:x=>1072400673, :y=>35127652, :d=>932, :iterations=>22, :precision=>932, :cutoff=>2000}
{:x=>480644425002415999597113107233, :y=>15701968936415353889062192632, :d=>937, :iterations=>66, :precision=>937, :cutoff=>2000}
{:x=>1068924905989944201, :y=>34845956052079180, :d=>941, :iterations=>34, :precision=>941, :cutoff=>2000}
{:x=>45225786400145, :y=>1470417148788, :d=>946, :iterations=>30, :precision=>946, :cutoff=>2000}
{:x=>13509645362, :y=>439004487, :d=>947, :iterations=>22, :precision=>947, :cutoff=>2000}
{:x=>609622436806639069525576201, :y=>19789181711517243032971740, :d=>949, :iterations=>54, :precision=>949, :cutoff=>2000}
{:x=>15090531843660371073, :y=>488830275367615376, :d=>953, :iterations=>42, :precision=>953, :cutoff=>2000}
{:x=>2095256249, :y=>67800900, :d=>955, :iterations=>16, :precision=>955, :cutoff=>2000}
{:x=>76759023628799, :y=>2482564242480, :d=>956, :iterations=>32, :precision=>956, :cutoff=>2000}
{:x=>16762522330425599, :y=>541572514048560, :d=>958, :iterations=>36, :precision=>958, :cutoff=>2000}
{:x=>10085143557001249, :y=>324820602522300, :d=>964, :iterations=>34, :precision=>964, :cutoff=>2000}
{:x=>4649532557817485528, :y=>149518887194649693, :d=>967, :iterations=>32, :precision=>967, :cutoff=>2000}
{:x=>215395035859, :y=>6915917802, :d=>970, :iterations=>18, :precision=>970, :cutoff=>2000}
{:x=>12479806786330, :y=>400496058813, :d=>971, :iterations=>22, :precision=>971, :cutoff=>2000}
{:x=>9863382151, :y=>316368130, :d=>972, :iterations=>20, :precision=>972, :cutoff=>2000}
{:x=>488825745235215, :y=>15662987185124, :d=>974, :iterations=>32, :precision=>974, :cutoff=>2000}
{:x=>1766319049, :y=>56538495, :d=>976, :iterations=>18, :precision=>976, :cutoff=>2000}
{:x=>108832847723078562849, :y=>3481871275306470280, :d=>977, :iterations=>38, :precision=>977, :cutoff=>2000}
{:x=>158070671986249, :y=>5046808151700, :d=>981, :iterations=>30, :precision=>981, :cutoff=>2000}
{:x=>14549450527, :y=>462879684, :d=>988, :iterations=>16, :precision=>988, :cutoff=>2000}
{:x=>550271588560695, :y=>17497618534396, :d=>989, :iterations=>32, :precision=>989, :cutoff=>2000}
{:x=>379516400906811930638014896080, :y=>12055735790331359447442538767, :d=>991, :iterations=>60, :precision=>991, :cutoff=>2000}
{:x=>14418057673, :y=>456624468, :d=>997, :iterations=>26, :precision=>997, :cutoff=>2000}
{:x=>16421658242965910275055840472270471049, :y=>638728478116949861246791167518480580, :d=>661, :iterations=>78, :precision=>661, :cutoff=>2000}
