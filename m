Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9746647A
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Dec 2021 14:27:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57919C5F1D9;
	Thu,  2 Dec 2021 13:27:09 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7714AC5F1D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 13:27:07 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id j14so55636687uan.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyEUfQhsjCpBJ7IRxeHoFPPemML3vfalSMN+3uukBW8=;
 b=K4hFOcjSwbNo7nvO30EcbSV0bOj20rhritaRcHjitQVugLpCbthj0OVs9HCLSpqXbv
 10xUbPkMk22Au+OiJxUbVFm3qwYECol6F67mhmL5xHf5mwjihxW7/fVMn6uUjkiQN6Ee
 1I+xI68vwwRjkOXB3He+62JEFgItJRqJm5s8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyEUfQhsjCpBJ7IRxeHoFPPemML3vfalSMN+3uukBW8=;
 b=RixpFGyYCOnmAS3QUo3CoGgBaM5GMvOg99mGuOYwuoSbtNeB9ZHQb2sfkEHVX4nr/Y
 TWoAlz5i3YpRIE7rOVKeA+hPwSAhtbI2gWjzan5hs8hRi53iWLVtfU9hOa6nhZTubyRA
 1k+lz8AwISEi97Le6ArCp1LCQjKSc5mNJCSzb6dZ3i715V9Foj/Y0YQtLzQbmLkWIYGT
 7x+4vApJXAsepJeTE2stvE/bwu9IRteqFsPKu+ctMG/4fMhUL/wiQJuztIJplALB8cf5
 DyxKSBypHwV4UgtGy9lgREA0F9OoN8M7SaTQwCvu4DPF/cxobifL0m2lP4Vm21vHWROA
 gRuA==
X-Gm-Message-State: AOAM532q79nK+7t6xGoy1XwWUgWVEWY6+Si71RzZlOmpEf658xg74jyY
 PzQAErDfCUEeRR3oePChqUzTLgizY1b15rwzwPgufA==
X-Google-Smtp-Source: ABdhPJxXipyNyE7nyXwrzXxEFc9ZCpy/1ruDSfUSqcuU5cD9KcWrAXpmIEkj2ZQpohfIktKvw6uno8Kc3sQmu2aTBXk=
X-Received: by 2002:ab0:2983:: with SMTP id u3mr14758070uap.35.1638451626053; 
 Thu, 02 Dec 2021 05:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20211201192653.2171260-1-seanga2@gmail.com>
In-Reply-To: <20211201192653.2171260-1-seanga2@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 2 Dec 2021 06:26:54 -0700
Message-ID: <CAPnjgZ0tPNUCMDvYsLF_BzDGXDP+GXQE0YXPCy7xudLj0+3Arw@mail.gmail.com>
To: Sean Anderson <seanga2@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Hai Pham <hai.pham.ud@renesas.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 u-boot@lists.denx.de, Lokesh Vutla <lokeshvutla@ti.com>,
 Dave Gerlach <d-gerlach@ti.com>, Lukasz Majewski <lukma@denx.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: Re: [Uboot-stm32] [PATCH] treewide: invaild -> invalid
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

On Wed, 1 Dec 2021 at 12:27, Sean Anderson <seanga2@gmail.com> wrote:
>
> Somewhere along the way, someone misspelt "invalid" and it got copied
> everywhere. Fix it.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
>
>  drivers/clk/clk-uclass.c               | 2 +-
>  drivers/clk/clk_stm32f.c               | 2 +-
>  drivers/clk/clk_stm32h7.c              | 2 +-
>  drivers/clk/clk_versaclock.c           | 2 +-
>  drivers/clk/renesas/clk-rcar-gen2.c    | 2 +-
>  drivers/clk/renesas/clk-rcar-gen3.c    | 2 +-
>  drivers/clk/ti/clk-ctrl.c              | 2 +-
>  drivers/dma/dma-uclass.c               | 2 +-
>  drivers/hwspinlock/hwspinlock-uclass.c | 2 +-
>  drivers/mailbox/k3-sec-proxy.c         | 2 +-
>  drivers/mailbox/mailbox-uclass.c       | 2 +-
>  drivers/mailbox/tegra-hsp.c            | 2 +-
>  drivers/misc/irq-uclass.c              | 2 +-
>  drivers/mux/mux-uclass.c               | 2 +-
>  drivers/phy/phy-uclass.c               | 2 +-
>  drivers/reset/reset-uclass.c           | 2 +-
>  16 files changed, 16 insertions(+), 16 deletions(-)
>

It's almost like a virus.

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
