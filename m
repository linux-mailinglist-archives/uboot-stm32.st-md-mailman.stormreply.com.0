Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E82265EF7
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Sep 2020 13:46:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07DB1C3FAE3
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Sep 2020 11:46:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11C54C3FAE2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 11:46:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08BBfljW024888; Fri, 11 Sep 2020 13:46:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Fwccz2xE8WX3R5VADbdMPs+uh+vC9iQArpM8zgfBdDQ=;
 b=Af4TveLlt4LMY4ntpa8PlM4dEBGDIMgzAyGao6IRsNE+ykDiHb2Cq/67P0COdG1X07Fi
 CWSqVXjFQRkH3WbcF3+nYND1G7aqO3QO9uZQGu2qJ9DyfofY9D1ptFLkj3TiQeh2zPv+
 JlzBJ0cw9W1W+xuGxhWxRSVqHj6DuBgm0eziBEJ4mY/Lt+JKrykHl3IRqlrprCfUk3fj
 LUJsc5PlHADPG6mDxrS9aqkMdt/keeNDsKHS0uWrIEsRw8310Y4vIVlm6rTcD6pbeKqc
 irOnf56sczeQfKQqfwbUkAtmY8IyRevvW0QiIuHLzhcslyDTOUi1DqQJh1PgXfEH3Vah bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jfhc72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 13:46:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F68A10002A;
 Fri, 11 Sep 2020 13:46:32 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node4.st.com [10.75.127.80])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3038F2A7A11;
 Fri, 11 Sep 2020 13:46:32 +0200 (CEST)
Received: from GPXDAG6NODE6.st.com (10.75.127.82) by GPXDAG6NODE4.st.com
 (10.75.127.80) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Sep
 2020 13:46:31 +0200
Received: from GPXDAG6NODE6.st.com ([fe80::1c1:61d:3d8d:4b33]) by
 GPXDAG6NODE6.st.com ([fe80::1c1:61d:3d8d:4b33%19]) with mapi id
 15.00.1473.003; Fri, 11 Sep 2020 13:46:31 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Jaehoon Chung <jh80.chung@samsung.com>, Alexandru Gagniuc
 <mr.nuke.me@gmail.com>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to read host
 capabilities
Thread-Index: AQHWhvPBpA6CLj++jEKGeAsJCXckZ6li8L6AgABhtkA=
Date: Fri, 11 Sep 2020 11:46:31 +0000
Message-ID: <2cb173a6d4834550805337bf76545a12@GPXDAG6NODE6.st.com>
References: <CGME20200910005435epcas1p20d2f97d097717214bd2836fafdd140d9@epcas1p2.samsung.com>
 <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <79b3e835-0dac-43cd-9d6e-0d31e985424b@samsung.com>
In-Reply-To: <79b3e835-0dac-43cd-9d6e-0d31e985424b@samsung.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_04:2020-09-10,
 2020-09-11 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
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

Hi Jaehoon

> From: Jaehoon Chung <jh80.chung@samsung.com>
> Sent: vendredi 11 septembre 2020 09:50
> 
> On 9/10/20 6:54 AM, Alexandru Gagniuc wrote:
> > mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of
> > struct mmc_config from devicetree.
> > The same logic is duplicated in stm32_sdmmc2_probe(). Use
> > mmc_of_parse(), which is more generic.
> >
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > ---
> >  drivers/mmc/stm32_sdmmc2.c | 18 ++----------------
> >  1 file changed, 2 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> > index 6d50356217..77871d5afc 100644
> > --- a/drivers/mmc/stm32_sdmmc2.c
> > +++ b/drivers/mmc/stm32_sdmmc2.c
> > @@ -676,27 +676,13 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
> >  			     GPIOD_IS_IN);
> >
> >  	cfg->f_min = 400000;
> > -	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
> >  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 |
> MMC_VDD_165_195;
> >  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
> >  	cfg->name = "STM32 SD/MMC";
> >
> >  	cfg->host_caps = 0;
> > -	if (cfg->f_max > 25000000)
> > -		cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
> > -
> > -	switch (dev_read_u32_default(dev, "bus-width", 1)) {
> > -	case 8:
> > -		cfg->host_caps |= MMC_MODE_8BIT;
> > -		/* fall through */
> > -	case 4:
> > -		cfg->host_caps |= MMC_MODE_4BIT;
> > -		break;
> > -	case 1:
> > -		break;
> > -	default:
> > -		pr_err("invalid \"bus-width\" property, force to 1\n");
> > -	}
> > +	cfg->f_max = 52000000;
> 
> cfg->f_max can be also removed?
> 
> Best Regards,
> Jaehoon Chung

I don't think because " max-frequency" is optional in device tree (only "reg" is required)

Here 52MHz is a default value when it is absent in device tree
That avoids cfg->f_max = 0 after mmc_of_parse() call.

> 
> > +	mmc_of_parse(dev, cfg);
> >
> >  	upriv->mmc = &plat->mmc;
> >
> >

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
