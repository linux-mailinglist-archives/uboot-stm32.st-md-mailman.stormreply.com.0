Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAEC3D725C
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 11:51:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4173BC58D5D;
	Tue, 27 Jul 2021 09:51:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DDF9C5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 09:51:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R9kOJN021902; Tue, 27 Jul 2021 11:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=J8XWP/wau8Wpi3Tkr2/VOT+L1uLV8RBSAwX9H8NCCbo=;
 b=DSVZBTlZGVui1HH368o4Ml+Il0C2nyIfDn8nmaro6UaWuLVIdAu3Xq6Zez3lv7XR0Ssb
 ua+cF6Mdw/H0kzlotgNl/MiFq9hMfF6b3rSXb3pOFhCBw164eaVMTq3nIiGU5h4ypnyM
 aFf3P0xHKLDzMV3alANbpfsEtfbSNteO9u5J2DhdVOT7uICCv7LpHNbhGBINIPS/jrtx
 qcZNXh/+a9Ch+lWGnQh2giu3Zc0DSmNkg6D3fGZnnNcZo1HiSbq8TgNlM0iV4rYR7mXy
 f9YY05zhteulAhQRHOZ3eQZXdkAAOgAjM3TQKcCFFOe9IyAYbV2Yt67rQsYZZ9lUddbQ Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a235n3ew5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 11:51:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8B7910002A;
 Tue, 27 Jul 2021 11:51:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9B7021D380;
 Tue, 27 Jul 2021 11:51:36 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 11:51:36 +0200
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>
References: <20210724153546.9778-1-xypron.glpk@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <c481032f-0099-c2b6-9b2f-f7cc3c1b1af4@foss.st.com>
Date: Tue, 27 Jul 2021 11:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210724153546.9778-1-xypron.glpk@gmx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 u-boot-board-maintainers@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/1] lib: disable CONFIG_SPL_HEXDUMP by
	default
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


On 7/24/21 5:35 PM, Heinrich Schuchardt wrote:
> CONFIG_HEXDUMP is needed to display UEFI variables using 'printenv -e'.
>
> Enabling CONFIG_SPL_HEXDUMP only makes sense for debugging purposes.
> Hence CONFIG_SPL_HEXDUMP should not be enabled by default.
>
> The following boards currently have CONFIG_SPL_HEXDUMP=y:
>
> axm_defconfig
> imx8mm-cl-iot-gate_defconfig
> imx8mm_venice_defconfig
> imxrt1020-evk_defconfig
> imxrt1050-evk_defconfig
> kontron_sl28_defconfig
> kp_imx53_defconfig
> lx2160ardb_tfa_stmm_defconfig
> mt7622_rfb_defconfig
> octeon_ebb7304_defconfig
> octeon_nic23_defconfig
> qemu_arm64_defconfig
> qemu_arm_defconfig
> qemu-riscv32_defconfig
> qemu-riscv32_smode_defconfig
> qemu-riscv64_defconfig
> qemu-riscv64_smode_defconfig
> qemu-x86_64_defconfig
> qemu-x86_defconfig
> sandbox64_defconfig
> sandbox_defconfig
> stm32mp15_basic_defconfig
> stm32mp15_trusted_defconfig
> synquacer_developerbox_defconfig
> taurus_defconfig
> xilinx_versal_virt_defconfig
>
> The patch only keeps it enabled on
>
> sandbox64_defconfig
> sandbox_defconfig
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>   configs/sandbox64_defconfig | 1 +
>   configs/sandbox_defconfig   | 1 +
>   lib/Kconfig                 | 1 -
>   3 files changed, 2 insertions(+), 1 deletion(-)
>

Acked-by: Patrick Delaunay <patrick.delaunay@foss.st.com> # for 
stm32mp15_*_defconfig


but it is strange for "stm32mp15_trusted_defconfig" as this 
configuration don't enable the SPL support(see after).


> diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
> index 5fb1da49e4..9e3c2d5e41 100644
> --- a/configs/sandbox64_defconfig
> +++ b/configs/sandbox64_defconfig
> @@ -233,6 +233,7 @@ CONFIG_CMD_DHRYSTONE=y
>   CONFIG_TPM=y
>   CONFIG_LZ4=y
>   CONFIG_ERRNO_STR=y
> +CONFIG_SPL_HEXDUMP=y
>   CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
>   CONFIG_EFI_CAPSULE_ON_DISK=y
>   CONFIG_EFI_CAPSULE_FIRMWARE_FIT=y
> diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
> index a1e77a511d..7e8694100c 100644
> --- a/configs/sandbox_defconfig
> +++ b/configs/sandbox_defconfig
> @@ -281,6 +281,7 @@ CONFIG_CMD_DHRYSTONE=y
>   CONFIG_TPM=y
>   CONFIG_LZ4=y
>   CONFIG_ERRNO_STR=y
> +CONFIG_SPL_HEXDUMP=y
>   CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
>   CONFIG_EFI_CAPSULE_ON_DISK=y
>   CONFIG_EFI_CAPSULE_FIRMWARE_FIT=y
> diff --git a/lib/Kconfig b/lib/Kconfig
> index ad4d75e0a4..b0ea4cf91c 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -559,7 +559,6 @@ config HEXDUMP
>   config SPL_HEXDUMP
>   	bool "Enable hexdump in SPL"
>   	depends on HEXDUMP

I think it should depends on SPL alos

+ depends on SPL && HEXDUMP


> -	default y
>   	help
>   	  This enables functions for printing dumps of binary data in
>   	  SPL.
> --
> 2.30.2
>

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
