require 'spec_helper'

RSpec.describe Commander do
  let(:table) { Table.new(length: 5, width: 5) }
  subject { described_class.new(table: table) }

  describe '#execute' do
    context 'when table empty' do
      it do
        expect {
          subject.execute('PLACE 3,3,EAST')
        }.to raise_error(StandardError, 'Please place your robot on the table')
      end
    end

    context 'when placed robot on the table' do
      let(:robot) { Robot.new }

      before { table.robot = robot }

      context 'invalid command' do
        specify do
          expect {
            subject.execute('HELLO 3,3,EAST')
          }.to raise_error(StandardError, 'Not found command HELLO')
        end
      end

      context 'valid command' do
        context 'when execute command PLACE' do
          context 'valid arguments' do
            before { expect(robot).to receive(:place).with('3', '3', 'EAST').once.and_call_original }

            specify do
              expect {
                subject.execute('PLACE 3,3,EAST')
              }.not_to raise_error
            end
          end

          context 'invalid arguments' do
            specify do
              expect {
                subject.execute('PLACE 3,3')
              }.to raise_error(ArgumentError, 'Required 3 arguments (x, y and direction)')
            end
          end
        end

        context 'when execute command MOVE' do
          before { expect(robot.position).to receive(:move).once.and_call_original }

          it { expect { subject.execute('MOVE') }.not_to raise_error }
        end

        context 'when execute command REPORT' do
          before { expect(robot).to receive(:report).once.and_call_original }

          it { expect { subject.execute('REPORT') }.not_to raise_error }
        end

        context 'when execute command LEFT' do
          before { expect(robot.position).to receive(:turn_left).once.and_call_original }

          it { expect { subject.execute('LEFT') }.not_to raise_error }
        end

        context 'when execute command RIGHT' do
          before { expect(robot.position).to receive(:turn_right).once.and_call_original }

          it { expect { subject.execute('RIGHT') }.not_to raise_error }
        end
      end
    end
  end
end
