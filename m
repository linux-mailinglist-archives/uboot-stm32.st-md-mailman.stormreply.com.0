Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D26333D6E5
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 16:13:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E360CC57B77;
	Tue, 16 Mar 2021 15:13:23 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9480C57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 15:13:21 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id c10so72676962ejx.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lK830ocSKRQja1xSTSlrj7RvRq0hbZAewi9bz4fvXnU=;
 b=zRuQJCRFrrjPS8ZwcLx8m4S1jp3isaNFeqq/iLlAcZtJ4c6a4JOm500GTnqH2gTjvJ
 USZCuoGVfxsc0yQp002hSMdpV7CV/VXhDFaCUytaoahCTYlGDv0zbONEeGGhNbaQcS1s
 a4BH4iZg68Sew1CHEB4oMa0GQbYKcpAval0o6Om+jkpkWa7PBfnbg6meYfB6O+e3E+Tr
 KbpUzatuO6JCHVDaF4IFQm7rbFE3bBnAajfz07wzaaxi7mD7Kp/0Ah5RftdqfxjF5Fcl
 C90ohhG7LFuKxC7C/HyJXbdqMMFN6mgGrD3zi2ITPQioq+n2Iq8JFWPOgzGS44jvKjMJ
 yXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lK830ocSKRQja1xSTSlrj7RvRq0hbZAewi9bz4fvXnU=;
 b=MmKX8q8EVMKYMfll7IuHa/uQA7Goct7yKNOtLE+WmPB15EBIPbZqXAwlLxG6tjGeQp
 AuaRhksUozF4MgX35qm/KUDpSYxPyzoYi+N1oLuOov0xHTNyOCi90iz+j1gyQKEQ29q2
 2/79OmPwBZuTb5x5XOc3ZF1wA6xg2Ny+msIiIsw1uWJIsFT5n6MtH1VOYCnnQE0YywMQ
 Pksr6T3kHIuiDe++cLfshY2yMSsIDbAGiHW09sdGktuucz6QELwmohyOZDmHTYqVokyi
 7cd90lvRz66VGh4K/Y2hIVI+1bEJZCYVUaTrxXTxaSvyWQjt1adpYUQOAPoHs0YwwMQA
 cokg==
X-Gm-Message-State: AOAM530HumeL+68TNWzoMPlnmOmlgOwclDuf+nw00JQytMgqCGTmkJ+/
 SHWpzRk0afpM/8vECPAkjuZntdwAD3YaJH4/1328cQ==
X-Google-Smtp-Source: ABdhPJwGvXPbkq0JYjlIxU8W9MSTYrC3ptQ9W1YpsubrhmAhFcIghZBdLo0LlkOfXV24aRNaCs6WEzX8MoA0EWtyDOY=
X-Received: by 2002:a17:906:6bd1:: with SMTP id
 t17mr30530611ejs.319.1615907601020; 
 Tue, 16 Mar 2021 08:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210316092937.1.Ie4df1c787d51eb06945ee580b4ff5248c609ab7b@changeid>
In-Reply-To: <20210316092937.1.Ie4df1c787d51eb06945ee580b4ff5248c609ab7b@changeid>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 16 Mar 2021 16:13:10 +0100
Message-ID: <CAN5uoS-Ni6XOiEZtWzpfzD--1TwfCZ11k0T=TNixS-1gbWEyFQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] scmi: correctly configure MMU for SCMI
	buffer
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

Hello Patrick,

On Tue, 16 Mar 2021 at 09:29, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Align the MMU area for SCMI shared buffer on section size;
> use the ALIGN macro in mmu_set_region_dcache_behaviour call.
>
> Since commit d877f8fd0f09 ("arm: provide a function for boards init
> code to modify MMU virtual-physical map") the parameter of
> mmu_set_region_dcache_behaviour need to be MMU_SECTION_SIZE
> aligned.
>
> Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/firmware/scmi/smt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
> index d25478796a..3c41013bca 100644
> --- a/drivers/firmware/scmi/smt.c
> +++ b/drivers/firmware/scmi/smt.c
> @@ -54,8 +54,10 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
>
>  #ifdef CONFIG_ARM
>         if (dcache_status())
> -               mmu_set_region_dcache_behaviour((uintptr_t)smt->buf,
> -                                               smt->size, DCACHE_OFF);
> +               mmu_set_region_dcache_behaviour(ALIGN_DOWN((uintptr_t)smt->buf, MMU_SECTION_SIZE),
> +                                               ALIGN(smt->size, MMU_SECTION_SIZE),
> +                                               DCACHE_OFF);
> +
>  #endif
>
>         return 0;
> --
> 2.17.1
>

Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>

This indeed fixes the scmi smt driver.
Thanks Patrick.

Regards,
Etienne
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
