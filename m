Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48671199AF3
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:08:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13792C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:08:20 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10860C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:08:16 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id y71so19364742oia.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sCzhbnENEVrPkADu51arzQp8dH2NRRrNxbz2DeQ3SBQ=;
 b=C/X+YVfbNjzcSQuslfsByFMr6Tm/diUftatMgkFvvp+TEHavhBJ2ihePS6NNj6Qa2u
 3Qcbk9a84cN+UWkFt/6ajZid3Td3OJKebBs1IoIAkE1bTVMoKbpKMiJKkkLwh9ElL52q
 bam80la1lvIz7s37vpfOQVdWAVf9ud+o0l2eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCzhbnENEVrPkADu51arzQp8dH2NRRrNxbz2DeQ3SBQ=;
 b=f85Ohgd88kYcu4tvz+vYarjAkOiZ45usbkbSsE9D+PbZJj1rHUjyMFXtiEppZefsE+
 loMzvwybqviLWI7CclrXBgf8UtKgJP2rMlLZUUKNsJSaLsGW5Xsf8dMU+yvJTgHrKhkG
 OpqAa5CovbxfdnYyl7wMEy81o1l7+lyyxVivzwXqFuBJwi0aKpgKKrqmoEmRMP3fjPgg
 ndpowkvjk2Ct8WB5BU2XQuFAI58NQls2xPzojm305bwiwSe8b0tb2GpdP+t/BxpnOSc8
 THEzpeAaROxwQXhh0+aPUtsQnOR6ogVNF1BWNAaB/lZmdPV5ID26fY1MtV/uy6q7teJi
 i49A==
X-Gm-Message-State: ANhLgQ38TxW577omXhoT1zszQmJAX5YjS/IwT5MwEV1yHCKZ+6q+hOUQ
 yjW1z7juTRQzTQ7gkd0/Ne9bCSqpwdc0q1h9HHO1jw==
X-Google-Smtp-Source: ADFU+vvwquYckpedbC0WB8V4KGRx2OwBUjfOkrJbw9LpNMN5QJRCc7z7txIUnrqiNb0aMYS18hD2P07FqrRsfNbNiRg=
X-Received: by 2002:aca:bb83:: with SMTP id l125mr2551091oif.122.1585670895161; 
 Tue, 31 Mar 2020 09:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <1546595706-31360-1-git-send-email-patrice.chotard@st.com>
 <1546595706-31360-3-git-send-email-patrice.chotard@st.com>
 <f3e23915-c6ae-7c4d-7c5a-f725f726b5d4@denx.de>
In-Reply-To: <f3e23915-c6ae-7c4d-7c5a-f725f726b5d4@denx.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 31 Mar 2020 10:08:03 -0600
Message-ID: <CAPnjgZ3m_Ft+uoY4RnFCQN2Ug77WbXWr1fwTOiZ7heoAdeNeMA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL
	code size
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

Hi,

On Mon, 30 Mar 2020 at 20:51, Marek Vasut <marex@denx.de> wrote:
>
> On 1/4/19 10:55 AM, Patrice Chotard wrote:
>
> Hi,
>
> > @@ -215,7 +220,9 @@ U_BOOT_DRIVER(gpio_stm32) = {
> >       .id     = UCLASS_GPIO,
> >       .of_match = stm32_gpio_ids,
> >       .probe  = gpio_stm32_probe,
> > +#ifndef CONFIG_SPL_BUILD
> >       .ops    = &gpio_stm32_ops,
> > +#endif
> >       .flags  = DM_UC_FLAG_SEQ_ALIAS,
> >       .priv_auto_alloc_size   = sizeof(struct stm32_gpio_priv),
> >  };
>
> The U-Boot DM GPIO uclass code assumes the .ops is always non-NULL.
> Hence, this patch breaks all GPIO access (actually crashes SPL) on STM32
> in SPL.

Right. You are not allowed to have a driver without operations unless
the uclass defines none.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
