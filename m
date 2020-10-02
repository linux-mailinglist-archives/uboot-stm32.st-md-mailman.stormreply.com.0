Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F6280FA8
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:16:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9EB5C3089F;
	Fri,  2 Oct 2020 09:16:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7203FC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:16:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929742L015382; Fri, 2 Oct 2020 11:16:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Vc/zDcoBdxJySM9hYSiMyP3Vh2jZi7XP2QL1yCMKGoo=;
 b=OkBr+j/o2GHMYFCFRhd03GBESrkgXqMUHcCEOnuJ9VyUleh2YDEPGDQ1QZt/JGcS7eQq
 hGFtuhq8ADnBM3LbMyQqrMetWJ6PtHPIuwRwChs45gmvZwWSKPaXC/Uo1Hi/1iTpXHaP
 EYja7xuA6oB9tJAJojfbAEbilvolE8ZZDo2PoGnnCzgyEGwTLs6tY+xQpVmS3aq8IBcY
 salz6FoL1o7A5xu8PK+6o6507g8NBZWYTvZtIzskI0vPCbBtKMArs8+EJ6ZCHq+07+4d
 aLbqnfOR8Mc6bBgQG06y7RuFpk9r5ymZq1XmhzITqmhAyJa6alBi1JKFP5S6iAzhDJw+ jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf2a9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:16:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18182100034;
 Fri,  2 Oct 2020 11:16:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B29D2AE6DD;
 Fri,  2 Oct 2020 11:16:41 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:16:37 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:16:37 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, "peng.fan@nxp.com"
 <peng.fan@nxp.com>
Thread-Topic: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with
 "cap-mmc-highspeed"
Thread-Index: AQHWi5msGhDIPL5WykOA1I3zu06JJ6mEICqg
Date: Fri, 2 Oct 2020 09:16:37 +0000
Message-ID: <ba02620d889647dfbc2c01f3c281f5a9@SFHDAG6NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-1-mr.nuke.me@gmail.com>
In-Reply-To: <20200915195147.2659607-1-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz
 support with "cap-mmc-highspeed"
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

Hi,

> From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Sent: mardi 15 septembre 2020 21:52
> 
> "cap-mmc-highspeed" enables support for 26 MHz MMC, but there is no additional
> flag to enable 52 MHz MMC. In Linux. "cap-mmc-highspeed"
> is used for MMC HS at both 26MHz and 52MHz.
> 
> Use the same approach and enable MMC_CAP(MMC_HS_52) host capability
> when "cap-mmc-highspeed" is found in the devicetree. In the event an MMC card
> doesn't support 52 MHz, it will be clocked at a speed based on its EXT CSD, even
> on 52 MHz host controllers
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/mmc/mmc-uclass.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/mmc-uclass.c b/drivers/mmc/mmc-uclass.c index
> 90690c8d1e..6d2310eff3 100644
> --- a/drivers/mmc/mmc-uclass.c
> +++ b/drivers/mmc/mmc-uclass.c
> @@ -198,7 +198,7 @@ int mmc_of_parse(struct udevice *dev, struct
> mmc_config *cfg)
>  	if (dev_read_bool(dev, "cap-sd-highspeed"))
>  		cfg->host_caps |= MMC_CAP(SD_HS);
>  	if (dev_read_bool(dev, "cap-mmc-highspeed"))
> -		cfg->host_caps |= MMC_CAP(MMC_HS);
> +		cfg->host_caps |= MMC_CAP(MMC_HS) |
> MMC_CAP(MMC_HS_52);
>  	if (dev_read_bool(dev, "sd-uhs-sdr12"))
>  		cfg->host_caps |= MMC_CAP(UHS_SDR12);
>  	if (dev_read_bool(dev, "sd-uhs-sdr25"))
> --
> 2.25.4

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@st.com>

Tested on STM32MP157C-EV1, for mmc 1 = emmc with patch [1]

	Mode: MMC High Speed (52MHz)

[1]: mmc: stm32_sdmmc2: Use mmc_of_parse() to read host capabilities
     http://patchwork.ozlabs.org/project/uboot/patch/20200909215402.366561-1-mr.nuke.me@gmail.com/


Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
