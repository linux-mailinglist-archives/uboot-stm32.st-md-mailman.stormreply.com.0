Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81BA6E184
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 18:50:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FF0BC7802F;
	Mon, 24 Mar 2025 17:50:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCF9CC7801E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1742838630; x=1743443430; i=xypron.glpk@gmx.de;
 bh=Qx4B6wm4bfj0k9vOM1XsJ+RRp02TRWnyAaBUbcckkes=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=okSBouVuimHIfbJJvtuk89VCwSwSdvveRITKvh2YR1FK0lLDuLUf8Pmhlzt1PFam
 HzEsuOqlTcOarpX6co5NcBYQLvuNsXyFLhdmleV4vc9ncfDZhl9Bg9LR1ve3Gb0QE
 fpX0dHd2LVtRfnGYRaZAmKXmgEohfcrNH021agAQWEwwLZRejYrAG1r5dnZ/AmbrA
 XN6muZxCbHuXSJAyq5OI+zVV4+aLOzhk6imNoSVbmsVkoVb9+j/mJ5lih+dhAKuA/
 caw3mE7bIjnSLCeSkXBir7JnZhUSeNWrd7EfuNVHAMtvhS4eG25pbE5BYho7JXcNO
 6pgd/zlUYtUkGYaSNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.103.102] ([5.147.80.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1szbZd1rfn-00sd3j; Mon, 24
 Mar 2025 18:50:30 +0100
Message-ID: <380f1f2c-59cd-4c52-a598-5e6f1ed1dcad@gmx.de>
Date: Mon, 24 Mar 2025 18:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
Content-Language: en-US
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20250317133845.138061-1-ilias.apalodimas@linaro.org>
X-Provags-ID: V03:K1:k6U/0KwRV/2YDtVzRWbW42pyOb5J2Vqo6OgOs75Ix5Ij9BmHGHB
 pIigmgeRuk9+5Fk2cDmDtxrQ3GRrB9Tyi8n7LZp9Cm7dopLlaeEHu9f9wklHg2oAxW8P3VS
 9ww1u/K0CenxUAtstn5vcOX+OxPT0aRaEWYpDzRrgRsH5iqCjiOR1z3bpjG1VuHormQ3qkB
 mQAVCFP9QUCyNSOU3v+PA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zNe0lvPJj8w=;//i+JWRhH7Ei5w/iSTxJdO7h/YJ
 vW/ZQBp5xEcNuztp26hmm7iemPDFjb366JqUeMstZcY1JS8cbtG81PXWm0EHhb8xNNr50yx0e
 wPQCkHEPi4eVk25/0lB4pcko1gOXL7eiwlF1Fk9zTzde2XaNi2mVQ76V8rKXzi4reENlW/MmY
 hW01Gq1NNTkWULV03OVx2w0p0Xqu33YoTf0zR1zzgMSGz0+xghiCmythI91hK3PvNJHt+3DAi
 Dtzwpgs7BOShj4Rfjldt8S4Q4CzQVtR2/o1tEDTvfptPZhIvv1W0DRquJ1h3sIObdnZXXOrQo
 HLYqxV0jK/PIexyawsDbYercVI0fEJPFo8/JXTcCXkeRP+IZOfT50dxR9nfaBbJxeGwPcJMjC
 gJYUdZVaWhJnSaS5ngSp9oOJWphf7hJVf/ptMhPe4Vh8cvFpKlY5JdJbSfq5SOoMbOxKE1ycR
 v82UZadoPfRvM2esxeUpaHosNcpTekjv3tb/qdULnTFgfSDcqQ3fPQ77cn8uhQosaSWlxdwCu
 BSNxwJ+VjGRSmEjpkMUWQIulfoBLkmnqMWG6TqwVHFPPPn94IL7Jbrkt8fpp9wZO+Lpw9Kmn3
 faYGjpeQrklZjWbI1FGyReevIkuVEAunNfTjWnB6qxb79od8ag0lx2W/VSufdvJlNvzBapyU2
 nmwjBha/WvWQ1IsuOTZtXO2eSTMu8xdByhZxYtuC7oHsAmRXW8+869lVlC0LOXnXMhbekZU9p
 wafQwWUKgTfiPrzpd5JUSnTwXDwQsmkcIZLDJTgbgmqnMtTnM3Q5wnhJTLPnl8yc0Heg5f2t7
 9K/vZs4jKYrCn3h+mxEempiIF1VmePIRJfpXqIk/7yIDnyPOj/KiwcftoH2Bl6jypRrQ5mBix
 nKFePn+t9BqMFdRMJzuDknO6IyBDCDdMmcKoQt6ZXQXcS+aRoC0r+jL7NUVU4O59ro/derGOV
 NKPAlSrK/Bx86gIGP+bxnY4Efbsi1E/tvn5+ZXG2T88e5a4QnkKiNVKHXIxwZ4AUmgtW4gaSG
 GBVhFWq02f1DLu5OylcIVLtp7JcdpN81idV9mZb64QIRATmhmzXOP9t3LBkttYjBFfU7sv5Xo
 Rvpwwine+iNnw2/gw+TZeBqFgsmSmC+Y+HLBbHqJO1cgwNjC6eZAmBXgpSQ3a159u8B4QJNi0
 UhVxpPaPJxV1rWlEwHJWhSdG9YUcW9+vkSJ9xW4m2xxCSrXZK8P8W0jq7z1Xe2qKkk/TX2dY1
 IWwxeISSxsHM13bTDJZbh3tZYmQMPEZU/T0CS/R5i1MVS2+oDAAiHEwnNRn4GGwNWtAdKVM3z
 L6VreKBRRZLfyndn5uM37ouPhSJ/H2ZZKJOAcdNFYcrfxquBBWhEIinX7hcM/f4HAPXYg8pmf
 G9HpwvU9uO12cK5Gy8BG5HW+bfGFRiOWzeBHc7bpg1wRo3ZoPcoCyvF0bu59UIWixdT/DkjlO
 CGaDYcM30joSOv9P/5wpYVMsFNs0=
Cc: Peng Fan <peng.fan@nxp.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, u-boot@lists.denx.de,
 Wei Ming Chen <jj251510319013@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Tom Rini <trini@konsulko.com>,
 Udit Agarwal <udit.agarwal@nxp.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Manish Tomar <Manish.Tomar@nxp.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Wasim Khan <wasim.khan@nxp.com>,
 Mathew McBride <matt@traverse.com.au>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Tien Fong Chee <tien.fong.chee@altera.com>, e@freeshell.de,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Adriano Cordova <adrianox@gmail.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Sumit Garg <sumit.garg@kernel.org>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@intel.com>,
 Lukas Funke <lukas.funke@weidmueller.com>,
 Robert Marko <robert.marko@sartura.hr>, Michal Simek <michal.simek@amd.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tang Yuantian <andy.tang@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Maks Mishin <maks.mishinfz@gmail.com>,
 Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: remove EFI_BOUNCE_BUFFER
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

On 17.03.25 14:38, Ilias Apalodimas wrote:

%s/EFI_BOUNCE_BUFFER/CONFIG_EFI_LOADER_BOUNCE_BUFFER/

> The EFI subsystem defines its own bounce buffer for devices that
> can't transfer data > 4GB. U-Boot already has a generic BOUNCE_BUFFER
> which can be reused instead of defining another symbol.
> The only limitation for EFI is that we don't know how big the file a user
> chooses to transfer is and as a result we can't depend on allocating the
> memory from the malloc area, which can prove too small.
>
> So allocate an EFI buffer of the correct size and pass it to the DM,
> which already supports bounce buffering via bounce_buffer_start_extalign()

Looking at

     if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && desc->bb) {

in drivers/block/blk-uclass.c the bounce buffer has to be explicitly
enabled by the device driver. Only the scsi drivers sets bb = true.

Cf. 81bd22e935dc ("rockchip: block: blk-uclass: add bounce buffer flag
to blk_desc")

Which device-drivers of the boards mentioned below do actually need
bounce buffering?

Best regards

Heinrich

>
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
>   arch/arm/Kconfig                              |  8 ++
>   configs/ls1028aqds_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/ls1028aqds_tfa_defconfig              |  1 -
>   configs/ls1028aqds_tfa_lpuart_defconfig       |  1 -
>   configs/ls1028ardb_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/ls1028ardb_tfa_defconfig              |  1 -
>   configs/ls1043ardb_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/ls1043ardb_tfa_defconfig              |  1 -
>   configs/ls1046ardb_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/ls1046ardb_tfa_defconfig              |  1 -
>   configs/ls1088aqds_tfa_defconfig              |  1 -
>   configs/ls1088ardb_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/ls1088ardb_tfa_defconfig              |  1 -
>   configs/ls2088aqds_tfa_defconfig              |  1 -
>   configs/ls2088ardb_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/ls2088ardb_tfa_defconfig              |  1 -
>   configs/lx2160aqds_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/lx2160aqds_tfa_defconfig              |  1 -
>   configs/lx2160ardb_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/lx2160ardb_tfa_defconfig              |  1 -
>   configs/lx2160ardb_tfa_stmm_defconfig         |  1 -
>   configs/lx2162aqds_tfa_SECURE_BOOT_defconfig  |  1 -
>   configs/lx2162aqds_tfa_defconfig              |  1 -
>   .../lx2162aqds_tfa_verified_boot_defconfig    |  1 -
>   configs/ten64_tfa_defconfig                   |  1 -
>   include/efi_loader.h                          |  4 -
>   lib/efi_loader/Kconfig                        |  7 --
>   lib/efi_loader/efi_disk.c                     | 78 +++++++------------
>   lib/efi_loader/efi_memory.c                   | 16 ----
>   29 files changed, 36 insertions(+), 101 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index cf08fe63f1e7..bb946e69254c 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1417,6 +1417,7 @@ config TARGET_LS2080A_EMU
>   	select ARCH_LS2080A
>   	select ARM64
>   	select ARMV8_MULTIENTRY
> +	select BOUNCE_BUFFER
>   	select FSL_DDR_SYNC_REFRESH
>   	select GPIO_EXTRA_HEADER
>   	help
> @@ -1432,6 +1433,7 @@ config TARGET_LS1088AQDS
>   	select ARMV8_MULTIENTRY
>   	select ARCH_SUPPORT_TFABOOT
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select GPIO_EXTRA_HEADER
>   	select SUPPORT_SPL
>   	select FSL_DDR_INTERACTIVE if !SD_BOOT
> @@ -1448,6 +1450,7 @@ config TARGET_LS2080AQDS
>   	select ARMV8_MULTIENTRY
>   	select ARCH_SUPPORT_TFABOOT
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select GPIO_EXTRA_HEADER
>   	select SUPPORT_SPL
>   	imply SCSI
> @@ -1467,6 +1470,7 @@ config TARGET_LS2080ARDB
>   	select ARMV8_MULTIENTRY
>   	select ARCH_SUPPORT_TFABOOT
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select SUPPORT_SPL
>   	select FSL_DDR_BIST
>   	select FSL_DDR_INTERACTIVE if !SPL
> @@ -1485,6 +1489,7 @@ config TARGET_LS2081ARDB
>   	select ARM64
>   	select ARMV8_MULTIENTRY
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select GPIO_EXTRA_HEADER
>   	select SUPPORT_SPL
>   	help
> @@ -1500,6 +1505,7 @@ config TARGET_LX2160ARDB
>   	select ARMV8_MULTIENTRY
>   	select ARCH_SUPPORT_TFABOOT
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select GPIO_EXTRA_HEADER
>   	help
>   	  Support for NXP LX2160ARDB platform.
> @@ -1514,6 +1520,7 @@ config TARGET_LX2160AQDS
>   	select ARMV8_MULTIENTRY
>   	select ARCH_SUPPORT_TFABOOT
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select GPIO_EXTRA_HEADER
>   	help
>   	  Support for NXP LX2160AQDS platform.
> @@ -1529,6 +1536,7 @@ config TARGET_LX2162AQDS
>   	select ARMV8_MULTIENTRY
>   	select ARCH_SUPPORT_TFABOOT
>   	select BOARD_LATE_INIT
> +	select BOUNCE_BUFFER
>   	select GPIO_EXTRA_HEADER
>   	help
>   	  Support for NXP LX2162AQDS platform.
> diff --git a/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
> index 97eb7d9dca4c..e3b1018f6f8e 100644
> --- a/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
> +++ b/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
> @@ -23,7 +23,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1028aqds_tfa_defconfig b/configs/ls1028aqds_tfa_defconfig
> index cc53c17f543b..5b7dd4bf7dd5 100644
> --- a/configs/ls1028aqds_tfa_defconfig
> +++ b/configs/ls1028aqds_tfa_defconfig
> @@ -25,7 +25,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1028aqds_tfa_lpuart_defconfig b/configs/ls1028aqds_tfa_lpuart_defconfig
> index 8da7271c7f85..a38c81e83199 100644
> --- a/configs/ls1028aqds_tfa_lpuart_defconfig
> +++ b/configs/ls1028aqds_tfa_lpuart_defconfig
> @@ -24,7 +24,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
> index 3f71a37559be..da225e1dad8f 100644
> --- a/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
> +++ b/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
> @@ -23,7 +23,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1028ardb_tfa_defconfig b/configs/ls1028ardb_tfa_defconfig
> index 89e452bdb1a8..829cc5204d34 100644
> --- a/configs/ls1028ardb_tfa_defconfig
> +++ b/configs/ls1028ardb_tfa_defconfig
> @@ -25,7 +25,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
> index 1b41fe608dae..04ca2a3afd81 100644
> --- a/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
> +++ b/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
> @@ -24,7 +24,6 @@ CONFIG_PCIE2=y
>   CONFIG_PCIE3=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1043ardb_tfa_defconfig b/configs/ls1043ardb_tfa_defconfig
> index ca100bd4bca9..a6ca63cd8f79 100644
> --- a/configs/ls1043ardb_tfa_defconfig
> +++ b/configs/ls1043ardb_tfa_defconfig
> @@ -26,7 +26,6 @@ CONFIG_PCIE2=y
>   CONFIG_PCIE3=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
> index 6b4e834ad4a0..9c22d542a6f8 100644
> --- a/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
> +++ b/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
> @@ -24,7 +24,6 @@ CONFIG_PCIE2=y
>   CONFIG_PCIE3=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1046ardb_tfa_defconfig b/configs/ls1046ardb_tfa_defconfig
> index a8f20f9b87b7..4eab8ea19e8e 100644
> --- a/configs/ls1046ardb_tfa_defconfig
> +++ b/configs/ls1046ardb_tfa_defconfig
> @@ -26,7 +26,6 @@ CONFIG_PCIE2=y
>   CONFIG_PCIE3=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ls1088aqds_tfa_defconfig b/configs/ls1088aqds_tfa_defconfig
> index df86bf982ee4..31d56f587af8 100644
> --- a/configs/ls1088aqds_tfa_defconfig
> +++ b/configs/ls1088aqds_tfa_defconfig
> @@ -29,7 +29,6 @@ CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
> index df472eeb404d..c910b73634f9 100644
> --- a/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
> +++ b/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
> @@ -26,7 +26,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/ls1088ardb_tfa_defconfig b/configs/ls1088ardb_tfa_defconfig
> index 8d640f6594b2..682007e803d1 100644
> --- a/configs/ls1088ardb_tfa_defconfig
> +++ b/configs/ls1088ardb_tfa_defconfig
> @@ -28,7 +28,6 @@ CONFIG_SYS_MEMTEST_START=0x80000000
>   CONFIG_SYS_MEMTEST_END=0x9fffffff
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/ls2088aqds_tfa_defconfig b/configs/ls2088aqds_tfa_defconfig
> index 8c86b8b11eb3..ea73a4cda971 100644
> --- a/configs/ls2088aqds_tfa_defconfig
> +++ b/configs/ls2088aqds_tfa_defconfig
> @@ -23,7 +23,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig b/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
> index 3fd1de967896..7f53397cdcb1 100644
> --- a/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
> +++ b/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
> @@ -27,7 +27,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/ls2088ardb_tfa_defconfig b/configs/ls2088ardb_tfa_defconfig
> index f053044fa56e..398dfe068015 100644
> --- a/configs/ls2088ardb_tfa_defconfig
> +++ b/configs/ls2088ardb_tfa_defconfig
> @@ -29,7 +29,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig b/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
> index 321ed71993b8..afb842978209 100644
> --- a/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
> +++ b/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
> @@ -28,7 +28,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_OF_BOARD_SETUP=y
>   CONFIG_OF_STDOUT_VIA_ALIAS=y
> diff --git a/configs/lx2160aqds_tfa_defconfig b/configs/lx2160aqds_tfa_defconfig
> index 465f07ee7f82..ec23ed384c44 100644
> --- a/configs/lx2160aqds_tfa_defconfig
> +++ b/configs/lx2160aqds_tfa_defconfig
> @@ -30,7 +30,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig b/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
> index 478a01b566c6..71f4436eca06 100644
> --- a/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
> +++ b/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
> @@ -29,7 +29,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_OF_BOARD_SETUP=y
>   CONFIG_OF_STDOUT_VIA_ALIAS=y
> diff --git a/configs/lx2160ardb_tfa_defconfig b/configs/lx2160ardb_tfa_defconfig
> index 8fd18825569c..6be3890de3ed 100644
> --- a/configs/lx2160ardb_tfa_defconfig
> +++ b/configs/lx2160ardb_tfa_defconfig
> @@ -31,7 +31,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/lx2160ardb_tfa_stmm_defconfig b/configs/lx2160ardb_tfa_stmm_defconfig
> index cf65897af898..ef89b0f34575 100644
> --- a/configs/lx2160ardb_tfa_stmm_defconfig
> +++ b/configs/lx2160ardb_tfa_stmm_defconfig
> @@ -32,7 +32,6 @@ CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
>   CONFIG_EFI_MM_COMM_TEE=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig b/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig
> index 46b6085a52fe..2b31be10899b 100644
> --- a/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig
> +++ b/configs/lx2162aqds_tfa_SECURE_BOOT_defconfig
> @@ -28,7 +28,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_OF_BOARD_SETUP=y
>   CONFIG_OF_STDOUT_VIA_ALIAS=y
> diff --git a/configs/lx2162aqds_tfa_defconfig b/configs/lx2162aqds_tfa_defconfig
> index 41e0262f3ca5..43f8069cfde5 100644
> --- a/configs/lx2162aqds_tfa_defconfig
> +++ b/configs/lx2162aqds_tfa_defconfig
> @@ -30,7 +30,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
>   CONFIG_OF_BOARD_SETUP=y
> diff --git a/configs/lx2162aqds_tfa_verified_boot_defconfig b/configs/lx2162aqds_tfa_verified_boot_defconfig
> index 7abfdbafbdf1..33b362c20b65 100644
> --- a/configs/lx2162aqds_tfa_verified_boot_defconfig
> +++ b/configs/lx2162aqds_tfa_verified_boot_defconfig
> @@ -30,7 +30,6 @@ CONFIG_FSL_QIXIS=y
>   CONFIG_REMAKE_ELF=y
>   CONFIG_MP=y
>   CONFIG_DYNAMIC_SYS_CLK_FREQ=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_SIGNATURE=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTDELAY=10
> diff --git a/configs/ten64_tfa_defconfig b/configs/ten64_tfa_defconfig
> index a65209e8335b..f35de31718f7 100644
> --- a/configs/ten64_tfa_defconfig
> +++ b/configs/ten64_tfa_defconfig
> @@ -16,7 +16,6 @@ CONFIG_PCI=y
>   CONFIG_AHCI=y
>   CONFIG_SYS_FSL_NUM_CC_PLLS=3
>   CONFIG_MP=y
> -CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
>   CONFIG_FIT_VERBOSE=y
>   CONFIG_BOOTSTD_FULL=y
>   CONFIG_BOOTSTD_BOOTCOMMAND=y
> diff --git a/include/efi_loader.h b/include/efi_loader.h
> index e9c10819ba26..3ed27e97a083 100644
> --- a/include/efi_loader.h
> +++ b/include/efi_loader.h
> @@ -894,10 +894,6 @@ efi_status_t efi_setup_loaded_image(struct efi_device_path *device_path,
>   				    struct efi_loaded_image_obj **handle_ptr,
>   				    struct efi_loaded_image **info_ptr);
>
> -#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
> -extern void *efi_bounce_buffer;
> -#define EFI_LOADER_BOUNCE_BUFFER_SIZE (64 * 1024 * 1024)
> -#endif
>
>   /* shorten device path */
>   struct efi_device_path *efi_dp_shorten(struct efi_device_path *dp);
> diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
> index 6130af14337e..bc08776ef4a6 100644
> --- a/lib/efi_loader/Kconfig
> +++ b/lib/efi_loader/Kconfig
> @@ -490,13 +490,6 @@ config EFI_HTTP_PROTOCOL
>   endmenu
>
>   menu "Misc options"
> -config EFI_LOADER_BOUNCE_BUFFER
> -	bool "EFI Applications use bounce buffers for DMA operations"
> -	help
> -	  Some hardware does not support DMA to full 64bit addresses. For this
> -	  hardware we can create a bounce buffer so that payloads don't have to
> -	  worry about platform details.
> -
>   config EFI_GRUB_ARM32_WORKAROUND
>   	bool "Workaround for GRUB on 32bit ARM"
>   	default n if ARCH_BCM283X || ARCH_SUNXI || ARCH_QEMU
> diff --git a/lib/efi_loader/efi_disk.c b/lib/efi_loader/efi_disk.c
> index 5452640354e0..a0202032bb5a 100644
> --- a/lib/efi_loader/efi_disk.c
> +++ b/lib/efi_loader/efi_disk.c
> @@ -105,6 +105,8 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
>   	int blksz;
>   	int blocks;
>   	unsigned long n;
> +	u64 bb = 0xffffffff;
> +	void *bb_ptr = buffer;
>
>   	diskobj = container_of(this, struct efi_disk_obj, ops);
>   	blksz = diskobj->media.block_size;
> @@ -113,27 +115,35 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
>   	EFI_PRINT("blocks=%x lba=%llx blksz=%x dir=%d\n",
>   		  blocks, lba, blksz, direction);
>
> +	if (IS_ENABLED(CONFIG_BOUNCE_BUFFER) && (uintptr_t)buffer >= SZ_4G + buffer_size - 1) {
> +		if (efi_allocate_pages(EFI_ALLOCATE_MAX_ADDRESS, EFI_BOOT_SERVICES_DATA,
> +				       buffer_size >> EFI_PAGE_SHIFT, &bb) != EFI_SUCCESS)
> +			return EFI_OUT_OF_RESOURCES;
> +
> +		bb_ptr = (void *)(uintptr_t)bb;
> +	}
>   	/* We only support full block access */
> -	if (buffer_size & (blksz - 1))
> +	if (buffer_size & (blksz - 1)) {
> +		if (buffer != bb_ptr)
> +			efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
>   		return EFI_BAD_BUFFER_SIZE;
> +	}
>
>   	if (CONFIG_IS_ENABLED(PARTITIONS) &&
>   	    device_get_uclass_id(diskobj->header.dev) == UCLASS_PARTITION) {
>   		if (direction == EFI_DISK_READ)
> -			n = disk_blk_read(diskobj->header.dev, lba, blocks,
> -					  buffer);
> +			n = disk_blk_read(diskobj->header.dev, lba, blocks, bb_ptr);
>   		else
> -			n = disk_blk_write(diskobj->header.dev, lba, blocks,
> -					   buffer);
> +			n = disk_blk_write(diskobj->header.dev, lba, blocks, bb_ptr);
>   	} else {
>   		/* dev is a block device (UCLASS_BLK) */
>   		struct blk_desc *desc;
>
>   		desc = dev_get_uclass_plat(diskobj->header.dev);
>   		if (direction == EFI_DISK_READ)
> -			n = blk_dread(desc, lba, blocks, buffer);
> +			n = blk_dread(desc, lba, blocks, bb_ptr);
>   		else
> -			n = blk_dwrite(desc, lba, blocks, buffer);
> +			n = blk_dwrite(desc, lba, blocks, bb_ptr);
>   	}
>
>   	/* We don't do interrupts, so check for timers cooperatively */
> @@ -141,8 +151,16 @@ static efi_status_t efi_disk_rw_blocks(struct efi_block_io *this,
>
>   	EFI_PRINT("n=%lx blocks=%x\n", n, blocks);
>
> -	if (n != blocks)
> +	if (n != blocks) {
> +		if (buffer != bb_ptr)
> +			efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
>   		return EFI_DEVICE_ERROR;
> +	}
> +
> +	if (buffer != bb_ptr) {
> +		memcpy(buffer, bb_ptr, buffer_size);
> +		efi_free_pages(bb, buffer_size >> EFI_PAGE_SHIFT);
> +	}
>
>   	return EFI_SUCCESS;
>   }
> @@ -166,7 +184,6 @@ static efi_status_t EFIAPI efi_disk_read_blocks(struct efi_block_io *this,
>   			u32 media_id, u64 lba, efi_uintn_t buffer_size,
>   			void *buffer)
>   {
> -	void *real_buffer = buffer;
>   	efi_status_t r;
>
>   	if (!this)
> @@ -184,31 +201,12 @@ static efi_status_t EFIAPI efi_disk_read_blocks(struct efi_block_io *this,
>   	    (this->media->last_block + 1) * this->media->block_size)
>   		return EFI_INVALID_PARAMETER;
>
> -#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
> -	if (buffer_size > EFI_LOADER_BOUNCE_BUFFER_SIZE) {
> -		r = efi_disk_read_blocks(this, media_id, lba,
> -			EFI_LOADER_BOUNCE_BUFFER_SIZE, buffer);
> -		if (r != EFI_SUCCESS)
> -			return r;
> -		return efi_disk_read_blocks(this, media_id, lba +
> -			EFI_LOADER_BOUNCE_BUFFER_SIZE / this->media->block_size,
> -			buffer_size - EFI_LOADER_BOUNCE_BUFFER_SIZE,
> -			buffer + EFI_LOADER_BOUNCE_BUFFER_SIZE);
> -	}
> -
> -	real_buffer = efi_bounce_buffer;
> -#endif
> -
>   	EFI_ENTRY("%p, %x, %llx, %zx, %p", this, media_id, lba,
>   		  buffer_size, buffer);
>
> -	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, real_buffer,
> +	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, buffer,
>   			       EFI_DISK_READ);
>
> -	/* Copy from bounce buffer to real buffer if necessary */
> -	if ((r == EFI_SUCCESS) && (real_buffer != buffer))
> -		memcpy(buffer, real_buffer, buffer_size);
> -
>   	return EFI_EXIT(r);
>   }
>
> @@ -232,7 +230,6 @@ static efi_status_t EFIAPI efi_disk_write_blocks(struct efi_block_io *this,
>   			u32 media_id, u64 lba, efi_uintn_t buffer_size,
>   			void *buffer)
>   {
> -	void *real_buffer = buffer;
>   	efi_status_t r;
>
>   	if (!this)
> @@ -252,29 +249,10 @@ static efi_status_t EFIAPI efi_disk_write_blocks(struct efi_block_io *this,
>   	    (this->media->last_block + 1) * this->media->block_size)
>   		return EFI_INVALID_PARAMETER;
>
> -#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
> -	if (buffer_size > EFI_LOADER_BOUNCE_BUFFER_SIZE) {
> -		r = efi_disk_write_blocks(this, media_id, lba,
> -			EFI_LOADER_BOUNCE_BUFFER_SIZE, buffer);
> -		if (r != EFI_SUCCESS)
> -			return r;
> -		return efi_disk_write_blocks(this, media_id, lba +
> -			EFI_LOADER_BOUNCE_BUFFER_SIZE / this->media->block_size,
> -			buffer_size - EFI_LOADER_BOUNCE_BUFFER_SIZE,
> -			buffer + EFI_LOADER_BOUNCE_BUFFER_SIZE);
> -	}
> -
> -	real_buffer = efi_bounce_buffer;
> -#endif
> -
>   	EFI_ENTRY("%p, %x, %llx, %zx, %p", this, media_id, lba,
>   		  buffer_size, buffer);
>
> -	/* Populate bounce buffer if necessary */
> -	if (real_buffer != buffer)
> -		memcpy(real_buffer, buffer, buffer_size);
> -
> -	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, real_buffer,
> +	r = efi_disk_rw_blocks(this, media_id, lba, buffer_size, buffer,
>   			       EFI_DISK_WRITE);
>
>   	return EFI_EXIT(r);
> diff --git a/lib/efi_loader/efi_memory.c b/lib/efi_loader/efi_memory.c
> index 6d00b1862505..d7a8cb89e5b5 100644
> --- a/lib/efi_loader/efi_memory.c
> +++ b/lib/efi_loader/efi_memory.c
> @@ -40,10 +40,6 @@ struct efi_mem_list {
>   /* This list contains all memory map items */
>   static LIST_HEAD(efi_mem);
>
> -#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
> -void *efi_bounce_buffer;
> -#endif
> -
>   /**
>    * struct efi_pool_allocation - memory block allocated from pool
>    *
> @@ -852,18 +848,6 @@ int efi_memory_init(void)
>
>   	add_u_boot_and_runtime();
>
> -#ifdef CONFIG_EFI_LOADER_BOUNCE_BUFFER
> -	/* Request a 32bit 64MB bounce buffer region */
> -	uint64_t efi_bounce_buffer_addr = 0xffffffff;
> -
> -	if (efi_allocate_pages(EFI_ALLOCATE_MAX_ADDRESS, EFI_BOOT_SERVICES_DATA,
> -			       (64 * 1024 * 1024) >> EFI_PAGE_SHIFT,
> -			       &efi_bounce_buffer_addr) != EFI_SUCCESS)
> -		return -1;
> -
> -	efi_bounce_buffer = (void*)(uintptr_t)efi_bounce_buffer_addr;
> -#endif
> -
>   	return 0;
>   }
>
> --
> 2.47.2
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
