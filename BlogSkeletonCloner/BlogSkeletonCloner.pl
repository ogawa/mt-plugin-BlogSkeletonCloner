# BlogSkeletonCloner
#
# $Id$
#
# This software is provided as-is. You may use it for commercial or 
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2007 Hirotaka Ogawa

package MT::Plugin::BlogSkeletonCloner;
use strict;
use base qw(MT::Plugin);

use MT;
use MT::Blog;

our $VERSION = '0.01';

my $plugin = __PACKAGE__->new({
    id => 'blog_skeleton_cloner',
    name => 'BlogSkeletonCloner',
    description => q(<MT_TRANS phrase="Clones a weblog except for its contents.">),
    doc_link => 'http://code.as-is.net/wiki/BlogSkeletonCloner',
    author_name => 'Hirotaka Ogawa',
    author_link => 'http://profile.typekey.com/ogawa/',
    version => $VERSION,
    l10n_class => 'BlogSkeletonCloner::L10N',
});
MT->add_plugin($plugin);

sub init_registry {
    my $plugin = shift;
    $plugin->registry({
	applications => {
	    cms => {
		list_actions => {
		    blog => {
			skeleton_clone_blog => {
			    label      => $plugin->translate('Clone Blog (Skeleton)'),
			    code       => \&clone_blog,
			    permission => 'administer',
			    max        => 4,
			},
		    },
		},
	    },
	},
    });
}

sub clone_blog {
    my $app = shift;
    my $user = $app->user;
    return $app->error($app->translate('Permission denied.'))
        unless $user->is_superuser;

    my @blog_ids = $app->param('id')
	or return $app->error($plugin->translate('No blog was selected to clone.'));
    if (scalar @blog_ids > 4) {
        return $app->error($plugin->translate("This action can only be run for at most four blogs at a time."));
    }

    for my $blog_id (@blog_ids) {
	my $blog = MT::Blog->load($blog_id)
	    or return $app->error($plugin->translate('Invalid blog_id'));

	my $blog_cloned = $blog->clone({
	    BlogName => make_unique_blog_name($blog),
	    Children => 1,
	    Except   => {
		id        => 1,
		site_path => 1,
		site_url  => 1,
	    },
	    Classes  => {
		'MT::Permission'  => 1,
		'MT::Association' => 1,
		'MT::Entry'       => 0,
		'MT::Category'    => 0,
		'MT::Comment'     => 0,
		'MT::ObjectTag'   => 0,
		'MT::Trackback'   => 0,
		'MT::TBPing'      => 0,
		'MT::Template'    => 1,
	    }
	});
    }

    $app->call_return;
}

sub make_unique_blog_name {
    my $blog = shift;
    my $blog_name = $blog->name;
    my $unique_blog_name;
    my $i = 1;
    do {
	$unique_blog_name = $blog_name . ' (' . $i++ . ')';
    } while (MT::Blog->count({ name => $unique_blog_name }));

    $unique_blog_name;
}

1;
