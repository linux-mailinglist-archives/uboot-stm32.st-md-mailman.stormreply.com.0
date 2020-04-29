Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89F1BE5D2
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 20:05:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53E4AC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 18:05:10 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60AB0C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 18:05:07 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i27so2503263ota.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 11:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndgpDoOceVW7WcuV04d/x5WBllcQNOHDjaCNwbmeRlA=;
 b=oSC+Mc5nrSeIG5gF00lpOYRIVC9/wGVnhV597tydifBWN7j8IPRKotiHkE59tj0B7g
 diuJ1vyzczU7tdwHHbrhQP43y4cM87jS5mjrM6DbgG5PA7/M3S+34ysW9xj/YSaOfBDl
 kWHMauJdNrRraUpeXNX7bRQUF64Bd/9S1g5bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndgpDoOceVW7WcuV04d/x5WBllcQNOHDjaCNwbmeRlA=;
 b=pxp9IRWxF3GR6TVx5SITD7fPkLPwA9g0dYIok8Q3v/qJZh+GjTmH1eEIKpMT9wAzSc
 GvLmIDAfldUSssUQ3aCVtDzTTq7cVyZ0ARWt+FQEDrro+bGLEjWYzcytIEh4vuZaVyci
 ElPXbVwg4/+T3EYfRJaCy36UoqQcpoEhstdT8vRY+V3Sc+6dbmwsqvZMovH99JY0Rpwd
 8INblA6SOeXRlibHm7exL/EXW0G03vOAVztD/MZQmOyxR8Z9iJb0LX+8Bb6kXqYIyRKS
 hlcD4/bfitZt5FPUwDLI6hp9uqamYlpkOmoSFCsZff+3/n7kmMqQVTMVDaZWNV1adhz9
 oU5A==
X-Gm-Message-State: AGi0PuYjTcJuPDjxmHpM3dBeu/e4/FsS13IGj0lmbQh20ZWLKWNk235P
 jeAZ6/bjPVCse9axCrM5E9mPOS3NqDVbm3yFwM8veA==
X-Google-Smtp-Source: APiQypIUMYNt2jhaY1DUuzWEs5DBeghBtHvadICXu23nhe8BUXLnIW6a838qRaMnMfEZdvKwOcmc4QnAgA/yARGY06w=
X-Received: by 2002:a9d:107:: with SMTP id 7mr29470262otu.48.1588183505719;
 Wed, 29 Apr 2020 11:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-2-patrice.chotard@st.com>
In-Reply-To: <20200429122031.31279-2-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Apr 2020 12:04:51 -0600
Message-ID: <CAPnjgZ16TXpPsig=6HP0OzpZcF9CObbcpQVNxZR4+WVzTacgTw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/5] cmd: bind: allow to bind driver
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

On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Initial implementation invokes device_bind_with_driver_data()
> with driver_data parameter equal to 0.
> For driver with driver data, the bind command can't bind
> correctly this driver or even worse causes data abort as shown below:
>
> As example, for debug purpose on STM32MP1 platform, ethernet (dwc_eth_qos.c)
> driver needed to be unbinded/binded. This driver is using driver data:
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
>
> ---
>
> Changes in v2:
>    - add a bind command test
>    - add bind command documentation in doc/driver/model/bind.rst
>    - simplify patch 1 by using lists_bind_fdt()
>
>  cmd/bind.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
