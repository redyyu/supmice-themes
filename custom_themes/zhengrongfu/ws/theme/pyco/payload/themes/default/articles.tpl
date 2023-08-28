<sup-set ng-model="g.default_img"
         value="{{theme_url+'/assets/default.jpg'}}"></sup-set>

<sup-set ng-model="g.logo"
         value="{{theme_url+'/assets/logo.png'}}"></sup-set>

<sup-set ng-model="g.trans"
         value="{{theme_url+'/assets/trans.png'}}"></sup-set>

<sup-set ng-model="g.trans_4x7"
         value="{{theme_url+'/assets/trans_4x7.png'}}"></sup-set>

<sup-set ng-model="g.trans_2x5"
         value="{{theme_url+'/assets/trans_2x5.png'}}"></sup-set>

<!-- bootstrap -->
<link ng-href="{{theme_url}}/assets/bootstrap.min.css"
      rel="stylesheet"
      type="text/css">

<!-- styles -->
<link ng-href="{{theme_url}}/assets/main.css"
      rel="stylesheet"
      type="text/css">

<!-- custom -->
<style sup-bind-html="theme_meta.styles"></style>
<sup-body class="wrapper-body"></sup-body>

<header class="fixed-top">
  <nav class="navbar navbar-expand-lg affix">
    <div class="container-fluid">
      <a class="navbar-brand"
         href="#">
        {{site_meta.title}}
      </a>
      <div>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link"
               href="#">
              <svg width="24" height="24" viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/><path d="M0 0h24v24H0z" fill="none"/></svg>
              <span>{{_('Back to home')}}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<div class="wrapper">
  <div class="container p-5">
    <header>
      <h1>
        <span sup-widget-text
              default="{{_('Articles')}}"
              ng-model="meta.title"></span>
      </h1>
    </header>
    <hr>
    <div class="row">
      <!-- col entries -->
      <div class="col-md-7 mb-5"
           sup-query='post'
           ng-model="query.booklet">
        <div class="py-2">
          <a class="btn btn-lg btn-primary"
             href="#"
             sup-widget-create
             type="post">
            {{_('Create New Artcile')}}
          </a>
          <hr>
        </div>
        <div class="py-2"
             ng-repeat="post in query.booklet.contents">
          <div sup-widget-open
               file="post">
            <header>
              <h3>{{post.title || _('Title')}}</h3>
              <h5 class="lead">{{post.date|date_formatted}}</h5>
            </header>
            <figure ng-if="post.featured_img.src">
              <img ng-src="{{post.featured_img.src}}" />
            </figure>
            <p class="excerpt text-clamp-4">{{post.excerpt}}</p>
            <a class="mt-2 btn btn-sm btn-secondary"
               href="{{post.url}}">{{_('Read Detail')}}</a>
          </div>
          <hr>
        </div>
        <nav aria-label="{{_('Pagination')}}"
             ng-if="booklet.total_pages > 1">
          <ul class="pagination">
            <li class="page-item disabled">
              <a class="page-link"
                 href="#"
                 aria-label="{{_('Previous Page')}}">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item {{$first ? 'active' : ''}}"
                ng-repeat="p in query.booklet.page_range">
              <a class="page-link"
                 href="#">
               {{p}}
              </a>
            </li>
            <li class="page-item {{query.booklet.has_next ? '':'disabled'}}">
              <a class="page-link"
                 href="#"
                 aria-label="{{_('Next Page')}}">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>


      <!-- col recent -->
      <div class="col-md-4 ml-auto">
        <h6 class="text-primary">{{_('Recent Articles')}}</h6>
      </div>

    </div>
  </div>
</div>

<footer class="footer">
  <div class="container">
    <div class="pt-4 pb-2">
      <img class="logo"
           ng-if="meta.logo.src || site_meta.logo"
           ng-src="{{meta.logo.src || site_meta.logo}}" />
      <div ng-if="!meta.logo.src && !site_meta.logo">
        <svg class="logo" width="52" height="52" viewBox="0 0 52 52"><title>logo</title><path d="M19.0732,24.2279c-.0971-.2-.158-.4167-.2346-.624a16.5049,16.5049,0,0,1-1.5075,2.19c-1.1686,1.2338-2.2519,2.7443-4.4086,2.2146a2.6056,2.6056,0,0,0,2.4349,1.2487q10.4628.0213,20.9257.0016a2.3955,2.3955,0,0,0,2.3991-1.2515,2.4207,2.4207,0,0,1-2.3779-.42,10.2434,10.2434,0,0,1-3.4253-4.1149c-.07.1692-.133.31-.1876.4547-.3821,1.0118-.6239,1.1783-1.7013,1.1777-3.51-.0016-7.021-.0152-10.5313.0086A1.397,1.397,0,0,1,19.0732,24.2279ZM32.6283,36.6507c-.51,0-1.02,0-1.5349,0v6.85A18.2593,18.2593,0,0,0,35.67,41.4176c.0007-2.1146.0019-3.4287.0085-4.2469.0031-.385-.1455-.5306-.5211-.5252C34.3144,36.6577,33.4713,36.65,32.6283,36.6507ZM16.11,37.1056c-.0227.9259-.0427,2.3164-.0506,4.3244a18.2569,18.2569,0,0,0,4.5383,2.0654v-6.84c-1.412,0-2.7725-.012-4.132.02C16.3387,36.6775,16.1138,36.9526,16.11,37.1056Zm7.176-.4265c-.1352.0026-.37.3508-.3774.5455-.051,1.32-.0589,1.9229-.0693,3.2445-.0035.4479-.0045,1.9053-.0043,3.5431a18.4587,18.4587,0,0,0,6.0167.0036c.0017-2.1769.0078-4.3176.0078-5.04,0-.976,0-1.2324,0-2.3216C26.9284,36.6545,25.1068,36.6423,23.2862,36.6791Zm15.958-.0677a2.3179,2.3179,0,0,0,1.2363-1.9588c.0491-.415.1634-.5767.5642-.6713a9.7211,9.7211,0,0,0,1.2892-.4936l-.0364-.2646c-2.9026.4117-5.38-.1969-7.0632-2.9973a7.9,7.9,0,0,1-.2611.8144,1.4471,1.4471,0,0,1-1.33.9974c-5.199.0056-10.3981.0166-15.5967-.0235a1.9244,1.9244,0,0,1-1.1134-.6246A3.868,3.868,0,0,1,16.394,30.32a5.187,5.187,0,0,1-3.0317,2.6126c-1.2752.351-2.6448-.36-4.1731-.1773.7415.27,1.34,1.207,1.9689,1.4356a1.2522,1.2522,0,0,0,.0328.4459c.2864.623.448,1.4666.9426,1.7881.5709.3712.529.74.532,1.2106.0038.5877.0039.4549.0033,1.0359q.4779.4937.9917.9507c.0016-1.4253.0048-2.1254-.0172-3.5444a.5913.5913,0,0,0-.3674-.422c-.8237-.1831-1.1162-.6156-.941-1.5063H39.3663c.0508,1.0077-.2188,1.3652-1.1553,1.5938v3.7341q.3971-.3618.7717-.7468c-.0015-.7517-.0011-.7731.0135-1.5127C39,37.0081,39.0939,36.6875,39.2442,36.6114Zm-22.52-31.544.2193.0937.297.7829,1.0827-.41-.3-.79.1-.2149c.3344-.1156.6675-.2226.99-.3177l.207.1174.7406,2.8742.5379-.1079a39.0442,39.0442,0,0,1,3.9521-.5934l-.0394-1.1567c-.3039.017-.679.0541-1.1179.1106l-.1851-.142-.1-.7469-1.1476.1529.1031.7716-.1364.1849c-.3224.0543-.62.1074-.8663.1527l-.19-.1214-.6093-2.364L20.0887,2.75l-.5432.1408a23.4647,23.4647,0,0,0-4.37,1.6086L15.69,5.5363C16.02,5.3759,16.3672,5.2186,16.7237,5.0674ZM10.952,8.6654l.2371.0248.5149.66.9133-.7113-.5193-.6663.0326-.2348c.2857-.21.5724-.41.8524-.5954l.2322.0511L14.771,9.7219l.482-.2614a39.378,39.378,0,0,1,3.6012-1.7316l-.3788-1.0938c-.2848.1056-.6322.2516-1.0355.4351l-.2188-.0811-.3158-.6845-1.0514.4848.3262.7067-.0759.217c-.292.1468-.5606.2852-.7826.4012l-.2176-.06-1.28-2.0794-.3407-.5158-.4776.2945a23.4572,23.4572,0,0,0-3.7008,2.825l.7971.8393C10.3716,9.1666,10.657,8.914,10.952,8.6654ZM2.9774,26.7806l.1672-.17.8376.009.0127-1.1569-.845-.0094-.1635-.1719c.0142-.3546.0362-.7035.0653-1.0373l.1848-.15,2.9478.3594.0957-.54A38.8873,38.8873,0,0,1,7.1691,20.02l-1.0917-.3855c-.0949.2887-.1972.6511-.305,1.0806l-.2.12-.7323-.18L4.5642,21.78l.7565.1857.1223.1943c-.0669.32-.1261.6158-.1737.8618l-.1824.1326-2.4247-.2958-.6159-.0551-.0671.5569a23.4469,23.4469,0,0,0-.0959,4.6535l1.1535-.1C3.0079,27.5467,2.988,27.1663,2.9774,26.7806ZM6.4985,13.804l.2338-.0461.6868.4794.6628-.9488-.6927-.4832-.0381-.2343c.2106-.2835.4255-.56.6387-.82l.2371-.02,2.2325,1.9574.3834-.3919a39.0278,39.0278,0,0,1,2.93-2.7162l-.6845-.9335c-.2415.1853-.5306.4271-.8613.7208l-.2329-.013-.5037-.5608-.8617.7729.52.5795-.0084.2294c-.2357.2264-.4515.4377-.63.6142l-.2255.0068-1.8362-1.61-.4777-.3924-.3694.4221a23.4438,23.4438,0,0,0-2.703,3.79l1.0094.5671C6.0918,14.4542,6.29,14.1287,6.4985,13.804ZM3.759,20.0271l.21-.113.7978.2556.3534-1.102L4.3154,18.81,4.21,18.5975c.1178-.3337.2417-.6608.3684-.9721l.2208-.0886L7.51,18.7492l.2509-.4876A39.0991,39.0991,0,0,1,9.759,14.8028l-.93-.69c-.176.2482-.3807.5645-.61.9429l-.2264.0559-.6468-.3874-.5953.9926.668.4.06.2218c-.1583.2858-.3022.5511-.42.7722l-.2133.0731-2.23-.997-.5722-.2344-.2284.5125A23.4436,23.4436,0,0,0,2.35,20.8831l1.1317.2444C3.562,20.7689,3.6552,20.4,3.759,20.0271ZM23.3,3.3307l.1818.1539.053.8357,1.1556-.0731-.0535-.8429.1594-.1757c.3536-.0124.7033-.0165,1.04-.012L26,3.39l-.14,2.9645.5456.0558a38.7846,38.7846,0,0,1,3.9514.5976L30.66,5.8909c-.2953-.0733-.6646-.1484-1.1009-.224l-.1349-.19.125-.743-1.1419-.1919-.129.7675-.1849.1366c-.3241-.0431-.624-.08-.8729-.11l-.146-.1719L27.19,2.7258l.0094-.618-.5607-.0255a23.4872,23.4872,0,0,0-4.65.2492l.1852,1.1423C22.5376,3.4179,22.9157,3.37,23.3,3.3307Zm18.6176,6.8017-.6194.5639.78.8554.6247-.5687.2368.0146c.2311.2686.453.5391.6594.8035l-.0332.2354-2.4028,1.7444.2979.46a39.105,39.105,0,0,1,2.004,3.4558l1.062-.4614c-.1277-.2766-.3-.6118-.5136-.9986l.0643-.2242.6585-.367-.5641-1.0108-.68.3794-.2222-.0589c-.169-.28-.3276-.537-.46-.7494l.0431-.2215L44.8288,12.55l.4884-.379-.3306-.4533a23.4587,23.4587,0,0,0-3.102-3.4713l-.7762.8588c.2709.2486.5446.5135.816.7891ZM30.167,3.7985l-.1938.8145L31.1,4.8805l.1954-.8214.2038-.1214c.3419.0918.6775.19.9977.2925l.1054.2131L31.6008,7.2375l.5055.2125A38.4769,38.4769,0,0,1,35.71,9.1762l.617-.9792c-.26-.1562-.5916-.3359-.9871-.536L35.2669,7.44l.3369-.6739L34.568,6.2485,34.22,6.945l-.2169.0763c-.2971-.136-.5732-.2588-.8027-.36l-.0891-.2068.8237-2.2985.19-.588L33.5958,3.38a23.4681,23.4681,0,0,0-4.52-1.1206l-.1569,1.1465c.3642.053.74.1174,1.119.1923ZM48.1937,21.79l-.14.1931-.83.117.1617,1.1457.8367-.1178.1874.1454c.04.3536.07.7018.0916,1.0353l-.16.1759-2.9683.0876-.0134.548a39.0421,39.0421,0,0,1-.2932,3.9835l1.1374.2168c.05-.3.0971-.6735.139-1.1142l.1794-.1489.7511.0675.1037-1.1526-.7758-.07-.15-.174c.0181-.326.0322-.6277.0422-.8781l.16-.1588,2.4415-.0721.6172-.0379-.0177-.5607a23.403,23.403,0,0,0-.6054-4.6147l-1.1253.2722C48.048,21.0361,48.1249,21.4093,48.1937,21.79ZM45.88,15.5953l-.7582.3561.4927,1.0473.7648-.3591.2219.0835c.14.3227.2726.6463.393.9622l-.1011.2153-2.8106.9586.1489.5276a39.5285,39.5285,0,0,1,.895,3.8926l1.151-.1277c-.04-.3008-.106-.6716-.1961-1.1056l.1276-.1953.7375-.1568-.2408-1.1319-.762.1621-.1948-.122c-.0788-.3171-.1547-.61-.2187-.8516l.1064-.1987,2.3117-.7885.5784-.2183-.1822-.5307a23.4438,23.4438,0,0,0-1.94-4.2309l-.995.5918c.186.3181.37.652.5469.9944ZM36.52,6.08l-.4255.7214.9974.5877.4292-.7277.2306-.0559c.3007.1893.5927.3824.8672.5737l.0377.2348L36.8757,9.7886l.42.3522A38.7943,38.7943,0,0,1,40.23,12.8522l.8787-.7538c-.2029-.226-.4663-.4952-.7854-.8029l-.0047-.2332.5208-.5449-.8371-.7993-.5381.5627-.23.0092c-.2438-.2175-.4713-.4164-.6609-.58L38.55,9.4857l1.4652-1.9535.3547-.5059L39.92,6.69a23.4641,23.4641,0,0,0-3.9885-2.4027L35.4437,5.337c.3328.1579.6727.3305,1.0126.5134ZM4.2231,33.4643l.11-.2117.8031-.238-.3293-1.11-.81.24L3.79,32.0292c-.0911-.343-.1731-.6829-.2438-1.01l.1324-.1975,2.9228-.5254-.0676-.5441a38.8336,38.8336,0,0,1-.2994-3.9829L5.077,25.7227c-.0056.3043.0036.6807.0274,1.1224l-.1555.1739-.7528.0439.0678,1.1555.7775-.0457.1745.15c.03.3252.0612.6259.0881.8749l-.1352.1805-2.404.4321-.6046.1288.1.5517a23.4335,23.4335,0,0,0,1.2812,4.475L4.6142,34.53C4.4787,34.1881,4.3474,33.8307,4.2231,33.4643Zm42.4423,1.6839-.2242.0806L45.69,34.858l-.5124,1.0377.7577.3742.073.2257c-.166.3127-.3369.6178-.5081.9067l-.2315.0551-2.5017-1.6-.32.4451a39.0233,39.0233,0,0,1-2.4881,3.1257l.8173.82c.2111-.22.46-.502.7428-.8421l.2324-.0221.5823.479.7358-.8939-.6017-.4944-.0259-.2285c.1987-.2592.3805-.5006.53-.7016l.222-.0408L45.2512,38.82l.531.3161.3019-.473A23.4455,23.4455,0,0,0,48.186,34.51l-1.0834-.4089C46.9694,34.4451,46.8226,34.7965,46.6654,35.1482Zm-3.63,5.75-.2381.0112-.6083-.5757-.7958.84.6136.58.0031.2372c-.2516.2506-.5051.4918-.753.7167l-.2375-.0154-1.9186-2.2657-.4371.331a39.517,39.517,0,0,1-3.3,2.2534l.539,1.0243c.2663-.1477.5878-.3442.9585-.5858l.2284.0475.4152.629.9664-.6372-.4287-.65.0424-.2259c.2666-.1891.5113-.3664.7134-.5143l.224.0265,1.5781,1.8634.4143.4587.4279-.3631a23.4248,23.4248,0,0,0,3.2336-3.3491l-.9144-.71C43.5333,40.316,43.2894,40.6087,43.0357,40.898Zm-5.1645,4.4244-.2308-.0595-.4115-.7292-1.0086.5685.4152.7356-.0671.2274c-.3143.1654-.6276.3211-.9309.4629l-.2223-.0847L34.25,43.713l-.5154.1875a38.26,38.26,0,0,1-3.8178,1.1809l.2129,1.1374c.2973-.0623.6625-.1552,1.0886-.2772l.2042.1126.2113.7235,1.1114-.3239-.218-.7474.1072-.2033c.31-.102.5967-.1992.8334-.2813l.2063.0914.9581,2.2458.2606.5605.5159-.2209a23.4934,23.4934,0,0,0,4.0781-2.2471l-.6643-.9479C38.52,44.9121,38.2,45.12,37.8712,45.3224ZM8.1247,38.7849l-.642-.9631L6.78,38.29l-.232-.05c-.1875-.3-.3661-.6-.5309-.8935l.0681-.2278,2.638-1.3634-.2251-.5a38.5038,38.5038,0,0,1-1.4612-3.7178l-1.1194.2965c.0845.2922.2043.6494.3574,1.0645l-.0972.2119-.7061.2641.4055,1.0839.7295-.2726.2108.0917c.1247.3017.2431.58.3423.81L7.0833,35.3l-2.17,1.1216-.54.3011.2586.4978a23.428,23.428,0,0,0,2.5444,3.8981l.8965-.7322c-.23-.2862-.4612-.5893-.688-.9028l.0422-.2344ZM48.4373,28.5842l-.19.1434-.8272-.133-.1837,1.1428.8343.1339.1363.1941c-.066.3471-.1394.6889-.2179,1.0164l-.2049.1206-2.8622-.7911-.1745.52a39.5382,39.5382,0,0,1-1.4554,3.72l1.0228.5425c.1366-.2718.2915-.6152.4616-1.0235l.2153-.09.6976.2857.4394-1.0708L45.4079,33l-.0925-.2105c.1136-.3061.2158-.5906.3-.8269l.2-.104,2.3543.6505.6008.1454.1488-.5407a23.448,23.448,0,0,0,.783-4.588l-1.1555-.0714C48.52,27.8215,48.4838,28.2005,48.4373,28.5842ZM31.6308,48.028l-.2029-.1248L31.25,47.085l-1.1314.2462.18.825-.1312.1977c-.3474.0651-.6927.1216-1.0261.1679l-.1873-.1465-.3074-2.952-.5479.0271a39.5177,39.5177,0,0,1-3.9964.003l-.1322,1.15c.3033.0284.68.0472,1.122.056l.1621.1679-.0117.7536,1.1576.0179.0122-.7783.1624-.1627c.3267-.006.6288-.0146.8792-.023l.17.1482.2529,2.428.0838.6122.5581-.0589a23.4715,23.4715,0,0,0,4.56-.9453l-.3551-1.1014C32.3717,47.8272,32.005,47.9316,31.6308,48.028ZM12.154,44.0669l.5292-.6492-.8976-.731-.5338.6547-.2364.0208c-.27-.2336-.5293-.468-.7711-.6977l-.002-.2376,2.1184-2.08-.3626-.4111a38.94,38.94,0,0,1-2.493-3.1219l-.982.6134c.1668.2539.3867.56.6555.9115l-.03.2314-.5971.4605.7074.9163.6167-.4759.2284.0256c.2083.2516.4034.4826.5662.6729l-.01.2252L8.9176,42.1055l-.4269.4472.3939.3994a23.4428,23.4428,0,0,0,3.5813,2.9749l.6405-.964c-.304-.2055-.614-.4267-.9236-.66ZM24.87,48.7744l-.1571-.1793.0713-.8342L23.63,47.6626l-.0719.8415-.1837.15c-.352-.04-.6985-.088-1.03-.1418l-.1358-.1952.5772-2.9117-.5315-.1354a39.2932,39.2932,0,0,1-3.82-1.1749l-.4655,1.06c.2809.1158.635.2448,1.0556.384l.1053.208-.2335.7167,1.1009.3584.2413-.74.203-.1076c.3141.0906.6054.1713.8471.2372l.1189.1917-.4747,2.3947-.1007.61.5507.108a23.5018,23.5018,0,0,0,4.636.4405l-.0145-1.1571C25.6378,48.8014,25.257,48.7924,24.87,48.7744Zm-6.778-1.4971.3141-.7762-1.0732-.4341-.317.7831-.22.0893c-.324-.1422-.641-.29-.9423-.4391l-.0722-.2266,1.41-2.612-.4678-.2859a39.3317,39.3317,0,0,1-3.3031-2.2486l-.7575.8754c.2347.1941.535.4215.8955.6783l.0392.23-.4346.6158.9462.667.4489-.636.2257-.0431c.2734.1791.5278.3422.7395.4762l.0569.218-1.16,2.1483-.2761.5532.4944.2655a23.46,23.46,0,0,0,4.3,1.7873l.3277-1.11c-.3531-.1074-.7146-.2276-1.0774-.3584ZM13.014,19.4666a2.68,2.68,0,0,1-.7169-.1871q-.0652-.0316-.1349.0422a.2722.2722,0,0,0-.07.1951.176.176,0,0,0,.0465.1054q.0466.0581.14.1527a3.07,3.07,0,0,1,.2886.3323,2.5941,2.5941,0,0,1,.149.2318,1.9919,1.9919,0,0,0,.1909.2742.2454.2454,0,0,0,.1907.09,2.6914,2.6914,0,0,0,.3445-.0687q1.01-.2317,2.3251-.4163a23.3547,23.3547,0,0,1,3.1815-.1845,2.1354,2.1354,0,0,1,.7658.1212,3.4476,3.4476,0,0,1,.612.3111,1.3757,1.3757,0,0,0,.13.0791.226.226,0,0,0,.0931.0315.5135.5135,0,0,0,.2723-.1106,1.3576,1.3576,0,0,0,.2816-.2584.4276.4276,0,0,0,.121-.2372.9018.9018,0,0,0-.2862-.5455,3.3619,3.3619,0,0,0-.6539-.5613,1.1888,1.1888,0,0,0-.5494-.2426.6058.6058,0,0,0-.1792.0449q-.1233.0447-.2676.1081-.2562.11-.44.1765a1.6686,1.6686,0,0,1-.342.087q-.5773.0738-1.01.1212l-.014-.3584q-.0091-.2477-.0255-.7088t-.0209-.7935q.2139-.042.3794-.06a2.21,2.21,0,0,1,.7935.0527,1.8523,1.8523,0,0,1,.33.1238c.0187.0072.045.0177.0792.0317a.2328.2328,0,0,0,.0838.021.4262.4262,0,0,0,.1908-.0711.8916.8916,0,0,0,.2561-.2162.53.53,0,0,0,.1256-.3189q0-.0946-.2211-.3031a3.6207,3.6207,0,0,0-.4888-.3846.9017.9017,0,0,0-.3654-.1767.2881.2881,0,0,0-.1489.0447,2.3238,2.3238,0,0,0-.21.15q-.13.1-.2234.1633a.6171.6171,0,0,1-.2.09c-.0124.0035-.0535.0139-.1233.0315s-.1576.0351-.263.0527a2.9646,2.9646,0,0,1,.0511-.5006q.042-.2.1072-.4165a1.0325,1.0325,0,0,0,.0651-.2845.4.4,0,0,0-.114-.25,1.561,1.561,0,0,0-.3049-.2662c.0308,0,.0807-.0036.1489-.0106q.1956-.0105.2793-.0106a2.7257,2.7257,0,0,1,.5609.05,4.7213,4.7213,0,0,1,.4911.1343q.0233.0054.1443.0422a.7386.7386,0,0,0,.21.0369.4264.4264,0,0,0,.23-.14,1.6962,1.6962,0,0,0,.27-.3214.59.59,0,0,0,.1187-.2874q0-.1-.256-.3214a4.8531,4.8531,0,0,0-.5563-.4138,1.1374,1.1374,0,0,0-.3793-.1925.2924.2924,0,0,0-.1258.0424q-.0791.0422-.2141.1264-.2188.1317-.3677.2082a1.3223,1.3223,0,0,1-.3073.1132q-.6051.1268-1.3824.2426a10.0746,10.0746,0,0,1-1.4849.1159,1.6982,1.6982,0,0,1-.3863-.0685q-.028-.0051-.1723-.037a1.2231,1.2231,0,0,0-.256-.0315.113.113,0,0,0-.1094.0475.2811.2811,0,0,0-.0256.1318,1.2566,1.2566,0,0,0,.1886.3083,5.2932,5.2932,0,0,0,.3933.4928q.2046.2266.284.2266a.8543.8543,0,0,0,.1652-.0315q.1233-.0318.1792-.0422.712-.174,1.2662-.2689a1.134,1.134,0,0,1,.1955.7222q0,2.0031-.0094,3.6159-.4468.0528-.6982.0737l-.2281.0264q.0046-1.0541.0513-1.8394l.0092-.2954a.57.57,0,0,0-.128-.3029,1.2417,1.2417,0,0,0-.3281-.3163.734.734,0,0,0-.4144-.1345.6886.6886,0,0,0-.2746.0922,1.9624,1.9624,0,0,0-.3282.2083c-.0977.0772-.1466.1389-.1466.1845a.0591.0591,0,0,0,.0234.0527.5274.5274,0,0,0,.0883.0421.4006.4006,0,0,1,.2979.4533q.0139,1.1438.0326,1.9608-.3489.0267-.4375.0264A6.2667,6.2667,0,0,1,13.014,19.4666Zm8.9679.9409q-.1443.09-.1443.1687a.0835.0835,0,0,0,.0466.0711.225.225,0,0,0,.1209.0292.3191.3191,0,0,0,.0653-.0054,3.4908,3.4908,0,0,0,.8215-.2688,5.2582,5.2582,0,0,0,1.0544-.6641,6.764,6.764,0,0,0,1.15-1.1807q-.0188,1.1544-.0327,1.3125a.4169.4169,0,0,1-.107.2582.3383.3383,0,0,1-.228.0685q-.0515,0-.1815-.01a.3.3,0,0,0-.1747.0341.1144.1144,0,0,0-.0628.0975q0,.079.1117.1108a1.0019,1.0019,0,0,1,.3933.1951.8754.8754,0,0,1,.2141.2581,1.9774,1.9774,0,0,1,.1235.3111.8552.8552,0,0,0,.07.1817.0989.0989,0,0,0,.0884.0554q.1211,0,.3444-.25a2.7483,2.7483,0,0,0,.3957-.59,1.3673,1.3673,0,0,0,.1723-.6036,1.9309,1.9309,0,0,0-.0559-.3688q-.0652-.2849-.1048-.5747a5.4265,5.4265,0,0,1-.04-.7168l.0047-.1951a5.6243,5.6243,0,0,1,.4166.5589q.1933.295.4725.7536.27.448.44.701a2.0945,2.0945,0,0,0,.3469.4086.4415.4415,0,0,0,.3445.1344.4086.4086,0,0,0,.1768-.0605,1.5667,1.5667,0,0,0,.2-.1608,2.9409,2.9409,0,0,1,.305-.2426,1.8306,1.8306,0,0,1,.4-.1923,2.7621,2.7621,0,0,1,.6214-.1344.4144.4144,0,0,0,.1838-.0633c.045-.0317.0644-.065.0582-.1a.1392.1392,0,0,0-.07-.1106.6712.6712,0,0,0-.2746-.0579,5.1076,5.1076,0,0,1-.81-.2,6.0913,6.0913,0,0,1-1.22-.5587,4.6847,4.6847,0,0,1-1.21-1.0119,5.2221,5.2221,0,0,1,1.024.079,4.4158,4.4158,0,0,1,.6424.1791.299.299,0,0,0,.0931.0318.2027.2027,0,0,0,.0908-.0421.4161.4161,0,0,0,.1141-.1214.332.332,0,0,0,.0511-.1845.5957.5957,0,0,0-.1373-.3083,1.8555,1.8555,0,0,0-.3281-.3505.8424.8424,0,0,0-.34-.19l.1211-.0631a3.82,3.82,0,0,1,.3724-.1925.5664.5664,0,0,1,.27-.0605,1.0486,1.0486,0,0,1,.1932.0342q.0815.0237.1932.0659a.6183.6183,0,0,0,.2.0633.294.294,0,0,0,.1886-.0923,1.0479,1.0479,0,0,0,.2-.232.4427.4427,0,0,0,.0862-.2186.8016.8016,0,0,0-.1862-.4667,2.0188,2.0188,0,0,0-.4375-.4321.94.94,0,0,0-.405-.1977.2179.2179,0,0,0-.1025.0184c-.04.016-.0837.0344-.13.0555a2.7279,2.7279,0,0,1-.4562.1713,2.3316,2.3316,0,0,1-.5818.0711q-.1443,0-.4143.0106l-.2048.0052a.9737.9737,0,0,0,.34-.2318,3.1783,3.1783,0,0,0,.3677-.638l.1721.0054q.1259,0,.1676.0052a1.2075,1.2075,0,0,1,.1908.0318q.1117.0263.2514.0736c.0932.0318.152.0509.1769.0581q.1209.0423.2282.0763a.58.58,0,0,0,.1582.0344.4819.4819,0,0,0,.263-.1,1.0937,1.0937,0,0,0,.249-.2318.3943.3943,0,0,0,.1023-.2214q0-.09-.1907-.2478a3.1442,3.1442,0,0,0-.4213-.2924.9071.9071,0,0,0-.291-.1345,1.2479,1.2479,0,0,0-.2932.079,2.5528,2.5528,0,0,1-.3817.1108l-.0326.0052a1.8213,1.8213,0,0,0,.14-.4163q0-.09-.1536-.24a1.9659,1.9659,0,0,0-.3585-.274.9067.9067,0,0,0-.3443-.14.2611.2611,0,0,0-.163.0421.2855.2855,0,0,0-.13.1741.2113.2113,0,0,0,.0418.1053,1.0927,1.0927,0,0,1,.0791.1661.42.42,0,0,1,.0187.1819,3.4988,3.4988,0,0,1-.1351.5165l-.6423.0633a.0515.0515,0,0,0-.0512.058.36.36,0,0,0,.0721.1739,1.1764,1.1764,0,0,0,.1677.203.3582.3582,0,0,0,.1513.1027.5406.5406,0,0,0,.1024.0106q-.0932.2952-.2049.585a.5734.5734,0,0,0-.0418.2.1862.1862,0,0,0,.0372.1266q-.9124.0631-1.8945.216a1.4166,1.4166,0,0,0,.2747-.3268,1.1338,1.1338,0,0,0,.1582-.3058.5263.5263,0,0,0-.0186-.1765c-.0187-.086-.0295-.1377-.0326-.1555q.0047.0159-.0372-.1582.1767-.0263.3141-.0341c.0914-.0054.1466-.008.1653-.008a1.4476,1.4476,0,0,0,.4469-.0711.21.21,0,0,0,.1582-.203.5586.5586,0,0,0-.1094-.2846,1.4094,1.4094,0,0,0-.2537-.2951.4086.4086,0,0,0-.2373-.1266.0888.0888,0,0,0-.0513.0158,3.0743,3.0743,0,0,1-.5492.2741.96.96,0,0,1-.0047-.1106c0-.0387.0031-.0966.0093-.1741q.0092-.0791-.135-.15a1.6015,1.6015,0,0,0-.3305-.116,1.331,1.331,0,0,0-.2607-.0447.3768.3768,0,0,0-.1628.0553.7921.7921,0,0,0-.1862.14.3182.3182,0,0,0-.0977.1685.092.092,0,0,0,.0255.0871.5981.5981,0,0,0,.1186.0816.5109.5109,0,0,1,.1584.1212.763.763,0,0,1,.0652.2267q-.27.095-.4143.1372a2.7545,2.7545,0,0,1-.7821.1739.383.383,0,0,1-.0744-.0052.2446.2446,0,0,0-.149.0209.0987.0987,0,0,0-.0558.09.2.2,0,0,0,.093.1476,3.2072,3.2072,0,0,0,.4027.2687.66.66,0,0,0,.3049.0949.5919.5919,0,0,0,.1746-.0422q.1186-.0419.2583-.1.135-.058.3537-.1424a6.4652,6.4652,0,0,0,.177.8856.2156.2156,0,0,0,.0466.0791c-.0808.0139-.1583.0281-.2328.0421s-.1459.0264-.2141.0369l-.1955.037a1.7848,1.7848,0,0,0-.1164-.3243,1.3084,1.3084,0,0,0-.135-.2292q-.0652-.0841-.0932-.09a.1287.1287,0,0,0-.0419-.0052.1039.1039,0,0,0-.0907.0422.2111.2111,0,0,0-.0349.1106q-.0046.0422-.0116.1635t-.035.3688a.9073.9073,0,0,1-.1326.4139,1.9691,1.9691,0,0,1-.291.3293,1.86,1.86,0,0,0-.228.2636.48.48,0,0,0-.0745.2741.75.75,0,0,0,.135.4375.54.54,0,0,0,.3026.2372.1631.1631,0,0,0,.0511.0052.5012.5012,0,0,0,.2468-.0737.4186.4186,0,0,0,.0464.1081q.0373.0658.0932.15a2.0558,2.0558,0,0,0,.17.2346.195.195,0,0,0,.1466.0765,3.3667,3.3667,0,0,0,.3957-.09q.2279-.0633.6191-.1582a9.839,9.839,0,0,1-.9682,1.2308A5.9987,5.9987,0,0,1,21.9819,20.4075Zm5.1994-4.3907.1583.0052a1.32,1.32,0,0,0,.14.0054.8987.8987,0,0,1,.2514.0342.1222.1222,0,0,1,.0838.1292.2573.2573,0,0,1-.0583.14q-.0582.0814-.1745.2187a2.6184,2.6184,0,0,0-.1792.2214.2805.2805,0,0,0-.0628.1476.1114.1114,0,0,0,.0186.0527c-.0155.0106-.0581.0359-.128.0765a.6859.6859,0,0,1-.2117.0816q-.3539.0792-.9264.1528a2.996,2.996,0,0,1,.0931-.4057.7924.7924,0,0,1,.021-.0817.356.356,0,0,0,.0163-.0977.4885.4885,0,0,0-.149-.2819,2.1561,2.1561,0,0,0-.34-.3243Q26.5762,16.0168,27.1813,16.0168Zm-3.3934,1.4549a2.9984,2.9984,0,0,1-.605-.0633,1.9718,1.9718,0,0,0,.27-.9331l.0047-.0527q.67-.1474,1.4616-.2476V16.18a.2121.2121,0,0,0,.0163.1c.014.0352.03.0719.0489.1106a2.062,2.062,0,0,1,.0814.2.7685.7685,0,0,1,.035.2161q.0092.2426.0092.5852Q24.2394,17.4716,23.7879,17.4717Zm7.8,2.227a5.8573,5.8573,0,0,1-.8284,1.5311.1964.1964,0,0,0-.042.116.0861.0861,0,0,0,.0186.0553.057.057,0,0,0,.0466.0238.1591.1591,0,0,0,.0883-.0316,5.6217,5.6217,0,0,0,1.39-1.439,6.219,6.219,0,0,0,.91-2.235,6.8429,6.8429,0,0,0,.6-.369q-.0048,1.4074-.06,2.546l-.0094.2688a1.5177,1.5177,0,0,0,.0792.4982,1.1242,1.1242,0,0,0,.1931.3636q.114.1345.1979.1344.0791,0,.1978-.1633a1.8427,1.8427,0,0,0,.2095-.3848,1.0422,1.0422,0,0,0,.0908-.3848q0-.2794-.0327-.8856-.0372-.8224-.0372-1.2176a7.6159,7.6159,0,0,1,.0512-.9594,1.8832,1.8832,0,0,0,.014-.1949.4487.4487,0,0,0-.014-.116.4009.4009,0,0,0-.0558-.116,5.41,5.41,0,0,0,.6377-.5957.7776.7776,0,0,0,.2421-.4269.5284.5284,0,0,0-.1026-.3163,2.6365,2.6365,0,0,0-.3118-.3426q-.1116-.1054-.1676-.1633.68-.0736,1.5362-.09a.5012.5012,0,0,0-.1141.1186.1169.1169,0,0,0-.021.108.4367.4367,0,0,0,.0792.09.8636.8636,0,0,1,.1513.232,1.1815,1.1815,0,0,1,.0861.4639l.0232.585q-.3537.0264-.6935.0264a2.2257,2.2257,0,0,1-.3631-.0264q-.1582-.0262-.377-.0844a.0842.0842,0,0,0-.0862.04.23.23,0,0,0-.04.145.1825.1825,0,0,0,.0256.0922q.0255.045.0954.145c.0155.0211.0325.0449.0512.0711l.0652.0924a1.5272,1.5272,0,0,0,.249.2766.384.384,0,0,0,.23.1134.5349.5349,0,0,0,.14-.0316,3.5805,3.5805,0,0,1,.7309-.1423q.0419,1.0329.0417,1.7341a2.9359,2.9359,0,0,1-.0651.8962.276.276,0,0,1-.2235.0789,2.4286,2.4286,0,0,1-.3537-.0474c-.0249-.0034-.0645-.0106-.1187-.0211a.727.727,0,0,0-.1279-.0158c-.0684,0-.1025.023-.1025.0685a.15.15,0,0,0,.03.0818.1906.1906,0,0,0,.0723.0657,1.2547,1.2547,0,0,1,.4282.377,3.4011,3.4011,0,0,1,.2932.5507q.0837.19.1373.29a.5212.5212,0,0,0,.1373.1661.3214.3214,0,0,0,.2049.0659.5387.5387,0,0,0,.37-.2452,2.2137,2.2137,0,0,0,.3422-.5954,1.75,1.75,0,0,0,.14-.6406q0-.2795-.1349-2.33-.0094-.137-.0327-.4848a1.0712,1.0712,0,0,1,.121.0052,1.9652,1.9652,0,0,1,.526.0684q.2466.0687.5586.1845a.9245.9245,0,0,0,.2.0685.3331.3331,0,0,0,.1676-.0607.6821.6821,0,0,0,.1676-.1447.2519.2519,0,0,0,.07-.153.9074.9074,0,0,0-.1886-.4612,2.9321,2.9321,0,0,0-.4258-.506q-.2375-.2241-.3491-.224a.3316.3316,0,0,0-.1187.0263c-.045.0178-.0924.0387-.142.0633a3.4437,3.4437,0,0,1-.6377.253l-.0093-.2951a3.564,3.564,0,0,1,.0326-.4323,1.5407,1.5407,0,0,0,.0232-.2424q0-.0841-.16-.2109a2.2823,2.2823,0,0,0-.3794-.2372,2.5777,2.5777,0,0,1,.47.0948,4.3615,4.3615,0,0,1,.419.1582.681.681,0,0,0,.2.0685.3543.3543,0,0,0,.2047-.09.9356.9356,0,0,0,.2-.2106.3816.3816,0,0,0,.0838-.1951.4964.4964,0,0,0-.142-.2714,3.0435,3.0435,0,0,0-.3561-.3558l-.1629-.1478a3.756,3.756,0,0,0-.2839-.25.3283.3283,0,0,0-.1863-.0816.5083.5083,0,0,0-.1373.0317q-.0955.0315-.2071.0791-.242.0947-.4189.1555a3.6924,3.6924,0,0,1-.391.1081l-.3957.079a1.6991,1.6991,0,0,0,.1955-.5377.5445.5445,0,0,0,.0094-.0685.18.18,0,0,0-.0629-.15.9026.9026,0,0,0-.1978-.1083.7331.7331,0,0,1-.1676-.0736q-.0885-.0582-.2839-.2163a1.8051,1.8051,0,0,0-.17-.137.2021.2021,0,0,0-.1047-.0421.5211.5211,0,0,0-.1582.0685,2.2585,2.2585,0,0,0-.2328.145q-.1071.0764-.1071.108c0,.014.0271.04.0816.0791a.5994.5994,0,0,1,.1511.1661.6287.6287,0,0,1,.07.3346,3.8132,3.8132,0,0,1-.0372.5851q-.554.079-1.0288.1318t-.6329.0527l-.326.0052q-.2232.0108-.335.0106a2.3453,2.3453,0,0,1-.5167-.0474.159.159,0,0,0-.1.0158.2992.2992,0,0,0-.1094.0791.1667.1667,0,0,0-.0186.2081c.0186.03.0512.0746.0978.1345q.093.1159.149.1949a3.6694,3.6694,0,0,0,.2466.3111,2.5337,2.5337,0,0,0-.3211.1608q-.135.0817-.135.1291a.0852.0852,0,0,0,.0209.0528.4217.4217,0,0,0,.0675.0631.7443.7443,0,0,1,.135.1529.3735.3735,0,0,1,.0465.2,10.9294,10.9294,0,0,1-.6889,3.703Zm2.7045-4.7256a.7245.7245,0,0,1,.0186.1528,1.841,1.841,0,0,1-.2281.7512,6.0281,6.0281,0,0,1-.7866,1.1359,10.4951,10.4951,0,0,0,.0792-1.3124.4492.4492,0,0,0-.0932-.2189,1.3134,1.3134,0,0,0-.2094-.245A8.7093,8.7093,0,0,1,34.292,14.9731Zm1.7618,3.7028a1.6442,1.6442,0,0,0,.2026-.3318.7624.7624,0,0,0,.0837-.3031.2081.2081,0,0,0-.0047-.0528.482.482,0,0,0-.17-.2609A1.0618,1.0618,0,0,0,35.81,17.53a1.3642,1.3642,0,0,0-.4469-.0739,1.2769,1.2769,0,0,0-.391.0581q-.1257.0369-.1257.1054,0,.0582.1118.1264a.783.783,0,0,1,.2465.253,3.4411,3.4411,0,0,1,.21.4112,1.9848,1.9848,0,0,0,.1722.3454.2241.2241,0,0,0,.191.108.2156.2156,0,0,0,.0743-.0106A.5.5,0,0,0,36.0538,18.6759Z"/></svg>
      </div>
    </div>
    <div class="certificate">
      <p sup-bind-html="site_meta.copyright"></p>
      <p sup-bind-html="site_meta.license"></p>
    </div>
  </div>
</footer>

