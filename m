Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70378263F05
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 09:52:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 254B8C3FAE3
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 07:52:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAA3FC3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 07:52:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08A7mgWC011119; Thu, 10 Sep 2020 09:52:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=D1Yp/JXck/5OGJ2f4HOFwn9rpLSna9flcs0vGhK2zFg=;
 b=RS/SFVX8x/eUV8q/lQg0+Nvu1FxiwJLDJCt3pGN+gYbe/9Ur+hWX8ynfC1k34Q31mIgC
 ffrq+mnkyUUqCEgyKlzJoLowHXdrr6lCTUHgbtsNHQqhigqSwrpDRdQzlbAsmNHAgI5w
 oLT9dt+eu7z4iASe0N/9izy0zlQUd8TyCjzo/IoOxXi6+pkkufcGVgVu99rbkGo5jpzs
 +qVBMBQ9gT86rPitcvMGCJYQIOOE/SNWvV00CFyJeh3BWUbFZpdeFUq7iQ5yCyBkumvd
 Y261YTRNqfo6+NcSAq6NGrqx7gjFLqrrc0n4+MzgsYIOUMQOn1nWtliplqP2fevaB4ch EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev1nh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 09:52:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4025F10002A;
 Thu, 10 Sep 2020 09:52:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B992212FB5;
 Thu, 10 Sep 2020 09:52:08 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 09:52:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 10 Sep 2020 09:52:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to read host
 capabilities
Thread-Index: AQHWhvPBpA6CLj++jEKGeAsJCXckZ6lhXyCA
Date: Thu, 10 Sep 2020 07:52:07 +0000
Message-ID: <920817e8-1a04-dd4c-55a9-4adb0160efd9@st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
In-Reply-To: <20200909215402.366561-1-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <F8631521F56F9549A38718CFB5B0591C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_01:2020-09-10,
 2020-09-10 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to
 read host capabilities
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

On 9/9/20 11:54 PM, Alexandru Gagniuc wrote:
> mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of
> struct mmc_config from devicetree.
> The same logic is duplicated in stm32_sdmmc2_probe(). Use
> mmc_of_parse(), which is more generic.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/mmc/stm32_sdmmc2.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 6d50356217..77871d5afc 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -676,27 +676,13 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  			     GPIOD_IS_IN);
>  
>  	cfg->f_min = 400000;
> -	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>  	cfg->name = "STM32 SD/MMC";
>  
>  	cfg->host_caps = 0;
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
> +	cfg->f_max = 52000000;
> +	mmc_of_parse(dev, cfg);
>  
>  	upriv->mmc = &plat->mmc;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice

Thanks

>  
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
