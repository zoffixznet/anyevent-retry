package AnyEvent::Retry::Interval::Constant;
# ABSTRACT: a constant interval
use Moose;
use MooseX::Types::Common::Numeric qw(PositiveNum);
use namespace::autoclean;

with 'AnyEvent::Retry::Interval';

has 'interval' => (
    is      => 'ro',
    isa     => PositiveNum,
    default => 1,
);

sub reset {}

sub next {
    my ($self, $try) = @_;
    return $self->interval;
}

1;

__END__

=head1 SYNOPSIS

Always wait 42 seconds:

    my $i = AnyEvent::Retry::Interval::Constant->new( interval => 42 );

