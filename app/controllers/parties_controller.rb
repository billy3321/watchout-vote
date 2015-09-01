class PartiesController < ApplicationController
  before_action :set_party, except: [:index, :new]
  before_action :set_issue, except: [:index, :new, :issues, :show]
  before_action :set_party_standpoints, except: [:index, :new, :show]
  before_action :set_party_standpoint, except: [:index, :new, :issues, :show]
  before_action :get_record_count, except: [:index, :new, :issues, :show]

  # GET /partys
  def index
    @parties = Party.all
    set_meta_tags({
      title: "所有議題"
    })
  end

  # GET /partys/1
  def show
  end

  def issues
    @parties = Party.includes(:party_standpoints).all
  end

  def issue
  end

  def bills
    @bills = Bill.get_party_bill(@party, @issue).date_desc.page(params[:page])
  end

  def interpellations
    @interpellations = Interpellation.get_party_interpellation(@party, @issue).date_desc.page(params[:page])
  end

  def votes
    @votes = Vote.get_party_vote(@party, @issue).date_desc.page(params[:page])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    unless params[:party_id].blank?
      @party = Party.find(params[:party_id])
    else
      @party = params[:id] ? Party.find(params[:id]) : Party.new(party_params)
    end
  end

  def set_issue
    @issue = params[:id] ? Issue.published.find(params[:id]) : nil
  end

  def get_record_count
    @bills_count = Bill.get_party_bill(@party, @issue).count
    @interpellations_count = Interpellation.get_party_interpellation(@party, @issue).count
    @votes_count = Vote.get_party_vote(@party, @issue).count
  end

  def set_party_standpoint
    @party_standpoint = PartyStandpoint.get_standpoint(@party, @issue)
  end

  def set_party_standpoints
    @party_standpoints = @party.party_standpoints.includes(:issue)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_params
    params.require(:party).permit()
  end
end