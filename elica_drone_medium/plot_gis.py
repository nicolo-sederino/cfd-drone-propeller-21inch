import matplotlib.pyplot as plt

# ==========================================
# DATI DELLO STUDIO DI CONVERGENZA
# ==========================================
celle = [119728, 427635, 1235717]
lift = [19.25, 20.58, 20.90]
power = [128.12, 136.10, 137.63]

# Converto le celle in Milioni per l'asse X
celle_mil = [c / 1000000.0 for c in celle]

# Creazione del grafico con doppio asse Y
fig, ax1 = plt.subplots(figsize=(9, 6))

# Asse Y di sinistra (Spinta - Lift)
color1 = '#1f77b4' # Blu elegante
ax1.set_xlabel('Grid Size (Millions of Cells)', fontweight='bold', fontsize=11)
ax1.set_ylabel('Thrust (N)', color=color1, fontweight='bold', fontsize=11)
line1 = ax1.plot(celle_mil, lift, marker='o', markersize=8, color=color1, linewidth=2.5, label='Thrust (N)')
ax1.tick_params(axis='y', labelcolor=color1)
ax1.grid(True, linestyle='--', alpha=0.6)

# Asse Y di destra (Potenza - Power)
ax2 = ax1.twinx()  
color2 = '#d62728' # Rosso elegante
ax2.set_ylabel('Power (W)', color=color2, fontweight='bold', fontsize=11)
line2 = ax2.plot(celle_mil, power, marker='s', markersize=8, color=color2, linewidth=2.5, label='Power (W)')
ax2.tick_params(axis='y', labelcolor=color2)

# Unione delle legende e formattazione
lines = line1 + line2
labels = [l.get_label() for l in lines]
ax1.legend(lines, labels, loc='lower right', framealpha=0.9)

# Aggiunta di etichette per i punti della spinta (opzionale ma d'impatto)
for i, txt in enumerate(lift):
    ax1.annotate(f"{txt} N", (celle_mil[i], lift[i]), textcoords="offset points", xytext=(0,10), ha='center', fontsize=9)

# Titolo e layout
plt.title('Grid Independence Study: Thrust and Power vs. Cell Count', fontweight='bold', fontsize=13)
fig.tight_layout()

# Salvataggio
plt.savefig('grid_independence.png', dpi=300, bbox_inches='tight')
print("Grafico generato con successo: grid_independence.png")

