use utf8;
package Postcodify::Schema::Result::PostcodifyAddress;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Postcodify::Schema::Result::PostcodifyAddress

=cut

use strict;
use warnings;


=head1 BASE CLASS: L<Postcodify::Schema::Base>

=cut

use base 'Postcodify::Schema::Base';

=head1 TABLE: C<postcodify_addresses>

=cut

__PACKAGE__->table("postcodify_addresses");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 postcode5

  data_type: 'char'
  is_nullable: 1
  size: 5

=head2 postcode6

  data_type: 'char'
  is_nullable: 1
  size: 6

=head2 road_id

  data_type: 'decimal'
  is_nullable: 1
  size: [14,0]

=head2 num_major

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 num_minor

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 is_basement

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 dongri_ko

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 dongri_en

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 jibeon_major

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 jibeon_minor

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 is_mountain

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 building_id

  data_type: 'decimal'
  is_nullable: 1
  size: [25,0]

=head2 building_name

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 building_nums

  data_type: 'varchar'
  is_nullable: 1
  size: 120

=head2 other_addresses

  data_type: 'text'
  is_nullable: 1

=head2 updated

  data_type: 'decimal'
  is_nullable: 1
  size: [8,0]

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "postcode5",
  { data_type => "char", is_nullable => 1, size => 5 },
  "postcode6",
  { data_type => "char", is_nullable => 1, size => 6 },
  "road_id",
  { data_type => "decimal", is_nullable => 1, size => [14, 0] },
  "num_major",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "num_minor",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_basement",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "dongri_ko",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "dongri_en",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "jibeon_major",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "jibeon_minor",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_mountain",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "building_id",
  { data_type => "decimal", is_nullable => 1, size => [25, 0] },
  "building_name",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "building_nums",
  { data_type => "varchar", is_nullable => 1, size => 120 },
  "other_addresses",
  { data_type => "text", is_nullable => 1 },
  "updated",
  { data_type => "decimal", is_nullable => 1, size => [8, 0] },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2017-02-24 07:00:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7LfHPw/vEXQyPrpM4nwrWg

__PACKAGE__->belongs_to(
  "road",
  "Postcodify::Schema::Result::PostcodifyRoad",
  { road_id => "road_id" },
  {
    is_deferrable => 0,
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->has_many(
  "keywords",
  "Postcodify::Schema::Result::PostcodifyKeyword",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "buildings",
  "Postcodify::Schema::Result::PostcodifyBuilding",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "numbers",
  "Postcodify::Schema::Result::PostcodifyNumber",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "poboxes",
  "Postcodify::Schema::Result::PostcodifyPobox",
  { "foreign.address_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
