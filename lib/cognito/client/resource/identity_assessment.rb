# frozen_string_literal: true
class Cognito
  class Client
    class Resource
      class IdentityAssessment < self
        register_type :identity_assessment

        attribute :name
        attribute :phone

        many :identity_record_comparisons
      end # IdentityAssessment

      class IdentityRecordComparison < self
        register_type :identity_record_comparison

        many :name_comparisons
        many :phone_comparisons
        many :ssn_comparisons
        many :birth_comparisons
        many :death_comparisons
        many :address_comparisons
        one :identity_record

        attribute :score
      end # IdentityRecordComparison

      class NameComparison < self
        register_type :name_comparison

        attribute :score

        one :source_record

        class Components
          include Anima.new(:first, :middle, :last), Adamantium

          class Component
            include Anima.new(:source, :input, :score)

            class Name
              include Concord.new(:name), Adamantium
            end # Name
          end # Component
        end # Components
      end # NameComparison

      class PhoneComparison < self
        register_type :phone_comparison

        attribute :score

        one :source_record
      end # PhoneComparison

      class SSNComparison < self
        register_type :ssn_comparison

        attribute :score

        one :source_record

        class Components
          include Anima.new(:area, :group, :serial), Adamantium

          class Component
            include Anima.new(:source, :input, :score)

            class SSN
              include Concord.new(:ssn), Adamantium
            end # SSN
          end # Component
        end # Components
      end # SSNComparison

      class BirthComparison < self
        register_type :birth_comparison

        attribute :score

        one :source_record

        class Components
          include Anima.new(:year, :month, :day), Adamantium

          class Component
            include Anima.new(:source, :input, :score)

            class Birth
              include Concord.new(:birth), Adamantium
            end # Birth
          end # Component
        end # Components
      end # BirthComparison

      class DeathComparison < self
        register_type :death_comparison

        attribute :score

        one :source_record

        class Components
          include Anima.new(:year, :month, :day), Adamantium

          class Component
            include Anima.new(:source, :input, :score)

            class Death
              include Concord.new(:death), Adamantium
            end # Death
          end # Component
        end # Components
      end # DeathComparison

      class AddressComparison < self
        register_type :address_comparison

        attribute :score

        one :source_record

        class Components
          include Anima.new(:street, :city, :subdivision, :postal_code, :country_code), Adamantium

          class Component
            include Anima.new(:source, :input, :score)

            class Address
              include Concord.new(:address), Adamantium
            end # Address
          end # Component
        end # Components
      end # AddressComparison
    end # Resource
  end # Client
end # Cognito
