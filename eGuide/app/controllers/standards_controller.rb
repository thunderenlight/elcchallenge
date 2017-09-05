require 'csv'


class StandardsController < ApplicationController

  def index
    @standards = Standard.all
  end

  def show
    @standard = Standard.find(params[:id])
  end

  def create
    domains = params[:domains]
    tests = params[:tests]

    @standard = Standard.new({domains: domains.read, tests: tests.read})
    invalid = domains.nil? || tests.nil?

    if !invalid && @standard.save
      @standard.run
      flash[:success] = "Guide created"
    else
      flash[:error] = "Try again"
    end
    redirect_to :back
  end


  def save
    @standard = Standard.find(params[:id])
    respond_to do |format|
      format.csv { send_data @standard.save_csv }
  end
end

  def destroy
    Standard.find(params[:id]).destroy
    flash[:success] = "Guide deleted"
    redirect_to standards_url
  end

  private

  def standard_params
    params.require(:standard).permit(:tests, :domains)
  end

end


