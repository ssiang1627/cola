class HomeController < ApplicationController

  def index
    colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
    @data=Paxdata.data_count;
    @data1=Paxdata.data_count1;
    @data2=Paxdata.data_count2;
  end

  def index2

  end
end