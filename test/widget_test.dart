import 'package:flutter_test/flutter_test.dart';
import 'package:gestor_poliester/models/cliente_model.dart';
import 'package:gestor_poliester/models/producto_model.dart';

void main() {
  group('Cliente · serializacion', () {
    test('toMap guarda solo campos de negocio', () {
      final c=Cliente(id:'c-1',nombre:'Cliente de prueba',email:'prueba@example.com',telefono:'600000000');
      expect(c.toMap(), {'nombre':'Cliente de prueba','email':'prueba@example.com','telefono':'600000000'});
    });
    test('fromMap conserva el identificador', () {
      final c=Cliente.fromMap({'nombre':'Ejemplo','email':'demo@example.com','telefono':'611111111'},'doc1');
      expect(c.id,'doc1');
      expect(c.nombre,'Ejemplo');
    });
  });
  group('Producto · serializacion', () {
    test('toMap conserva precio y capacidad', () {
      final p=Producto(id:'p1',nombre:'Deposito',tipo:'depósito',capacidad:5000,precio:850);
      expect(p.toMap(), {'nombre':'Deposito','tipo':'depósito','capacidad':5000.0,'precio':850.0});
    });
    test('fromMap convierte numeros enteros a double', () {
      final p=Producto.fromMap({'nombre':'Piscina','tipo':'piscina','capacidad':12000,'precio':4500},'p2');
      expect(p.id,'p2');
      expect(p.capacidad,12000.0);
      expect(p.precio,4500.0);
    });
  });
}
