import Pkg
Pkg.add(Qiskit)

using Qiskit

# Create a quantum circuit with 2 qubits and 2 classical bits
circuit = QuantumCircuit(2, 2)

# Apply a Hadamard gate to the first qubit
circuit.h(1)
# Apply a CNOT gate with the first qubit as control and the second qubit as a target
circuit.cx(1, 2)

# Measure the qubits and store the results in classical bits

circuit.measure(1, 1)
circuit.measure(2, 2)

# Simulate the circuit with a classical simulator
backend = Qiskit.get_backend("statevector_simulator")
result = Qiskit.execute(circuit, backend).result()

# Print the resulting statevector and the counts of each measurement outcome
println("Statevector: " result.get_statevector(circuit))
println("Counts: ", result.get_counts(circuit))