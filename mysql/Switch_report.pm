package Switch_report;

=head2

 Functions for switch report

=cut

use strict;
our $VERSION = 2.00;
use parent 'dbcore';
my ($admin, $CONF);

#**********************************************************
# Init
#**********************************************************
sub new {
  my $class = shift;
  my $db    = shift;
  ($admin, $CONF) = @_;

  my $self = {
    db => $db,
    admin => $admin,
    conf  => $CONF
  };

  bless($self, $class);

  return $self;
}

#**********************************************************
=head1 customer_list ($attr) - returns list of all customers

  Arguments:
    $attr - hash_ref

  Returns:
  switch_id
  switch_name
  switch_users
  user_off
  user_on
  users_request

=cut
#**********************************************************
sub switch_list {
  my $self = shift;
  my ($attr) = @_;

  my $SORT = ($attr->{SORT}) ? $attr->{SORT} : 1;
  my $DESC = ($attr->{DESC}) ? $attr->{DESC} : '';
  my $PG = ($attr->{PG}) ? $attr->{PG} : 0;
  my $PAGE_ROWS = ($attr->{PAGE_ROWS}) ? $attr->{PAGE_ROWS} : 1000;

  my $search_columns = [
    [ 'EQUIPMENT_ID',               'INT', 'nas.id',                1 ],
    [ 'EQUIPMENT_NAME',             'STR', 'nas.name',              1 ],
    [ 'USER_ID',                    'STR', 'users.uid',             1 ],
    [ 'USER_ACTIVE',                'STR', 'internet_main.disable', 1 ],
    [ 'MESSAGES',                   'STR', 'msgs_messages.uid',     1 ],
  ];

  my $WHERE = $self->search_former($attr, $search_columns, {
    WHERE => 1,
  });

  $self->query("
    SELECT nas.id AS switch_id,
       nas.name AS switch_name,
       (SELECT COUNT(uid)
        FROM internet_main
        WHERE internet_main.nas_id = nas.id
       ) AS switch_users,
       (SELECT COUNT(disable)
        FROM internet_main
        WHERE disable = 1
        AND internet_main.nas_id = nas.id
        ) AS user_off,
       (SELECT COUNT(disable)
        FROM internet_main
        WHERE disable = 0
        AND internet_main.nas_id = nas.id
       ) AS user_on,
       (SELECT COUNT(msgs_messages.id)
        FROM msgs_messages
        WHERE msgs_messages.date >= (NOW() - INTERVAL 30 DAY)
        AND msgs_messages.uid = users.uid
        AND users.uid = internet_main.uid
        AND internet_main.nas_id = nas.id
       ) AS users_request
    FROM internet_main
    LEFT JOIN nas           ON internet_main.nas_id = nas.id
    LEFT JOIN users         ON internet_main.uid = users.uid
    GROUP BY switch_id
    $WHERE
    ORDER BY $SORT $DESC
    LIMIT $PG, $PAGE_ROWS;",
    undef, $attr
  );

  my $list = $self->{list};

  return $list;
}
1;
