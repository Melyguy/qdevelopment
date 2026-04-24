namespace qsharptest {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation HelloQ(): Result{
        use q = Qubit();
        H(q);
        return M(q);

    }

    
}