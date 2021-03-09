Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1433286B
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 15:21:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C375C57B53;
	Tue,  9 Mar 2021 14:21:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AF5FC57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 14:21:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129ED0M2021176; Tue, 9 Mar 2021 15:21:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tluGAWSq2rTjnNoVB2d7iZkeD7LXx7fqBHa5NeSxCzg=;
 b=ZetCPY++j7SsQFOOykgCMp+5kJQ48WtxE+S8L5kUpHf/mDXEfuhvCJ8eDtl+644qqfFq
 iLLZwhiasOIQC/C0OLP0PQ51jVOqdq2BNTUGjqBN+fYtl22ftMWlLQWA06oMunvU6R/8
 WzGfzBIE7dFWIB/3pMvphDWVInyhlFd+O3CkobRByyMCbi7NCW3Tj31/vqv++j1W3Gvi
 khkaiHcLGTkv6pvPvBaSvOEDCdg8/TP+FJ8h8U3mmYpRXibz0s/uRireu13bOoWrgYz4
 C05FzIphde6NT6ES6iE/dIlo1ZCDY/s7/e1rX6Rb19RUE/+H5kvLsZUJ+dwJcxzsup4y NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpj8p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 15:21:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63E6D100034;
 Tue,  9 Mar 2021 15:21:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FC93271189;
 Tue,  9 Mar 2021 15:21:51 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 15:21:16 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210301194052.1.Ic785baaeea3c0a6c77088a100ea10fbbda0b5bdf@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <fdf9e70a-dd4f-4a15-d8df-eb9ba8492b79@foss.st.com>
Date: Tue, 9 Mar 2021 15:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301194052.1.Ic785baaeea3c0a6c77088a100ea10fbbda0b5bdf@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: move bootdelay
 configuration in defconfig
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

On 3/1/21 7:40 PM, Patrick Delaunay wrote:
> The STM32MP15 boards have no reason to configure bootdelay in stm32mp1.h
> as it is already done with CONFIG_BOOTDELAY (default = 2) and in
> include/env_default.h.
> 
> This patch allows configuration for customers which reuse stm32mp1.h
> and reduce the size of the default environment.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp15_basic_defconfig       | 1 +
>  configs/stm32mp15_dhcom_basic_defconfig | 1 +
>  configs/stm32mp15_dhcor_basic_defconfig | 1 +
>  configs/stm32mp15_trusted_defconfig     | 1 +
>  include/configs/stm32mp1.h              | 1 -
>  5 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 1c680984b8..0864d4f252 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SPL_SPI_SUPPORT=y
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
> +CONFIG_BOOTDELAY=1
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SPL_LOG=y
>  CONFIG_BOARD_EARLY_INIT_F=y
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index ed285e9161..e36d34d001 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -19,6 +19,7 @@ CONFIG_FIT=y
>  CONFIG_SPL_LOAD_FIT=y
>  CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its"
>  # CONFIG_USE_SPL_FIT_GENERATOR is not set
> +CONFIG_BOOTDELAY=1
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_SPL_LEGACY_IMAGE_SUPPORT=y
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index a6620561ac..4794b1a14d 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -17,6 +17,7 @@ CONFIG_FIT=y
>  CONFIG_SPL_LOAD_FIT=y
>  CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its"
>  # CONFIG_USE_SPL_FIT_GENERATOR is not set
> +CONFIG_BOOTDELAY=1
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_SPL_LEGACY_IMAGE_SUPPORT=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 107041119f..4becdbb238 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -13,6 +13,7 @@ CONFIG_ENV_OFFSET_REDUND=0x2C0000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
> +CONFIG_BOOTDELAY=1
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>  CONFIG_SYS_PROMPT="STM32MP> "
>  CONFIG_CMD_ADTIMG=y
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index 36e400453e..db2117a3d7 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -160,7 +160,6 @@
>   * and the ramdisk at the end.
>   */
>  #define CONFIG_EXTRA_ENV_SETTINGS \
> -	"bootdelay=1\0" \
>  	"kernel_addr_r=0xc2000000\0" \
>  	"fdt_addr_r=0xc4000000\0" \
>  	"scriptaddr=0xc4100000\0" \
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
