Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AF529553
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 May 2022 01:34:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED6D2C03FC9;
	Mon, 16 May 2022 23:34:45 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70DE4C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 23:34:44 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220516233441epoutp03f0e00bbd5e17b377207e5b284c564a58~vufxADFso2587125871epoutp03l
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 23:34:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220516233441epoutp03f0e00bbd5e17b377207e5b284c564a58~vufxADFso2587125871epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652744081;
 bh=HM/agacXBAb/dfTaZemd9SrxsENW+uihqXM4k9uQVqw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=XJNh1TmG6BG/FCtyGjy1AGOtE65lA7Oj9MZw7FrsZg7eOUIQWSm6+2RxMWBQMncKb
 Gc9dmAXwHYGWsdUPlSPW/bzJvf3IKU543+836vwKcJd28p6/20YyMXEJW1atacMUiJ
 zusmFnqCRMo2mL81BOgXJTBCSCs59rN91d0eNXFA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220516233440epcas1p102852bb3f8b4bc639a7fde473294ca7b~vufwkXUcg2617426174epcas1p1B;
 Mon, 16 May 2022 23:34:40 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.145]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4L2Fvz4cl6z4x9QN; Mon, 16 May
 2022 23:34:39 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.3F.09935.F8FD2826; Tue, 17 May 2022 08:34:39 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220516233439epcas1p140feb5b0bdcfe619aad1ca804e95e26a~vufvLAk1K2626726267epcas1p10;
 Mon, 16 May 2022 23:34:39 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220516233439epsmtrp279722e28da465f3a45e82e144033ac2e~vufvKI5l52190321903epsmtrp23;
 Mon, 16 May 2022 23:34:39 +0000 (GMT)
X-AuditID: b6c32a39-f4dff700000026cf-72-6282df8ff54f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 51.05.08924.F8FD2826; Tue, 17 May 2022 08:34:39 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220516233438epsmtip1d61b1b4336995c23a70ed545ed9e6c54~vufuu42So2745027450epsmtip1W;
 Mon, 16 May 2022 23:34:38 +0000 (GMT)
Message-ID: <da392094-f28c-2c49-cbbe-5614f7776e1f@samsung.com>
Date: Tue, 17 May 2022 08:34:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
In-Reply-To: <20220506160540.13.I39b69e8dc7b43b8e265e77388fb53f7c1fa2a007@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmvm7//aYkg3nnVC1+nnzPbjFp/TV2
 ix+rvrBavN3byW6xcOtyFosXf/8wOrB5PO3fyu5x9s4ORo+N73YweRzcZxjAEpVtk5GamJJa
 pJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQO0XEmhLDGnFCgUkFhc
 rKRvZ1OUX1qSqpCRX1xiq5RakJJTYFqgV5yYW1yal66Xl1piZWhgYGQKVJiQnTG1czJbQT9f
 xe7l55kbGHdxdzFyckgImEhc/dfB1sXIxSEksINRYuqXVewQzidGieunW5khnM+MEn3vD7LD
 tNz/OgkqsQuoauFkJgjnPaNE45yJYFW8AnYSF14sA7NZBFQlvs54zQQRF5Q4OfMJC4gtKhAh
 MW3WGTYQW1jAS2L34TlgNrOAuMStJ/PB6kUEPCVuPtvNCLKAWWApo8Sln6tYQRJsAjoS278d
 ByviFAiWmHtzClSzvMT2t3PAzpMQaOWQuHLuBNTdLhLzZp5khbCFJV4d3wIVl5L4/G4vG0RD
 M6PE0iUHWSGcHkaJfw3X2SCqjCX2LwV5lANohabE+l36EGFFiZ2/5zJCbOaTePe1hxWkREKA
 V6KjTQiiREXi0uuXTDC77j75D3WDh8SsGX+ZJzAqzkIKmFlIATALyT+zEBYvYGRZxSiWWlCc
 m55abFhgCo/w5PzcTYzgtKlluYNx+tsPeocYmTgYDzFKcDArifAaVDQkCfGmJFZWpRblxxeV
 5qQWH2I0BUbPRGYp0eR8YOLOK4k3NLE0MDEzMjaxMDQzVBLnXTXtdKKQQHpiSWp2ampBahFM
 HxMHp1QD0wSj7JkTXAPyD0x1ylmpf2714heVJp2T90S++2A80Zq3fkPbx3VvY5+93W1a5fp7
 moPrqVvMCxfc/XxGlkHDRC6Ks8njKt/ue5Nu/f60zdT79VQRkb9f5FLlGLRX8ERG1pfeXDF/
 33dX24xTNc9kv9778vD2kUJ1b81cS/vM7cIuEQ/0rXi/dngHsm7/cI69byqnFItwlZ7YM3dz
 twcBy89pdPe/mZt4RoVzngL3nieNp9X36231zP1yl2mB2B2OBTzsDt86tXRebExpmMXM8jR+
 Xc39TS6NTPmMwalfr33d6jDp//4N1muWP5PpiDjSFm0/W59P4Z7yKiETk1amxcwPT5rbt8R3
 79hx7+/Ba0osxRmJhlrMRcWJAO1QH1UkBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnG7//aYkg8mP+Sx+nnzPbjFp/TV2
 ix+rvrBavN3byW6xcOtyFosXf/8wOrB5PO3fyu5x9s4ORo+N73YweRzcZxjAEsVlk5Kak1mW
 WqRvl8CVMbVzMltBP1/F7uXnmRsYd3F3MXJySAiYSNz/Oom5i5GLQ0hgB6PEp6Y/rBAJKYnP
 T6eydTFyANnCEocPF4OEhQTeMkrc+80OYvMK2ElceLEMzGYRUJX4OuM1E0RcUOLkzCcsILao
 QITEg91nwUYKC3hJ7D48hw3EZhYQl7j1ZD5YvYiAp8TNZ7sZQW5gFljKKLF2ZhMbxLL7jBLP
 z4eC2GwCOhLbvx0Ha+AUCJaYe3MK2G3MAuoS6+cJQcyUl9j+dg7zBEahWUjOmIVk3SyEjllI
 OhYwsqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiODi2tHYx7Vn3QO8TIxMF4iFGC
 g1lJhNegoiFJiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6p
 BiaBr//2LM66m6pXvWW7zHqm02dc8udf3fRzEefOdSfWfDg7a3/WlkapU0EfbBrs3/9vudy+
 Zm9/SsPUaUe/OexdvGWJyoU9U0UYMhdFl757lGrYlub1svB84OEZh3lddh9p+bTcTvWkRdMt
 3tp9Wycoxlke4+PYfuoT8zvxM9cn6a+26DrTwhTC9z5H9OGRNUXmbNbait2nJh813aX/1udH
 v8n0tUfyN2a5uHU410/giT84Sz2d6WVasNvMbwvEJtuXFBnfO92ouuXL7VvmIteWv9z+xPrL
 N4ufKzXP3b57TnK2f9LjbwYM4XK23TnrOoIYGtrSd/m9vrlYfPcSxz8aGz5J7L65947yjXr2
 46rb65RYijMSDbWYi4oTAU6zyKX9AgAA
X-CMS-MailID: 20220516233439epcas1p140feb5b0bdcfe619aad1ca804e95e26a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220506140845epcas1p268d40c3e1b5f2ca4873a492795c85f3a
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <CGME20220506140845epcas1p268d40c3e1b5f2ca4873a492795c85f3a@epcas1p2.samsung.com>
 <20220506160540.13.I39b69e8dc7b43b8e265e77388fb53f7c1fa2a007@changeid>
Cc: uboot-stm32@st-md-mailman.stormreply.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 13/16] mmc: stm32_sdmmc2: make reset
	property optional
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 5/6/22 23:06, Patrick Delaunay wrote:
> Although not recommended, the reset property could be made optional.
> This way the driver will probe even if no reset property is provided
> in an sdmmc node in DT. This reset is already optional in Linux.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 44bfc911af..81b07609a9 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -514,10 +514,12 @@ retry_cmd:
>   */
>  static void stm32_sdmmc2_reset(struct stm32_sdmmc2_priv *priv)
>  {
> -	/* Reset */
> -	reset_assert(&priv->reset_ctl);
> -	udelay(2);
> -	reset_deassert(&priv->reset_ctl);
> +	if (reset_valid(&priv->reset_ctl)) {
> +		/* Reset */
> +		reset_assert(&priv->reset_ctl);
> +		udelay(2);
> +		reset_deassert(&priv->reset_ctl);
> +	}
>  
>  	/* init the needed SDMMC register after reset */
>  	writel(priv->pwr_reg_msk, priv->base + SDMMC_POWER);
> @@ -735,7 +737,7 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  
>  	ret = reset_get_by_index(dev, 0, &priv->reset_ctl);
>  	if (ret)
> -		goto clk_disable;
> +		dev_dbg(dev, "No reset provided\n");
>  
>  	gpio_request_by_name(dev, "cd-gpios", 0, &priv->cd_gpio,
>  			     GPIOD_IS_IN);
> @@ -755,8 +757,6 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  	stm32_sdmmc2_reset(priv);
>  	return 0;
>  
> -clk_disable:
> -	clk_disable(&priv->clk);
>  clk_free:
>  	clk_free(&priv->clk);
>  

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
