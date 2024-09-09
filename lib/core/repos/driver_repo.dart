import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:may_fair/core/network_services/cloud_firestore.dart';

class DriverRepo {
  final CloudFirestoreServices _firebaseCloudServices;

  // Constructor that takes FirebaseCloudServices
  DriverRepo(this._firebaseCloudServices);

  String collection = "Drivers";

  // Method to add driver data
  Future<void> addDriver(Map<String, dynamic> driverData) async {
    try {
      await _firebaseCloudServices.addData(collection, driverData);
      print("Driver added successfully");
    } catch (e) {
      print("Error adding driver: $e");
    }
  }

  // Method to get a specific driver by ID
  Future<Map<String, dynamic>?> getDriver(String driverId) async {
    try {
      Map<String, dynamic>? driverData =
          await _firebaseCloudServices.getDataById(collection, driverId);
      if (driverData != null) {
        print("Driver retrieved successfully");
        return driverData;
      } else {
        print("Driver not found");
        return null;
      }
    } catch (e) {
      print("Error getting driver: $e");
      return null;
    }
  }
 // Method to get all drivers' data
  Future<List<Map<String, dynamic>>> getAllDrivers() async {
    try {
      List<Map<String, dynamic>> drivers = await _firebaseCloudServices.getAllData(collection);
      print("All drivers retrieved successfully");
      return drivers;
    } catch (e) {
      print("Error getting all drivers: $e");
      return [];
    }
  }

  // Method to get all drivers along with their document IDs
  Future<List<Map<String, dynamic>>> getAllDriversWithIds() async {
    try {
      List<Map<String, dynamic>> driversWithIds = [];

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collection).get();
      for (var doc in querySnapshot.docs) {
        driversWithIds.add({
          'id': doc.id,
          'data': doc.data(),
        });
      }

      print("All drivers with IDs retrieved successfully");
      return driversWithIds;
    } catch (e) {
      print("Error getting all drivers with IDs: $e");
      return [];
    }
  }
  // Method to update driver data
  Future<void> updateDriver(
      String driverId, Map<String, dynamic> updatedData) async {
    try {
      await _firebaseCloudServices.updateData(collection, driverId, updatedData);
      print("Driver updated successfully");
    } catch (e) {
      print("Error updating driver: $e");
    }
  }

  // Method to delete a driver by ID
  Future<void> deleteDriver(String driverId) async {
    try {
      await _firebaseCloudServices.deleteDataById(collection, driverId);
      print("Driver deleted successfully");
    } catch (e) {
      print("Error deleting driver: $e");
    }
  }
}
