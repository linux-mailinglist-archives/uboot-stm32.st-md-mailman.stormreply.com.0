Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC7265C1D
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Sep 2020 11:01:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA50C3FAE3
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Sep 2020 09:01:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 926E9C3FADD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 09:01:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B8urdu024360; Fri, 11 Sep 2020 11:01:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iu4KnuFHqgo2ujcloqIZhqHwUNMNl+lQ8xH9xwS3Xps=;
 b=ItUfnu17L1Sb67Y/3sw40pPLB2AW12GhMhGNRmyyOQmfj//PSF8ZX1yxn1LHYdHdSrdn
 PVbW61il8ssDVKsDvI3KHlehXhiLUQtqrG9JVW9b3/C1rRysvCpU20sbIY0EsFTEs/1Z
 WfpPplWxFRlOLnGhPgF+G/to2vwa1TJ9+CgWMH3bP45bDD3lzmkTz8CiOKvenWNcAxbT
 Zvv9al5KdWNMhi45pimvkK+NEiwR2iGK1ZBxZ9dlBu40i2MTm4ROZ/JXb3oRjt/28ZpQ
 HAMpUwNT7yTrRtgnL6zXXUgAnwcHC+gHaCPAdxxx2mITu8P7ayAunFEeVFTd/45qQaJP RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev84rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 11:01:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C68F100038;
 Fri, 11 Sep 2020 11:01:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E5AA21F69D;
 Fri, 11 Sep 2020 11:01:03 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Sep
 2020 11:00:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Sep 2020 11:00:14 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Alex G. <mr.nuke.me@gmail.com>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Yann GAUTIER
 <yann.gautier@st.com>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to read host
 capabilities
Thread-Index: AQHWhvPBpA6CLj++jEKGeAsJCXckZ6lh6s/QgABCmACAAOGvIA==
Date: Fri, 11 Sep 2020 09:00:14 +0000
Message-ID: <f43d5afbf0ce4b6bb2d11941cb28f7da@SFHDAG6NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <f48f0991628c4dda87089f1464da65d5@SFHDAG6NODE3.st.com>
 <ed73c108-71e5-4940-f9e0-9490758087a8@gmail.com>
In-Reply-To: <ed73c108-71e5-4940-f9e0-9490758087a8@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_03:2020-09-10,
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

Hi Alex,

> From: Alex G. <mr.nuke.me@gmail.com>
> Sent: jeudi 10 septembre 2020 22:10
> 
> On 9/10/20 11:04 AM, Patrick DELAUNAY wrote:
> > Hi Alexandru,
> 
> Hi
> 
> [snip]
> 
> >> +	cfg->f_max = 52000000;
> >> +	mmc_of_parse(dev, cfg);
> >
> > Result of mmc_of_parse is not tested ?
> >
> > I proposed:
> >
> > +	ret = mmc_of_parse(dev, cfg);
> > +	if (ret)
> > +		return ret;
> 
> You're right. I'll get that updated.

Thanks;
 
> 
> > I test this patch with a trace in stm32_sdmmc2_probe on
> > STM32MP157C-EV1
> [snip]
> > I think that it is a issue U-Boot, in mmc uclass in mmc_of_parse():
> >
> > 	if (dev_read_bool(dev, "cap-mmc-highspeed"))
> > -		cfg->host_caps |= MMC_CAP(MMC_HS);
> > +		cfg->host_caps |= MMC_CAP(MMC_HS) |
> MMC_CAP(MMC_HS_52);
> >
> > In U-Boot this capability is splitted in 2 bits = one for 26MHz one
> > for 52MHz And  for card side it is managed on card side by
> > mmc_get_capabilities()
> 
> I agree. I am preparing a patch to address this.

Thanks;
 
> 
> [snip]
> > 2) some host caps can be added in device tree (they are supported by SOC and
> by Linux driver)
> >      but they are not supported by U-Boot driver, for example:
> >
> > #define MMC_MODE_DDR_52MHz	MMC_CAP(MMC_DDR_52)
> > #define MMC_MODE_HS200		MMC_CAP(MMC_HS_200)
> > #define MMC_MODE_HS400		MMC_CAP(MMC_HS_400)
> > #define MMC_MODE_HS400_ES	MMC_CAP(MMC_HS_400_ES)
> >
> >
> > I afraid (I don't sure) that this added caps change the mmc core
> > behavior in U-Boot = U-Boot try to select  the high speed mode even if not
> supported by driver....
> 
> Two issues here. The first is when devicetree enables an unsupported mode, say
> "mmc-hs400-1_2v". That's a devicetree bug, and not something we should fix in
> the code. Hypothetical exam: DT says
> 	bus-width = <8>;
> but only four lines are routed on the board.

Yes it is a device tree issue when the mode is not supported by board / SOC.

But high mode is supported by the STM32MP15x SOC but only if additional
Operation are done (IO configuration to support higher speed) 

It is not supported in U-Boot driver (yet ?) but it is supported by Linux driver...

> The second issue is what happens when somebody plugs in a UHS SD card?
> UHS support is not enabled by default in the stm32mp1 defconfigs, so the mmc
> core won't try to run it at UHS.
> 
> Now if somebody were to enable UHS manually:
> 	CONFIG_MMC_IO_VOLTAGE=y
> 	CONFIG_MMC_UHS_SUPPORT=y
> Then yes, the UHS switch will be attempted, fail, and the card will not be detected.
> 
> To work around that, one could implement a .wait_dat0() that returns an error
> other than -ENOSYS. This would cause mmc_switch_voltage() to fail, making the
> mmc core to leave the card at default speeds.
> 
> My argument is that it takes conscious effort to break things in the first place, so
> it's not a situation we should worry about.
> 

Yes  we should have issue only if UHS defconfig was activated
(CONFIG_MMC_UHS_SUPPORT, CONFIG_MMC_HS*_SUPPORT)....

And it is not the case today in stm32*defconfig
And my proposal is protection (over).

> > The host_caps bitfield should be limited by the supported features in the driver
> (or remove the unsupported features)
> [snip]
> > 	cfg->host_caps &= SDMMC_SUPPORTED_CAPS;
> > or
> > 	cfg->host_caps |= ~SDMMC_UNSUPPORTED_CAPS;
> 
> I think this sort of playing with the flags will cause more confusion.
> People would expect this to come from DT. For example, somebody sets
> "sd-uhs-ddr52" in devicetree. It's more confusing to check host_caps,
> and find that MMC_MODE_DDR_52MHz is not set than it is to see the driver
> trying to place the card in DDR52 and failing.

- card_caps = CARD capacity

For you
- host_caps is SOC capacity (read from DT)

For me 
- host_caps is SOC capacity (read from DT) AND driver capacity

=> then in mmc u-class, the real capacity is  host_caps | card_caps

I already see this kind of limitation in one driver 
omap_hsmmc.c:1939:		cfg->host_caps &= ~fixups->unsupported_caps;

But I agree it is today an over protection on host_caps and it can be confusing
so you can forget this point....

> Alex

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
