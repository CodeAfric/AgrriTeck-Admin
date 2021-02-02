import 'package:agriteck_admin/model-data/farmers.dart';
import 'package:flutter/material.dart';

class FarmerCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return  ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            header: Text('Farmer List'),
            rowsPerPage: 9,
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Telephone')),
              DataColumn(label: Text('Location')),
              DataColumn(label: Text('No. Farms')),
            ],
            source: _DataSources(context),
          ),
        ],
    );
  }
}

class _DataSources extends DataTableSource {
  _DataSources(this.context) {
    _rows = <Farmers>[
    Farmers(
         "Kwaku Bosman",
         "Duampopo",
        "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4),
      Farmers(
          "Kwaku Bosman",
          "Duampopo",
          "0548402534",4)
    ];
  }

  final BuildContext context;
  List<Farmers> _rows;

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.name)),
        DataCell(Text(row.telephone)),
        DataCell(Text(row.location)),
        DataCell(Text(row.numFarms.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
