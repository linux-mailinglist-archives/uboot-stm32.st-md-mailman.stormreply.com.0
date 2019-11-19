Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA51035D6
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 09:13:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08241C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 08:13:01 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0A37C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 21:39:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so4847798wmb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 13:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S3pzCetPsqjkZnz6FBMFPksKMM44FWvN8NODGmV18ws=;
 b=iw+MxBTFk/WFEVb0vD3VfMxJd/1sTPNSBZhYMod096oJ2VESgD23NrCghZjx5hMsqD
 oDoTVYngpHrgwVANPgEbooj9RrOs4TlTVDAVQgXBOFCaDfNjfjnffby+/w7fZZXp6kp7
 CT1rzgB48l6SNxmzXBgfY/Kf+Z9aS3UCzLyrf4+0U/COdIHa+llh9w9TYP+8RunmkKrs
 4K2D1q/iHwQvFKGq2ZjrjMVj6R9poYo7JIoGQf0oU7s0vq4Tbn9RgH3AZvBkva6LhBPU
 i4mDcvw/V590eWUWaIvKWPiFmOuPAsDQ8TFq0x3RZfXCBYWDAarNvO0Zjt//GrUTHTA1
 IwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S3pzCetPsqjkZnz6FBMFPksKMM44FWvN8NODGmV18ws=;
 b=f92AhJG+iR9IsEblQDNscOzEmi6boBltuAXAlT9wBtQngsuwOPawuQ3sixBcRXm5pr
 ox/TML7RzRhKFmbAvL4fHvQ0ezrnV/aHcZfM/DOIR70DSgEnnmy2JtQZa5vppkSsVvy1
 VeVizOPqe+vOC+IQAse4dpsBcVRLAfqDgeHHO6rHpG7ZI7ooHM0IlxIBrcXEQqk/760p
 VDOOgdOxnqsqYp99+zMLTjgjI5JGbejL5slYpDyRgbAqlvxvQELnSXiaDFeb0ilVP/Bj
 1JQYJQOQT/65J4MUQumfHkPqRJhF6KeTQ6XaPxDd696QZaD/2U6j0pfDfzxwmBy+LM3h
 jbBg==
X-Gm-Message-State: APjAAAWb0cNm/q9rH600NUpE22vC2FcLC1p4VJ+qJfa83Q3SCkC+589M
 DacUguFYF91KosaTM8qyh3c=
X-Google-Smtp-Source: APXvYqyEnNogFzMw7JvH96l6vN5uEWdwTNwp6YLLM7BT2p//UPVDJClVZX5MVGXG1L0Y4F/KhHu/Aw==
X-Received: by 2002:a1c:5f04:: with SMTP id t4mr8024300wmb.23.1574199576477;
 Tue, 19 Nov 2019 13:39:36 -0800 (PST)
Received: from ?IPv6:2a02:8071:6a3:700:51d2:2ba0:bc1:d4b3?
 ([2a02:8071:6a3:700:51d2:2ba0:bc1:d4b3])
 by smtp.gmail.com with ESMTPSA id v184sm4636456wme.31.2019.11.19.13.39.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Nov 2019 13:39:35 -0800 (PST)
To: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de
References: <20191119010210.24477-1-trini@konsulko.com>
 <20191119010210.24477-5-trini@konsulko.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <54bb624a-5d80-71e9-4c5a-f5bd4aa20851@gmail.com>
Date: Tue, 19 Nov 2019 22:39:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119010210.24477-5-trini@konsulko.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 20 Nov 2019 08:12:58 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCHv2 5/5] env: Finish migration of
 common ENV options
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

Am 19.11.2019 um 02:02 schrieb Tom Rini:> - In ARMv8 NXP Layerscape 
platforms we also need to make use of
 >    CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
 > - On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the define
 >    to 0.
 > - Add Kconfig entry for ENV_ADDR.
 > - Make ENV_ADDR / ENV_OFFSET depend on the env locations that use it.
 > - Add ENV_xxx_REDUND options that depend on their primary option and
 >    SYS_REDUNDAND_ENVIRONMENT
 > - On a number of PowerPC platforms, use SPL_ENV_ADDR not CONFIG_ENV_ADDR
 >    for the pre-main-U-Boot environment location.
 > - On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set but
 >    rather it being non-zero, as it will now be zero by default.
 > - Rework the env_offset absolute in env/embedded.o to not use
 >    CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
 >    ENV_IS_IN_FLASH.
 > - Migrate all platforms.
 >
 > Cc: Wolfgang Denk <wd@denx.de>
 > Cc: Joe Hershberger <joe.hershberger@ni.com>
 > Cc: Patrick Delaunay <patrick.delaunay@st.com>
 > Cc: uboot-stm32@st-md-mailman.stormreply.com
 > Signed-off-by: Tom Rini <trini@konsulko.com>
 > ---

<snip>

 > diff --git a/include/configs/socfpga_common.h 
b/include/configs/socfpga_common.h
 > index baa214399ff9..05bfef75c0df 100644
 > --- a/include/configs/socfpga_common.h
 > +++ b/include/configs/socfpga_common.h
 > @@ -157,21 +157,13 @@ unsigned int cm_get_qspi_controller_clk_hz(void);
 >   /*
 >    * U-Boot environment
 >    */
 > -#if !defined(CONFIG_ENV_SIZE)
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 > -#endif
 >
 >   /* Environment for SDMMC boot */
 > -#if defined(CONFIG_ENV_IS_IN_MMC) && !defined(CONFIG_ENV_OFFSET)
 > +#if defined(CONFIG_ENV_IS_IN_MMC)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0 /* device 0 */
 > -#define CONFIG_ENV_OFFSET		(34 * 512) /* just after the GPT */
 >   #endif
 >
 >   /* Environment for QSPI boot */
 > -#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFFSET)
 > -#define CONFIG_ENV_OFFSET		0x00100000
 > -#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
 > -#endif

Removing paragraphs like this one will break configs that haven't made 
it to a mainline defconfig. E.g. for socfpga_socrates_defconfig, you can 
chose for the ENV to be saved in SPI instead of MMC as the config 
supports booting from all sources.

How do we proceed with such things? I know that might be non-mainline, 
but I think throwing this info away is a step-back, not an improvement.

[And don't get me wrong: this doesn't affect my downstream boards, they 
don't save/load env due to secure boot reasons anyway.]

Regards,
Simon

 >
 >   /*
 >    * SPL
 > diff --git a/include/configs/socfpga_sr1500.h 
b/include/configs/socfpga_sr1500.h
 > index e1a48715fb0d..ccaa050ae597 100644
 > --- a/include/configs/socfpga_sr1500.h
 > +++ b/include/configs/socfpga_sr1500.h
 > @@ -28,10 +28,6 @@
 >   #define CONFIG_SYS_BOOTCOUNT_BE
 >
 >   /* Environment setting for SPI flash */
 > -#define CONFIG_ENV_SECT_SIZE	(64 * 1024)
 > -#define CONFIG_ENV_SIZE		(16 * 1024)
 > -#define CONFIG_ENV_OFFSET	0x000e0000
 > -#define CONFIG_ENV_OFFSET_REDUND (CONFIG_ENV_OFFSET + 
CONFIG_ENV_SECT_SIZE)
 >
 >   /* The rest of the configuration is shared */
 >   #include <configs/socfpga_common.h>
 > diff --git a/include/configs/socfpga_stratix10_socdk.h 
b/include/configs/socfpga_stratix10_socdk.h
 > index 8e6ecf4bed34..e8e66fa4ae67 100644
 > --- a/include/configs/socfpga_stratix10_socdk.h
 > +++ b/include/configs/socfpga_stratix10_socdk.h
 > @@ -48,9 +48,7 @@
 >   /*
 >    * U-Boot environment configurations
 >    */
 > -#define CONFIG_ENV_SIZE			0x1000
 >   #define CONFIG_SYS_MMC_ENV_DEV		0	/* device 0 */
 > -#define CONFIG_ENV_OFFSET		512	/* just after the MBR */
 >
 >   /*
 >    * QSPI support
 > @@ -62,13 +60,6 @@
 >   /* Flash device info */
 >
 >   /*#define CONFIG_ENV_IS_IN_SPI_FLASH*/
 > -#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
 > -#undef CONFIG_ENV_OFFSET
 > -#undef CONFIG_ENV_SIZE
 > -#define CONFIG_ENV_OFFSET		0x710000
 > -#define CONFIG_ENV_SIZE			(4 * 1024)
 > -#define CONFIG_ENV_SECT_SIZE		(4 * 1024)
 > -#endif /* CONFIG_ENV_IS_IN_SPI_FLASH */
 >
 >   #ifndef CONFIG_SPL_BUILD
 >   #define CONFIG_MTD_DEVICE
 > diff --git a/include/configs/socfpga_vining_fpga.h 
b/include/configs/socfpga_vining_fpga.h
 > index 5cc12419a692..8b97cd93a78a 100644
 > --- a/include/configs/socfpga_vining_fpga.h
 > +++ b/include/configs/socfpga_vining_fpga.h
 > @@ -195,11 +195,6 @@
 >   		"fi\0"							\
 >   		"socfpga_legacy_reset_compat=1\0"
 >
 > -#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
 > -#define CONFIG_ENV_OFFSET		0x100000
 > -#define CONFIG_ENV_OFFSET_REDUND	\
 > -	(CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
 > -
 >   /* Support changing the prompt string */
 >   #define CONFIG_CMDLINE_PS_SUPPORT
 >
 > diff --git a/include/configs/socrates.h b/include/configs/socrates.h
 > index f5f3316b9030..4fe67dced850 100644
 > --- a/include/configs/socrates.h
 > +++ b/include/configs/socrates.h
 > @@ -187,11 +187,6 @@
 >   /*
 >    * Environment
 >    */
 > -#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K(one sector) for env	*/
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - \
 > -				CONFIG_ENV_SECT_SIZE - CONFIG_ENV_SECT_SIZE)
 > -#define CONFIG_ENV_SIZE		0x4000
 > -#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR - CONFIG_ENV_SECT_SIZE)
 >
 >   #define CONFIG_LOADS_ECHO	1	/* echo on for serial download	*/
 >   #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change	*/
 > diff --git a/include/configs/som-db5800-som-6867.h 
b/include/configs/som-db5800-som-6867.h
 > index cfcc9c866d63..201f2c2ece57 100644
 > --- a/include/configs/som-db5800-som-6867.h
 > +++ b/include/configs/som-db5800-som-6867.h
 > @@ -21,7 +21,4 @@
 >   #define VIDEO_IO_OFFSET				0
 >   #define CONFIG_X86EMU_RAW_IO
 >
 > -#define CONFIG_ENV_SECT_SIZE		0x1000
 > -#define CONFIG_ENV_OFFSET		0x006ef000
 > -
 >   #endif	/* __CONFIG_H */
 > diff --git a/include/configs/spear-common.h 
b/include/configs/spear-common.h
 > index d21ff9771693..85e498dc6687 100644
 > --- a/include/configs/spear-common.h
 > +++ b/include/configs/spear-common.h
 > @@ -99,7 +99,6 @@
 >    * Environment is in serial NOR flash
 >    */
 >   #define CONFIG_SYS_MONITOR_LEN			0x00040000
 > -#define CONFIG_ENV_SECT_SIZE			0x00010000
 >   #define CONFIG_FSMTDBLK				"/dev/mtdblock3 "
 >
 >   #define CONFIG_BOOTCOMMAND			"bootm 0xf8050000"
 > @@ -109,21 +108,16 @@
 >    * Environment is in parallel NOR flash
 >    */
 >   #define CONFIG_SYS_MONITOR_LEN			0x00060000
 > -#define CONFIG_ENV_SECT_SIZE			0x00020000
 >   #define CONFIG_FSMTDBLK				"/dev/mtdblock3 "
 >
 >   #define CONFIG_BOOTCOMMAND			"cp.b 0x50080000 0x1600000 " \
 >   						"0x4C0000; bootm 0x1600000"
 >   #endif
 > -
 > -#define CONFIG_ENV_ADDR				(CONFIG_SYS_FLASH_BASE + \
 > -						CONFIG_SYS_MONITOR_LEN)
 >   #elif defined(CONFIG_ENV_IS_IN_NAND)
 >   /*
 >    * Environment is in NAND
 >    */
 >
 > -#define CONFIG_ENV_OFFSET			0x60000
 >   #define CONFIG_ENV_RANGE			0x10000
 >   #define CONFIG_FSMTDBLK				"/dev/mtdblock7 "
 >
 > @@ -146,7 +140,6 @@
 >   		"console=ttyAMA0,115200 $(othbootargs);"		\
 >   	CONFIG_BOOTCOMMAND
 >
 > -#define CONFIG_ENV_SIZE				0x02000
 >   #define CONFIG_SYS_MONITOR_BASE			CONFIG_SYS_TEXT_BASE
 >
 >   /* Miscellaneous configurable options */
 > diff --git a/include/configs/stih410-b2260.h 
b/include/configs/stih410-b2260.h
 > index b67efbb16830..a8a58f395068 100644
 > --- a/include/configs/stih410-b2260.h
 > +++ b/include/configs/stih410-b2260.h
 > @@ -39,9 +39,6 @@
 >   			"ramdisk_addr_r=0x48000000\0"		\
 >   			BOOTENV
 >
 > -
 > -#define CONFIG_ENV_SIZE 0x4000
 > -
 >   /* Extra Commands */
 >   #define CONFIG_CMD_ASKENV
 >
 > diff --git a/include/configs/stm32f429-discovery.h 
b/include/configs/stm32f429-discovery.h
 > index 31c17d081867..a8b3a173096f 100644
 > --- a/include/configs/stm32f429-discovery.h
 > +++ b/include/configs/stm32f429-discovery.h
 > @@ -20,10 +20,6 @@
 >   #define CONFIG_SYS_MAX_FLASH_SECT	12
 >   #define CONFIG_SYS_MAX_FLASH_BANKS	2
 >
 > -#define CONFIG_ENV_OFFSET		(256 << 10)
 > -#define CONFIG_ENV_SECT_SIZE		(128 << 10)
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -
 >   #define CONFIG_RED_LED			110
 >   #define CONFIG_GREEN_LED		109
 >
 > diff --git a/include/configs/stm32f429-evaluation.h 
b/include/configs/stm32f429-evaluation.h
 > index a5390f874284..7a17222d7b81 100644
 > --- a/include/configs/stm32f429-evaluation.h
 > +++ b/include/configs/stm32f429-evaluation.h
 > @@ -20,10 +20,6 @@
 >   #define CONFIG_SYS_MAX_FLASH_SECT	12
 >   #define CONFIG_SYS_MAX_FLASH_BANKS	2
 >
 > -#define CONFIG_ENV_OFFSET		(256 << 10)
 > -#define CONFIG_ENV_SECT_SIZE		(128 << 10)
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -
 >   #define CONFIG_STM32_FLASH
 >
 >   #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 > diff --git a/include/configs/stm32f469-discovery.h 
b/include/configs/stm32f469-discovery.h
 > index 1c7efd13b835..463f1c4396d0 100644
 > --- a/include/configs/stm32f469-discovery.h
 > +++ b/include/configs/stm32f469-discovery.h
 > @@ -20,10 +20,6 @@
 >   #define CONFIG_SYS_MAX_FLASH_SECT	12
 >   #define CONFIG_SYS_MAX_FLASH_BANKS	2
 >
 > -#define CONFIG_ENV_OFFSET		(256 << 10)
 > -#define CONFIG_ENV_SECT_SIZE		(128 << 10)
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -
 >   #define CONFIG_STM32_FLASH
 >
 >   #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 > diff --git a/include/configs/stm32f746-disco.h 
b/include/configs/stm32f746-disco.h
 > index cc26f83e7462..337b99977b80 100644
 > --- a/include/configs/stm32f746-disco.h
 > +++ b/include/configs/stm32f746-disco.h
 > @@ -24,8 +24,6 @@
 >   #define CONFIG_SYS_MAX_FLASH_SECT	8
 >   #define CONFIG_SYS_MAX_FLASH_BANKS	1
 >
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -
 >   #define CONFIG_STM32_FLASH
 >
 >   #define CONFIG_DW_GMAC_DEFAULT_DMA_PBL	(8)
 > diff --git a/include/configs/stm32h743-disco.h 
b/include/configs/stm32h743-disco.h
 > index f110e2994c71..74c69eba39d3 100644
 > --- a/include/configs/stm32h743-disco.h
 > +++ b/include/configs/stm32h743-disco.h
 > @@ -18,8 +18,6 @@
 >   #define CONFIG_SYS_LOAD_ADDR		0xD0400000
 >   #define CONFIG_LOADADDR			0xD0400000
 >
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -
 >   #define CONFIG_SYS_HZ_CLOCK		1000000
 >
 >   #define CONFIG_CMDLINE_TAG
 > diff --git a/include/configs/stm32h743-eval.h 
b/include/configs/stm32h743-eval.h
 > index e3bf5b27e859..b7c84922ab84 100644
 > --- a/include/configs/stm32h743-eval.h
 > +++ b/include/configs/stm32h743-eval.h
 > @@ -18,8 +18,6 @@
 >   #define CONFIG_SYS_LOAD_ADDR		0xD0400000
 >   #define CONFIG_LOADADDR			0xD0400000
 >
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -
 >   #define CONFIG_SYS_HZ_CLOCK		1000000
 >
 >   #define CONFIG_CMDLINE_TAG
 > diff --git a/include/configs/stmark2.h b/include/configs/stmark2.h
 > index 35966580a918..a08d9950bd87 100644
 > --- a/include/configs/stmark2.h
 > +++ b/include/configs/stmark2.h
 > @@ -139,9 +139,6 @@
 >
 >   #if defined(CONFIG_CF_SBF)
 >   #define CONFIG_ENV_IS_IN_SPI_FLASH	1
 > -#define CONFIG_ENV_OFFSET		0x40000
 > -#define CONFIG_ENV_SIZE			0x2000
 > -#define CONFIG_ENV_SECT_SIZE		0x10000
 >   #endif
 >
 >   #undef CONFIG_ENV_OVERWRITE
 > diff --git a/include/configs/strider.h b/include/configs/strider.h
 > index d270d8a2dd4f..ac9fce80cec3 100644
 > --- a/include/configs/strider.h
 > +++ b/include/configs/strider.h
 > @@ -384,15 +384,6 @@ void fpga_control_clear(unsigned int bus, int pin);
 >   /*
 >    * Environment
 >    */
 > -#if 1
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
 > -				 CONFIG_SYS_MONITOR_LEN)
 > -#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K(one sector) for env */
 > -#define CONFIG_ENV_SIZE		0x2000
 > -#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 > -#else
 > -#define CONFIG_ENV_SIZE		0x2000		/* 8KB */
 > -#endif
 >
 >   #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 >   #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
 > diff --git a/include/configs/stv0991.h b/include/configs/stv0991.h
 > index e5262085fc75..81e1e49c928a 100644
 > --- a/include/configs/stv0991.h
 > +++ b/include/configs/stv0991.h
 > @@ -13,11 +13,6 @@
 >   #define CONFIG_SYS_SDRAM_BASE			PHYS_SDRAM_1
 >   #define PHYS_SDRAM_1_SIZE			0x00198000
 >
 > -#define CONFIG_ENV_SIZE				0x10000
 > -#define CONFIG_ENV_SECT_SIZE			CONFIG_ENV_SIZE
 > -#define CONFIG_ENV_OFFSET			0x30000
 > -#define CONFIG_ENV_ADDR				\
 > -	(PHYS_SDRAM_1_SIZE - CONFIG_ENV_SIZE)
 >   #define CONFIG_SYS_MALLOC_LEN			(CONFIG_ENV_SIZE + 16 * 1024)
 >
 >   /* user interface */
 > diff --git a/include/configs/t4qds.h b/include/configs/t4qds.h
 > index bf3750191281..5d087caf31e4 100644
 > --- a/include/configs/t4qds.h
 > +++ b/include/configs/t4qds.h
 > @@ -54,9 +54,7 @@
 >   #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 >   #define CONFIG_SYS_L3_SIZE		(512 << 10)
 >   #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
 > -#ifdef CONFIG_RAMBOOT_PBL
 > -#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 > -#endif
 > +#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 >   #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 >   #define CONFIG_SPL_RELOC_MALLOC_SIZE	(50 << 10)
 >   #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
 > diff --git a/include/configs/tam3517-common.h 
b/include/configs/tam3517-common.h
 > index 69819da492fd..a2bb1b55eb12 100644
 > --- a/include/configs/tam3517-common.h
 > +++ b/include/configs/tam3517-common.h
 > @@ -110,10 +110,6 @@
 >
 >   /* Redundant Environment */
 >   #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
 > -#define CONFIG_ENV_OFFSET		0x180000
 > -#define CONFIG_ENV_ADDR			0x180000
 > -#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
 > -						2 * CONFIG_SYS_ENV_SECT_SIZE)
 >
 >   #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 >   #define CONFIG_SYS_INIT_RAM_ADDR	0x4020f800
 > diff --git a/include/configs/tao3530.h b/include/configs/tao3530.h
 > index 7a54fe3e1e37..e95cd0087d3f 100644
 > --- a/include/configs/tao3530.h
 > +++ b/include/configs/tao3530.h
 > @@ -169,7 +169,6 @@
 >   #define ONENAND_ENV_OFFSET		0x260000 /* environment starts here */
 >
 >   #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)
 > -#define CONFIG_ENV_ADDR			CONFIG_ENV_OFFSET
 >
 >   #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 >   #define CONFIG_SYS_INIT_RAM_ADDR	0x4020f800
 > diff --git a/include/configs/taurus.h b/include/configs/taurus.h
 > index fdd1c5224b78..9990c9340a3d 100644
 > --- a/include/configs/taurus.h
 > +++ b/include/configs/taurus.h
 > @@ -108,7 +108,6 @@
 >   #define CONFIG_SYS_LOAD_ADDR			0x22000000
 >
 >   /* bootstrap in spi flash , u-boot + env + linux in nandflash */
 > -#define CONFIG_ENV_OFFSET_REDUND	0x180000
 >
 >   #ifndef CONFIG_SPL_BUILD
 >   #if defined(CONFIG_BOARD_AXM)
 > diff --git a/include/configs/tbs2910.h b/include/configs/tbs2910.h
 > index 46d67a7fcfd0..b598fca1ecb3 100644
 > --- a/include/configs/tbs2910.h
 > +++ b/include/configs/tbs2910.h
 > @@ -75,8 +75,6 @@
 >   /* Environment organization */
 >   #define CONFIG_SYS_MMC_ENV_DEV		2 /* overwritten on SD boot */
 >   #define CONFIG_SYS_MMC_ENV_PART		1 /* overwritten on SD boot */
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 > -#define CONFIG_ENV_OFFSET		(384 * 1024)
 >   #define CONFIG_ENV_OVERWRITE
 >
 >   #define CONFIG_BOARD_SIZE_LIMIT		392192 /* (CONFIG_ENV_OFFSET - 
1024) */
 > diff --git a/include/configs/tec-ng.h b/include/configs/tec-ng.h
 > index b637832a5ee7..1047372105e2 100644
 > --- a/include/configs/tec-ng.h
 > +++ b/include/configs/tec-ng.h
 > @@ -17,7 +17,6 @@
 >   #define CONFIG_SYS_NS16550_COM1		NV_PA_APB_UARTD_BASE
 >
 >   /* Environment in eMMC, at the end of 2nd "boot sector" */
 > -#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >   #define CONFIG_SYS_MMC_ENV_PART		2
 >
 > diff --git a/include/configs/tec.h b/include/configs/tec.h
 > index 907c8d5e2301..aa9665eab59a 100644
 > --- a/include/configs/tec.h
 > +++ b/include/configs/tec.h
 > @@ -23,7 +23,6 @@
 >   #define CONFIG_SYS_MAX_NAND_DEVICE	1
 >
 >   /* Environment in NAND, aligned to start of last sector */
 > -#define CONFIG_ENV_OFFSET		(SZ_512M - SZ_128K) /* 128K sectors */
 >
 >   #include "tegra-common-post.h"
 >
 > diff --git a/include/configs/tegra-common.h 
b/include/configs/tegra-common.h
 > index 84f671d00c37..b4da1f8428ca 100644
 > --- a/include/configs/tegra-common.h
 > +++ b/include/configs/tegra-common.h
 > @@ -25,7 +25,6 @@
 >   #define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
 >
 >   /* Environment */
 > -#define CONFIG_ENV_SIZE			0x2000	/* Total Size Environment */
 >
 >   /*
 >    * NS16550 Configuration
 > diff --git a/include/configs/theadorable-x86-common.h 
b/include/configs/theadorable-x86-common.h
 > index 2d7be7d5b96e..0a1261fa2017 100644
 > --- a/include/configs/theadorable-x86-common.h
 > +++ b/include/configs/theadorable-x86-common.h
 > @@ -23,12 +23,6 @@
 >   #define CONFIG_BMP_16BPP
 >
 >   /* Environment settings */
 > -#undef CONFIG_ENV_SIZE
 > -#define CONFIG_ENV_SIZE			0x2000
 > -#define CONFIG_ENV_SECT_SIZE		0x1000
 > -#define CONFIG_ENV_OFFSET		0x006ec000
 > -#define CONFIG_ENV_OFFSET_REDUND	\
 > -	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 >
 >   #undef CONFIG_BOOTCOMMAND
 >   #undef CONFIG_EXTRA_ENV_SETTINGS
 > diff --git a/include/configs/theadorable.h 
b/include/configs/theadorable.h
 > index 45cd7e2b83ac..6d42ec1aa194 100644
 > --- a/include/configs/theadorable.h
 > +++ b/include/configs/theadorable.h
 > @@ -40,9 +40,6 @@
 >   #define CONFIG_USB_MAX_CONTROLLER_COUNT 3
 >
 >   /* Environment in SPI NOR flash */
 > -#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
 > -#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
 > -#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 >   #define CONFIG_ENV_OVERWRITE
 >
 >   #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 > diff --git a/include/configs/thuban.h b/include/configs/thuban.h
 > index 954b063e293a..d909be9b019c 100644
 > --- a/include/configs/thuban.h
 > +++ b/include/configs/thuban.h
 > @@ -39,7 +39,6 @@
 >   #define CONFIG_FACTORYSET
 >
 >   /* Define own nand partitions */
 > -#define CONFIG_ENV_OFFSET_REDUND    0x2E0000
 >   #define CONFIG_ENV_RANGE        (4 * CONFIG_SYS_ENV_SECT_SIZE)
 >
 >   #ifndef CONFIG_SPL_BUILD
 > diff --git a/include/configs/thunderx_88xx.h 
b/include/configs/thunderx_88xx.h
 > index 619571d45ba6..dac7e4ad9594 100644
 > --- a/include/configs/thunderx_88xx.h
 > +++ b/include/configs/thunderx_88xx.h
 > @@ -61,7 +61,6 @@
 >   					"fdt_high=0x9fffffff\0"
 >
 >   /* Do not preserve environment */
 > -#define CONFIG_ENV_SIZE			0x1000
 >
 >   /* Monitor Command Prompt */
 >   #define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
 > diff --git a/include/configs/ti816x_evm.h b/include/configs/ti816x_evm.h
 > index fc5608b3fd47..1d3b2a392237 100644
 > --- a/include/configs/ti816x_evm.h
 > +++ b/include/configs/ti816x_evm.h
 > @@ -12,7 +12,6 @@
 >   #include <configs/ti_armv7_omap.h>
 >   #include <asm/arch/omap.h>
 >
 > -#define CONFIG_ENV_SIZE			0x2000
 >   #define CONFIG_MACH_TYPE		MACH_TYPE_TI8168EVM
 >
 >   #define CONFIG_EXTRA_ENV_SETTINGS	\
 > @@ -84,8 +83,6 @@
 >   #define CONFIG_SYS_NAND_ONFI_DETECTION
 >   #define CONFIG_NAND_OMAP_ECCSCHEME	OMAP_ECC_BCH8_CODE_HW
 >   #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x000c0000
 > -#define CONFIG_ENV_OFFSET		0x001c0000
 > -#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
 >   #define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
 >
 >   /* SPL */
 > diff --git a/include/configs/titanium.h b/include/configs/titanium.h
 > index 64ec06da8599..d6ab5e4393ee 100644
 > --- a/include/configs/titanium.h
 > +++ b/include/configs/titanium.h
 > @@ -145,16 +145,10 @@
 >   /* DMA stuff, needed for GPMI/MXS NAND support */
 >
 >   /* Environment in NAND */
 > -#define CONFIG_ENV_OFFSET		(16 << 20)
 > -#define CONFIG_ENV_SECT_SIZE		(128 << 10)
 > -#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
 > -#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + (512 << 10))
 >
 >   #else /* CONFIG_CMD_NAND */
 >
 >   /* Environment in MMC */
 > -#define CONFIG_ENV_SIZE			(8 << 10)
 > -#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >
 >   #endif /* CONFIG_CMD_NAND */
 > diff --git a/include/configs/topic_miami.h 
b/include/configs/topic_miami.h
 > index b98656dd4c17..73fdfae4610c 100644
 > --- a/include/configs/topic_miami.h
 > +++ b/include/configs/topic_miami.h
 > @@ -15,10 +15,6 @@
 >   #include "zynq-common.h"
 >
 >   /* Fixup settings */
 > -#undef CONFIG_ENV_SIZE
 > -#define CONFIG_ENV_SIZE			0x8000
 > -#undef CONFIG_ENV_OFFSET
 > -#define CONFIG_ENV_OFFSET		0x80000
 >
 >   /* SPL settings */
 >   #undef CONFIG_SPL_ETH_SUPPORT
 > diff --git a/include/configs/tplink_wdr4300.h 
b/include/configs/tplink_wdr4300.h
 > index 436715824b23..8f13744c322f 100644
 > --- a/include/configs/tplink_wdr4300.h
 > +++ b/include/configs/tplink_wdr4300.h
 > @@ -34,8 +34,6 @@
 >   #define CONFIG_BOOTCOMMAND		\
 >   	"dhcp 192.168.1.1:wdr4300.fit && bootm $loadaddr"
 >
 > -#define CONFIG_ENV_SIZE			0x10000
 > -
 >   /*
 >    * Command
 >    */
 > diff --git a/include/configs/tqma6.h b/include/configs/tqma6.h
 > index 3c1d629d251f..1ea6332878fe 100644
 > --- a/include/configs/tqma6.h
 > +++ b/include/configs/tqma6.h
 > @@ -68,7 +68,6 @@
 >
 >   #define CONFIG_ARP_TIMEOUT		200UL
 >
 > -#define CONFIG_ENV_SIZE			(SZ_8K)
 >   /* Size of malloc() pool */
 >   #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + 2 * SZ_1M)
 >
 > @@ -78,7 +77,6 @@
 >   #define TQMA6_UBOOT_SECTOR_START	0x2
 >   #define TQMA6_UBOOT_SECTOR_COUNT	0x7fe
 >
 > -#define CONFIG_ENV_OFFSET		SZ_1M
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >
 >   #define TQMA6_FDT_OFFSET		(2 * SZ_1M)
 > @@ -148,11 +146,6 @@
 >   #define TQMA6_UBOOT_SIZE		(TQMA6_UBOOT_SECTOR_SIZE * \
 >   					 TQMA6_UBOOT_SECTOR_COUNT)
 >
 > -#define CONFIG_ENV_OFFSET		(TQMA6_UBOOT_SIZE)
 > -#define CONFIG_ENV_SECT_SIZE		TQMA6_SPI_FLASH_SECTOR_SIZE
 > -#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
 > -					 CONFIG_ENV_SECT_SIZE)
 > -
 >   #define TQMA6_FDT_OFFSET		(CONFIG_ENV_OFFSET_REDUND + \
 >   					 CONFIG_ENV_SECT_SIZE)
 >   #define TQMA6_FDT_SECT_SIZE		(TQMA6_SPI_FLASH_SECTOR_SIZE)
 > diff --git a/include/configs/trats.h b/include/configs/trats.h
 > index af8e8ce3b6cc..37fadc52102a 100644
 > --- a/include/configs/trats.h
 > +++ b/include/configs/trats.h
 > @@ -49,8 +49,6 @@
 >   #define CONFIG_ENV_COMMON_BOOT		"${console} ${meminfo}"
 >
 >   #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
 > -#define CONFIG_ENV_SIZE			4096
 > -#define CONFIG_ENV_OFFSET		((32 - 4) << 10) /* 32KiB - 4KiB */
 >
 >   #define CONFIG_ENV_OVERWRITE
 >
 > diff --git a/include/configs/trats2.h b/include/configs/trats2.h
 > index 9c6b2bbc8d60..8b71c2575735 100644
 > --- a/include/configs/trats2.h
 > +++ b/include/configs/trats2.h
 > @@ -44,8 +44,6 @@
 >   #define CONFIG_SYS_MONITOR_BASE	0x00000000
 >
 >   #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
 > -#define CONFIG_ENV_SIZE			4096
 > -#define CONFIG_ENV_OFFSET		((32 - 4) << 10) /* 32KiB - 4KiB */
 >
 >   #define CONFIG_ENV_OVERWRITE
 >
 > diff --git a/include/configs/tricorder.h b/include/configs/tricorder.h
 > index 2106f4e5b043..1e4459747d54 100644
 > --- a/include/configs/tricorder.h
 > +++ b/include/configs/tricorder.h
 > @@ -78,7 +78,6 @@
 >
 >   /* environment placement (for NAND), is different for FLASHCARD but 
does not
 >    * harm there */
 > -#define CONFIG_ENV_OFFSET_REDUND	0x2A0000    /* redundant env start */
 >   #define CONFIG_ENV_RANGE		(384 << 10) /* allow badblocks in env */
 >
 >   /* the loadaddr is the same as CONFIG_SYS_LOAD_ADDR, unfortunately 
the defiend
 > diff --git a/include/configs/trimslice.h b/include/configs/trimslice.h
 > index 93db175288c1..b914e444b6e7 100644
 > --- a/include/configs/trimslice.h
 > +++ b/include/configs/trimslice.h
 > @@ -23,9 +23,7 @@
 >   /* SPI */
 >
 >   /* Environment in SPI */
 > -#define CONFIG_ENV_SECT_SIZE		CONFIG_ENV_SIZE
 >   /* 1MiB flash, environment located as high as possible */
 > -#define CONFIG_ENV_OFFSET		(SZ_1M - CONFIG_ENV_SIZE)
 >
 >   #include "tegra-common-post.h"
 >
 > diff --git a/include/configs/ts4600.h b/include/configs/ts4600.h
 > index a107e96530ec..6aab8a06a963 100644
 > --- a/include/configs/ts4600.h
 > +++ b/include/configs/ts4600.h
 > @@ -21,11 +21,9 @@
 >   #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 >
 >   /* Environment */
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 >
 >   /* Environment is in MMC */
 >   #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
 > -#define CONFIG_ENV_OFFSET		(256 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >   #endif
 >
 > diff --git a/include/configs/ts4800.h b/include/configs/ts4800.h
 > index 4e274bd4141d..bd50d3b19c32 100644
 > --- a/include/configs/ts4800.h
 > +++ b/include/configs/ts4800.h
 > @@ -135,8 +135,6 @@
 >    * Environment organization
 >    */
 >
 > -#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
 > -#define CONFIG_ENV_SIZE        (8 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV 0
 >
 >   #endif
 > diff --git a/include/configs/turris_mox.h b/include/configs/turris_mox.h
 > index 16a49c766f28..9409344338e1 100644
 > --- a/include/configs/turris_mox.h
 > +++ b/include/configs/turris_mox.h
 > @@ -62,9 +62,6 @@
 >   #define CONFIG_SYS_I2C_SLAVE		0x0
 >
 >   /* Environment in SPI NOR flash */
 > -#define CONFIG_ENV_OFFSET		0x180000 /* as Marvell U-Boot version */
 > -#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
 > -#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 >
 >   /*
 >    * Ethernet Driver configuration
 > diff --git a/include/configs/turris_omnia.h 
b/include/configs/turris_omnia.h
 > index abe1e99acda5..0b55c14d8bff 100644
 > --- a/include/configs/turris_omnia.h
 > +++ b/include/configs/turris_omnia.h
 > @@ -22,9 +22,6 @@
 >   #define CONFIG_EHCI_IS_TDI
 >
 >   /* Environment in SPI NOR flash */
 > -#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
 > -#define CONFIG_ENV_OFFSET		((1 << 20) - CONFIG_ENV_SIZE)
 > -#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB */
 >
 >   #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 >
 > diff --git a/include/configs/udoo.h b/include/configs/udoo.h
 > index 3378b4a601c4..bf9106e239fe 100644
 > --- a/include/configs/udoo.h
 > +++ b/include/configs/udoo.h
 > @@ -87,9 +87,7 @@
 >   	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 >
 >   /* Environment organization */
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 >
 > -#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >
 >   #endif			       /* __CONFIG_H * */
 > diff --git a/include/configs/udoo_neo.h b/include/configs/udoo_neo.h
 > index 6ba4270b72db..f4a2837b3913 100644
 > --- a/include/configs/udoo_neo.h
 > +++ b/include/configs/udoo_neo.h
 > @@ -75,8 +75,6 @@
 >   	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 >
 >   /* Environment organization */
 > -#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 > -#define CONFIG_ENV_SIZE			SZ_8K
 >
 >   #define CONFIG_IMX_THERMAL
 >
 > diff --git a/include/configs/ulcb.h b/include/configs/ulcb.h
 > index 6f2a0cc56dce..1d99dcaba666 100644
 > --- a/include/configs/ulcb.h
 > +++ b/include/configs/ulcb.h
 > @@ -19,7 +19,6 @@
 >   #define COUNTER_FREQUENCY	0xFE502A	/* 16.66MHz from CPclk */
 >
 >   /* Environment in eMMC, at the end of 2nd "boot sector" */
 > -#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 >   #define CONFIG_SYS_MMC_ENV_DEV		1
 >   #define CONFIG_SYS_MMC_ENV_PART		2
 >
 > diff --git a/include/configs/uniphier.h b/include/configs/uniphier.h
 > index 68568f412245..29866668c491 100644
 > --- a/include/configs/uniphier.h
 > +++ b/include/configs/uniphier.h
 > @@ -72,10 +72,6 @@
 >   /* Boot Argument Buffer Size */
 >   #define CONFIG_SYS_BARGSIZE		(CONFIG_SYS_CBSIZE)
 >
 > -#define CONFIG_ENV_OFFSET			0x100000
 > -#define CONFIG_ENV_SIZE				0x2000
 > -/* #define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + 
CONFIG_ENV_SIZE) */
 > -
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >   #define CONFIG_SYS_MMC_ENV_PART		1
 >
 > diff --git a/include/configs/usbarmory.h b/include/configs/usbarmory.h
 > index 128f02db66fa..91c8b478b3af 100644
 > --- a/include/configs/usbarmory.h
 > +++ b/include/configs/usbarmory.h
 > @@ -15,8 +15,6 @@
 >   #include <asm/arch/imx-regs.h>
 >
 >   /* U-Boot environment */
 > -#define CONFIG_ENV_OFFSET	(6 * 64 * 1024)
 > -#define CONFIG_ENV_SIZE		(8 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV	0
 >
 >   /* U-Boot general configurations */
 > diff --git a/include/configs/vcoreiii.h b/include/configs/vcoreiii.h
 > index 6ff68cd6a085..e69456ef7ce2 100644
 > --- a/include/configs/vcoreiii.h
 > +++ b/include/configs/vcoreiii.h
 > @@ -25,15 +25,6 @@
 >
 >   #define CONFIG_BOARD_TYPES
 >
 > -#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFFSET)
 > -#define CONFIG_ENV_OFFSET		(1024 * 1024)
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 > -#define CONFIG_ENV_SECT_SIZE		(256 * 1024)
 > -
 > -#define CONFIG_ENV_OFFSET_REDUND      (CONFIG_ENV_OFFSET + 
CONFIG_ENV_SECT_SIZE)
 > -
 > -#endif
 > -
 >   #define CONFIG_SYS_SDRAM_BASE		0x80000000
 >   #if defined(CONFIG_DDRTYPE_H5TQ1G63BFA) || 
defined(CONFIG_DDRTYPE_MT47H128M8HQ)
 >   #define CONFIG_SYS_SDRAM_SIZE		(128 * SZ_1M)
 > diff --git a/include/configs/vct.h b/include/configs/vct.h
 > index 890f347b4395..284d2682593d 100644
 > --- a/include/configs/vct.h
 > +++ b/include/configs/vct.h
 > @@ -128,12 +128,7 @@
 >   #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Timeout for Flash Write 
(in ms)	*/
 >
 >   #ifdef CONFIG_ENV_IS_IN_FLASH
 > -#define CONFIG_ENV_SECT_SIZE	0x10000		/* size of one complete sector	*/
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 
CONFIG_SYS_MONITOR_LEN)
 > -#define	CONFIG_ENV_SIZE		0x4000	/* Total Size of Environment Sector	*/
 > -
 >   /* Address and size of Redundant Environment Sector	*/
 > -#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 >   #endif /* CONFIG_ENV_IS_IN_FLASH */
 >   #endif /* CONFIG_VCT_NOR */
 >
 > @@ -141,8 +136,6 @@
 >   #define CONFIG_USE_ONENAND_BOARD_INIT
 >   #define	CONFIG_SYS_ONENAND_BASE		0x00000000	/* this is not real 
address */
 >   #define CONFIG_SYS_FLASH_BASE		0x00000000
 > -#define CONFIG_ENV_ADDR			(128 << 10)	/* after compr. U-Boot image */
 > -#define	CONFIG_ENV_SIZE			(128 << 10)	/* erase size */
 >   #endif /* CONFIG_VCT_ONENAND */
 >
 >   /*
 > diff --git a/include/configs/ve8313.h b/include/configs/ve8313.h
 > index 2608b2b23220..a31e6f4abe35 100644
 > --- a/include/configs/ve8313.h
 > +++ b/include/configs/ve8313.h
 > @@ -195,13 +195,7 @@
 >   /*
 >    * Environment
 >    */
 > -#define CONFIG_ENV_ADDR		\
 > -			(CONFIG_SYS_FLASH_BASE + CONFIG_SYS_MONITOR_LEN)
 > -#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
 > -#define CONFIG_ENV_SIZE		0x4000
 >   /* Address and size of Redundant Environment Sector */
 > -#define CONFIG_ENV_OFFSET_REDUND	\
 > -			(CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
 >
 >   #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 >   #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
 > diff --git a/include/configs/venice2.h b/include/configs/venice2.h
 > index 8ad872d94f37..b62a43054a21 100644
 > --- a/include/configs/venice2.h
 > +++ b/include/configs/venice2.h
 > @@ -21,7 +21,6 @@
 >   /* Environment in eMMC, at the end of 2nd "boot sector" */
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >   #define CONFIG_SYS_MMC_ENV_PART		2
 > -#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 >
 >   /* SPI */
 >   #define CONFIG_SPI_FLASH_SIZE          (4 << 20)
 > diff --git a/include/configs/ventana.h b/include/configs/ventana.h
 > index 09f90db1f515..2c2d66cdc099 100644
 > --- a/include/configs/ventana.h
 > +++ b/include/configs/ventana.h
 > @@ -20,7 +20,6 @@
 >   #define CONFIG_MACH_TYPE		MACH_TYPE_VENTANA
 >
 >   /* Environment in eMMC, at the end of 2nd "boot sector" */
 > -#define CONFIG_ENV_OFFSET (-CONFIG_ENV_SIZE)
 >   #define CONFIG_SYS_MMC_ENV_DEV 0
 >   #define CONFIG_SYS_MMC_ENV_PART 2
 >
 > diff --git a/include/configs/vexpress_aemv8a.h 
b/include/configs/vexpress_aemv8a.h
 > index b2c14f9e10f6..9a9cec414c87 100644
 > --- a/include/configs/vexpress_aemv8a.h
 > +++ b/include/configs/vexpress_aemv8a.h
 > @@ -201,15 +201,11 @@
 >   #define CONFIG_SYS_MAX_FLASH_SECT	259
 >   /* Store environment at top of flash in the same location as 
blank.img */
 >   /* in the Juno firmware. */
 > -#define CONFIG_ENV_ADDR			0x0BFC0000
 > -#define CONFIG_ENV_SECT_SIZE		0x00010000
 >   #else
 >   #define CONFIG_SYS_FLASH_BASE		0x0C000000
 >   /* 256 x 256KiB sectors */
 >   #define CONFIG_SYS_MAX_FLASH_SECT	256
 >   /* Store environment at top of flash */
 > -#define CONFIG_ENV_ADDR			0x0FFC0000
 > -#define CONFIG_ENV_SECT_SIZE		0x00040000
 >   #endif
 >
 >   #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
 > @@ -217,6 +213,5 @@
 >
 >   #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
 >   #define FLASH_MAX_SECTOR_SIZE		0x00040000
 > -#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
 >
 >   #endif /* __VEXPRESS_AEMV8A_H */
 > diff --git a/include/configs/vexpress_common.h 
b/include/configs/vexpress_common.h
 > index 47ea89df6607..7f215a670771 100644
 > --- a/include/configs/vexpress_common.h
 > +++ b/include/configs/vexpress_common.h
 > @@ -226,21 +226,15 @@
 >   #define FLASH_MAX_SECTOR_SIZE		0x00040000	/* 256 KB sectors */
 >
 >   /* Room required on the stack for the environment data */
 > -#define CONFIG_ENV_SIZE			FLASH_MAX_SECTOR_SIZE
 >
 >   /*
 >    * Amount of flash used for environment:
 >    * We don't know which end has the small erase blocks so we use the 
penultimate
 >    * sector location for the environment
 >    */
 > -#define CONFIG_ENV_SECT_SIZE		FLASH_MAX_SECTOR_SIZE
 >   #define CONFIG_ENV_OVERWRITE		1
 >
 >   /* Store environment at top of flash */
 > -#define CONFIG_ENV_OFFSET		(PHYS_FLASH_SIZE - \
 > -					(2 * CONFIG_ENV_SECT_SIZE))
 > -#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE1 + \
 > -					 CONFIG_ENV_OFFSET)
 >   #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
 >   #define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE0, \
 >   					  CONFIG_SYS_FLASH_BASE1 }
 > diff --git a/include/configs/vf610twr.h b/include/configs/vf610twr.h
 > index ba85bc91e74d..3ab323194387 100644
 > --- a/include/configs/vf610twr.h
 > +++ b/include/configs/vf610twr.h
 > @@ -187,17 +187,11 @@
 >   	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 >
 >   #ifdef CONFIG_ENV_IS_IN_MMC
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 > -
 > -#define CONFIG_ENV_OFFSET		(12 * 64 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >   #endif
 >
 >   #ifdef CONFIG_ENV_IS_IN_NAND
 > -#define CONFIG_ENV_SIZE			(64 * 2048)
 > -#define CONFIG_ENV_SECT_SIZE		(64 * 2048)
 >   #define CONFIG_ENV_RANGE		(512 * 1024)
 > -#define CONFIG_ENV_OFFSET		0x180000
 >   #endif
 >
 >   #endif
 > diff --git a/include/configs/vinco.h b/include/configs/vinco.h
 > index eebb3f7ca789..a709502d4373 100644
 > --- a/include/configs/vinco.h
 > +++ b/include/configs/vinco.h
 > @@ -63,11 +63,6 @@
 >   #ifdef CONFIG_SPI_BOOT
 >   /* bootstrap + u-boot + env + linux in serial flash */
 >   /* Use our own mapping for the VInCo platform */
 > -#undef CONFIG_ENV_OFFSET
 > -#undef CONFIG_ENV_SIZE
 > -
 > -#define CONFIG_ENV_OFFSET       0x10000
 > -#define CONFIG_ENV_SIZE         0x10000
 >
 >   /* Update the bootcommand according to our mapping for the VInCo 
platform */
 >   #undef CONFIG_BOOTCOMMAND
 > diff --git a/include/configs/vining_2000.h 
b/include/configs/vining_2000.h
 > index 6672930fb39c..54c8c2f62efc 100644
 > --- a/include/configs/vining_2000.h
 > +++ b/include/configs/vining_2000.h
 > @@ -85,10 +85,6 @@
 >
 >   #define CONFIG_IMX6_PWM_PER_CLK 66000000
 >
 > -#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 > -#define CONFIG_ENV_SIZE			SZ_8K
 > -#define CONFIG_ENV_OFFSET_REDUND	(9 * SZ_64K)
 > -
 >   #ifdef CONFIG_ENV_IS_IN_MMC
 >   #define CONFIG_SYS_MMC_ENV_DEV		0 /* USDHC4 eMMC */
 >   /* 0=user, 1=boot0, 2=boot1, * 4..7=general0..3. */
 > diff --git a/include/configs/vme8349.h b/include/configs/vme8349.h
 > index 74e8d3925bf2..f40c9002e590 100644
 > --- a/include/configs/vme8349.h
 > +++ b/include/configs/vme8349.h
 > @@ -199,16 +199,7 @@
 >    * Environment
 >    */
 >   #ifndef CONFIG_SYS_RAMBOOT
 > -	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0xc0000)
 > -	#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
 > -	#define CONFIG_ENV_SIZE		0x2000
 > -
 >   /* Address and size of Redundant Environment Sector	*/
 > -#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 > -
 > -#else
 > -	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
 > -	#define CONFIG_ENV_SIZE		0x2000
 >   #endif
 >
 >   #define CONFIG_LOADS_ECHO		/* echo on for serial download */
 > diff --git a/include/configs/wandboard.h b/include/configs/wandboard.h
 > index a0a78eab27bf..a65d23bbe80a 100644
 > --- a/include/configs/wandboard.h
 > +++ b/include/configs/wandboard.h
 > @@ -124,9 +124,7 @@
 >   	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 >
 >   /* Environment organization */
 > -#define CONFIG_ENV_SIZE			(8 * 1024)
 >
 > -#define CONFIG_ENV_OFFSET		(768 * 1024)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >
 >   #endif			       /* __CONFIG_H * */
 > diff --git a/include/configs/warp.h b/include/configs/warp.h
 > index 41fd6c759eba..68361a6199ee 100644
 > --- a/include/configs/warp.h
 > +++ b/include/configs/warp.h
 > @@ -41,8 +41,6 @@
 >   #define CONFIG_SYS_INIT_SP_ADDR \
 >   	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 >
 > -#define CONFIG_ENV_OFFSET		(6 * SZ_64K)
 > -#define CONFIG_ENV_SIZE			SZ_8K
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 >
 >   /* VDD voltage 1.65 - 1.95 */
 > diff --git a/include/configs/warp7.h b/include/configs/warp7.h
 > index 73541fe17608..9a82581c5f3a 100644
 > --- a/include/configs/warp7.h
 > +++ b/include/configs/warp7.h
 > @@ -130,9 +130,7 @@
 >   #define CONFIG_SYS_I2C_SPEED		100000
 >
 >   /* environment organization */
 > -#define CONFIG_ENV_SIZE			SZ_8K
 >
 > -#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 >   #define CONFIG_SYS_FSL_USDHC_NUM	1
 >
 >   #define CONFIG_SYS_MMC_ENV_DEV		0
 > diff --git a/include/configs/wb45n.h b/include/configs/wb45n.h
 > index 43de2e111933..36060975c10e 100644
 > --- a/include/configs/wb45n.h
 > +++ b/include/configs/wb45n.h
 > @@ -66,9 +66,6 @@
 >
 >   #ifdef CONFIG_SYS_USE_NANDFLASH
 >   /* bootstrap + u-boot + env + linux in nandflash */
 > -#define CONFIG_ENV_OFFSET           0xa0000
 > -#define CONFIG_ENV_OFFSET_REDUND    0xc0000
 > -#define CONFIG_ENV_SIZE             0x20000	/* 1 block = 128 kB */
 >
 >   #define CONFIG_BOOTCOMMAND  "nand read 0x22000000 0xe0000 0x280000; " \
 >       "run _mtd; bootm"
 > diff --git a/include/configs/wb50n.h b/include/configs/wb50n.h
 > index 6e471f62e6be..ca1619f25116 100644
 > --- a/include/configs/wb50n.h
 > +++ b/include/configs/wb50n.h
 > @@ -72,7 +72,6 @@
 >       "autostart=no\0"
 >
 >   /* bootstrap + u-boot + env in nandflash */
 > -#define CONFIG_ENV_OFFSET_REDUND    0xC0000
 >   #define CONFIG_BOOTCOMMAND \
 >       "nand read 0x22000000 0x000e0000 0x500000; " \
 >       "bootm"
 > diff --git a/include/configs/woodburn_common.h 
b/include/configs/woodburn_common.h
 > index d7c4a6f1f4d8..194e43ecc612 100644
 > --- a/include/configs/woodburn_common.h
 > +++ b/include/configs/woodburn_common.h
 > @@ -119,14 +119,7 @@
 >   #define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
 >   #define CONFIG_SYS_MONITOR_LEN		(512 * 1024)
 >
 > -#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
 > -#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
 > -
 >   /* Address and size of Redundant Environment Sector	*/
 > -#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 > -
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
 > -				CONFIG_SYS_MONITOR_LEN)
 >
 >   /*
 >    * CFI FLASH driver setup
 > diff --git a/include/configs/work_92105.h b/include/configs/work_92105.h
 > index e260a637d6fd..f73946b935a4 100644
 > --- a/include/configs/work_92105.h
 > +++ b/include/configs/work_92105.h
 > @@ -116,11 +116,6 @@
 >    * Environment
 >    */
 >
 > -#define CONFIG_ENV_SIZE			0x00020000
 > -#define CONFIG_ENV_OFFSET		0x00100000
 > -#define CONFIG_ENV_OFFSET_REDUND	0x00120000
 > -#define CONFIG_ENV_ADDR			0x80000100
 > -
 >   /*
 >    * Boot Linux
 >    */
 > diff --git a/include/configs/x530.h b/include/configs/x530.h
 > index 2269d1ed8cd0..b4e986ebccdf 100644
 > --- a/include/configs/x530.h
 > +++ b/include/configs/x530.h
 > @@ -59,10 +59,6 @@
 >   #define CONFIG_EHCI_IS_TDI
 >
 >   /* Environment in SPI NOR flash */
 > -#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
 > -#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
 > -#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 > -#define CONFIG_ENV_ADDR			CONFIG_ENV_OFFSET
 >
 >   #define CONFIG_PHY_MARVELL		/* there is a marvell phy */
 >   #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 > diff --git a/include/configs/x600.h b/include/configs/x600.h
 > index f6779213a896..63092b24a53a 100644
 > --- a/include/configs/x600.h
 > +++ b/include/configs/x600.h
 > @@ -87,12 +87,6 @@
 >   /*
 >    * U-Boot Environment placing definitions.
 >    */
 > -#define CONFIG_ENV_SECT_SIZE			0x00010000
 > -#define CONFIG_ENV_ADDR				(CONFIG_SYS_MONITOR_BASE + \
 > -						 CONFIG_SYS_MONITOR_LEN)
 > -#define CONFIG_ENV_SIZE				0x02000
 > -#define CONFIG_ENV_ADDR_REDUND			(CONFIG_ENV_ADDR + \
 > -						 CONFIG_ENV_SECT_SIZE)
 >
 >   /* Miscellaneous configurable options */
 >   #define CONFIG_BOOT_PARAMS_ADDR			0x00000100
 > diff --git a/include/configs/x86-chromebook.h 
b/include/configs/x86-chromebook.h
 > index 5a33223b7ddf..0efc7156a6dd 100644
 > --- a/include/configs/x86-chromebook.h
 > +++ b/include/configs/x86-chromebook.h
 > @@ -28,11 +28,6 @@
 >   #define VIDEO_IO_OFFSET				0
 >   #define CONFIG_X86EMU_RAW_IO
 >
 > -#undef CONFIG_ENV_SIZE
 > -#define CONFIG_ENV_SIZE			0x1000
 > -#define CONFIG_ENV_SECT_SIZE		0x1000
 > -#define CONFIG_ENV_OFFSET		0x003f8000
 > -
 >   #define CONFIG_STD_DEVICES_SETTINGS	"stdin=usbkbd,i8042-kbd,serial\0" \
 >   					"stdout=vidconsole,serial\0" \
 >   					"stderr=vidconsole,serial\0"
 > diff --git a/include/configs/x86-common.h b/include/configs/x86-common.h
 > index 54214f99e9a6..329b270467e2 100644
 > --- a/include/configs/x86-common.h
 > +++ b/include/configs/x86-common.h
 > @@ -79,7 +79,6 @@
 > 
/*-----------------------------------------------------------------------
 >    * Environment configuration
 >    */
 > -#define CONFIG_ENV_SIZE			0x01000
 >
 > 
/*-----------------------------------------------------------------------
 >    * PCI configuration
 > diff --git a/include/configs/xfi3.h b/include/configs/xfi3.h
 > index afc4b82fd80f..51efab1d2c1a 100644
 > --- a/include/configs/xfi3.h
 > +++ b/include/configs/xfi3.h
 > @@ -13,7 +13,6 @@
 >   #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 >
 >   /* Environment */
 > -#define CONFIG_ENV_SIZE			(16 * 1024)
 >   #define CONFIG_ENV_OVERWRITE
 >
 >   /* Booting Linux */
 > diff --git a/include/configs/xilinx_zynqmp_r5.h 
b/include/configs/xilinx_zynqmp_r5.h
 > index 4eb3312e2d2b..38d952d0c0cc 100644
 > --- a/include/configs/xilinx_zynqmp_r5.h
 > +++ b/include/configs/xilinx_zynqmp_r5.h
 > @@ -16,8 +16,6 @@
 >   #define CONFIG_SYS_BAUDRATE_TABLE  \
 >   	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200, 
230400}
 >
 > -# define CONFIG_ENV_SIZE	(128 << 10)
 > -
 >   /* Allow to overwrite serial and ethaddr */
 >   #define CONFIG_ENV_OVERWRITE
 >
 > diff --git a/include/configs/xpedite517x.h 
b/include/configs/xpedite517x.h
 > index 23f038961574..634ee4240993 100644
 > --- a/include/configs/xpedite517x.h
 > +++ b/include/configs/xpedite517x.h
 > @@ -485,9 +485,6 @@ extern unsigned long get_board_sys_clk(unsigned 
long dummy);
 >   /*
 >    * Environment Configuration
 >    */
 > -#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
 > -#define CONFIG_ENV_SIZE		0x8000
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 
CONFIG_SYS_MONITOR_LEN)
 >
 >   /*
 >    * Flash memory map:
 > diff --git a/include/configs/xpedite520x.h 
b/include/configs/xpedite520x.h
 > index 21e91ee1a4dd..0186aaa10277 100644
 > --- a/include/configs/xpedite520x.h
 > +++ b/include/configs/xpedite520x.h
 > @@ -285,9 +285,6 @@
 >   /*
 >    * Environment Configuration
 >    */
 > -#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
 > -#define CONFIG_ENV_SIZE		0x8000
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - (256 * 1024))
 >
 >   /*
 >    * Flash memory map:
 > diff --git a/include/configs/xpedite537x.h 
b/include/configs/xpedite537x.h
 > index 73e1fa313f88..5e027bebcabe 100644
 > --- a/include/configs/xpedite537x.h
 > +++ b/include/configs/xpedite537x.h
 > @@ -335,9 +335,6 @@ extern unsigned long get_board_ddr_clk(unsigned 
long dummy);
 >   /*
 >    * Environment Configuration
 >    */
 > -#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
 > -#define CONFIG_ENV_SIZE		0x8000
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - (256 * 1024))
 >
 >   /*
 >    * Flash memory map:
 > diff --git a/include/configs/xpedite550x.h 
b/include/configs/xpedite550x.h
 > index e5a41abd4b52..611089cbb935 100644
 > --- a/include/configs/xpedite550x.h
 > +++ b/include/configs/xpedite550x.h
 > @@ -333,9 +333,6 @@ extern unsigned long get_board_ddr_clk(unsigned 
long dummy);
 >   /*
 >    * Environment Configuration
 >    */
 > -#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
 > -#define CONFIG_ENV_SIZE		0x8000
 > -#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - (256 * 1024))
 >
 >   /*
 >    * Flash memory map:
 > diff --git a/include/configs/xpress.h b/include/configs/xpress.h
 > index 4cbf8aa5261d..dbdd812506b5 100644
 > --- a/include/configs/xpress.h
 > +++ b/include/configs/xpress.h
 > @@ -51,8 +51,6 @@
 >   	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 >
 >   /* Environment is in stored in the eMMC boot partition */
 > -#define CONFIG_ENV_SIZE			(16 << 10)
 > -#define CONFIG_ENV_OFFSET		(512 << 10)
 >   #define CONFIG_SYS_MMC_ENV_DEV		0	/* USDHC2 */
 >   #define CONFIG_SYS_MMC_ENV_PART		1	/* boot parition */
 >   #define CONFIG_MMCROOT			"/dev/mmcblk0p2"  /* USDHC2 */
 > diff --git a/include/configs/xtfpga.h b/include/configs/xtfpga.h
 > index 2f20273572d2..8b73900130d7 100644
 > --- a/include/configs/xtfpga.h
 > +++ b/include/configs/xtfpga.h
 > @@ -220,8 +220,6 @@
 >    * Put environment in top block (64kB)
 >    * Another option would be to put env. in 2nd param block offs 8KB, 
size 8KB
 >    */
 > -#define CONFIG_ENV_OFFSET    (CONFIG_SYS_FLASH_SIZE - 
CONFIG_SYS_FLASH_SECT_SZ)
 > -#define CONFIG_ENV_SIZE	     CONFIG_SYS_FLASH_SECT_SZ
 >
 >   /* print 'E' for empty sector on flinfo */
 >   #define CONFIG_SYS_FLASH_EMPTY_INFO
 > diff --git a/include/configs/zmx25.h b/include/configs/zmx25.h
 > index 9d683768f4cf..a8c6f0be10d4 100644
 > --- a/include/configs/zmx25.h
 > +++ b/include/configs/zmx25.h
 > @@ -85,10 +85,6 @@
 >   #define CONFIG_SYS_MAX_FLASH_BANKS	1
 >   #define CONFIG_SYS_MAX_FLASH_SECT	256
 >
 > -#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x00040000)
 > -#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
 > -#define CONFIG_ENV_SIZE			(128 * 1024)
 > -
 >   /*
 >    * CFI FLASH driver setup
 >    */
 > diff --git a/include/env_internal.h b/include/env_internal.h
 > index b8158c0e0bc5..90a4df8a7273 100644
 > --- a/include/env_internal.h
 > +++ b/include/env_internal.h
 > @@ -30,26 +30,6 @@
 > 
*************************************************************************/
 >
 >   #if defined(CONFIG_ENV_IS_IN_FLASH)
 > -# ifndef	CONFIG_ENV_ADDR
 > -#  define	CONFIG_ENV_ADDR	(CONFIG_SYS_FLASH_BASE + CONFIG_ENV_OFFSET)
 > -# endif
 > -# ifndef	CONFIG_ENV_OFFSET
 > -#  define	CONFIG_ENV_OFFSET (CONFIG_ENV_ADDR - CONFIG_SYS_FLASH_BASE)
 > -# endif
 > -# if !defined(CONFIG_ENV_ADDR_REDUND) && 
defined(CONFIG_ENV_OFFSET_REDUND)
 > -#  define	CONFIG_ENV_ADDR_REDUND	\
 > -		(CONFIG_SYS_FLASH_BASE + CONFIG_ENV_OFFSET_REDUND)
 > -# endif
 > -# if defined(CONFIG_ENV_SECT_SIZE) || defined(CONFIG_ENV_SIZE)
 > -#  ifndef	CONFIG_ENV_SECT_SIZE
 > -#   define	CONFIG_ENV_SECT_SIZE	CONFIG_ENV_SIZE
 > -#  endif
 > -#  ifndef	CONFIG_ENV_SIZE
 > -#   define	CONFIG_ENV_SIZE	CONFIG_ENV_SECT_SIZE
 > -#  endif
 > -# else
 > -#  error "Both CONFIG_ENV_SECT_SIZE and CONFIG_ENV_SIZE undefined"
 > -# endif
 >   # if	defined(CONFIG_ENV_ADDR_REDUND) && \
 >   	((CONFIG_ENV_ADDR >= CONFIG_SYS_MONITOR_BASE) &&		\
 >   	(CONFIG_ENV_ADDR_REDUND + CONFIG_ENV_SIZE) <=		\
 > @@ -75,41 +55,9 @@
 >   #  endif
 >   extern unsigned long nand_env_oob_offset;
 >   #  define CONFIG_ENV_OFFSET nand_env_oob_offset
 > -# else
 > -#  ifndef CONFIG_ENV_OFFSET
 > -#   error "Need to define CONFIG_ENV_OFFSET when using 
CONFIG_ENV_IS_IN_NAND"
 > -#  endif
 >   # endif /* CONFIG_ENV_OFFSET_OOB */
 > -# ifndef CONFIG_ENV_SIZE
 > -#  error "Need to define CONFIG_ENV_SIZE when using 
CONFIG_ENV_IS_IN_NAND"
 > -# endif
 >   #endif /* CONFIG_ENV_IS_IN_NAND */
 >
 > -#if defined(CONFIG_ENV_IS_IN_UBI)
 > -# ifndef CONFIG_ENV_UBI_PART
 > -#  error "Need to define CONFIG_ENV_UBI_PART when using 
CONFIG_ENV_IS_IN_UBI"
 > -# endif
 > -# ifndef CONFIG_ENV_UBI_VOLUME
 > -#  error "Need to define CONFIG_ENV_UBI_VOLUME when using 
CONFIG_ENV_IS_IN_UBI"
 > -# endif
 > -# ifndef CONFIG_ENV_SIZE
 > -#  error "Need to define CONFIG_ENV_SIZE when using 
CONFIG_ENV_IS_IN_UBI"
 > -# endif
 > -# ifndef CONFIG_CMD_UBI
 > -#  error "Need to define CONFIG_CMD_UBI when using CONFIG_ENV_IS_IN_UBI"
 > -# endif
 > -#endif /* CONFIG_ENV_IS_IN_UBI */
 > -
 > -/* Embedded env is only supported for some flash types */
 > -#ifdef CONFIG_ENV_IS_EMBEDDED
 > -# if	!defined(CONFIG_ENV_IS_IN_FLASH)	&& \
 > -	!defined(CONFIG_ENV_IS_IN_NAND)		&& \
 > -	!defined(CONFIG_ENV_IS_IN_ONENAND)	&& \
 > -	!defined(CONFIG_ENV_IS_IN_SPI_FLASH)
 > -#  error "CONFIG_ENV_IS_EMBEDDED not supported for your flash type"
 > -# endif
 > -#endif
 > -
 >   /*
 >    * For the flash types where embedded env is supported, but it 
cannot be
 >    * calculated automatically (i.e. NAND), take the board opt-in.
 > diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
 > index d73e433cffb1..284fb62e54c1 100644
 > --- a/scripts/config_whitelist.txt
 > +++ b/scripts/config_whitelist.txt
 > @@ -426,9 +426,7 @@ CONFIG_ENABLE_MMU
 >   CONFIG_ENABLE_MUST_CHECK
 >   CONFIG_ENABLE_WARN_DEPRECATED
 >   CONFIG_ENV_ACCESS_IGNORE_FORCE
 > -CONFIG_ENV_ADDR
 >   CONFIG_ENV_ADDR_FLEX
 > -CONFIG_ENV_ADDR_REDUND
 >   CONFIG_ENV_BASE
 >   CONFIG_ENV_CALLBACK_LIST_DEFAULT
 >   CONFIG_ENV_CALLBACK_LIST_STATIC
 > @@ -443,7 +441,6 @@ CONFIG_ENV_IS_IN_
 >   CONFIG_ENV_MAX_ENTRIES
 >   CONFIG_ENV_MIN_ENTRIES
 >   CONFIG_ENV_OFFSET_OOB
 > -CONFIG_ENV_OFFSET_REDUND
 >   CONFIG_ENV_OVERWRITE
 >   CONFIG_ENV_RANGE
 >   CONFIG_ENV_RDADDR
 >

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
