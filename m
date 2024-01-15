Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DF82DE96
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 18:42:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB27DC6B457;
	Mon, 15 Jan 2024 17:42:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87921C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 17:42:19 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FDU0NA021553; Mon, 15 Jan 2024 18:42:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=s1q66G7043sYJvF6jBzsBt/8C3bNHFiI3gM+7akYBaI=; b=z7
 geCC2xp1rjyt1SsTp1YnQj07tnX2E8LOv78b4YIht9gZDRrXsTgazg38aXmpysj1
 g/Jve2Fs2neuJamrUfr+zZzMovM7Tf4b4NhwKC7oKsKDo/2Gp2OWanzVQuNQP66l
 9q1kVaRLpGKVoaxFAYn5BATsrWjzfhiGuk4VmbJ1QGurT1tIL2d6/LSB5o6ASN6u
 z7KaOuvpU+LGfQeByFBInHwdkKp/gjGvW7OadPFXf+gKVbYcwec2Zkg5rYxKQD3h
 we3lY5C2mhbSoOX2GhveYjuJv/ZA3ZqcfcxL5fC6ylSzhazWbuMMM4VhdDRyoXtJ
 NxV19uKNFEvsW2l/APEQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y4qs9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 18:42:17 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C7BA100057;
 Mon, 15 Jan 2024 18:42:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 634DD290FC1;
 Mon, 15 Jan 2024 18:42:17 +0100 (CET)
Received: from [10.201.20.205] (10.201.20.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 18:42:16 +0100
Message-ID: <dae41bd1-7d12-47c4-99bd-4638c8888b13@foss.st.com>
Date: Mon, 15 Jan 2024 18:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.10.I7e8d4ae242605f7c9d276a858f336d13681528d9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240115150451.v2.10.I7e8d4ae242605f7c9d276a858f336d13681528d9@changeid>
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Simon Glass <sjg@chromium.org>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 10/14] stm32mp: activate the command
 stboard for stm32mp25 boards
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



On 1/15/24 15:05, Patrick Delaunay wrote:
> Activate the command stboard for stm32mp25 STMicroelectronics boards,
> add the default used OTP identifier and the associated board identifier:
> - stm32mp25xx-ev1 = MB1936
> - stm32mp25xx-dk = MB1605
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - fix CONFIG name with 'x': TARGET_ST_STM32MP15x TARGET_ST_STM32MP13x
> 
>  arch/arm/mach-stm32mp/include/mach/stm32.h | 1 +
>  board/st/common/Kconfig                    | 2 +-
>  board/st/common/cmd_stboard.c              | 2 ++
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 45c929aa605d..726c390977e3 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -198,6 +198,7 @@ enum forced_boot_mode {
>  #define BSEC_OTP_SERIAL	5
>  #define BSEC_OTP_RPN	9
>  #define BSEC_OTP_PKG	122
> +#define BSEC_OTP_BOARD	246
>  #define BSEC_OTP_MAC	247
>  #endif
>  
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index c1c254d07354..f40d1a78ca36 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -1,7 +1,7 @@
>  config CMD_STBOARD
>  	bool "stboard - command for OTP board information"
>  	depends on ARCH_STM32MP
> -	default y if TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
> +	default y if TARGET_ST_STM32MP25X || TARGET_ST_STM32MP15x || TARGET_ST_STM32MP13x
>  	help
>  	  This compile the stboard command to
>  	  read and write the board in the OTP.
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index 853ab78bbf16..cb103e69b369 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -49,7 +49,9 @@ static bool check_stboard(u16 board)
>  		0x1298,
>  		0x1341,
>  		0x1497,
> +		0x1605, /* stm32mp25xx-dk */
>  		0x1635,
> +		0x1936, /* stm32mp25xx-ev1 */
>  	};
>  
>  	for (i = 0; i < ARRAY_SIZE(st_board_id); i++)
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
