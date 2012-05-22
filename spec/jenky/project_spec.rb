require 'spec_helper'
#
# Reference Ruby spec for Github Push Events
# payload
# {
#   :before     => before,
#   :after      => after,
#   :ref        => ref,
#   :commits    => [{
#     :id        => commit.id,
#     :message   => commit.message,
#     :timestamp => commit.committed_date.xmlschema,
#     :url       => commit_url,
#     :added     => array_of_added_paths,
#     :removed   => array_of_removed_paths,
#     :modified  => array_of_modified_paths,
#     :author    => {
#       :name  => commit.author.name,
#       :email => commit.author.email
#     }
#   }],
#   :repository => {
#     :name        => repository.name,
#     :url         => repo_url,
#     :pledgie     => repository.pledgie.id,
#     :description => repository.description,
#     :homepage    => repository.homepage,
#     :watchers    => repository.watchers.size,
#     :forks       => repository.forks.size,
#     :private     => repository.private?,
#     :owner => {
#       :name  => repository.owner.login,
#       :email => repository.owner.email
#     }
#   }
# }
#
describe Jenky::Project do
  describe 'with valid tag' do
    it 'rightly grabs the tag'
    it 'correctly determines branch from final tag'
    it 'correctly determines branch from rc tag'
    it 'rightly grabs the repo name'
  end
  describe 'with invalid tag' do
    it 'sets tag to unknown'
    it 'sets branch to unknown'
    it 'logs error'
    it 'ends execution'
  end
end
