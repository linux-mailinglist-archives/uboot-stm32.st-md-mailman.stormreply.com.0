Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4C46357C
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 14:31:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A23C1C597BA;
	Tue, 30 Nov 2021 13:31:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1E6FC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 13:31:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU8s9GD013252;
 Tue, 30 Nov 2021 14:31:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XSwMHtYU+7pbj2RcpiZVSjs9wW6ulbARBCyPiL6kz7M=;
 b=7YTrh5xZb9yj+evk/tjkMUBQBKIA5CZ7SdQVyifg3FiYS4kvfTK00je62WWRvURVi9L8
 PvVHL/3TgEwxY1Vq60+kpk73hWfLVEat3Q1bwcVm9VY1RwvgHbsp54799HVFFvqypuu6
 bTPT9ROgckCXw0MdbW6Hbrx6eybMySM1Q5Qerd70P3C4SCLx/OmacUC5WHaRJnngZDeu
 5QUZVtf9orb5+qfQFj77YyNqQJOva8MTyLopRQgSkpIIPZXNRdo1HA7I3cgJbgdEUfr8
 X8MwqBikMWZPUIscDaswFOGmPvcWk8VX8Bg9nfIcuwmEJo56sP+JMik893B8bc2m58Q9 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cn9y7ueje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 14:31:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBDFC10002A;
 Tue, 30 Nov 2021 14:31:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A26352C41EC;
 Tue, 30 Nov 2021 14:31:14 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 14:31:12 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <0310163e-a2b8-f5b5-6e95-d46ca0b24e47@foss.st.com>
Date: Tue, 30 Nov 2021 14:31:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_08,2021-11-28_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@foss.st.com>,
 Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Thomas Huth <thuth@redhat.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, Stefan Roese <sr@denx.de>,
 Anatolij Gustschin <agust@denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] stm32mp1: enable simple framebuffer
 node for splashscreen
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
> 
> Use simple framebuffer node in the Linux kernel device tree
> to preserved the resources (clock, memory) used by the stm32 video
> driver to display the splashscreen.
> 
> See Linux documentation for details:
> Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> 
> The 3 first commits of the series are cleanup steps:
> migration to Kconfig and rename files and function to fdt_simplefb_
> (it seems like a good time time as this function is only used today
>  in RPI boards)
> 
> patch 4 is a preliminary step = add video_is_active function
> 
> patch 5 add a new API fdt_simplefb_enable_and_mem_rsv
> to activate node and add reserved memory for video memory
> 
> patch 6 avoid a issue in kernel when the reserved video memory by
> LTDC driver is not aligned with Linux kernel MMU_SECTION_SIZE
> 
> patch 7 use this new function in stm32mp1 code for STMicroelectronics
> boards when the simple-framebuffer node is present in Linux device tree
> 
> 
> 
> Patrick Delaunay (7):
>   Convert CONFIG_LCD_DT_SIMPLEFB to Kconfig
>   common: rename lcd_simplefb.c file to fdt_simplefb.c
>   common: rename functions lcd_dt_simplefb to fdt_simplefb
>   video: Add video_is_active function
>   common: add fdt_simplefb_enable_and_mem_rsv function
>   video: stm32: stm32_ltdc: align framebuffer on 2MB
>   board: stm32mp1: enable simple framebuffer node for splashscreen
> 
>  board/raspberrypi/rpi/rpi.c               |  2 +-
>  board/st/stm32mp1/stm32mp1.c              |  4 +++
>  common/Kconfig                            |  9 ++++++
>  common/Makefile                           |  2 +-
>  common/{lcd_simplefb.c => fdt_simplefb.c} | 37 ++++++++++++++++++++---
>  configs/rpi_0_w_defconfig                 |  1 +
>  configs/rpi_2_defconfig                   |  1 +
>  configs/rpi_3_32b_defconfig               |  1 +
>  configs/rpi_3_b_plus_defconfig            |  1 +
>  configs/rpi_3_defconfig                   |  1 +
>  configs/rpi_4_32b_defconfig               |  1 +
>  configs/rpi_4_defconfig                   |  1 +
>  configs/rpi_arm64_defconfig               |  1 +
>  configs/rpi_defconfig                     |  1 +
>  configs/stm32mp15_basic_defconfig         |  1 +
>  configs/stm32mp15_defconfig               |  1 +
>  configs/stm32mp15_trusted_defconfig       |  1 +
>  drivers/video/stm32/stm32_ltdc.c          |  5 ++-
>  drivers/video/video-uclass.c              | 14 +++++++++
>  include/configs/rpi.h                     |  1 -
>  include/fdt_simplefb.h                    |  5 +--
>  include/video.h                           |  7 +++++
>  scripts/config_whitelist.txt              |  1 -
>  23 files changed, 87 insertions(+), 12 deletions(-)
>  rename common/{lcd_simplefb.c => fdt_simplefb.c} (65%)
> 

For the series, applied to u-boot-stm32/next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
