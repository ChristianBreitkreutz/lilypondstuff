
\version "2.16.0"

\header{
  composer = "Ulf"
  title = "Lilypond test"
}


% set tempo in beats per minutes
setBpm = \tempo 4 = 120

% midi instruments
% (http://lilypond.org/doc/v2.19/Documentation/notation/midi-instruments)
instrument_bass = #"slap bass 1"
instrument_rhythm = #"electric guitar (clean)"




basslineFragmentA = \relative g,, { g8. r16  b16 r16 g'16 r16 d16 g,16 r16 d'8. b8 }
basslineFragmentB = \relative g,, { g8. g16  b16 r16 g'16 r16 d16 g,16 r16 d'8. ~ d8 }
basslineFragmentC = \relative g,, { g1 }
bassline = {
  \basslineFragmentA
  \basslineFragmentB
  \basslineFragmentA
  \basslineFragmentC
}

rhythm = \chordmode {r8 g16 r8 g16 g16 r4 g16 g16 r16 g16 r16}

% http://lilypond.org/doc/v2.18/Documentation/notation/percussion-notes
drumFragmentHiHats = \drummode { hhc16 r16 hhc16 hhc16  hhc16 r16 hhc16 hhc16  hhc16 r16 hhc16 hhc16  hhc16 r16 hhc16 hhc16 }
drumFragmentBaseDrums = \drummode { bd4 bd4 bd4 bd4 }
drumFragmentElectricSnare = \drummode {r16 r16 sne16 sne16  sne16 r16 sne16 sne16  sne16 sne16 sne16 sne16  sne16 r16 sne16 r16}
drumFragmentAcousticSnare = \drummode {r16 r16 r16 r16   r16 r16 r16 r16   sna16 sna16 sna16 sna16  sna16 r16 sna16 r16}
drumFragmentA = <<
  \new DrumVoice {
     \oneVoice
     \drumFragmentHiHats
  }
  \new DrumVoice {
     \oneVoice
     \drumFragmentBaseDrums
  }
>>
drumFragmentB = <<
  \new DrumVoice {
     \oneVoice
     \drumFragmentHiHats
  }
  \new DrumVoice {
     \oneVoice
     \drumFragmentBaseDrums
  }
  \new DrumVoice {
     \oneVoice
     \drumFragmentElectricSnare
  }
  \new DrumVoice {
     \oneVoice
     \drumFragmentAcousticSnare
  }
>>
drumFragmentC = <<
  \new DrumVoice {
     \oneVoice
     \drumFragmentHiHats
  }
  \new DrumVoice {
     \oneVoice
     \drumFragmentBaseDrums
  }
  \new DrumVoice {
     \oneVoice
     \drummode {sne}
  }
  \new DrumVoice {
     \oneVoice
     \drummode {sna}
  }
  \new DrumVoice {
     \oneVoice
     \drummode {cymc}
  }
>>



\score {


  \new StaffGroup <<

    \new Staff {
      \setBpm
      \set Staff.midiInstrument = \instrument_rhythm

      \rhythm
      \rhythm
      \rhythm
      \rhythm
      \transpose g a \rhythm
      \transpose g a \rhythm
      \transpose g a \rhythm
      \transpose g a \rhythm
    }
    
    \new Staff {
      \setBpm
      \clef bass
      \set Staff.midiInstrument = \instrument_bass

      \bassline
      \transpose g a \bassline
    }

    \new DrumStaff {
      \drumFragmentA
      \drumFragmentA
      \drumFragmentA
      \drumFragmentB
      \drumFragmentC
      \drumFragmentA
      \drumFragmentA
      \drumFragmentA
    }
  
  >>



  \midi {}
  \layout {}

}