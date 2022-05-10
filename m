Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C5520FED
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:45:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39C2DC035BE;
	Tue, 10 May 2022 08:45:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F709C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:45:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A8GImd021577;
 Tue, 10 May 2022 10:45:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6kszInmjnV9eQYFruh8GJVNf7wSkrvCUKD4hbsx4rLw=;
 b=IeCC1Pz2/R74xPT4QE0eMdQ5dWssPmOrtbGoErXD/uZKLBPJ2AP4gTu7IGy6JTArQHDq
 9DI19GvzV680pzaai2VZ8L//PGvdL91ZThcyv5gRpmJz6hFE2K4uHvRP5Zs9fTVJ0grj
 u2AvrG8DUngEJ1hSUYqfHkSX1pk1OGH7EWPOaNYAVLutAkFH1X2r6c245YTri7nTcVHY
 LvpPWbWQaB1xgtBbwgB29zlQQ8bmo1mBtLD7hr7f+tK/XptbxFA0swB2zttQwqnr0qxW
 ikGyEIHX9slN8nxBeS/9YxWXnZG+OjDkgaJ2ZEmNNz/hRtDxf40UD0ezqLySEDCJG/+N NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40xnt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:45:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21A13100034;
 Tue, 10 May 2022 10:45:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A6E3214D27;
 Tue, 10 May 2022 10:45:38 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:45:37 +0200
Message-ID: <bfea4918-0368-4a32-4a1a-51e7e7eee33f@foss.st.com>
Date: Tue, 10 May 2022 10:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-2-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220427115401.155400-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 01/12] configs: stm32f746-disco:
 Concatenate spl and u-boot binaries
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



On 4/27/22 13:53, Patrice Chotard wrote:
> This allows to concatenate spl and u-boot binaries together.
> Previously, both binaries has to be flashed separately at the correct
> offset (spl at offset 0 and u-boot at offset 0x8000).
> With this patch, only one binary is generated (u-boot-with-spl.bin)
> and has to be copied in flash at offset 0 using openocd for example
> or simply copied in exported mass storage.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  configs/stm32f746-disco_defconfig | 1 +
>  include/configs/stm32f746-disco.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
> index 130b90fae3..0133867942 100644
> --- a/configs/stm32f746-disco_defconfig
> +++ b/configs/stm32f746-disco_defconfig
> @@ -9,6 +9,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
>  CONFIG_SPL_TEXT_BASE=0x8000000
>  CONFIG_STM32F7=y
>  CONFIG_TARGET_STM32F746_DISCO=y
> +CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
>  CONFIG_SYS_LOAD_ADDR=0x8008000
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_BOOTDELAY=3
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index 8ad4bb99c8..b93acdcc1f 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -49,6 +49,7 @@
>  #define CONFIG_SYS_UBOOT_START		0x080083FD
>  #define CONFIG_SYS_UBOOT_BASE		(CONFIG_SYS_FLASH_BASE + \
>  					 CONFIG_SYS_SPL_LEN)
> +#define CONFIG_SPL_PAD_TO		0x8000
>  
>  /* DT blob (fdt) address */
>  #define CONFIG_SYS_FDT_BASE		(CONFIG_SYS_FLASH_BASE + \
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
