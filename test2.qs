namespace qsharptest {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    operation HundredCoinFlips() : Unit {

        mutable zeros = 0;
        mutable ones = 0;

        for i in 1..100 {

            use q = Qubit();
            H(q);

            let result = M(q);

            if result == Zero {
                set zeros += 1;
            } else {
                set ones += 1;
            }

            Reset(q);
        }

        Message($"Zeros: {zeros}");
        Message($"Ones: {ones}");
    }
}