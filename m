Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED006280FED
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:33:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7D53C424B1;
	Fri,  2 Oct 2020 09:33:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FD9C424B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:33:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929LcHa020474; Fri, 2 Oct 2020 11:33:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YVqsUAYo9yB0KOaTIVsJYNFJyz4UsOtin94+qCI/FVc=;
 b=vIhBFRTYvqvd3dLTNE/NQrK0m8TPJacMNLw9iZTdo58kpbeRZYLuSCoxnvCBzgAFdz2/
 ffVKa5tF27fXjXpOjz4O+FsuDsuC5SSOOOULlCNW6DIq0qfIZYFVbu9nhPclEflU7GXr
 Yy0zvzD79UAWe3xlvhAKRlLW8rzYZAKSZ9SmhpNgJijLSnBO65Zpu8SZi5BGs5ANNC0v
 IWB6EEPlbxSaPLhGd9UEb5iu1vtkCFv6AohlQfUc2uGzdV6yvXT1fOrxLF3ODRE7yRA+
 i+YL5GjR3h7ygmLFV/QRVAVSMhCY6Al6Ab+vKk+INzDq2L7K4x0UHAhkx82BJ58PCsxU 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33su409gdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:33:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2719810003A;
 Fri,  2 Oct 2020 11:33:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19F122A53E7;
 Fri,  2 Oct 2020 11:33:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:32:38 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:32:38 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "peng.fan@nxp.com"
 <peng.fan@nxp.com>
Thread-Topic: [PATCH v2 2/2] mmc: stm32_sdmmc2: Use mmc_of_parse() to read
 host capabilities
Thread-Index: AQHWi5mtovrW458BzUe9sSUhkMbAtqmEBTIA
Date: Fri, 2 Oct 2020 09:32:38 +0000
Message-ID: <bf8168de-fa8c-8bf1-73b3-c31a34fab3f5@st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-2-mr.nuke.me@gmail.com>
In-Reply-To: <20200915195147.2659607-2-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <32E7F0BD5AB8FB4997800A439E0C432D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] mmc: stm32_sdmmc2: Use
 mmc_of_parse() to read host capabilities
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

Hi Alexandru

On 9/15/20 9:51 PM, Alexandru Gagniuc wrote:
> mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of
> struct mmc_config from devicetree.
> The same logic is duplicated in stm32_sdmmc2_probe(). Use
> mmc_of_parse(), which is more generic.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
> Changes from v1:
>  - Check the return value of mmc_of_parse().
>  - The call to mmc_of_parse() is moved further up. This means we can just
>    'return err' on error instead of exiting via goto.
>
>  drivers/mmc/stm32_sdmmc2.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 6d50356217..a29657429c 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -653,6 +653,12 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  	if (priv->base == FDT_ADDR_T_NONE)
>  		return -EINVAL;
>  
> +	cfg->host_caps = 0;
> +	cfg->f_max = 52000000;
> +	ret = mmc_of_parse(dev, cfg);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (dev_read_bool(dev, "st,neg-edge"))
>  		priv->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
>  	if (dev_read_bool(dev, "st,sig-dir"))
> @@ -676,28 +682,10 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  			     GPIOD_IS_IN);
>  
>  	cfg->f_min = 400000;
> -	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>  	cfg->name = "STM32 SD/MMC";
>  
> -	cfg->host_caps = 0;
> -	if (cfg->f_max > 25000000)
> -		cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
> -
> -	switch (dev_read_u32_default(dev, "bus-width", 1)) {
> -	case 8:
> -		cfg->host_caps |= MMC_MODE_8BIT;
> -		/* fall through */
> -	case 4:
> -		cfg->host_caps |= MMC_MODE_4BIT;
> -		break;
> -	case 1:
> -		break;
> -	default:
> -		pr_err("invalid \"bus-width\" property, force to 1\n");
> -	}
> -
>  	upriv->mmc = &plat->mmc;
>  
>  	/* SDMMC init */

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
