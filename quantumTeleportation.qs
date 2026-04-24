namespace quantumTeleportation {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    operation Teleport(source : Qubit, helper : Qubit, target : Qubit) : Unit {

        CNOT(source, helper);
        H(source);

        let m1 = M(source);
        let m2 = M(helper);

        if m2 == One {
            X(target);
        }

        if m1 == One {
            Z(target);
        }
    }

    @EntryPoint()
    operation TeleportationTest() : Unit {

        use qubits = Qubit[3];

        let message = qubits[0];
        let alice  = qubits[1];
        let bob    = qubits[2];

        H(message);

        H(alice);
        CNOT(alice, bob);

        Teleport(message, alice, bob);

        let result = M(bob);

        Message($"Bob received: {result}");

        ResetAll(qubits);
    }
}