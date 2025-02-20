return{
  --- Plot Setup
  s("setup_header", {
    t({
      "from matplotlib.lines import lineStyles",
      "import scienceplots",
      "import numpy as np",
      "import matplotlib.pyplot as plt",
      "import matplotlib as mpl",
      "import csv",
    }),
  }),
  s("setup_plot", {
    t({
      "## Setup Plot Configuration",
      "plt.rc('text', usetex=True)",
      "plt.rc('text.latex', preamble=r'\\usepackage{amsmath}\\usepackage{siunitx}')",
      "plt.style.use(['science', 'ieee'])",
      "plt.rcParams['axes.grid'] = True",
    })
  }),
  s("def_plot", {
    t("plt.figure()"),
    t({"", "plt.plot("}),
    i(1, "x_values"), t(", "), i(2, "y_values"),
    t(", marker='o', ms=3, mfc='w', label='"), i(3, "Graph-Beschriftung"), t("')"),
    t({"", "plt.xlabel('"}), i(4, "X-Achsenbeschriftung"), t("')"),
    t({"", "plt.ylabel(r'"}), i(5, "Y-Achsenbeschriftung"), t("')"),
    t({"", "", "plt.legend(frameon=True, facecolor='w', framealpha=1)"}),
  }),

  --- CSV Setup
  s("read_csv", {
    t("import csv"),
    t({"", "", "with open("}), i(1, "'datei.csv'"), t(", 'r') as file:"),
    t({"", "    reader = csv.reader(file)"}),
    t({"", "    header = next(reader)  # Überspringt die Kopfzeile (falls vorhanden)"}),
    t({"", "    data = []"}),
    t({"", "    for row in reader:"}),
    t({"", "        data.append(row)"}),
  }),
}
