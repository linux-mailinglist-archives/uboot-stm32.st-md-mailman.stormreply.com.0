Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE7421F35
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Oct 2021 09:02:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC1BDC5AB7C;
	Tue,  5 Oct 2021 07:02:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8BBFC5AB74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 07:02:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19567wqQ015249; 
 Tue, 5 Oct 2021 09:01:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HA1J7rwZ7XJMhNW3RNfEnoYhi/5JjTJChxpoki6zqnk=;
 b=ZFklmNOiHYiwpOciq+8VWp/9P2ocLh/szZ6ZvVa/MfKnhQ3dXwazkPDAJLCmbOWrPlsp
 8z6SkcIBz6kS41tzjH1gQ8d+huKxp5RoTwWoIvVRy638novviVFCDrGZtozxqulyU6NO
 GhewutPOLhkcZWa7RAtXbBtCn7S8+5p11pUmp2vycqncESMQ1iPKtI6D+cMO5HNIc08+
 bXkTr7WX7uWwUhUwxuohHwnqf1q76kridgfy0C/j1qhmYhF6fjnyY1nE92pkTBAI98Vx
 HzQwZ+rKn8CunWz/FX6RHjzfjQRst6H8FDW6dggIjOtO6rkbkBfgrkLUnbJeJRqjyuSb Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bg6bu2r11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 09:01:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76CFB100034;
 Tue,  5 Oct 2021 09:01:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2DD5621CA8F;
 Tue,  5 Oct 2021 09:01:56 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 5 Oct
 2021 09:01:55 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211004112322.1.Ibee20141b9082ea184cc316944070e647a60fc92@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <bd94b9b2-987b-420f-dc77-e1d85d2da0fa@foss.st.com>
Date: Tue, 5 Oct 2021 09:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004112322.1.Ibee20141b9082ea184cc316944070e647a60fc92@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Rick Chen <rick@andestech.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ian Ray <ian.ray@ge.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Sean Anderson <seanga2@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: Move some usb config in defconfig
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

HI Patrick

On 10/4/21 11:23 AM, Patrick Delaunay wrote:
> Using the tools moveconfig.py to move the following config in the
> defconfig files:
>  CONFIG_USB_HOST_ETHER
>  CONFIG_USB_ETHER_ASIX
>  CONFIG_USB_ETHER_MCS7830
>  CONFIG_USB_ETHER_SMSC95XX
> 
> These option are already migrated since the commit f58ad98a621c ("usb: net:
> migrate USB Ethernet adapters to Kconfig") and the commit ae3584498bf8
> ("usb: net: migrate CONFIG_USB_HOST_ETHER to Kconfig").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/dh_imx6_defconfig       | 2 ++
>  configs/kp_imx6q_tpc_defconfig  | 2 ++
>  configs/mx53ppd_defconfig       | 4 ++++
>  configs/stih410-b2260_defconfig | 4 ++++
>  include/configs/dh_imx6.h       | 2 --
>  include/configs/kp_imx6q_tpc.h  | 2 --
>  include/configs/mx53ppd.h       | 4 ----
>  include/configs/stih410-b2260.h | 5 -----
>  8 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/configs/dh_imx6_defconfig b/configs/dh_imx6_defconfig
> index eb588b68d3..abbb6412e8 100644
> --- a/configs/dh_imx6_defconfig
> +++ b/configs/dh_imx6_defconfig
> @@ -97,6 +97,8 @@ CONFIG_MXC_SPI=y
>  CONFIG_SYSRESET=y
>  CONFIG_SYSRESET_WATCHDOG=y
>  CONFIG_USB=y
> +CONFIG_USB_HOST_ETHER=y
> +CONFIG_USB_ETHER_ASIX=y
>  CONFIG_USB_GADGET=y
>  CONFIG_USB_GADGET_MANUFACTURER="dh"
>  CONFIG_USB_GADGET_VENDOR_NUM=0x0525
> diff --git a/configs/kp_imx6q_tpc_defconfig b/configs/kp_imx6q_tpc_defconfig
> index 85fdfad834..bcaa82ab89 100644
> --- a/configs/kp_imx6q_tpc_defconfig
> +++ b/configs/kp_imx6q_tpc_defconfig
> @@ -76,5 +76,7 @@ CONFIG_SYSRESET_WATCHDOG=y
>  CONFIG_IMX_THERMAL=y
>  CONFIG_USB=y
>  # CONFIG_SPL_DM_USB is not set
> +CONFIG_USB_HOST_ETHER=y
> +CONFIG_USB_ETHER_ASIX=y
>  CONFIG_WATCHDOG_TIMEOUT_MSECS=60000
>  CONFIG_IMX_WATCHDOG=y
> diff --git a/configs/mx53ppd_defconfig b/configs/mx53ppd_defconfig
> index 081707f27e..5f39df85ef 100644
> --- a/configs/mx53ppd_defconfig
> +++ b/configs/mx53ppd_defconfig
> @@ -70,6 +70,10 @@ CONFIG_SYSRESET=y
>  CONFIG_SYSRESET_WATCHDOG=y
>  CONFIG_USB=y
>  CONFIG_USB_EHCI_MX5=y
> +CONFIG_USB_HOST_ETHER=y
> +CONFIG_USB_ETHER_ASIX=y
> +CONFIG_USB_ETHER_MCS7830=y
> +CONFIG_USB_ETHER_SMSC95XX=y
>  CONFIG_DM_VIDEO=y
>  CONFIG_SYS_WHITE_ON_BLACK=y
>  CONFIG_VIDEO_IPUV3=y
> diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
> index d5ec00e1e0..a7ad277066 100644
> --- a/configs/stih410-b2260_defconfig
> +++ b/configs/stih410-b2260_defconfig
> @@ -53,6 +53,10 @@ CONFIG_USB_EHCI_GENERIC=y
>  CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_GENERIC=y
>  CONFIG_USB_DWC3=y
> +CONFIG_USB_HOST_ETHER=y
> +CONFIG_USB_ETHER_ASIX=y
> +CONFIG_USB_ETHER_MCS7830=y
> +CONFIG_USB_ETHER_SMSC95XX=y
>  CONFIG_USB_GADGET=y
>  CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
>  CONFIG_USB_GADGET_VENDOR_NUM=0x483
> diff --git a/include/configs/dh_imx6.h b/include/configs/dh_imx6.h
> index 7af8fceb71..ee56eb691a 100644
> --- a/include/configs/dh_imx6.h
> +++ b/include/configs/dh_imx6.h
> @@ -50,8 +50,6 @@
>  /* USB Configs */
>  #ifdef CONFIG_CMD_USB
>  #define CONFIG_EHCI_HCD_INIT_AFTER_RESET
> -#define CONFIG_USB_HOST_ETHER
> -#define CONFIG_USB_ETHER_ASIX
>  #define CONFIG_MXC_USB_PORTSC		(PORT_PTS_UTMI | PORT_PTS_PTW)
>  #define CONFIG_MXC_USB_FLAGS		0
>  #define CONFIG_USB_MAX_CONTROLLER_COUNT	2 /* Enabled USB controller number */
> diff --git a/include/configs/kp_imx6q_tpc.h b/include/configs/kp_imx6q_tpc.h
> index 8471dffe83..3061c96e76 100644
> --- a/include/configs/kp_imx6q_tpc.h
> +++ b/include/configs/kp_imx6q_tpc.h
> @@ -23,8 +23,6 @@
>  /* USB Configs */
>  #ifdef CONFIG_CMD_USB
>  #define CONFIG_EHCI_HCD_INIT_AFTER_RESET
> -#define CONFIG_USB_HOST_ETHER
> -#define CONFIG_USB_ETHER_ASIX
>  #define CONFIG_MXC_USB_PORTSC		(PORT_PTS_UTMI | PORT_PTS_PTW)
>  #define CONFIG_MXC_USB_FLAGS		0
>  #define CONFIG_USB_MAX_CONTROLLER_COUNT	2 /* Enabled USB controller number */
> diff --git a/include/configs/mx53ppd.h b/include/configs/mx53ppd.h
> index b623242256..f8118818b0 100644
> --- a/include/configs/mx53ppd.h
> +++ b/include/configs/mx53ppd.h
> @@ -14,10 +14,6 @@
>  #define CONFIG_SYS_FSL_CLK
>  
>  /* USB Configs */
> -#define CONFIG_USB_HOST_ETHER
> -#define CONFIG_USB_ETHER_ASIX
> -#define CONFIG_USB_ETHER_MCS7830
> -#define CONFIG_USB_ETHER_SMSC95XX
>  #define CONFIG_MXC_USB_PORT	1
>  #define CONFIG_MXC_USB_PORTSC	(PORT_PTS_UTMI | PORT_PTS_PTW)
>  #define CONFIG_MXC_USB_FLAGS	0
> diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
> index b1917c9d3f..2fe0900e9f 100644
> --- a/include/configs/stih410-b2260.h
> +++ b/include/configs/stih410-b2260.h
> @@ -57,11 +57,6 @@
>  #define CONFIG_USB_OHCI_NEW
>  #define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	2
>  
> -#define CONFIG_USB_HOST_ETHER
> -#define CONFIG_USB_ETHER_ASIX
> -#define CONFIG_USB_ETHER_MCS7830
> -#define CONFIG_USB_ETHER_SMSC95XX
> -
>  /* NET Configs */
>  
>  #endif /* __CONFIG_H */
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
