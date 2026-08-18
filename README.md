# Aerodynamic Analysis of a 21-inch Drone Propeller 🚁💨

![OpenFOAM](https://img.shields.io/badge/OpenFOAM-v8%2B-blue.svg)
![ParaView](https://img.shields.io/badge/ParaView-PostProcessing-orange.svg)
![CFD](https://img.shields.io/badge/CFD-Grid%2BIndependence-green.svg)

## 📌 Project Overview
This project presents a Computational Fluid Dynamics (CFD) study of a 21-inch drone propeller operating in hover conditions at **4000 RPM**. The primary objective of this BSc project is to evaluate the aerodynamic performance (Thrust and Power) and to conduct a rigorous **Grid Independence Study** to ensure numerical reliability.

Simulations were performed using **OpenFOAM** (MRF approach, `simpleFoam` solver) with the **k-ω SST** turbulence model, which is highly suited for rotating machinery and accurately capturing tip vortices and adverse pressure gradients.

---

## 👁️ Visual Post-Processing (ParaView)
High-quality post-processing was performed to analyze the flow physics around the propeller blades.

### Flow Velocity Field across Mesh Refinements
The following contours show the velocity magnitude at the blade section. Notice how the wake resolution and the blade tip vortices become significantly sharper and more physically accurate as the mesh is refined.

<p align="center">
  <img src="coarse_mesh.png" width="32%" alt="Coarse Mesh Velocity">
  <img src="medium_mesh.png" width="32%" alt="Medium Mesh Velocity">
  <img src="fine_mesh.png" width="32%" alt="Fine Mesh Velocity">
</p>
<p align="center"><i>Left to Right: Coarse, Medium, and Fine mesh velocity contours.</i></p>

### Pressure Distribution & Streamlines (Fine Mesh)
The pressure contour highlights the extreme $\Delta P$ between the pressure (lower) and suction (upper) sides of the blade, responsible for thrust generation. The streamlines reveal the strong induced downwash and the helical tip vortex structures typical of hovering rotors.

<p align="center">
  <img src="fine_pressione.png" width="48%" alt="Pressure Contours">
  <img src="fine_streamlines.png" width="48%" alt="Streamlines">
</p>

---

## 📊 Grid Independence Study
To guarantee that the solution is not dependent on the spatial discretization, three mesh levels were tested. 

| Mesh Level | Cell Count | Thrust [N] | Power [W] |
|:---:|:---:|:---:|:---:|
| **Coarse** | 119,728 | 19.25 | 128.12 |
| **Medium** | 427,635 | 20.58 | 136.10 |
| **Fine** | 1,235,717 | 20.90 | 137.63 |

**Convergence Analysis:** 
The jump from Coarse to Medium shows a significant variation in Thrust (+6.9%). However, further refinement from Medium to Fine yields an asymptotic behavior, with only a **+1.5% difference in Thrust**. This proves that the Fine mesh (1.23M cells) provides a stable, grid-independent solution.

<p align="center">
  <img src="residuals_plot.png" width="45%" alt="Simulation Residuals">
  <!-- Add your Excel convergence chart here -->
  <img src="convergence_plot.png" width="45%" alt="Grid Convergence Graph"> 
</p>

---

## 📈 Manufacturer Data vs. CFD Validation
A critical engineering assessment requires comparing numerical results with physical wind-stand tests provided by the manufacturer.

**Manufacturer Specs:**
* 3840 RPM $\rightarrow$ 2400 g ($~23.54$ N)
* 4290 RPM $\rightarrow$ 3000 g ($~29.43$ N)

Knowing that propeller thrust scales quadratically with rotational speed ($T \propto \Omega^2$), we can fit the manufacturer data to find the expected thrust at our simulation speed of **4000 RPM**.
Both a linear interpolation and a quadratic fit yield an expected physical thrust of **~25.6 N** (approx. 2610 g).

**Analytical Discussion of the Discrepancy:**
The CFD Fine mesh predicts **20.90 N**, showing an underprediction of about **18%** compared to the manufacturer's physical data. This is an expected and well-documented phenomenon in rotor CFD, due to the following aerodynamic assumptions:

1. **Aeroelastic Deformation:** The CFD model assumes a perfectly rigid blade. In reality, a 21-inch plastic or carbon fiber propeller spinning at 4000 RPM undergoes significant aeroelastic twisting. The aerodynamic load tends to increase the local pitch angle of the blades, thereby generating more thrust than the static CAD geometry.
2. **Test-Stand Interference:** Manufacturer data is gathered on static thrust stands. The presence of the motor hub and testing arm creates a blockage effect (ground effect reflection) that slightly increases the local pressure under the rotor disk, artificially boosting measured thrust.
3. **Idealized Domain:** The simulation operates in a perfectly undisturbed infinite domain, whereas physical testing invariably includes some flow recirculation in the testing room.

Given the rigid-rotor limitation, the CFD results are highly coherent and provide an excellent baseline for purely aerodynamic optimization.

---

## 👨‍💻 Author
**[Nicolò Sederino]**
- BSc Student in [Aerospace Enginnering] at [Sapienza Univeristy of Rome]
- Aerodynamic and strctural enginner at: [Sapienza Flight Team - SASA]
