Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBC4B84C6
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Feb 2022 10:49:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D026C5F1F2;
	Wed, 16 Feb 2022 09:49:51 +0000 (UTC)
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5F95C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1645004460;
 bh=pHwOeEPf6LvK95WpzZg98bR4sz8Xf6dib7HIrvE+TDM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BzqSlaskHGJXkZcYow+DBnH5CFnJtKhnJMdpwPzTnvGdyfTMXNXxvMVjCJkYUMALg
 mLlrOf0zSUC+hxJDD1kKp2kWMTwFmW7cVugHplqRVlJKNcNWqYFVIAKvPrf4hg2hQE
 u7gUhVL8Kb5SFsyNssx2qaGuR9c+kUa9+12BtF3+/NPr3BsNrA0+5apsINbUXYLZtE
 AjvnaszW15rA0cVJ93c8PpWrfR7S9BHEaakFnKfr4ibLMnjTUnF0FKyEBqfO1CRPS0
 iLe4cVla+1+2Ho5cq06cEckXg2XxRm5L4ZNLMUloN9YTFjLXbREjYEZIdNPmEHZbjG
 1+1pZ1/sIrr4A==
X-secureTransport-forwarded: yes
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] stm32mp: bsec: add permanent lock write support
Thread-Index: AQHYIn32UdMCwa/tq0KZUTTKg1pgX6yV6pBQ
Date: Wed, 16 Feb 2022 09:40:56 +0000
Message-ID: <e70e6fefd5594a9cb8bc1d848f09c968@dh-electronics.com>
References: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
In-Reply-To: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Feb 2022 09:49:50 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: bsec: add permanent lock
	write support
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

> -----Original Message-----
> From: Patrick Delaunay [mailto:patrick.delaunay@foss.st.com]
> Sent: Tuesday, February 15, 2022 4:09 PM
> 
> Add support of the permanent lock support in U-Boot proper
> when BSEC is not managed by secure monitor (TF-A SP_MIN or OP-TEE).
> 
> This patch avoid issue with stm32key command and fuse command
> on basic boot for this missing feature of U-Boot BSEC driver.
> 
> Reported-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c | 90 +++++++++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 27d1829501..fd6e1a3957 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -18,6 +18,7 @@
>  #include <linux/iopoll.h>
> 
>  #define BSEC_OTP_MAX_VALUE             95
> +#define BSEC_OTP_UPPER_START           32
>  #define BSEC_TIMEOUT_US                        10000
> 
>  /* BSEC REGISTER OFFSET (base relative) */
> @@ -41,6 +42,7 @@
>  /* BSEC_CONTROL Register */
>  #define BSEC_READ                      0x000
>  #define BSEC_WRITE                     0x100
> +#define BSEC_LOCK                      0x200
> 
>  /* LOCK Register */
>  #define OTP_LOCK_MASK                  0x1F
> @@ -61,6 +63,11 @@
>   */
>  #define BSEC_LOCK_PROGRAM              0x04
> 
> +/*
> + * OTP status: bit 0 permanent lock
> + */
> +#define BSEC_LOCK_PERM                 BIT(0)
> +
>  /**
>   * bsec_lock() - manage lock for each type SR/SP/SW
>   * @address: address of bsec IP register
> @@ -284,6 +291,65 @@ static int bsec_program_otp(struct udevice *dev, long base, u32 val, u32 otp)
>         return ret;
>  }
> 
> +/**
> + * bsec_permanent_lock_otp() - permanent lock of OTP in SAFMEM
> + * @dev: bsec IP device
> + * @base: base address of bsec IP
> + * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
> + * Return: 0 if no error
> + */
> +static int bsec_permanent_lock_otp(struct udevice *dev, long base, uint32_t otp)
> +{
> +       int ret;
> +       bool power_up = false;
> +       u32 val, addr;
> +
> +       /* check if safemem is power up */
> +       if (!(readl(base + BSEC_OTP_STATUS_OFF) & BSEC_MODE_PWR_MASK)) {
> +               ret = bsec_power_safmem(base, true);
> +               if (ret)
> +                       return ret;
> +
> +               power_up = true;
> +       }
> +
> +       /*
> +        * low OTPs = 2 bits word for low OTPs, 1 bits per word for upper OTP
> +        * and only 16 bits used in WRDATA
> +        */
> +       if (otp < BSEC_OTP_UPPER_START) {
> +               addr = otp / 8;
> +               val = 0x03 << ((otp * 2) & 0xF);
> +       } else {
> +               addr = BSEC_OTP_UPPER_START / 8 +
> +                      ((otp - BSEC_OTP_UPPER_START) / 16);
> +               val = 0x01 << (otp & 0xF);
> +       }
> +
> +       /* set value in write register*/
> +       writel(val, base + BSEC_OTP_WRDATA_OFF);
> +
> +       /* set BSEC_OTP_CTRL_OFF with the otp addr and lock request*/
> +       writel(addr | BSEC_WRITE | BSEC_LOCK, base + BSEC_OTP_CTRL_OFF);
> +
> +       /* check otp status*/
> +       ret = readl_poll_timeout(base + BSEC_OTP_STATUS_OFF,
> +                                val, (val & BSEC_MODE_BUSY_MASK) == 0,
> +                                BSEC_TIMEOUT_US);
> +       if (ret)
> +               return ret;
> +
> +       if (val & BSEC_MODE_PROGFAIL_MASK)
> +               ret = -EACCES;
> +       else
> +               ret = bsec_check_error(base, otp);
> +
> +       if (power_up)
> +               bsec_power_safmem(base, false);
> +
> +       return ret;
> +}
> +
>  /* BSEC MISC driver *******************************************************/
>  struct stm32mp_bsec_plat {
>         u32 base;
> @@ -339,9 +405,14 @@ static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
>  static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
>  {
>         struct stm32mp_bsec_plat *plat = dev_get_plat(dev);
> +       u32 wrlock;
> 
>         /* return OTP permanent write lock status */
> -       *val = bsec_read_lock(plat->base + BSEC_WRLOCK_OFF, otp);
> +       wrlock = bsec_read_lock(plat->base + BSEC_WRLOCK_OFF, otp);
> +
> +       *val = 0;
> +       if (wrlock)
> +               *val = BSEC_LOCK_PERM;
> 
>         return 0;
>  }
> @@ -377,15 +448,22 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
> 
>  static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>  {
> -       if (!IS_ENABLED(CONFIG_ARM_SMCCC) || IS_ENABLED(CONFIG_SPL_BUILD))
> -               return -ENOTSUPP;
> +       struct stm32mp_bsec_plat *plat;
> +
> +       /* only permanent write lock is supported in U-Boot */
> +       if (!(val & BSEC_LOCK_PERM)) {
> +               dev_dbg(dev, "lock option without BSEC_LOCK_PERM: %x\n", val);
> +               return 0; /* nothing to do */
> +       }
> 
> -       if (val == 1)
> +       if (IS_ENABLED(CONFIG_ARM_SMCCC) && !IS_ENABLED(CONFIG_SPL_BUILD))
>                 return stm32_smc_exec(STM32_SMC_BSEC,
>                                       STM32_SMC_WRLOCK_OTP,
>                                       otp, 0);
> -       if (val == 0)
> -               return 0; /* nothing to do */
> +
> +       plat = dev_get_plat(dev);
> +
> +       return bsec_permanent_lock_otp(dev, plat->base, otp);
> 
>         return -EINVAL;
>  }
> --
> 2.25.1
Tested-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
