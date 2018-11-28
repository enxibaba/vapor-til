import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

/*
extension Acronym: Model {
    //1 tell Fluent what database to use for this model.
    typealias Database = SQLiteDatabase
    //2 tell Fluent what type the ID is.
    typealias ID = Int
    //3 tell Fluent the key path of the model's ID property
    public static var idKey: IDKey = \Acronym.id
 } This code can be improved further with SQLiteModel . Replace*/

extension Acronym: SQLiteModel {}

// Fluent packages为每个数据库提供了模型帮助程序协议，因此您不必指定数据库、ID类型、密钥。
// SQLiteModel协议必须具有Int类型的ID？名为id，
// 对于ID为UUID或String的模型，有SQLiteUUIDModel和SQLiteStringModel协议。
// 如果要自定义ID属性名称，则必须符合标准模型协议

// 要将模型保存在数据库中，必须为其创建表。Fluent通过Migration完成此操作。Migrations
// 允许您对数据库进行可靠，可测试，可重现的更改。它们通常用于为模型创建数据库模式或表描述。
// 它们还用于将数据播种到数据库中，或者在模型保存后对模型进行更改。

extension Acronym: Migration {}
// That is all you need to do!

extension Acronym: Content {}
