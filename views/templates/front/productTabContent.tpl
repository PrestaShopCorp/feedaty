{*
* 2007-2013 PrestaShop
*
*
*  @author Feedaty <info@feedaty.com>
*  @copyright  2012-2014 Feedaty
*  @version  Release: 1.1.135 $
*}
{* <!-- OLD ORIGNAL VERSION -->
* <div id="feedaty_reviews" class="rte">
*    {if count($data_review.Feedbacks) neq 0}
*        {foreach $data_review.Feedbacks as $review}
*            <p>
*                <span class="stars">{$review.stars_html}</span>
*                <span class="review">{$review.ProductReview|escape:'htmlall':'UTF-8'}</span>
*            </p>
*        {/foreach}
*        <p>{$feedaty_link}</p>
*    {else}
*        <p>{l s='There are no reviews' mod='feedaty'}</p>
*    {/if}
*
* </div> 
*}


<div id="feedaty_reviews" class="rte" >
    {if count($data_review.Feedbacks) neq 0}
            {foreach $data_review.Feedbacks as $review}
            <div itemprop="review" itemscope itemtype="http://schema.org/Review">
                <meta itemprop="name" content = "{$review.ProductReview|escape:'htmlall':'UTF-8'}">
                <meta itemprop="author" content = "Feedaty">
                <p>
                    <span class="stars" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating" >
                        <meta itemprop="worstRating" content = "1">
                        <meta itemprop="bestRating" content = "5">
                        <meta itemprop="ratingValue" content = "{$review.stars_num}">
                        {$review.stars_html}
                    </span>
                    <span class="review" itemprop="reviewBody" >{$review.ProductReview|escape:'htmlall':'UTF-8'}</span>
                </p>
            </div>
            {/foreach}

        <p>{$feedaty_link}</p>
    {else}
        <p>{l s='There are no reviews' mod='feedaty'}</p>
    {/if}
    {if count($data_review.Feedbacks) neq 0}
    <div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">

        {l s='Rated' mod='feedaty'}: <br>
        {$avg_rating_stars}
        <meta itemprop="ratingValue" content = "{$avg_rating}">
        <meta itemprop="reviewCount" content = "{$count_review}">
    </div>
    {/if}

</div>