\header{
	title = "Shout for Joy"
	composer = "Traditional (Psalm 100)"
	tagline = "MDR Worship Ministry" 
}

firstVerse = \lyricmode {
	\set stanza = "1."
	Shout for joy to the Lord of the earth!
	Shout for joy to the Lord of the earth!
}

secondVerse = \lyricmode {
	\set stanza = "2."

}

thirdVerse = \lyricmode {
	\set stanza = "3."
}

fourthVerse = \lyricmode {
	\set stanza = "4."
	
}

fifthVerse = \lyricmode {
	\set stanza = "5."
	
}

treble = \new Voice = "soprano" \relative c''{
	\stemUp
	\slurUp	
	\tieUp
	\partial 8*3
	r8 r4 r8 g4 g8 f4 f8 f e e f g~ g4 r4 r8 g4 g8 f4 e8 f g f e c~ c4
	r4 r8 g'4 g8 f4 f e8( f4) g8~ g4 r4 r8 g4 g8 f4 e8 f g( f) e c~ c4 r4
	r1 c4( c8 d) e4 f a2. c,8~ c
	a'~ a~ a a a( f)~ f4~( e2) r8 f8 e16 f8. g1
}

trebleTwo = \new Voice = "alto" \relative c'{
	\stemDown
	\slurDown
	\tieDown
	r8 r4 r8 e4 e8 d4 d8 d c c d e~ e4 r4 r8 e4 e8 d4 c8 d e d c c~ c4
	r4 r8 e4 e8 d4 d c8( d4) e8~ e4 r4 r8 e4 e8 d4 c8 d e( d) c c~ c4 r4
	r1 c4( c8 d) e4 f f2. c8~ c
	f~ f~ f f f( c)~ c4~ c2 r8 f8 e16 f8. d1
}

bass = \new Voice = "tenor" \relative c'{
	\stemUp
	\slurUp	
	\tieUp
	e4 d8 c1~ c2 r8 g4 a8 c1~ c2 r8 e4 d8
	c1~ c2 r8 g4 a8 c1~ c2 r2
}

bassTwo = \new Voice = "bass" \relative c{
	\stemDown
	\slurDown
	\tieDown
	e4 d8 c1~ c2 r8 g4 a8 c1~ c2 r8 e4 d8
	c1~ c2 r8 g4 a8 c1~ c2 r2
}


theScore = \score {
    \context ChoirStaff <<
    	
        \new Staff = "treble" <<
        \time 4/4
        \tempo 4=100
    	\override Staff.TimeSignature #'style = #'() 
	    \treble
	    \trebleTwo
        >>        
        \lyricsto "soprano" \new Lyrics \firstVerse
      
        \new Staff = "bass" <<
        \time 4/4
    	\override Staff.TimeSignature #'style = #'() 
	    \clef bass
	    \bass
	    \bassTwo
        >>

    >>


    \layout {
    	indent = 0\cm 
    	top-margin = 3\cm
    	bottom-margin = 3\cm
	    \context {
		\Lyrics
		\override VerticalAxisGroup #'minimum-Y-extent = #'(-0.5 . 2.5)
		\override LyricText #'font-size = #-2
	    }
	    
	    \context { \ChoirStaff \accepts "Lyrics" } 
%		\context { \Lyrics \consists "Bar_engraver" } 

	    \context {
		\Score
		\override Beam #'thickness = #0.55
		\override SpacingSpanner #'spacing-increment = #1.0
		\override Slur #'height-limit = #2
	    }
	    \context {
		\ChoirStaff
		\override VerticalAlignment #'forced-distance = #12
	    }
	}

	\midi {
	  \context {
	    \theScore
	    %tempoWholesPerMinute = #(ly:make-moment 120 4)
	  }
	} 
}
			   
\book{
    \score { \theScore }
}
