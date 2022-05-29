/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [COMANDA_OBSERVACAO_PADRAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'package:moor/moor.dart';

@DataClassName("ComandaObservacaoPadrao")
@UseRowClass(ComandaObservacaoPadrao)
class ComandaObservacaoPadraos extends Table {
  @override
  String get tableName => 'COMANDA_OBSERVACAO_PADRAO';

  IntColumn get id => integer().named('ID').autoIncrement()();
  TextColumn get codigo => text().named('CODIGO').withLength(min: 0, max: 2).nullable()();
  TextColumn get descricao => text().named('DESCRICAO').withLength(min: 0, max: 100).nullable()();
}

class ComandaObservacaoPadrao extends DataClass implements Insertable<ComandaObservacaoPadrao> {
  final int? id;
  final String? codigo;
  final String? descricao;

  ComandaObservacaoPadrao(
    {
      required this.id,
      this.codigo,
      this.descricao,
    }
  );

  factory ComandaObservacaoPadrao.fromData(Map<String, dynamic> data, GeneratedDatabase db, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ComandaObservacaoPadrao(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}ID']),
      codigo: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}CODIGO']),
      descricao: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}DESCRICAO']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['ID'] = Variable<int?>(id);
    }
    if (!nullToAbsent || codigo != null) {
      map['CODIGO'] = Variable<String?>(codigo);
    }
    if (!nullToAbsent || descricao != null) {
      map['DESCRICAO'] = Variable<String?>(descricao);
    }
    return map;
  }

  ComandaObservacaoPadraosCompanion toCompanion(bool nullToAbsent) {
    return ComandaObservacaoPadraosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      codigo: codigo == null && nullToAbsent
        ? const Value.absent()
        : Value(codigo),
      descricao: descricao == null && nullToAbsent
        ? const Value.absent()
        : Value(descricao),
    );
  }

  factory ComandaObservacaoPadrao.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ComandaObservacaoPadrao(
      id: serializer.fromJson<int>(json['id']),
      codigo: serializer.fromJson<String>(json['codigo']),
      descricao: serializer.fromJson<String>(json['descricao']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'codigo': serializer.toJson<String?>(codigo),
      'descricao': serializer.toJson<String?>(descricao),
    };
  }

  ComandaObservacaoPadrao copyWith(
        {
		  int? id,
          String? codigo,
          String? descricao,
		}) =>
      ComandaObservacaoPadrao(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        descricao: descricao ?? this.descricao,
      );
  
  @override
  String toString() {
    return (StringBuffer('ComandaObservacaoPadrao(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
      id,
      codigo,
      descricao,
	]);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ComandaObservacaoPadrao &&
          other.id == id &&
          other.codigo == codigo &&
          other.descricao == descricao 
	   );
}

class ComandaObservacaoPadraosCompanion extends UpdateCompanion<ComandaObservacaoPadrao> {

  final Value<int?> id;
  final Value<String?> codigo;
  final Value<String?> descricao;

  const ComandaObservacaoPadraosCompanion({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.descricao = const Value.absent(),
  });

  ComandaObservacaoPadraosCompanion.insert({
    this.id = const Value.absent(),
    this.codigo = const Value.absent(),
    this.descricao = const Value.absent(),
  });

  static Insertable<ComandaObservacaoPadrao> custom({
    Expression<int>? id,
    Expression<String>? codigo,
    Expression<String>? descricao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'ID': id,
      if (codigo != null) 'CODIGO': codigo,
      if (descricao != null) 'DESCRICAO': descricao,
    });
  }

  ComandaObservacaoPadraosCompanion copyWith(
      {
	  Value<int>? id,
      Value<String>? codigo,
      Value<String>? descricao,
	  }) {
    return ComandaObservacaoPadraosCompanion(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['ID'] = Variable<int?>(id.value);
    }
    if (codigo.present) {
      map['CODIGO'] = Variable<String?>(codigo.value);
    }
    if (descricao.present) {
      map['DESCRICAO'] = Variable<String?>(descricao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComandaObservacaoPadraosCompanion(')
          ..write('id: $id, ')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write(')'))
        .toString();
  }
}

class $ComandaObservacaoPadraosTable extends ComandaObservacaoPadraos
    with TableInfo<$ComandaObservacaoPadraosTable, ComandaObservacaoPadrao> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ComandaObservacaoPadraosTable(this._db, [this._alias]);
  
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int>? _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('ID', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');

  final VerificationMeta _codigoMeta =
      const VerificationMeta('codigo');
  GeneratedColumn<String>? _codigo;
  @override
  GeneratedColumn<String> get codigo => _codigo ??=
      GeneratedColumn<String>('CODIGO', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _descricaoMeta =
      const VerificationMeta('descricao');
  GeneratedColumn<String>? _descricao;
  @override
  GeneratedColumn<String> get descricao => _descricao ??=
      GeneratedColumn<String>('DESCRICAO', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
		    
  @override
  List<GeneratedColumn> get $columns => [
        id,
        codigo,
        descricao,
      ];

  @override
  String get aliasedName => _alias ?? 'COMANDA_OBSERVACAO_PADRAO';
  
  @override
  String get actualTableName => 'COMANDA_OBSERVACAO_PADRAO';
  
  @override
  VerificationContext validateIntegrity(Insertable<ComandaObservacaoPadrao> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['ID']!, _idMeta));
    }
    if (data.containsKey('CODIGO')) {
        context.handle(_codigoMeta,
            codigo.isAcceptableOrUnknown(data['CODIGO']!, _codigoMeta));
    }
    if (data.containsKey('DESCRICAO')) {
        context.handle(_descricaoMeta,
            descricao.isAcceptableOrUnknown(data['DESCRICAO']!, _descricaoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ComandaObservacaoPadrao map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ComandaObservacaoPadrao.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ComandaObservacaoPadraosTable createAlias(String alias) {
    return $ComandaObservacaoPadraosTable(_db, alias);
  }
}