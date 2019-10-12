Dir['app/**/**.rb'].each { |file| require File.expand_path(file) }

table = Table.new(length: 5, width: 5)
table.robot = Robot.new
commander = Commander.new(table: table)

commander.execute('PLACE 0,0,NORTH')
commander.execute('MOVE')
commander.execute('REPORT')

commander.execute('PLACE 0,0,NORTH')
commander.execute('LEFT')
commander.execute('REPORT')

commander.execute('PLACE 1,2,EAST')
commander.execute('MOVE')
commander.execute('MOVE')
commander.execute('LEFT')
commander.execute('MOVE')
commander.execute('REPORT')
