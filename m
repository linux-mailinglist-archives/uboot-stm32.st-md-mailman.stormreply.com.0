Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC3649F1A
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 13:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94410C69040;
	Mon, 12 Dec 2022 12:50:07 +0000 (UTC)
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F619C65049
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Dec 2022 21:04:32 +0000 (UTC)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 335322C0230;
 Mon, 12 Dec 2022 10:04:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1670792669;
 bh=cH9P4qGBVUMTXQG1XfAyeebETIPP/0SwAG51qvTYsdM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=kWwCaiPMeQM9vK5VNwb2Z9HcVg01Y38AfeUoQEucy547HNz3AZRQoKPpou7COtywF
 A5MFXM9W4NQskak96D+Lywjmagem3VocdSM6YKdfmnx13yntF6xOOmv4mcwUqr6Wav
 Wqao/QzrKNyYkDwUXhMh13f6eaK0GuStd5ccg8Y9rDxSXeyPMKDDAUzO4ZLEzoMwpW
 cvJQTX2zvzWEsNPeIHDiFrMOI859TeTPS97/QOMIGdh6craCIaIyBHiE999x/gRK6R
 W/w5QW8wD1QCsRmYMSyP8qA08xrH9mFQ6IkqVQilCxlx0OsLMDS5q7Bo4KQQudAgDT
 3UiqzdejyCn1Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B639645dd0000>; Mon, 12 Dec 2022 10:04:29 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 10:04:29 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.044; Mon, 12 Dec 2022 10:04:28 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 0/5] Complete the migration of MTDPARTS_DEFAULT /
 MTDIDS_DEFAULT
Thread-Index: AQHZChW7a+eTrev0uEG3algSWWbC565oWjYA
Date: Sun, 11 Dec 2022 21:04:28 +0000
Message-ID: <7f31c463-1e37-4601-02d2-593b2e476e8d@alliedtelesis.co.nz>
References: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
In-Reply-To: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-ID: <AEA68C6AD61CF2469D3B1BD543C3F1CC@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=PqrtkDE3 c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=sHyYjHe8cH0A:10 a=UQ6OQWMryxMX7hOFXWkA:9
 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Mailman-Approved-At: Mon, 12 Dec 2022 12:50:06 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] Complete the migration of
 MTDPARTS_DEFAULT / MTDIDS_DEFAULT
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


On 7/12/22 21:26, Patrick Delaunay wrote:
> Addition for previous commit a331017c237c ("Complete migration of
> MTDPARTS_DEFAULT / MTDIDS_DEFAULT, include in environment")
>
> Remove the remaining defines MTDPARTS_DEFAULT and MTDIDS_DEFAULT
> in the configuration files (include/configs/*.h).
>
> After this serie, the only remaining references of these 2 defines are
> located in cmd/mtdparts.c and only for local purpose when
> CONFIG_MTDIDS_DEFAULT or CONFIG_MTDPART_DEFAULT are not defined.
>
> Patrick.
>
>
> Patrick Delaunay (5):
>    configs: am333x_guardian: move MTDIDS_DEFAULT in defconfif
>    configs: x530: move MTDPART/MTDIDS_DEFAULT in defconfig
>    configs: SBx81LIFXCAT: move MTDPART_DEFAULT in defconfig
>    configs: SBx81LIFKW: move MTDPART_DEFAULT in defconfig
>    configs: remove support of MTDIDS_DEFAULT/MTDPARTS_DEFAULT

For x530, SBx81LIFXCAT and SBx81LIFKW

Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

>   cmd/mtdparts.c                    | 5 +----
>   configs/SBx81LIFKW_defconfig      | 1 +
>   configs/SBx81LIFXCAT_defconfig    | 1 +
>   configs/am335x_guardian_defconfig | 1 +
>   configs/x530_defconfig            | 2 ++
>   drivers/mtd/mtd_uboot.c           | 4 ----
>   include/configs/SBx81LIFKW.h      | 1 -
>   include/configs/SBx81LIFXCAT.h    | 1 -
>   include/configs/am335x_guardian.h | 1 -
>   include/configs/x530.h            | 2 --
>   10 files changed, 6 insertions(+), 13 deletions(-)
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
