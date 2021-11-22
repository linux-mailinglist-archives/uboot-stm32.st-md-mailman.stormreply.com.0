Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4057458B9F
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 10:32:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D627C5A4FD;
	Mon, 22 Nov 2021 09:32:57 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B4CBC597BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 09:32:57 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y68so48338718ybe.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Cj5V5QVj1kot69+gYXfRYjj66phizsZ6hGMDHuBxkU=;
 b=uRqpvEhMPJp9KX+uGXQ4CQshOnSgBX6FlmAOqFkmRX6EdUfjCGelrhTFkL941/4EC4
 m/rfw0ax1LHwaG0FzjnuNgkUh7utsvcQVqgifARgzLDzhSadNtDWRJ3VupmGqrBhnP4D
 nlHdAnMd1+mMwZ+Ou5lkNCwTAlqUIs0unHe0yCzGLAHHi5MteIWpuLvG8lCgH+zVHyPD
 JBTQj/TssWe08VtRj8q5l973u5z04E5ZAeOZs3zt171opmsz8g9R7h0opEbIfDNCiQOx
 t9F2l+EOz3myDZZGv7T1obeGRVgwCtY9gcaO7sBEuIR2BK2Ys/yQtxVBAUwN7jYY8Qxl
 UDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Cj5V5QVj1kot69+gYXfRYjj66phizsZ6hGMDHuBxkU=;
 b=mxTNoQLF6vVcZxmgjx7e8ewMgr8iYFKoG73dScC3JxjM1BflCmdbm1mdlnm9GBDoa2
 x9iUNrfHrBuHGgyWHIVLSiCEJDFb0gL0sB2ujkgSVGpLbwwMFoz+cYwCnZTcnhCGE9Kf
 my+AzD4PrTVz7My1k7bRRSpazJ8WhVfAgBfQ6xDzBAglqWNlDt0AZWHm/Ea1vqVv/QLn
 udxZL81DnZ274bqIiWHoOGy5bmsRioL8RiqId72vD/p/1k6lsApcAVnnaHxQbtlalm+w
 BDrHZnuuprGrv2czGcyX1BD+fkmbaG1q/Si/dGGxx9NnDVGgmGvVWCpSD4Tv4RKlVp6V
 5wWg==
X-Gm-Message-State: AOAM530zqmSadtpZdoo4wB9iwJrtA3AfephZgLhAmw087gFPqib/dzZu
 iFUQA+z1tpXJrYCMjjDiO7Ubr5QvinW6Q+hu0k1zgw==
X-Google-Smtp-Source: ABdhPJwKGF1svygZJWhaDVkTW3mbU2GXqZIwH3EupscKK1ufPhjmeWHaHKd4QPnOBgjJ22ZAZPtCE+w8OH2i8E+96sM=
X-Received: by 2002:a25:c094:: with SMTP id
 c142mr61813183ybf.133.1637573575905; 
 Mon, 22 Nov 2021 01:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
 <20211011075244.2.Iceb3be142ba855190aaab771d6922f41ffcaccc3@changeid>
 <e958957d-7207-4c40-831d-78d78fd0602f@foss.st.com>
In-Reply-To: <e958957d-7207-4c40-831d-78d78fd0602f@foss.st.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 22 Nov 2021 11:32:19 +0200
Message-ID: <CAC_iWjJ1bZ+6VgP1HSa8hLw5Wys=+gDgM1S4JDrJgxo+iXquWw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] stm32mp15: remove configs dependency
	on CONFIG_TFABOOT
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

On Mon, 22 Nov 2021 at 10:09, Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
> Hi Patrick
>
> On 10/11/21 9:52 AM, Patrick Delaunay wrote:
> > Remove the dependency on CONFIG_TFABOOT in stm32mp Kconfig
> > - always activate the ARCH config: CONFIG_ARCH_SUPPORT_PSCI
> >   and CONFIG_CPU_V7_HAS_NONSEC
> > - CONFIG_ARMV7_NONSEC is deactivated in trusted defconfig
> > - the correct sysreset driver is activated in each defconfig:
> >   CONFIG_SYSRESET_PSCI or SYSRESET_SYSCON
> >
> > Reported-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > ---
> >
> >  arch/arm/mach-stm32mp/Kconfig                             | 8 ++------
> >  configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig        | 1 +
> >  configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig       | 1 +
> >  .../stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig   | 1 +
> >  configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig   | 1 +
> >  configs/stm32mp15_basic_defconfig                         | 1 +
> >  configs/stm32mp15_defconfig                               | 3 +++
> >  configs/stm32mp15_dhcom_basic_defconfig                   | 1 +
> >  configs/stm32mp15_dhcor_basic_defconfig                   | 1 +
> >  configs/stm32mp15_trusted_defconfig                       | 3 +++
> >  10 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> > index 69d56c23e1..4ef0daeab2 100644
> > --- a/arch/arm/mach-stm32mp/Kconfig
> > +++ b/arch/arm/mach-stm32mp/Kconfig
> > @@ -35,10 +35,9 @@ config ENV_SIZE
> >
> >  config STM32MP15x
> >       bool "Support STMicroelectronics STM32MP15x Soc"
> > -     select ARCH_SUPPORT_PSCI if !TFABOOT
> > -     select ARM_SMCCC if TFABOOT
> > +     select ARCH_SUPPORT_PSCI
> >       select CPU_V7A
> > -     select CPU_V7_HAS_NONSEC if !TFABOOT
> > +     select CPU_V7_HAS_NONSEC
> >       select CPU_V7_HAS_VIRT
> >       select OF_BOARD_SETUP
> >       select PINCTRL_STM32
> > @@ -47,8 +46,6 @@ config STM32MP15x
> >       select STM32_SERIAL
> >       select SYS_ARCH_TIMER
> >       imply CMD_NVEDIT_INFO
> > -     imply SYSRESET_PSCI if TFABOOT
> > -     imply SYSRESET_SYSCON if !TFABOOT
> >       help
> >               support of STMicroelectronics SOC STM32MP15x family
> >               STM32MP157, STM32MP153 or STM32MP151
> > @@ -153,7 +150,6 @@ config NR_DRAM_BANKS
> >
> >  config DDR_CACHEABLE_SIZE
> >       hex "Size of the DDR marked cacheable in pre-reloc stage"
> > -     default 0x10000000 if TFABOOT
> >       default 0x40000000
> >       help
> >               Define the size of the DDR marked as cacheable in U-Boot
> > diff --git a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> > index 14bf6d1376..ecc5ec1ffe 100644
> > --- a/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> > +++ b/configs/stm32mp15-icore-stm32mp1-ctouch2_defconfig
> > @@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
> >  CONFIG_DM_RTC=y
> >  CONFIG_RTC_STM32=y
> >  CONFIG_SERIAL_RX_BUFFER=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_WDT=y
> >  CONFIG_WDT_STM32MP=y
> >  CONFIG_LZO=y
> > diff --git a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> > index 648ecbfc67..fc5b5f370b 100644
> > --- a/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> > +++ b/configs/stm32mp15-icore-stm32mp1-edimm2.2_defconfig
> > @@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
> >  CONFIG_DM_RTC=y
> >  CONFIG_RTC_STM32=y
> >  CONFIG_SERIAL_RX_BUFFER=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_WDT=y
> >  CONFIG_WDT_STM32MP=y
> >  CONFIG_LZO=y
> > diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> > index f422ffbeda..4faa4e3ce4 100644
> > --- a/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> > +++ b/configs/stm32mp15-microgea-stm32mp1-microdev2-of7_defconfig
> > @@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
> >  CONFIG_DM_RTC=y
> >  CONFIG_RTC_STM32=y
> >  CONFIG_SERIAL_RX_BUFFER=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_WDT=y
> >  CONFIG_WDT_STM32MP=y
> >  CONFIG_LZO=y
> > diff --git a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> > index 244d9ccf4e..bab81bfa92 100644
> > --- a/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> > +++ b/configs/stm32mp15-microgea-stm32mp1-microdev2_defconfig
> > @@ -73,6 +73,7 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
> >  CONFIG_DM_RTC=y
> >  CONFIG_RTC_STM32=y
> >  CONFIG_SERIAL_RX_BUFFER=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_WDT=y
> >  CONFIG_WDT_STM32MP=y
> >  CONFIG_LZO=y
> > diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> > index 77ed82c99f..6b3c2d6150 100644
> > --- a/configs/stm32mp15_basic_defconfig
> > +++ b/configs/stm32mp15_basic_defconfig
> > @@ -147,6 +147,7 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_USB=y
> >  CONFIG_DM_USB_GADGET=y
> >  CONFIG_USB_EHCI_HCD=y
> > diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> > index 701b1510c5..9d97301075 100644
> > --- a/configs/stm32mp15_defconfig
> > +++ b/configs/stm32mp15_defconfig
> > @@ -8,10 +8,12 @@ CONFIG_ENV_OFFSET=0x480000
> >  CONFIG_ENV_SECT_SIZE=0x40000
> >  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
> >  CONFIG_TARGET_ST_STM32MP15x=y
> > +CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> >  CONFIG_CMD_STM32KEY=y
> >  CONFIG_CMD_STM32PROG=y
> >  CONFIG_ENV_OFFSET_REDUND=0x4C0000
> >  CONFIG_TYPEC_STUSB160X=y
> > +# CONFIG_ARMV7_NONSEC is not set
> >  CONFIG_DISTRO_DEFAULTS=y
> >  CONFIG_SYS_LOAD_ADDR=0xc2000000
> >  CONFIG_FIT=y
> > @@ -126,6 +128,7 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > +CONFIG_SYSRESET_PSCI=y
> >  CONFIG_TEE=y
> >  CONFIG_OPTEE=y
> >  # CONFIG_OPTEE_TA_AVB is not set
> > diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> > index 5b85f6ad03..8da8f3fe2a 100644
> > --- a/configs/stm32mp15_dhcom_basic_defconfig
> > +++ b/configs/stm32mp15_dhcom_basic_defconfig
> > @@ -129,6 +129,7 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_USB=y
> >  CONFIG_DM_USB_GADGET=y
> >  CONFIG_USB_EHCI_HCD=y
> > diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> > index 37dd2754c0..4315c4be3c 100644
> > --- a/configs/stm32mp15_dhcor_basic_defconfig
> > +++ b/configs/stm32mp15_dhcor_basic_defconfig
> > @@ -123,6 +123,7 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > +CONFIG_SYSRESET_SYSCON=y
> >  CONFIG_USB=y
> >  CONFIG_DM_USB_GADGET=y
> >  CONFIG_USB_EHCI_HCD=y
> > diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> > index b4ed090e3f..5e2ec49298 100644
> > --- a/configs/stm32mp15_trusted_defconfig
> > +++ b/configs/stm32mp15_trusted_defconfig
> > @@ -9,10 +9,12 @@ CONFIG_ENV_SECT_SIZE=0x40000
> >  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
> >  CONFIG_STM32MP15x_STM32IMAGE=y
> >  CONFIG_TARGET_ST_STM32MP15x=y
> > +CONFIG_DDR_CACHEABLE_SIZE=0x10000000
> >  CONFIG_CMD_STM32KEY=y
> >  CONFIG_CMD_STM32PROG=y
> >  CONFIG_ENV_OFFSET_REDUND=0x2C0000
> >  CONFIG_TYPEC_STUSB160X=y
> > +# CONFIG_ARMV7_NONSEC is not set
> >  CONFIG_DISTRO_DEFAULTS=y
> >  CONFIG_SYS_LOAD_ADDR=0xc2000000
> >  CONFIG_FIT=y
> > @@ -127,6 +129,7 @@ CONFIG_SPI=y
> >  CONFIG_DM_SPI=y
> >  CONFIG_STM32_QSPI=y
> >  CONFIG_STM32_SPI=y
> > +CONFIG_SYSRESET_PSCI=y
> >  CONFIG_TEE=y
> >  CONFIG_OPTEE=y
> >  # CONFIG_OPTEE_TA_AVB is not set
> >
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks
> Patrice

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
