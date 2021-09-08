// ignore_for_file: non_constant_identifier_names, camel_case_types

class Staff {
  final String ID;
  final String Staff_ID;
  final String Casual_Leave;
  final String Earned_Leave;
  final String Carrier_Leave;
  final String IsDeleted;
  final String ModifiedBy;
  final String Other_Leave;

  Staff(this.ID, this.Staff_ID, this.Casual_Leave, this.Earned_Leave,
      this.Carrier_Leave, this.IsDeleted, this.ModifiedBy, this.Other_Leave);
}

class Staff_List {
  final String StaffCode;
  final String StaffName;
  final String StaffPhoto;

  Staff_List(this.StaffCode, this.StaffName, this.StaffPhoto);
}
