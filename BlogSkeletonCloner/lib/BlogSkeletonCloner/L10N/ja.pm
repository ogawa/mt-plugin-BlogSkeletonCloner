# $Id$
package BlogSkeletonCloner::L10N::ja;

use strict;
use base 'BlogSkeletonCloner::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    'Clones a weblog except for its contents.' => 'ブログを複製します。ブログ記事、ウェブページ、コメント、トラックバックなどは複製されません。',
    'Clone Blog (Skeleton)' => 'ブログの複製 (スケルトン)',
    'No blog was selected to clone.' => '複製するブログが選択されていません。',
    'This action can only be run for a single blog at a time.' => '一度にひとつのブログしか選択できません。',
    'Are you sure you want to clone the selected blog(s)?' => '選択したブログを複製してよろしいですか?',
    'Invalid blog_id' => '不正なblog_id',
);

1;
