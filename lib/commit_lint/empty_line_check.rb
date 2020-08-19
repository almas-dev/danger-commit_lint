module Danger
  class DangerCommitLint < Plugin
    class EmptyLineCheck < CommitCheck # :nodoc:
      MESSAGE = 'Please separate commit message subject from body with newline.'.freeze

      def self.type
        :empty_line
      end

      def initialize(message)
        @empty_line = message[:empty_line]
      end

      def fail?
        @empty_line && !@empty_line.empty?
      end
    end
  end
end
