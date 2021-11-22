Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FA4589D8
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:30:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82BFAC5A4FD;
	Mon, 22 Nov 2021 07:30:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AFCDC597BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:30:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM3kMDC013715;
 Mon, 22 Nov 2021 08:30:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=y7Fh/3xIlpxxyAM0A93iDRRpRA5nc0sWf3Qw9sJGdZ0=;
 b=MkiShtl1PFMbRsdEP4UAZeUPB/PmFCM86e1hCdArbBL6y91X8s2rbJXelUJAWCZP4T8C
 M5B70pfGd6rY1+C2ct0hACJWWUIfxm+Gqkwm+AaBvSb0XyXa4bYTIz5PRNzWnWISm0B6
 OZyr+LWutRvATJi8pi/0g72UedQiKLs102LpbcxIxLPau6qC1LC3byhe+6KZooWd3M4q
 dAzvMEnvkM9iuIMSdTZEKlO07OxLdH9sL0BVZvLHKGT6UpmxsHV+yOVyMpopG9tXmHB9
 XMd3F+W+cNGJ9+1QaLgWk0VsyFtvhhpZXq6XB0xnYRbH+ujU2URXHJcSAMTKd5t3urGN hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cfjepuvw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:30:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2695510002A;
 Mon, 22 Nov 2021 08:30:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17F522171D1;
 Mon, 22 Nov 2021 08:30:39 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:30:38 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.2.I2b8768c30ed4364557c336097beea2e146c3e4fc@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <238263c6-a4e4-57e3-e8d3-6d3fa1f18a65@foss.st.com>
Date: Mon, 22 Nov 2021 08:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115163155.2.I2b8768c30ed4364557c336097beea2e146c3e4fc@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Anatolij Gustschin <agust@denx.de>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Asherah Connor <ashe@kivikakk.ee>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/7] common: rename lcd_simplefb.c file to
 fdt_simplefb.c
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

Hi Patrick

On 11/15/21 4:32 PM, Patrick Delaunay wrote:
> Rename the file lcd_simplefb.c to fdt_simplefb.c to be aligned
> with the configuration name and with the associated include file
> ./include/fdt_simplefb.h
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  common/Makefile                           | 2 +-
>  common/{lcd_simplefb.c => fdt_simplefb.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename common/{lcd_simplefb.c => fdt_simplefb.c} (100%)
> 
> diff --git a/common/Makefile b/common/Makefile
> index fed7e482e6..24be05c368 100644
> --- a/common/Makefile
> +++ b/common/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_DISPLAY_BOARDINFO) += board_info.o
>  obj-$(CONFIG_DISPLAY_BOARDINFO_LATE) += board_info.o
>  
>  obj-$(CONFIG_CMD_BEDBUG) += bedbug.o
> +obj-$(CONFIG_FDT_SIMPLEFB) += fdt_simplefb.o
>  obj-$(CONFIG_$(SPL_TPL_)OF_LIBFDT) += fdt_support.o
>  obj-$(CONFIG_MII) += miiphyutil.o
>  obj-$(CONFIG_CMD_MII) += miiphyutil.o
> @@ -40,7 +41,6 @@ ifndef CONFIG_DM_VIDEO
>  obj-$(CONFIG_LCD) += lcd.o lcd_console.o
>  endif
>  obj-$(CONFIG_LCD_ROTATION) += lcd_console_rotation.o
> -obj-$(CONFIG_FDT_SIMPLEFB) += lcd_simplefb.o
>  obj-$(CONFIG_MENU) += menu.o
>  obj-$(CONFIG_UPDATE_COMMON) += update.o
>  obj-$(CONFIG_USB_KEYBOARD) += usb_kbd.o
> diff --git a/common/lcd_simplefb.c b/common/fdt_simplefb.c
> similarity index 100%
> rename from common/lcd_simplefb.c
> rename to common/fdt_simplefb.c
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
