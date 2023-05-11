Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCE6FECB6
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 May 2023 09:25:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6749EC6904F;
	Thu, 11 May 2023 07:25:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80AFEC6904E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 07:25:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f13a72ff53so9234441e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683789901; x=1686381901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JhUCou5ULMwkIBKqua87iu4dS+aUDe2P4lu4DR3DeBA=;
 b=YU0kz401k5Hv2653HzG3Mxsly8hOP5I0xiyTT87hL7mkYfieJ7ibgElPEqL6hseMzY
 nOSJejMgFH1EOD4rXsACXPvfzXCPO+5/Vf8xbTrMUxavmDvimRFb7c+DoKEep6H48l+5
 gOL11ljFOe6pKCwnDyAZrDyWzksCYUBNAMkxqqRv5ICRTfXsw+ic1F6/Rc3AeFYd9CrR
 z1FUZrkdoZUCbaU4Ou7UOczU3zo81s/SSoQNR09AQ3+VZ3LepSc8dEz5hF2QNIUhgQQN
 t12dgzKrb5rz6rMyqhesfu1iUd24oa+AtMcqBW5EZFb+0nu6VSrPsS7TRDbL73ANUN6h
 iSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683789901; x=1686381901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JhUCou5ULMwkIBKqua87iu4dS+aUDe2P4lu4DR3DeBA=;
 b=gTfIDzLsRl0BrIwLTWVWEeoWc7HIDQk+ffQWRAF6CNfpMGlrgFjbaWXZK6chORSZFG
 cR0DymQ0rXGeYsPMsmf+V+QRjCAZjZgX7guGlS2wAbGv3JTeErVdUAzFz5LpS1NaytA+
 bKtHl63KmznH+H421aWXVhpBQ9+fUi9J3pbUSj1dxHnXLBtDj6lQwc9/PT4AGreccRer
 gaYuUq+FyEnHIL05m7132nMQR2w+708QOVyZpiKuwaxlQgnwi6NY+/CwG7EVCGjKMS2y
 vlnEja4K0O2fABWeQbs6YRPDGJKzWhIUm7xfOt0FERfC+MFsbLeb3mItSBDTxvIjTa8g
 +LaQ==
X-Gm-Message-State: AC+VfDzMeARHTGahSzjYma0TzRC9/ybSC12dN2jCnZTddg3rOhb85Ej1
 8Z7fhsrHwDa+EOmEXpe/2XVJcJwyzS8Z2LY3NhgW7w==
X-Google-Smtp-Source: ACHHUZ7fwz8jSaOyzAQlKPske9Tpk3WRWjVBckBe+ea+4M0Y7wNER8zKspzHuGqGTXCq7fQ/d/9mLTfdznzigmfAAjM=
X-Received: by 2002:ac2:43b1:0:b0:4ec:8524:65a4 with SMTP id
 t17-20020ac243b1000000b004ec852465a4mr2482058lfl.55.1683789900631; Thu, 11
 May 2023 00:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230511002206.180116-1-marex@denx.de>
 <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
In-Reply-To: <f30a7447-89e3-c3b3-3b8a-3ff048d0695b@foss.st.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 11 May 2023 10:24:24 +0300
Message-ID: <CAC_iWjJO4M07YNnZ01dqz-zP8EJvU8rYPx8gR7M++kmrF7PHAA@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add IWDG handling into PSCI
	suspend code
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

On Thu, 11 May 2023 at 09:39, Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
>
>
> On 5/11/23 02:22, Marek Vasut wrote:
> > In case the IWDG is enabled by either U-Boot or Linux, the IWDG can never
> > be disabled again. That includes low power states, which means that if the
> > IWDG is enabled, the SoC would reset itself after a while in suspend via
> > the IWDG. This is not desired behavior.
> >
> > It is possible to enable IWDG pre-timeout IRQ which is routed into the EXTI,
> > and use that IRQ to wake the CPU up before the IWDG timeout is reached and
> > reset is triggered. This pre-timeout IRQ can be used to reload the WDT and
> > then suspend the CPU again every once in a while.
> >
> > Implement this functionality for both IWDG1 and IWDG2 by reading out all
> > the unmasked IRQs, comparing the list with currently pending IRQs in GICv3:
> > - If any IRQ is pending and it is NOT IWDG1 or IWDG2 pre-timeout IRQ,
> >   wake up and let OS handle the IRQs
> > - If IWDG1 or IWDG2 IRQ is pending and no other IRQ is pending,
> >   ping the respective IWDG and suspend again
> >
> > This does not seem to have any adverse impact on power consumption in suspend.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> > Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> > Cc: u-boot@lists.denx.de
> > Cc: uboot-stm32@st-md-mailman.stormreply.com
> > ---
> >  arch/arm/mach-stm32mp/include/mach/stm32.h |  2 +
> >  arch/arm/mach-stm32mp/psci.c               | 66 ++++++++++++++++++++--
> >  2 files changed, 63 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> > index c85ae6a34ee..1cdc5e3b186 100644
> > --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> > +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> > @@ -21,8 +21,10 @@
> >  #define STM32_DBGMCU_BASE            0x50081000
> >  #endif
> >  #define STM32_FMC2_BASE                      0x58002000
> > +#define STM32_IWDG2_BASE             0x5A002000
> >  #define STM32_DDRCTRL_BASE           0x5A003000
> >  #define STM32_DDRPHYC_BASE           0x5A004000
> > +#define STM32_IWDG1_BASE             0x5C003000
> >  #define STM32_TZC_BASE                       0x5C006000
> >  #define STM32_ETZPC_BASE             0x5C007000
> >  #define STM32_STGEN_BASE             0x5C008000
> > diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
> > index 1e69673e88b..89b093d6d89 100644
> > --- a/arch/arm/mach-stm32mp/psci.c
> > +++ b/arch/arm/mach-stm32mp/psci.c
> > @@ -161,6 +161,12 @@
> >  #define RCC_MP_GRSTCSETR_MPUP0RST            BIT(4)
> >  #define RCC_MP_GRSTCSETR_MPUP1RST            BIT(5)
> >
> > +/* IWDG */
> > +#define IWDG_KR                                      0x00
> > +#define IWDG_KR_RELOAD_KEY                   0xaaaa
> > +#define IWDG_EWCR                            0x14
> > +#define IWDG_EWCR_EWIC                               BIT(14)
> > +
> >  #define STM32MP1_PSCI_NR_CPUS                        2
> >  #if STM32MP1_PSCI_NR_CPUS > CONFIG_ARMV7_PSCI_NR_CPUS
> >  #error "invalid value for CONFIG_ARMV7_PSCI_NR_CPUS"
> > @@ -696,7 +702,18 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
> >                                 u32 ep, u32 context_id)
> >  {
> >       u32 saved_mcudivr, saved_pll3cr, saved_pll4cr, saved_mssckselr;
> > +     u32 gicd_addr = stm32mp_get_gicd_base_address();
> > +     bool iwdg1_wake = false;
> > +     bool iwdg2_wake = false;
> > +     bool other_wake = false;
> >       u32 saved_pwrctl, reg;
> > +     u32 gic_enabled[8];
> > +     u32 irqs;
> > +     int i;
> > +
> > +     /* Cache enable mask of all 256 SPI */
> > +     for (i = 0; i < ARRAY_SIZE(gic_enabled); i++)
> > +             gic_enabled[i] = readl(gicd_addr + GICD_ISENABLERn + 0x4 + 4 * i);
> >
> >       /* Disable IO compensation */
> >
> > @@ -725,11 +742,50 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
> >       setbits_le32(STM32_PWR_BASE + PWR_CR3, PWR_CR3_DDRSREN);
> >       writel(0x3, STM32_RCC_BASE + RCC_MP_SREQSETR);
> >
> > -     /* Zzz, enter stop mode */
> > -     asm volatile(
> > -             "isb\n"
> > -             "dsb\n"
> > -             "wfi\n");
> > +     for (;;) {
> > +             /* Zzz, enter stop mode */
> > +             asm volatile(
> > +                     "isb\n"
> > +                     "dsb\n"
> > +                     "wfi\n");
> > +
> > +             /* Determine the wake up source */
> > +             for (i = 0; i < ARRAY_SIZE(gic_enabled); i++) {
> > +                     irqs = readl(gicd_addr + GICR_IGROUPMODRn + 0x4 + 4 * i);
> > +                     irqs &= gic_enabled[i];
> > +                     if (!irqs)
> > +                             continue;
> > +
> > +                     /* Test whether IWDG pretimeout triggered the wake up. */
> > +                     if (i == 4) {   /* SPI Num 128..159 */
> > +                             iwdg1_wake = !!(irqs & BIT(22));        /* SPI 150 */
> > +                             iwdg2_wake = !!(irqs & BIT(23));        /* SPI 151 */
> > +                             irqs &= ~(BIT(22) | BIT(23));
> > +                     }
> > +
> > +                     /* Test whether there is any other wake up trigger. */
> > +                     if (irqs) {
> > +                             other_wake = true;
> > +                             break;
> > +                     }
> > +             }
> > +
> > +             /* Other wake up triggers pending, let OS deal with all of it. */
> > +             if (other_wake)
> > +                     break;
> > +
> > +             /* Ping IWDG1 and ACK pretimer IRQ */
> > +             if (iwdg1_wake) {
> > +                     writel(IWDG_KR_RELOAD_KEY, STM32_IWDG1_BASE + IWDG_KR);
> > +                     writel(IWDG_EWCR_EWIC, STM32_IWDG1_BASE + IWDG_EWCR);
> > +             }
> > +
> > +             /* Ping IWDG2 and ACK pretimer IRQ */
> > +             if (iwdg2_wake) {
> > +                     writel(IWDG_KR_RELOAD_KEY, STM32_IWDG2_BASE + IWDG_KR);
> > +                     writel(IWDG_EWCR_EWIC, STM32_IWDG2_BASE + IWDG_EWCR);
> > +             }
> > +     }
> >
> >       writel(0x3, STM32_RCC_BASE + RCC_MP_SREQCLRR);
> >       ddr_sw_self_refresh_exit();
>
>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Thanks
> Patrice

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
