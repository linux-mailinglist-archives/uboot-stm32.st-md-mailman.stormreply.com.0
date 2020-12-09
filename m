Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9512D4047
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Dec 2020 11:48:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95529C3FADA;
	Wed,  9 Dec 2020 10:48:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A51BC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 10:48:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B9AkgTI026538; Wed, 9 Dec 2020 11:48:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nzwiSOD/L8iVyRdtsBpI+hKtCP0tO0lrZX1QfWFNT1o=;
 b=Nh0SCdEXjTdN6a0lfxgVyIXx0OOlv3VbK0HXHg+Rlb4NtW6HSODZA0bnCFxjo4rgi/KB
 B0DrWBh+cLx8HfrK/gItzvv7+v5424zpqEoeTZ+fh9sl5oNKFZY6qyjA6FnLvtuH6+oD
 cYLrDm2fLxKjJvOEb+aqJ3mLUovxfyfU0oP90FFWtzU6kaUTVK8VPo7lbvtQjwJ/DU+u
 TpS15xlR5p5iN4j6bZ15vFPm1CxlCdBbTRgrX8s9XqXyJobhET82WP6ZQcbkD+5/TzNJ
 UwoIb/ae67T5lLlyAvwjJaZSd0kmYgFU7UjyRjnP+zi43HDgBo9esO7aBAiqcfNTiXZe Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agwfkx71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 11:48:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4567510002A;
 Wed,  9 Dec 2020 11:48:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 150C425D007;
 Wed,  9 Dec 2020 11:48:34 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 11:48:33 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 9 Dec 2020 11:48:33 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Lukasz Majewski
 <lukma@denx.de>
Thread-Topic: [PATCH 1/4] fastboot: mmc: Add CONFIG_FASTBOOT_MMC_USER_SUPPORT
Thread-Index: AQHWhqxMDfO6nk7X1EyVb1ikk5gjiqnvIpnQ
Date: Wed, 9 Dec 2020 10:48:33 +0000
Message-ID: <8d6dfa51d37a4fcdb2f58516473925de@SFHDAG2NODE3.st.com>
References: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
In-Reply-To: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_08:2020-12-09,
 2020-12-09 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Mingming lee <mingming.lee@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] fastboot: mmc: Add
	CONFIG_FASTBOOT_MMC_USER_SUPPORT
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

Hi Lukasz,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 9 septembre 2020 15:23
> To: u-boot@lists.denx.de
> Cc: Patrick DELAUNAY <patrick.delaunay@st.com>; Jagan Teki
> <jagan@amarulasolutions.com>; Kever Yang <kever.yang@rock-chips.com>;
> Mingming lee <mingming.lee@mediatek.com>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Peng Fan <peng.fan@nxp.com>; Simon Glass
> <sjg@chromium.org>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>
> Subject: [PATCH 1/4] fastboot: mmc: Add
> CONFIG_FASTBOOT_MMC_USER_SUPPORT
> Importance: High
> 
> Split userdata and boot partition support for eMMC update and correct the
> description (update is supported).
> 
> The new configuration CONFIG_FASTBOOT_MMC_USER_SUPPORT allows to
> activate support of userdata partition update, based on target
> name=CONFIG_FASTBOOT_MMC_USER_NAME
> 
> This patch also removes the unnecessary dependency with ARCH_MEDIATEK
> and EFI_PARTITION.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  configs/mt8518_ap1_emmc_defconfig |  1 +
>  drivers/fastboot/Kconfig          | 22 +++++++++++++++++-----
>  drivers/fastboot/fb_mmc.c         |  9 ++++++---
>  3 files changed, 24 insertions(+), 8 deletions(-)
> 

Gentle reminder,

Any comments on this serie [1]

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=200509

Patrick 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
