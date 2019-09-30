Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC3C1DFE
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 11:31:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 407BFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 09:31:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9B69C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 09:31:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8U9UgNE003542; Mon, 30 Sep 2019 11:30:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pLQncXZ0PjIkegojiZLV8dcWql8nWF8SfY58/0a9SXo=;
 b=TozxvWp7hbocA2OUcRQhCv28wPs4JYn3C0TrH02zqiViYsW9NHPuOO1VUh9ByDZ0m1Az
 UwEosw6zqCUptEvZVzzKB1PpY48M2oKyNwz+7vQM87aCUhJCJnuuJjTMKkzpyTPNFd7/
 TLWcgdNtPrY0i+CuIR5VIp8cHDnhcZysNuL+MpO0QATpnuuUzpe2aTGE5ie/CFiaLV00
 Zec+u7H4VgS2BWXA1iTP+30hj3RzMSlHQpBnjrm5Nrju5MrLukFYnzEv5m+B/UvcNUsQ
 yy+/Z4xVYnakMGX0+67OdCcNy2oT1SmM6nJBm9No2tvDzfPYITL7g2gVYrCvJIX5qOt6 ew== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9vj3qh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 11:30:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A63D4B;
 Mon, 30 Sep 2019 09:30:34 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 636F92BACF5;
 Mon, 30 Sep 2019 11:30:33 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 30 Sep
 2019 11:30:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 30 Sep 2019 11:30:32 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v3 2/3] env: introduce macro ENV_IS_IN_SOMEWHERE
Thread-Index: AQHVbgOjXdLnjLSNmU6UWfD8qsxsJ6c+rdmAgAVGdqA=
Date: Mon, 30 Sep 2019 09:30:32 +0000
Message-ID: <c6c9d7f550f84529b1289822a518468f@SFHDAG6NODE3.st.com>
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <20190918092920.21435-3-patrick.delaunay@st.com>
 <CAPnjgZ2xTrD10Bc+ZFQxTqCx5Dnx05bbagaKTdRh=gg1RJsFNg@mail.gmail.com>
In-Reply-To: <CAPnjgZ2xTrD10Bc+ZFQxTqCx5Dnx05bbagaKTdRh=gg1RJsFNg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_06:2019-09-25,2019-09-30 signatures=0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Michal Simek <michal.simek@xilinx.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>, Marek
 Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ash Charles <ash@gumstix.com>, Wolfgang Denk <wd@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam
 Ford <aford173@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>, Anup
 Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] env: introduce macro
	ENV_IS_IN_SOMEWHERE
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

Hi Simon,

> From: Simon Glass <sjg@chromium.org>
> Sent: vendredi 27 septembre 2019 03:49
> 
> On Wed, 18 Sep 2019 at 03:30, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > This patch introduce a macro ENV_IS_IN_SOMEWHERE to check if the the
> > environment can be saved somewhere, in a device or in a file system,
> > without assumption on CONFIG$(SPL_TPL_)ENV_IS_NOWHERE.
> >
> > Since the commit 208bd2b85ecc ("env: allow ENV_IS_NOWHERE with other
> > storage target"), is is allowed to activated ENV_IS_NOWHERE with other
> > CONFIG_IS_IN...
> > It is only the case for U-Boot but the restriction in Kconfig could
> > also removed for SPL and TPL (depends on !SPL_ENV_IS_NOWHERE /
> depends
> > on !TPL_ENV_IS_NOWHERE).
> >
> > This macro ENV_IS_IN_DEVICE can be used in code to check if the
> > environment for U-Boot / SPL / TPL is really managed (at least one
> > CONFIG$(SPL_TPL_)ENV_IS_IN_.. is activated).
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v3: None
> > Changes in v2: None
> >
> >  cmd/nvedit.c  | 29 +++++++----------------------  include/env.h | 13
> > +++++++++++++
> >  2 files changed, 20 insertions(+), 22 deletions(-)
> 
> I feel this is a bit confusion as we have ENV_IS_NOWHERE and
> ENV_IS_IN_SOMEWHERE which are opposites. Can they both be true?

I am not completely satisfied by the name " ENV_IS_IN_SOMEWHERE ".

Perhaps other name will be less confusing: 
 "ENV_IS_IN_XXX", "ENV_IS_IN_DEVICE",  "ENV_IS_IN_STORAGE_MEDIUM",  "ENV_SAVE_SUPPORT" ...

But I don't found a perfect solution...

It is not really the opposite:  ENV_IS_IN_SOMEWHERE  means at least one of the config  "ENV_IS_IN...." is activated.
=> at leats one not volatile TARGET (= a strorage medium) is supported to load and save the environment

Yes, then can both be true: ENV can support several target in U-Boot
(but it is not the case today in SPL due to dependency in Kconfig):
- CONFIG_ENV_IS_IN_EXT4
- CONFIG_ENV_IS_IN_FAT
- CONFIG_ENV_IS_IN_NAND
....

The arrays env_locations[] to defined the location supported
=> env_get_location = weak function select the location (can ENVL_NOWHERE)

For me, U-Boot have no reason to refuse ENV_IS_NOWHERE when the other ENV_IS_IN_XXX are activated , as it I supported in env code.
=> ENVL_NOWHERE can be see as a fallback (no error) when no other ENV location is available (each init failed / not supported in device tree)...

I plan to use this feature in stm32mp1 platform: U-Boot select the ENV location according the boot device 

Boot from
- SD Card : eMMC => env in a file in ext4 file
- NAND =>  env in a UBI file
- NOR => env in SPI flash parttion (RAW)
- other case (boot form USB/serial for STM32CubeProgrammer): 
   U-Boot don't known where found the environment , use default environment => fallback with NOWHERE returned by env_get_location()

board/st/stm32mp1/stm32mp1.c:757

enum env_location env_get_location(enum env_operation op, int prio)
{
	u32 bootmode = get_bootmode();

	if (prio)
		return ENVL_UNKNOWN;

	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
#ifdef CONFIG_ENV_IS_IN_EXT4
	case BOOT_FLASH_SD:
	case BOOT_FLASH_EMMC:
		return ENVL_EXT4;
#endif
#ifdef CONFIG_ENV_IS_IN_UBI
	case BOOT_FLASH_NAND:
		return ENVL_UBI;
#endif
#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
	case BOOT_FLASH_NOR:
		return ENVL_SPI_FLASH;
#endif
	default:
		return ENVL_NOWHERE;
	}
}
 
> So how about adding a comment as to what your new ENV_IS_NOWHERE
> means?

I don't think I change the meaning of ENV_IS_NOWHERE

In env/Kconfig

	  Define this if you don't want to or can't have an environment stored
	  on a storage medium. In this case the environment will still exist
	  while U-Boot is running, but once U-Boot exits it will not be
	  stored. U-Boot will therefore always start up with a default
	  environment.

I only change the dependency 

> Also, how about ENV_IS_SOMEWHERE?

Yes I need to add comment on the added macro

> 
> >
> > diff --git a/cmd/nvedit.c b/cmd/nvedit.c index 1cb0bc1460..7a6ec5ae30
> > 100644
> > --- a/cmd/nvedit.c
> > +++ b/cmd/nvedit.c
> > @@ -40,28 +40,13 @@
> >
> >  DECLARE_GLOBAL_DATA_PTR;
> >
> > -#if    defined(CONFIG_ENV_IS_IN_EEPROM)        || \
> > -       defined(CONFIG_ENV_IS_IN_FLASH)         || \
> > -       defined(CONFIG_ENV_IS_IN_MMC)           || \
> > -       defined(CONFIG_ENV_IS_IN_FAT)           || \
> > -       defined(CONFIG_ENV_IS_IN_EXT4)          || \
> > -       defined(CONFIG_ENV_IS_IN_NAND)          || \
> > -       defined(CONFIG_ENV_IS_IN_NVRAM)         || \
> > -       defined(CONFIG_ENV_IS_IN_ONENAND)       || \
> > -       defined(CONFIG_ENV_IS_IN_SATA)          || \
> > -       defined(CONFIG_ENV_IS_IN_SPI_FLASH)     || \
> > -       defined(CONFIG_ENV_IS_IN_REMOTE)        || \
> > -       defined(CONFIG_ENV_IS_IN_UBI)
> > -
> > -#define ENV_IS_IN_DEVICE
> > -
> > -#endif
> > -
> > -#if    !defined(ENV_IS_IN_DEVICE)              && \
> > -       !defined(CONFIG_ENV_IS_NOWHERE)
> > +#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
> > +#if    !ENV_IS_IN_SOMEWHERE            && \
> > +       !CONFIG_IS_ENABLED(ENV_IS_NOWHERE)
> >  # error Define one of CONFIG_ENV_IS_IN_{EEPROM|FLASH|MMC|FAT|EXT4|\
> >  NAND|NVRAM|ONENAND|SATA|SPI_FLASH|REMOTE|UBI} or
> > CONFIG_ENV_IS_NOWHERE  #endif
> > +#endif
> >
> >  /*
> >   * Maximum expected input data size for import command @@ -744,7
> > +729,7 @@ ulong env_get_ulong(const char *name, int base, ulong
> > default_val)  }
> >
> >  #ifndef CONFIG_SPL_BUILD
> > -#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> > +#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
> >  static int do_env_save(cmd_tbl_t *cmdtp, int flag, int argc,
> >                        char * const argv[])  { @@ -1309,7 +1294,7 @@
> > static cmd_tbl_t cmd_env_sub[] = {  #if defined(CONFIG_CMD_RUN)
> >         U_BOOT_CMD_MKENT(run, CONFIG_SYS_MAXARGS, 1, do_run, "", ""),
> > #endif -#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> > +#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
> >         U_BOOT_CMD_MKENT(save, 1, 0, do_env_save, "", ""),  #if
> > defined(CONFIG_CMD_ERASEENV)
> >         U_BOOT_CMD_MKENT(erase, 1, 0, do_env_erase, "", ""), @@
> > -1392,7 +1377,7 @@ static char env_help_text[] =  #if
> > defined(CONFIG_CMD_RUN)
> >         "env run var [...] - run commands in an environment variable\n"
> >  #endif
> > -#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
> > +#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
> >         "env save - save environment\n"
> >  #if defined(CONFIG_CMD_ERASEENV)
> >         "env erase - erase environment\n"
> > diff --git a/include/env.h b/include/env.h index
> > a74a261337..0088d3b1e8 100644
> > --- a/include/env.h
> > +++ b/include/env.h
> > @@ -35,6 +35,19 @@ struct env_clbk_tbl {
> >                         int flags);
> >  };

To add a comment to describe the macro here in V4.

> > +#define ENV_IS_IN_SOMEWHERE \
> > +               (CONFIG_IS_ENABLED(ENV_IS_IN_EEPROM) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_EXT4) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_FAT) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_FLASH) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_MMC) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_NAND) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_NVRAM) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_ONENAND) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_REMOTE) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH) || \
> > +                CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
> > +
> >  /*
> >   * Define a callback that can be associated with variables.
> >   * when associated through the ".callbacks" environment variable, the
> > callback
> > --
> > 2.17.1
> >
> 
> Regards,
> Simon


Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
