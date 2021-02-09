Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883F315246
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 16:01:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C69B4C57189;
	Tue,  9 Feb 2021 15:01:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 902C8C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 15:01:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119F0oBn018000; Tue, 9 Feb 2021 16:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=M4i5+ju3ZSmk6pWrd0M5QZfGfcUkmhF+ZO9XwkR7nsE=;
 b=cGuO8PJuu62+cELUpeECgGXV31TVJNRm0EirDqsI1zBaL4IoHAgZnKHQVenu/nCgD+BK
 g80ViL1F6jZcdDYcwcNJpLOp5/s+F/6NvquT4MWxOuoJ09L2VZMlDV2PGYKWQ9Igutwl
 WAvclPd94mjFm70TEl7umWEKAHuvOIWn0p4phI+I0wj/ssx/mbJzGBU99f9i7NfpEh7z
 xKbvaDD9+bDxbMkB5dE6GSErZe79GzeMunk7pad3sOLxFWPK+YfjCMWb2VW9XiLQnuiB
 7EXpcDOYpFgnGphVlmA6yGn9a3/gCNvO0aFM4REYoU15w31I6PDLUXEAqJS2j21+jbsd 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr2c9a6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:01:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A67110002A;
 Tue,  9 Feb 2021 16:01:51 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3DD2525D013;
 Tue,  9 Feb 2021 16:01:51 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.118) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 16:01:50 +0100
To: <u-boot@lists.denx.de>
References: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <e6d74929-29de-0d32-3c30-f06fec95e8e5@foss.st.com>
Date: Tue, 9 Feb 2021 16:01:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111123329.1.I62e8df98aef0f695209fcc494c90777fb5beccb4@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG1NODE6.st.com (10.75.127.67) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with
	v5.11-rc2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 1/11/21 12:33 PM, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v5.11-rc2
> - fix DCMI DMA features on stm32mp15 family
> - Add alternate pinmux for FMC EBI bus
> - Harmonize EHCI/OHCI DT nodes name on stm32mp15
> - update sdmmc IP version for STM32MP15
> - Add LP timer irqs on stm32mp151
> - Add LP timer wakeup-source on stm32mp151
> - enable HASH by default on stm32mp15
> - enable CRC1 by default on stm32mp15
> - enable CRYP by default on stm32mp15
> - set bus-type in DCMI endpoint for stm32mp157c-ev1 board
> - reorder spi4 within stm32mp15-pinctrl
> - add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
> - fix mdma1 clients channel priority level on stm32mp151
> - fix dmamux reg property on stm32mp151
> - adjust USB OTG gadget fifo sizes in stm32mp151
> - update stm32mp151 for remote proc synchronization support
> - support child mfd cells for the stm32mp1 TAMP syscon
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp15-pinctrl.dtsi        | 87 +++++++++++++++++++++-
>   arch/arm/dts/stm32mp151.dtsi               | 48 +++++++++---
>   arch/arm/dts/stm32mp153.dtsi               |  6 ++
>   arch/arm/dts/stm32mp157c-dk2.dts           |  4 +
>   arch/arm/dts/stm32mp157c-ed1.dts           | 27 +++++++
>   arch/arm/dts/stm32mp157c-ev1.dts           |  1 +
>   arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 55 --------------
>   arch/arm/dts/stm32mp15xx-dkx.dtsi          | 47 ++++++++++--
>   8 files changed, 200 insertions(+), 75 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
