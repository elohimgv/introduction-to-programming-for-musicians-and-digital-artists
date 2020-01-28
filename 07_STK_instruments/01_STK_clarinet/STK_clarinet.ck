// STK Physical Clarinet Model
Clarinet clar => dac;

0.2 => float blow;

while ((0.05 +=> blow) < 1.0) {
    blow => clar.startBlowing;
    0.2::second => now;
    1 => clar.stopBlowing;
    0.2::second => now;
    <<<blow>>>;
}
