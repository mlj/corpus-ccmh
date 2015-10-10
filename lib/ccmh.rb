# encoding: UTF-8
#
# Preprocessing script for Codex Marianus
#
# Written by Marius L. Jøhndal, 2007, 2008.
# Updated for Ruby > 1.9.3 in 2015.
#
CHARACTER_MAP = {
   'a' => "\u0430",                   # a
  '^a' => "\u0430\u0484",             # a + round circumflex
  '(a' => "\u0430\u0485",             # a + spiritus asper
   'b' => "\u0431",                   # b
   'v' => "\u0432",                   # v
   'g' => "\u0433",                   # g
   'd' => "\u0434",                   # d
   'e' => "\u0435",                   # e
  '^e' => "\u0435\u0484",             # e + round circumflex
  '(e' => "\u0435\u0485",             # e + spiritus asper
   'Z' => "\u0436",                   # ž
   'D' => "\u0455",                   # dzelo
   'z' => "\u0437",                   # z
   'i' => "\u0438",                   # i
  '~i' => "\u0438\u0306",             # i + kratkaja
  '^i' => "\u0438\u0484",             # i + round circumflex
  '(i' => "\u0438\u0485",             # i + spiritus asper
   'I' => "\u0456",                   # i
  '(I' => "\u0456\u0485",             # i + spiritus asper
   'J' => "\ua647",                   # i
  '(J' => "\ua647\u0485",             # i + spiritus asper
   'G' => "\ua649",                   # g'
   'k' => "\u043a",                   # k
   'l' => "\u043b",                   # l
  '^l' => "\u043b\u0484",             # l + round circumflex
  '(l' => "\u043b\u0485",             # l + spiritus asper
   'm' => "\u043c",                   # m
   'n' => "\u043d",                   # n
  '^n' => "\u043d\u0484",             # n + round circumflex
   'o' => "\u043e",                   # o
  '(o' => "\u043e\u0485",             # o + spiritus asper
   'p' => "\u043f",                   # p
   'r' => "\u0440",                   # r
  '(r' => "\u0440\u0485",             # r + spiritus asper
   's' => "\u0441",                   # s
   't' => "\u0442",                   # t
  '^t' => "\u0442\u0484",             # t + round circumflex
   'u' => "\u043e\u0443",             # u
  '(u' => "\u043e\u0443\u0485",       # u + spiritus asper (s.a. is above the final half of the digraph)
   'f' => "\u0444",                   # f
   'T' => "\u0473",                   # th
   'x' => "\u0445",                   # x
   'w' => "\u0461",                   # o
  '~w' => "\u0461\u0306",             # o + kratkaja
  '(w' => "\u0461\u0485",             # o + spiritus asper
   'q' => "\u0449",                   # št
   'c' => "\u0446",                   # c
   'C' => "\u0447",                   # č
   'S' => "\u0448",                   # š
   '&' => "\u044a",                   # big jer
   '$' => "\u044c",                   # small jer
  '^$' => "\u044c\u0484",             # small jer + round circumflex
   'y' => "\ua651",                   # y
   '@' => "\u0463",                   # ě
  '(@' => "\u0463\u0485",             # ě + spiritus asper
  'ju' => "\u044e",                   # ju
 '~ju' => "\u044e\u0306",             # ju + kratkaja
 '^ju' => "\u044e\u0484",             # ju + round circumflex
 '(ju' => "\u044e\u0485",             # ju + spiritus asper
   'E' => "\u0467",                   # small jus
  '^E' => "\u0467\u0484",             # small jus + round circumflex
  'jE' => "\u0469",                   # j-small jus
 '~jE' => "\u0469\u0306",             # j-small jus + kratkaja
 '(jE' => "\u0469\u0485",             # j-small jus + spiritus asper
   'O' => "\u046b",                   # big jus
  '^O' => "\u046b\u0484",             # big jus + round circumflex
  '(O' => "\u046b\u0485",             # big jus + spiritus asper
  'jO' => "\u046d",                   # j-big jus
 '^jO' => "\u046d\u0484",             # j-big jus + round circumflex
 '(jO' => "\u046d\u0485",             # j-big jus + spiritus asper
   'U' => "\u0475",                   # ü
  '(U' => "\u0475\u0485",             # ü + spiritus asper
   'Y' => "\u0443",                   # interpolated u as part of uk
   'A' => "\ua659",                   # "nasal jer"
  'jw' => "\u0461\u0308",             # o + trema
                                     
  '*a' => "\u0410",                   # A
 '*(a' => "\u0410\u0485",             # A + spiritus asper
  '*b' => "\u0411",                   # B
 '*!b' => "\u0021\u0411",             # !B
  '*v' => "\u0412",                   # V
  '*g' => "\u0413",                   # G
 '*!g' => "\u0021\u0413",             # !G
  '*d' => "\u0414",                   # D
  '*e' => "\u0415",                   # E
 '*(e' => "\u0415\u0485",             # E + spiritus asper
  '*Z' => "\u0416",                   # Ž
  '*z' => "\u0417",                   # Z
  '*i' => "\u0418",                   # I
  '*I' => "\u0406",                   # I
  '*J' => "\ua646",                   # I
 '(*J' => "\ua646\u0485",             # I + spiritus asper
 '*(J' => "\ua646\u0485",             # I + spiritus asper
 '*!J' => "\u0021\ua646",             # !I
  '*G' => "\ua648",                   # G'
  '*k' => "\u041a",                   # K
  '*l' => "\u041b",                   # L
  '*m' => "\u041c",                   # M
  '*n' => "\u041d",                   # N
  '*o' => "\u041e",                   # O
 '(*o' => "\u041e\u0485",             # O + spiritus asper
 '*(o' => "\u041e\u0485",             # O + spiritus asper
 '*!o' => "\u0021\u041e",             # !O
  '*p' => "\u041f",                   # P
  '*r' => "\u0420",                   # R
  '*s' => "\u0421",                   # S
  '*t' => "\u0422",                   # T
  '*u' => "\u041e\u0443",             # U, FIXME: this may really be OU as well as Ou
 '*(u' => "\u041e\u0443\u0485",       # u + spiritus asper
  '*f' => "\u0424",                   # F
  '*x' => "\u0425",                   # X
  '*w' => "\u0460",                   # O
 '*~w' => "\u0460\u0306",             # O + kratkaja
 '*(w' => "\u0460\u0485",             # O + spiritus asper
'*!~w' => "\u0021\u0460\u0306",       # !O + kratkaja
  '*q' => "\u0429",                   # Št
  '*c' => "\u0426",                   # C
  '*C' => "\u0427",                   # Č
  '*S' => "\u0428",                   # Š
  '*&' => "\u042a",                   # Big jer
  '*$' => "\u042c",                   # Small jer
  '*y' => "\ua650",                   # Y
  '*@' => "\u0462",                   # Ě
 '*(@' => "\u0462\u0485",             # Ě + spiritus asper
 '*ju' => "\u042e",                   # Ju
'*(ju' => "\u042e\u0485",             # Ju + spiritus asper
 '*jw' => "\u0460\u0308",             # O + trema
  "'"  => "\ua67f",                   # poerok (non-combining)

  # Spacing
  ' ' => ' ',

  # Editorial symbols
  '=' => '=',
  '[' => '[',
  ']' => ']',
  '{' => '{',
  '}' => '}',
  '?' => '?',

  # Fall-through for manual handling
  '!' => '!',
  ':' => ':',
  '.' => '.',
  '-' => '-',
}

# Mapping between non-superscript and superscript characters.
SUPERSCRIPTS = {
  "\u0431" => "\u2de0", # b
  "\u0432" => "\u2de1", # v
  "\u0433" => "\u2de2", # g
  "\u0434" => "\u2de3", # d
  "\ua649" => "\u2df8", # g'
  "\u043b" => "\u2de7", # l
  "\u043d" => "\u2de9", # n
  "\u043e" => "\u2dea", # o
  "\u043f" => "\u2deb", # p
  "\u0445" => "\u2def", # x
  "\u0446" => "\u2df0", # c
  "\u0447" => "\u2df1", # č
  "\u043a" => "\u2de6", # k
  "\u0440" => "\u2dec", # r
  "\u0441" => "\u2ded", # s
  "\u0442" => "\u2dee", # t
}.freeze

ENCODING_KEYS_REGEXP = Regexp.union(*CHARACTER_MAP.keys).freeze

LINE_REGEXP = /^([1-4])(\d{2})(\d{2})(\d)0\s+(.*)$/.freeze

BOOKS = [nil, 'MATT', 'MARK', 'LUKE', 'JOHN']

def transcode(in_file, out_file)
  File.open(in_file, 'r:ascii:utf-8') do |f|
    File.open(out_file, 'w') do |g|
      g.puts 'BOOK,CHAPTER,VERSE,LINE,TEXT'

      f.each_line do |l|
        l.chomp!
        l.strip!

        if m = l.match(LINE_REGEXP)
          book, chapter, verse, line, text = $1.to_i, $2.to_i, $3.to_i, $4.to_i, $5
          result, ok_match = '', ''

          text.scan(ENCODING_KEYS_REGEXP) do |c|
            m = $~
            pre, actual, _ = m.pre_match, m.to_s, m.post_match
            unless m.pre_match == ok_match
              diff = m.pre_match.sub!(/^#{Regexp.escape(ok_match)}/m, '')
              STDERR.puts "#{in_file}: Unknown character(s) `#{diff}' in string `#{text}'"
            end

            result << CHARACTER_MAP[actual]

            ok_match = pre + actual
          end

          # Handle some punctuation first, since this must happen in a
          # particular order to be right.
          result.gsub!(/::/,  "\u2058") # FOUR DOT PUNCTUATION
          result.gsub!(/:\./, "\u10FB")
          result.gsub!(/--/,  "\u2053") # SWUNG DASH

          # FIXME: I give up representing these...
          result.gsub!(/:-/,  "\u2058") # FOUR DOT PUNCTUATION
          result.gsub!(/\.:/, "\u2058") # FOUR DOT PUNCTUATION

          # We leave : . - as is.

          # Now, finally, try to get a grip on titlos. First take care of the
          # word-titlos and stack them starting with the beginning of the word.
          # If there are two, put the first over the first letter, the second
          # over the next. This does not always lead to the correct result, but
          # it's the best we can do without information about *exactly* where
          # the titlo is supposed to go.
          result.gsub!(/\A\!\!(.)(.)/, '\1' + "\u0483" + '\2' + "\u0483") # two letters, two titlos
          result.gsub!(/\A\!(.)/, '\1' + "\u0483") # at a word boundary

          # The remaining !-characters now hopefully represent superscripts.
          result.gsub!(/\!(.)/) do |_|
            c = $1

            if c == 'и' # not like the others: actually just a raised "i"
              c
            else
              STDERR.puts "#{in_file}: Character #{c} cannot be converted to superscript" unless SUPERSCRIPTS.has_key?(c)

              (SUPERSCRIPTS[c] || '') + "\u0487"
            end
          end

          raise "Still titlos remaining: #{result}" if result[/\!/]

          g.puts [BOOKS[book], chapter, verse, line, result].map { |x| "\"#{x}\"" }.join(',')
        else
          raise "line #{l} does not parse"
        end
      end
    end
  end
end
