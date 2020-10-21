Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97181294CB3
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:35:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 645FEC3FAE0;
	Wed, 21 Oct 2020 12:35:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33F35C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:35:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCRoP6004669
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 21 Oct 2020 14:35:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=68q0wSXIIAyTFGXN86nOrHg5zTTinhZ4zFWj58frAwo=;
 b=Yp7cPxXd81Vnd5qB4o5nuhWfk4Fe3priSPe9lztuwA3//BgSh9cam2Lxqz25r0r5fU10
 24s9TvmHu1bWiu1crVbjkdL4jGtUoSP80he9si5voAlsW0ccjjsJkAchFH077kQsMnq1
 t3sW5l1pFSylXq62YIPSRPzQ89GQo7CUoTbgoPD0z/tKAiXKdRDu5kfBErltEoX9qcXG
 JbByAOKRHf4T8088CSK7e7BxUmZxItVW4yyrLkjz+/9oH700ihJQ3T/iii9UzbTZxbIM
 zfPsM8Xr72XVlTpvRbDgJeFLEDhTS7qnwMtJjBfQa3V8RDmROlr34QbWZZKf5dv/W287 mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggak9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 21 Oct 2020 14:35:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5125E10002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 14:35:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47CEF2E9C91
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 14:35:14 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:35:13 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:35:13 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [Uboot-stm32] [PATCH 30/33] video: stm32_dsi: migrate trace to
 dev and log macro
Thread-Index: AQHWp6af/tGZGnaDmUSDAW9rwgfkyQ==
Date: Wed, 21 Oct 2020 12:35:13 +0000
Message-ID: <c3480843-a5d3-c2b1-d7ce-d4bed37d5636@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-31-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-31-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <137DD0F638AE5648B87E0CDC3120F259@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 30/33] video: stm32_dsi: migrate trace to
 dev and log macro
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

Hi Patrick

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/video/stm32/stm32_dsi.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
> index 9d5abacc2b..dcec0edafc 100644
> --- a/drivers/video/stm32/stm32_dsi.c
> +++ b/drivers/video/stm32/stm32_dsi.c
> @@ -8,6 +8,8 @@
>   * drivers/gpu/drm/stm/dw_mipi_dsi-stm.c.
>   */
>  
> +#define LOG_CATEGORY UCLASS_VIDEO_BRIDGE
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -133,7 +135,7 @@ static enum dsi_color dsi_color_from_mipi(u32 fmt)
>  	case MIPI_DSI_FMT_RGB565:
>  		return DSI_RGB565_CONF1;
>  	default:
> -		pr_err("MIPI color invalid, so we use rgb888\n");
> +		log_err("MIPI color invalid, so we use rgb888\n");
>  	}
>  	return DSI_RGB888;
>  }
> @@ -213,14 +215,14 @@ static int dsi_phy_init(void *priv_data)
>  	u32 val;
>  	int ret;
>  
> -	debug("Initialize DSI physical layer\n");
> +	dev_dbg(dev, "Initialize DSI physical layer\n");
>  
>  	/* Enable the regulator */
>  	dsi_set(dsi, DSI_WRPCR, WRPCR_REGEN | WRPCR_BGREN);
>  	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
>  				 TIMEOUT_US);
>  	if (ret) {
> -		debug("!TIMEOUT! waiting REGU\n");
> +		dev_dbg(dev, "!TIMEOUT! waiting REGU\n");
>  		return ret;
>  	}
>  
> @@ -229,7 +231,7 @@ static int dsi_phy_init(void *priv_data)
>  	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
>  				 TIMEOUT_US);
>  	if (ret) {
> -		debug("!TIMEOUT! waiting PLL\n");
> +		dev_dbg(dev, "!TIMEOUT! waiting PLL\n");
>  		return ret;
>  	}
>  
> @@ -242,8 +244,8 @@ static void dsi_phy_post_set_mode(void *priv_data, unsigned long mode_flags)
>  	struct udevice *dev = device->dev;
>  	struct stm32_dsi_priv *dsi = dev_get_priv(dev);
>  
> -	debug("Set mode %p enable %ld\n", dsi,
> -	      mode_flags & MIPI_DSI_MODE_VIDEO);
> +	dev_dbg(dev, "Set mode %p enable %ld\n", dsi,
> +		mode_flags & MIPI_DSI_MODE_VIDEO);
>  
>  	if (!dsi)
>  		return;
> @@ -325,8 +327,8 @@ static int dsi_get_lane_mbps(void *priv_data, struct display_timing *timings,
>  
>  	*lane_mbps = pll_out_khz / 1000;
>  
> -	debug("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
> -	      pll_in_khz, pll_out_khz, *lane_mbps);
> +	dev_dbg(dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
> +		pll_in_khz, pll_out_khz, *lane_mbps);
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
