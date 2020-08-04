Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3A23B28F
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 04:01:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7AAC36B3A
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 02:01:37 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 679EFC36B38
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 02:01:36 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id g18so6844632ooa.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Aug 2020 19:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ArOvJDjAmAnBNkbK/BE7BRT5tzL+YMhz4mLdGGrdejc=;
 b=D9E+o7JKrXtu0BeT9VTanFNRTgKlMC9mRgXuUdHLKNWac+CxJc9xc7S444c26l/nbP
 X8MEcYXTy7My3kfe+0acdVYv+rVZVY0jr4TivyIH17M0K9PxGSNd8Bj3wQx3xXBhuSc5
 4jZ7fw2qNzeoskJnQGMMr6GM1681Eb12Dewos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ArOvJDjAmAnBNkbK/BE7BRT5tzL+YMhz4mLdGGrdejc=;
 b=sbZiTW1qhaJZNnSHV2FzfIRVJ28tWyWoHcl9Cf7iHomjRa/X+t4KajE8hUBnFrwuaQ
 QH0oVcYyLNKtPDlLOnvxuZe6wp7XJf5ybSfZWO8qG72JWXIWcHs/cxVVfLQPAvcrqEoE
 RvpX8cLN/U6TBNc+Ri1XqgWWa4EWj+kbFpypfola4ZMMkjeFTVepyfu1gyVI/L2Sl805
 Xqkt0wQw3EcYUYGd81H6Vs4i008ZDnDKo5u+x8jvWw7Muk2/V05TvGbe+nsomCYeZ2Nn
 KcnlFjRZ3sScfrNF3xgWxUP63BsdcOFdq8LOmC1CI5HsvEqZ/TPZa4/o0UkxfrKh4LU6
 lTGQ==
X-Gm-Message-State: AOAM530KMVUJa8A+BPe1BOGy515P+LfuUagjlI2JeLOrK/DLpCmPdQjf
 uIY5aqoEr8k+uJKjlwbyCRsgNfbuPkoE4QwLk0QPOw==
X-Google-Smtp-Source: ABdhPJxxvJGyqgoU1pg6tE50fH0jn9qROH0kZ3nCzUy17PcN3Hp28f1drgqjY6l03GZYiwYfflcAO4SsplkeFXLtJ6c=
X-Received: by 2002:a4a:3443:: with SMTP id n3mr16921557oof.30.1596506494760; 
 Mon, 03 Aug 2020 19:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200728071335.5840-1-patrice.chotard@st.com>
 <20200728071335.5840-2-patrice.chotard@st.com>
In-Reply-To: <20200728071335.5840-2-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 3 Aug 2020 20:00:29 -0600
Message-ID: <CAPnjgZ1AbvT8odeUk0Oyv58SfdGmMX_gS5J9P_NmZAmjLYu6iA@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v5 1/5] cmd: bind: allow to bind driver
	with driver data
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

On Tue, 28 Jul 2020 at 01:13, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Initial implementation invokes device_bind_with_driver_data()
> with driver_data parameter equal to 0.
> For driver with driver data, the bind command can't bind
> correctly this driver or even worse causes data abort as shown below:
>
> As example, for debug purpose on STM32MP1 platform, ethernet
> (dwc_eth_qos.c) driver needed to be unbinded/binded.
> This driver is using driver data:
>
> static const struct udevice_id eqos_ids[] = {
>     {
>         .compatible = "nvidia,tegra186-eqos",
>         .data = (ulong)&eqos_tegra186_config
>     },
>     {
>         .compatible = "snps,dwmac-4.20a",
>         .data = (ulong)&eqos_stm32_config
>     },
>
>     { }
> };
>
> After unbinding/binding this driver and probing it (with the dhcp command),
> we got a prefetch abort as below:
>
> STM32MP> unbind eth ethernet@5800a000
> STM32MP> bind /soc/ethernet@5800a000 eth_eqos
> STM32MP> dhcp
> prefetch abort
> pc : [<4310801c>]          lr : [<ffc8f4ad>]
> reloc pc : [<035ba01c>]    lr : [<c01414ad>]
> sp : fdaf19b0  ip : ffcea83c     fp : 00000001
> r10: ffcfd4a0  r9 : fdaffed0     r8 : 00000000
> r7 : ffcff304  r6 : fdc63220     r5 : 00000000  r4 : fdc5b108
> r3 : 43108020  r2 : 00003d39     r1 : ffcea544  r0 : fdc63220
> Flags: nZCv  IRQs off  FIQs off  Mode SVC_32
> Code: data abort
> pc : [<ffc4f9c0>]          lr : [<ffc4f9ad>]
> reloc pc : [<c01019c0>]    lr : [<c01019ad>]
> sp : fdaf18b8  ip : 00000000     fp : 00000001
> r10: ffcd69b2  r9 : fdaffed0     r8 : ffcd69aa
> r7 : 00000000  r6 : 00000008     r5 : 4310801c  r4 : fffffffc
> r3 : 00000001  r2 : 00000028     r1 : 00000000  r0 : 00000006
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32 (T)
> Code: 2f00 d1e9 2c00 dce9 (f855) 2024
> Resetting CPU ...
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> ---
>
> (no changes since v3)
>
> Changes in v3:
>   - fix typo
>
> Changes in v2:
>   - add a bind command test
>   - add bind command documentation in doc/driver/model/bind.rst
>   - simplify patch 1 by using lists_bind_fdt()
>
>  cmd/bind.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
