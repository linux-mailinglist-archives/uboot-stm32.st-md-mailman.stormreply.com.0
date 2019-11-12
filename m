Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0236AF8CA3
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:19:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9980C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:19:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD911C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:17:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACAH02N099359;
 Tue, 12 Nov 2019 04:17:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573553820;
 bh=WQT9UZsWdqGZyL7eQRaDsvfaCPrQ7XHFgWQfesuvI0c=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MA1Rf3AW6fpzkpCj2DSzHtHhzcXARuzzL4KaRitE4WGl2CgDMw8TFHfLd+Hl5kpz2
 yxi1iatPZV/767lCHy4a9cAEDRnfy/q/9O6YW2krB2C3/qPMNTD6M7JEvkBEhEdNG4
 3bRfWXqu65fLH5+1ZYUgaRkZX0O3WqoAR2iUC6zc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACAH0cb058844;
 Tue, 12 Nov 2019 04:17:00 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 12
 Nov 2019 04:16:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 12 Nov 2019 04:16:42 -0600
Received: from [10.250.100.20] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACAGvcl066530;
 Tue, 12 Nov 2019 04:16:58 -0600
To: Patrick Delaunay <patrick.delaunay@st.com>, <u-boot@lists.denx.de>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
 <20191112094214.12686-2-patrick.delaunay@st.com>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <19c5071a-ab8a-7c68-a7fe-bda25391b531@ti.com>
Date: Tue, 12 Nov 2019 11:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112094214.12686-2-patrick.delaunay@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 12 Nov 2019 10:18:59 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 ley.foon.tan@intel.com, b.galvani@gmail.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/5] dm: clk: add stub for
 clk_disable_bulk when CONFIG_CLK is desactivated
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick,

On 12/11/2019 10:42, Patrick Delaunay wrote:
> Add stub for clk_disable_bulk() when CONFIG_CLK is desactivated.
>
> That avoid compilation issue (undefined reference to
> `clk_disable_bulk') for code:
>
> clk_disable_bulk(&priv->clks);
> clk_release_bulk(&priv->clks);
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3:
> - Add stub for clk_disable_bulk
>
> Changes in v2: None
>
>   include/clk.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/clk.h b/include/clk.h
> index a5ee53d94a..6f0b0fe4bc 100644
> --- a/include/clk.h
> +++ b/include/clk.h
> @@ -379,7 +379,11 @@ int clk_disable(struct clk *clk);
>    *		by clk_get_bulk().
>    * @return zero on success, or -ve error code.
>    */
> + #if CONFIG_IS_ENABLED(CLK)
>   int clk_disable_bulk(struct clk_bulk *bulk);
> +#else
> +inline int clk_disable_bulk(struct clk_bulk *bulk) { return 0; }
> +#endif

Maybe this could be done for all clk operations ?

JJ

>   
>   /**
>    * clk_is_match - check if two clk's point to the same hardware clock
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
