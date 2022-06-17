Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBCD54F420
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 11:20:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA30C5F1F2;
	Fri, 17 Jun 2022 09:20:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8D54C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 09:20:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H6xqCf005188;
 Fri, 17 Jun 2022 11:20:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=V19JYzVt2xw8ffXRYLtOde09uhNEqdc2Bl/Pi8J75ro=;
 b=wW9iBk4ukLLIA+DbCYCqtPdZjBTyP45fnG/wbA/UNTFpj//i5nXJKIQvV2Q6Z/cVZl3l
 eJhLTgSiQBqBOtvZkZzHZ3mJZ1y2CYzWBejCY/ek5vQycIYwuIrAfaZXY7qT/WLqM3Ap
 4qWgRT8Ir7jKJE2W7JkKQq+dl8N3Sz2WMJDlRF/2TGKozcGVbWWf7bZ/vgOxQ2KVqWhl
 HNU/wln+6q1rpr3uHA9MxFW0ChGMIaUjRMAZydd0toKaMGcqnviWNSynBufA37b1wDPe
 LWY43WOgZNe+MSSvdoT7pTQHw7VqbvDdbPd9J1vfJRNQMvn9vFaIdJbbCfhkhWFtOHPd eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3grmu98uke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 11:20:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D56C10002A;
 Fri, 17 Jun 2022 11:20:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50AEF21A237;
 Fri, 17 Jun 2022 11:20:24 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 11:20:23 +0200
Message-ID: <bc41b546-9f99-8a49-caae-eaa2f9fb00f7@foss.st.com>
Date: Fri, 17 Jun 2022 11:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220520183718.1.I3ee35f18672107aad869bbd4b3e53957b16cb304@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220520183718.1.I3ee35f18672107aad869bbd4b3e53957b16cb304@changeid>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: Vignesh R <vigneshr@ti.com>, vipin.kumar@st.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Marek Vasut <marex@denx.de>,
 Mark Kettenis <kettenis@openbsd.org>, Samuel Holland <samuel@sholland.org>,
 Lukasz Majewski <lukma@denx.de>, Rayagonda
 Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>, armando.visconti@st.com,
 Andre Przywara <andre.przywara@arm.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Yuan Fang <fangyuanseu@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: fix reference for
	STMicroelectronics
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

On 5/20/22 18:38, Patrick Delaunay wrote:
> Replace reference to the correct name STMicroelectronics
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/Kconfig                      | 2 +-
>   arch/arm/cpu/armv7/stv0991/lowlevel.S | 2 +-
>   arch/arm/mach-sti/Kconfig             | 2 +-
>   drivers/i2c/designware_i2c.c          | 2 +-
>   drivers/i2c/designware_i2c.h          | 2 +-
>   drivers/i2c/designware_i2c_pci.c      | 2 +-
>   drivers/mtd/nand/raw/fsmc_nand.c      | 4 ++--
>   drivers/mtd/spi/spi-nor-ids.c         | 2 +-
>   drivers/net/designware.c              | 2 +-
>   drivers/net/designware.h              | 2 +-
>   drivers/pinctrl/Kconfig               | 2 +-
>   drivers/spi/pl022_spi.c               | 2 +-
>   drivers/usb/gadget/designware_udc.c   | 2 +-
>   include/configs/stm32mp15_st_common.h | 2 +-
>   include/elf.h                         | 4 ++--
>   include/linux/mtd/fsmc_nand.h         | 2 +-
>   include/usb/designware_udc.h          | 2 +-
>   17 files changed, 19 insertions(+), 19 deletions(-)
>

Applied to u-boot-stm/next, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
