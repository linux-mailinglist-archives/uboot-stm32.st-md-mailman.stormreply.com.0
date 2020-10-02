Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70F281333
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 14:55:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D88AC3FAFF;
	Fri,  2 Oct 2020 12:55:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7386EC3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 12:55:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092Cb7s1022530; Fri, 2 Oct 2020 14:55:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Se4WNNuy6ged93iUc5lF1RM17NsZ45pYAcTEDoXmq3Q=;
 b=AMc0ow7IQdqlzq8bfMGoWrX0tnBjUo8YWGBR88xpqKaHoqkimw2OKfwjg3wMORrHZ6bR
 LTGaC4pf6IZSm8cXIis0XWQDOdef6nFLcJEwbZ84ye74ZP3XdguXFX2u2DqVQxZ7y9OO
 CNg/BIcAWq2+b4bCWGhOMu0E2fkTmIbkLdNdAp81XH9oaapsnZ6h1ORk8Sorq2vcIQwP
 jVMUbZyBnvPa2Q6uDDgphrhWwTJX3X2ll0pL7/XBdPkTFceqCl5DrgKm42C88ZGCj6CX
 2HENYvuy64w6XfxxzIRSVkAdeN/lkMnhZjkn2/If8mgcF63Pqlv4hhqckcmj4AQ1wCj+ 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf3c0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 14:55:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25C1B10002A;
 Fri,  2 Oct 2020 14:55:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E65F42BF9BE;
 Fri,  2 Oct 2020 14:54:59 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 14:54:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 14:54:59 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "peng.fan@nxp.com" <peng.fan@nxp.com>
Thread-Topic: [PATCH 1/2] mmc: mmc_of_parse: Enable 52 MHz support with
 "cap-mmc-highspeed"
Thread-Index: AQHWi5msGhDIPL5WykOA1I3zu06JJ6mEICqggAA8aIA=
Date: Fri, 2 Oct 2020 12:54:59 +0000
Message-ID: <7fa74725c9c44853895730888635d898@SFHDAG6NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <20200915195147.2659607-1-mr.nuke.me@gmail.com>
 <ba02620d889647dfbc2c01f3c281f5a9@SFHDAG6NODE3.st.com>
In-Reply-To: <ba02620d889647dfbc2c01f3c281f5a9@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
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

Hi Peng,

> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On
> Behalf Of Patrick DELAUNAY
> 
> Hi,
> 
> > From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > Sent: mardi 15 septembre 2020 21:52
> >
> > "cap-mmc-highspeed" enables support for 26 MHz MMC, but there is no
> > additional flag to enable 52 MHz MMC. In Linux. "cap-mmc-highspeed"
> > is used for MMC HS at both 26MHz and 52MHz.
> >
> > Use the same approach and enable MMC_CAP(MMC_HS_52) host capability
> > when "cap-mmc-highspeed" is found in the devicetree. In the event an
> > MMC card doesn't support 52 MHz, it will be clocked at a speed based
> > on its EXT CSD, even on 52 MHz host controllers
> >
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > ---
> >  drivers/mmc/mmc-uclass.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> 
> Tested on STM32MP157C-EV1, for mmc 1 = emmc with patch [1]
> 
> 	Mode: MMC High Speed (52MHz)
> 
> [1]: mmc: stm32_sdmmc2: Use mmc_of_parse() to read host capabilities
>      http://patchwork.ozlabs.org/project/uboot/patch/20200909215402.366561-1-
> mr.nuke.me@gmail.com/

Today this patch is delegate to me in patchwork even it is a mmc core patch:

http://patchwork.ozlabs.org/project/uboot/list/?series=201912

You are OK if I integrate this patch in my stm32 pull request for v2020.01-rc1 or
I delegate to you ?

> 
> Thanks
> 
> Patrick
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
