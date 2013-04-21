Rails.application.routes.draw do

  mount GtAuth::Engine => "/gt_auth"
end
