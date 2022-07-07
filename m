Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48D569AC7
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 08:54:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5E03C0D2BF;
	Thu,  7 Jul 2022 06:54:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0645DC5F1ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 06:54:31 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675XdFv029339;
 Thu, 7 Jul 2022 08:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x7/uV8yUqjp8o6a1rKF3XAaszkmsTYMrmj5c95pf9Vo=;
 b=KsMPWTiN5A8zihxW78ZeTwO2A3UyTuVh+1gcjyosG1e+u4uz2DxWIl3JYqmUqOscR7Es
 ws9Ri1AixwdbxFEjSFBmVPP6s5ADwyGxDeuUDit48A30GW3662lhVbALBT3sxOs0a+A5
 I01ZaQ6F6zFCIMOzLPM6+qVTzsghHebwdKSJQ0B4TeG7fkHBeXvJODNbk5KTpxysKqF+
 GHuiyeUvLFhM4zDObrlGtGzZN+U8rXDK7iWBYgHumHUsIjlEcnTPbsBQce6PV8Faggqw
 h8XjFUoS94vdYepADME4UCzAgqK6iV1GLbPt9KQ03V9rjzMWvMGuM+IlJ6ZW8BacpVoj xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ubfapjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 08:54:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E0BC10002A;
 Thu,  7 Jul 2022 08:54:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01E3120FA2A;
 Thu,  7 Jul 2022 08:54:23 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 08:54:22 +0200
Message-ID: <2dc4b5fb-f9bd-8b80-f411-cb7139e6af93@foss.st.com>
Date: Thu, 7 Jul 2022 08:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] mmc: stm32_sdmmc2: cosmetic:
 rename stm32_sdmmc_bind
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

On 6/30/22 10:01, Patrick Delaunay wrote:
> Rename stm32_sdmmc_bind to stm32_sdmmc2_bind as all other functions
> in SDMMCv2 driver
> 
> series-changes: 2
> - fix typo in commit message (/oter function/other functions/)
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/mmc/stm32_sdmmc2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 81b07609a91..e3853b7fbfb 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -763,7 +763,7 @@ clk_free:
>  	return ret;
>  }
>  
> -static int stm32_sdmmc_bind(struct udevice *dev)
> +static int stm32_sdmmc2_bind(struct udevice *dev)
>  {
>  	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  
> @@ -781,7 +781,7 @@ U_BOOT_DRIVER(stm32_sdmmc2) = {
>  	.of_match = stm32_sdmmc2_ids,
>  	.ops = &stm32_sdmmc2_ops,
>  	.probe = stm32_sdmmc2_probe,
> -	.bind = stm32_sdmmc_bind,
> +	.bind = stm32_sdmmc2_bind,
>  	.priv_auto	= sizeof(struct stm32_sdmmc2_priv),
>  	.plat_auto	= sizeof(struct stm32_sdmmc2_plat),
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
