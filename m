Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B99A1192
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:29:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ED19C78032;
	Wed, 16 Oct 2024 18:29:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74216C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:29:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GCtGPR005320;
 Wed, 16 Oct 2024 20:29:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OJ3N8L2APTfUnRQqxN3g2wzZqPF+3SEn6gK1SOkQ7r4=; b=Rejy911hQW1bwlWE
 7RDN1ueQnwxkrMufBfcmJUMSP22yIuAqRS85yU21ab+JZL0P4TE5nrZ63ZPQSXC2
 7m/9rrSJ0HnaGvNxkzErSD1Fn56vpoV+oY5sPctGw7oGxYPhtnWtiO690mtXQ3nc
 iZyyQzmFt+YuRUDdsg5RoaUa/M+ybQuzzr7Gq7hXKSbsWCHQZXARKD+cNxJ5Wo1T
 7wMUakA2bqiYOOuzdarUhrdV9nUULAJgOx6ure6jJlQW5FcYA+rng5QeXs4QGxAE
 R2fMjRSulylJQv9TdO+IwouL/BJgmoqPHjYTFM2gj+e5ihr6hSDclEJlkKPXurxJ
 9pXMNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 427ehgcp93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:29:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DAC414004C;
 Wed, 16 Oct 2024 20:28:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A09C26899E;
 Wed, 16 Oct 2024 20:28:12 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 20:28:11 +0200
Message-ID: <5d8d01c2-6887-413c-8860-fcc99544f602@foss.st.com>
Date: Wed, 16 Oct 2024 20:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20241016195306.1.I7d090b2b98b91f6e009a5c570bbf71cd73caf2be@changeid>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241016195306.1.I7d090b2b98b91f6e009a5c570bbf71cd73caf2be@changeid>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: cosmetic: remove empty comment
 block in configs file
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

On 10/16/24 19:54, Patrick Delaunay wrote:
> This is cosmetic change.
>
> Remove the empty comment blocks remaining after conversion to Kconfig
> of CONFIG_SYS_MAX_NAND_DEVICE and CONFIG_SERVERIP.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   include/configs/stm32mp13_common.h | 2 --
>   include/configs/stm32mp15_common.h | 4 ----
>   2 files changed, 6 deletions(-)
>
> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
> index 5b0658ced927..3e3f49abae06 100644
> --- a/include/configs/stm32mp13_common.h
> +++ b/include/configs/stm32mp13_common.h
> @@ -21,8 +21,6 @@
>    */
>   #define CFG_SYS_BOOTMAPSZ		SZ_256M
>   
> -/* NAND support */
> -
>   /*****************************************************************************/
>   #ifdef CONFIG_DISTRO_DEFAULTS
>   /*****************************************************************************/
> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
> index af6dd4a8095a..9cac31bcf472 100644
> --- a/include/configs/stm32mp15_common.h
> +++ b/include/configs/stm32mp15_common.h
> @@ -21,10 +21,6 @@
>    */
>   #define CFG_SYS_BOOTMAPSZ		SZ_256M
>   
> -/* NAND support */
> -
> -/* Ethernet need */
> -
>   #define STM32MP_FIP_IMAGE_GUID \
>   	EFI_GUID(0x19d5df83, 0x11b0, 0x457b, 0xbe, 0x2c, \
>   		 0x75, 0x59, 0xc1, 0x31, 0x42, 0xa5)


minor cosmetic

Applied to u-boot-stm/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
