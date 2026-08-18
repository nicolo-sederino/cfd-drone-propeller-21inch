# CFD Analysis of a 21-inch Heavy-Lift Drone Propeller

## 1. Project Overview
This project simulates the aerodynamic performance of a 21-inch drone propeller operating at 4000 RPM using OpenFOAM. The simulation utilizes the **Actuator Disk Model** (`rotorDisk`) to evaluate thrust, drag, and power consumption efficiently, avoiding the computational cost of a fully resolved rotating 3D mesh (MRF).

## 2. Grid Independence & Wake Extension
A mesh sensitivity and domain analysis was conducted. After identifying a geometric boundary truncation in the initial setup, the actuator disk volume was properly scaled to encompass the full 21-inch diameter (0.533 m). The wake region was also extended to 6 diameters downstream to ensure boundary conditions do not artificially compress the flow. The final refined mesh sits at **~1.2 Million cells**.

| Test Phase | Mesh Density | Angular Vel. | Thrust / Lift (N) | Power (W) |
| :--- | :--- | :--- | :--- | :--- |
| **Final Setup** | ~1.2M Cells | 4000 RPM | **20.9 N** (2.13 kg) | **137.6 W** |

## 3. Model Validation & Limitations
The Actuator Disk simulation estimated a mathematically converged thrust of **2.13 kg (20.9 N) at 4000 RPM** and a power consumption of 137.6 W. 

The manufacturer datasheet for a similar 21-inch carbon propeller claims ~2.4 kg at 3800 RPM. The simulated value is remarkably accurate, presenting a delta of only **~11%** from real-world empirical data. This minor underestimation is fully expected and highlights the intrinsic limits of the actuator disk model: it utilizes generic 2D airfoil polars and does not explicitly resolve 3D tip-vortices or the complex washout (twist) distribution of real high-efficiency rotors. 

## 4. Methodology & HPC (High-Performance Computing)
To optimize calculation times and ensure reproducibility, the workflow was engineered with:
* **Bash Scripting**: Automated mesh generation, solver execution, and data extraction (`Allrun`, `Allclean`, `estrai_dati.sh`).
* **Parallel Computing**: Domain decomposition (`decomposePar`) with the Scotch method, running the RANS solver over 4 CPU physical cores simultaneously to accelerate the simulation.
* **Version Control**: Git integration to track dictionary configurations while strictly ignoring heavy binary mesh/time directories (`.gitignore`).

## 5. Flow Visualization
*(Images generated via ParaView)*
* **Wake Contraction**: Velocity contour showing the acceleration and contraction of the flow downstream of the disk.
* **Pressure Jump**: Pressure contour illustrating the pressure differential across the actuator disk.
