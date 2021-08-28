#include <fstream>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

int totalRegions = 0;
int totalSalesmen = 0;
int price = 100;

class Sales {
 public:
  int regionNo, salesmanNo, productCode, units;

  Sales() : regionNo(0), salesmanNo(0), productCode(0), units(0) {}
  Sales(int r, int s, int p, int u)
      : regionNo(r), salesmanNo(s), productCode(p), units(u) {
    totalRegions = std::max(r, totalRegions);
    totalSalesmen = std::max(s, totalSalesmen);
  }

  void display() {
    std::cout << "Region No: " << regionNo << "\nSalesman No: " << salesmanNo;
    std::cout << "\nProduct Code: " << productCode << "\nUnits: " << units
              << "\n";
  }
};

std::vector<Sales> readInput(std::string filename) {
  std::vector<Sales> sales;
  std::ifstream file(filename);
  std::string line;

  // ignore first line
  std::getline(file, line);

  while (std::getline(file, line)) {
    try {
      std::stringstream ss(line);
      std::string token;
      std::vector<std::string> tokens;
      while (std::getline(ss, token, ',')) {
        tokens.push_back(token);
      }
      Sales s(std::stoi(tokens[0]), std::stoi(tokens[1]), std::stoi(tokens[2]),
              std::stoi(tokens[3]));
      sales.push_back(s);
    } catch (std::exception &e) {
      std::cout << "Error in " << __func__ << ": reading file\n";
    }
  }
  return sales;
}

int main() {
  std::vector<Sales> sales = readInput("sales.csv");

  std::ofstream file("output.txt");

  std::vector<std::vector<int>> salesByRegion(
      totalRegions + 1, std::vector<int>(totalSalesmen + 1, 0));
  for (auto s : sales) {
    salesByRegion[s.regionNo][s.salesmanNo] += s.units * price;
  }

  file << std::setw(20) << "ABC Company\n\n";

  for (int i = 1; i <= totalRegions; i++) {
    file << "Region " << i << "\n";
    int totalSaleByRegion = 0;
    for (int j = 1; j <= totalSalesmen; j++) {
      if (salesByRegion[i][j] > 0) {
        file << "Salesman " << j << "\t\t\t Rs " << salesByRegion[i][j] << "\n";

        totalSaleByRegion += salesByRegion[i][j];
      }
    }
    file << "Total Sales at Region " << i << " : Rs " << totalSaleByRegion
         << "\n\n";
  }

  return 0;
}
