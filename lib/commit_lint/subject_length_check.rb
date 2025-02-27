module Danger
  class DangerCommitLint < Plugin
    class SubjectLengthCheck < CommitCheck # :nodoc:
      MESSAGE = 'Please limit commit message subject line to 50 characters.'.freeze
      GIT_GENERATED_SUBJECT = /^Merge branch \'.+\' into\ /.freeze
      GIT_REMOTE_GENERATED_SUBJECT = /^Merge remote-tracking branch \'.+\' into\ /.freeze
      GITHUB_GENERATED_SUBJECT = /^Merge pull request #\d+ from\ /.freeze

      attr_reader :subject

      def self.type
        :subject_length
      end

      def initialize(message)
        @subject = message[:subject]
      end

      def fail?
        subject.length > 50 && !merge_commit?
      end

      def merge_commit?
        subject =~ /#{GIT_GENERATED_SUBJECT}|#{GIT_REMOTE_GENERATED_SUBJECT}|#{GITHUB_GENERATED_SUBJECT}/
      end
    end
  end
end
