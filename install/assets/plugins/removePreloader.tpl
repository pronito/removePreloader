//<?php
/**
 * removePreloader
 *
 * switch-off preloader
 *
 * @author      webber (web-ber12@yandex.ru)
 * @category    plugin
 * @version     0.2
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnManagerTopPrerender
 * @internal    @properties  &show_icon=Показывать иконки (1-да);text;0&logo=Ссылка на логотип;image;/manager/media/style/default/images/misc/logo-navbar-white.png&hide_logo=Заменить логотип (1-да);text;0
 * @internal    @installset base, sample
 * @internal    @modx_category Manager and Admin
 */

$e = $modx->Event;
if ($e->name == 'OnManagerTopPrerender') {
    $out = '<style>';
    $out .= '#mainloader{display:none !important;}';
    if ($show_icon && $show_icon == '1') {
        $out .= '@media(min-width: 1200px){#mainMenu #nav>li>a>.fa{display:inline-block;margin-right:0.5rem;}}';
        $out .= '#treeHolder .rootNode .icon{display:inline-block;}';
        $out .= '#treeHolder .rootNode a{padding-left:1em;}';
    }
    if ($hide_logo && $hide_logo == '1') {
        $out .= '@media (min-width: 1200px){#mainMenu #nav #site a{padding: 0 1.25rem;}}';
        $out .= '@media (min-width: 1200px){body.light #mainMenu #nav #site::before, body.dark #mainMenu #nav #site::before, body.darkness #mainMenu #nav #site::before {background: url('.$logo.') 0 50% no-repeat;background-size: 8rem;}}';
    }
    $out .= '</style>';
    $e->output($out);
}
