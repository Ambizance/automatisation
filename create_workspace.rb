
#on check si user a bien mis un string à la suite de la commande pour
def check_input
    abort("missing name of folder") if ARGV.empty?
end

#on créé un dossier ayant pour nom le ARGV
def create_main_folder
    Dir.mkdir("#{ARGV.first}")
end

#on entre dans dossier_parent, on créé les dossiers enfant puis on retourne dans le dossier parent
def create_child_folder
    
    Dir.mkdir("#{ARGV.first}/lib")
    Dir.mkdir("#{ARGV.first}/spec")
end

#on créé le fichier app.rb dans dossier lib
def create_app
    app = File.new("#{ARGV.first}/lib/app.rb", "w")
    app.puts(" require 'dotenv' \n require 'rubocop' \n require 'pry' \n require 'rspec' \n require 'nokogiri' \n require 'rubygems' \n require 'open-uri' ")
    app.close
end

#on créé le fichier app_spec.rb dans dossier spec
def create_app_spec
    spec = File.new("#{ARGV.first}/spec/app_spec.rb" , "w")
    spec.close
end

#on créé les fichiers du dossier parent et les remplir si besoin
def create_files 
    #on créé le Gemfile et ses Gem 

    gmf = File.new("Gemfile" ,"a")
    gmf.puts(" source 'www.rubygems.org' \n ruby '2.7.1', \n gem 'pry' \n gem 'rspec' \n gem 'dotenv' \n gem 'rubygems'")
    gmf.close

    rdm = File.new("README.md","a")
    rdm.close
end

check_input
create_main_folder
create_child_folder
create_app
create_app_spec
create_files


#rajouter git init + rspec init + .env