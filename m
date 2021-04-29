Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899236EDE9
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 18:11:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F16DC58D5A;
	Thu, 29 Apr 2021 16:11:15 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD5D0C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 16:11:12 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso59941402otb.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V62hvLlkR2ceCGWaC3yOdlBklTBVYO2jMtkKbhQ+lno=;
 b=PBeJkOEn7V1FG5lLVUx0HLcAd8Ycs3DMWfy6j7/BCOGvVxNm/bOoMKvFDuU9M+27DQ
 K/kTtUddqwsgGTxjRaAv47ymqDjtCH9ZEoUednDQnUkO6fSMWzYYeTHZ7wAob6KRBzde
 PlZFJVtbee3BFqPSrhTp4ijn2+7SyJ7v6pXs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V62hvLlkR2ceCGWaC3yOdlBklTBVYO2jMtkKbhQ+lno=;
 b=CsCeKtxHEYpUhQTuajbksb86VuN9F0RgXJNpPD+YXKHIKOaJWmSkvegeLAQNPwu90S
 runv5KU16QpMtOiL0p+a51JI5Jd85q3Rs1KljgpwLRKEohWwSiFlKMpk60WtUfYf+pJy
 g0WJmGRG7/ERRJpqwleskHn91HWpa6X6Cb/CUi8yvQzMRN65NdiAalBBv8iurzVWI6sX
 2zhrXVnh40MXeOrNTVH+W79Gl7ZmqIyKorhZjuCpcdmRRE6bp7lH6kO6Bz8NNsWck9ME
 XwO84NNAC1l22v2vflVRM2VPSznFO4w02UlEM6+SHbGCnbqFnXOK9/r9TNjJ6L6snhkf
 QP1Q==
X-Gm-Message-State: AOAM532itAJ3aK+itSotTU6hUHb3Zag9+Myfs2zEw+kW5gRZUeKyf9yH
 qy+OWZvQDLUOZfbcBvO9xI7o35YtEykSQlxlxOx3hg==
X-Google-Smtp-Source: ABdhPJx5AGMsmhEl5j7H8MlgMFFuVB1QYAmKQDML5lQTVCqsQOczRy5xfSErIj/fKYV9vbBk9D3kDF89MBGhrXM6mOY=
X-Received: by 2002:a9d:7d81:: with SMTP id j1mr148244otn.88.1619712671351;
 Thu, 29 Apr 2021 09:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210428123802.v2.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
In-Reply-To: <20210428123802.v2.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Apr 2021 09:10:53 -0700
Message-ID: <CAPnjgZ1=DOFJBUrXkRGtm_9YNFdUqtSexWJX4hkORe90kpawpg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: core: Add address translation in
	fdt_get_resource
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

Hi Patrick,

On Wed, 28 Apr 2021 at 03:39, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Today of_address_to_resource() is called only in
> ofnode_read_resource() for livetree support and
> fdt_get_resource() is called when livetree is not supported.
>
> The fdt_get_resource() doesn't do the address translation
> so when it is required, but the address translation is done
> by ofnode_read_resource() caller, for example in
> drivers/firmware/scmi/smt.c::scmi_dt_get_smt_buffer() {
> ...
>         ret = ofnode_read_resource(args.node, 0, &resource);
>         if (ret)
>                 return ret;
>
>         faddr = cpu_to_fdt32(resource.start);
>         paddr = ofnode_translate_address(args.node, &faddr);
> ...
>
> The both behavior should be aligned and the address translation
> must be called in fdt_get_resource() and removed for each caller.
>
> Fixes: a44810123f9e ("dm: core: Add dev_read_resource() to read device resources")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> This patch allows to remove the workaround in smci/smt.c
> introduced by [1].
>
> But it impact with all user of
> - ofnode_read_resource
> - ofnode_read_resource_byname
> - dev_read_resource
> - dev_read_resource_byname
>
> After my first check, the only impacts are in drivers/net/mscc_eswitch
> => I remove the unnecessary translate after code review,
>    this patch need to be verify on real hardware
>
> I proposed to merge the workaround [1] as soon as possible to avoid issue
> on stm32mp1 platform and this patch can be merged when it will be acked
> by mscc_eswitch maintainers and other API users.
>
> [1] "scmi: translate the resource only when livetree is not activated"
>     http://patchwork.ozlabs.org/project/uboot/list/?series=236526&state=*
>
>
> Changes in v2:
> - remove translate in luton_switch.c:luton_probe()
>
>  drivers/firmware/scmi/smt.c               | 12 +-----------
>  drivers/net/mscc_eswitch/jr2_switch.c     |  4 +---
>  drivers/net/mscc_eswitch/luton_switch.c   |  5 +----
>  drivers/net/mscc_eswitch/ocelot_switch.c  |  4 +---
>  drivers/net/mscc_eswitch/serval_switch.c  |  4 +---
>  drivers/net/mscc_eswitch/servalt_switch.c |  4 +---
>  lib/fdtdec.c                              |  6 +++++-
>  7 files changed, 11 insertions(+), 28 deletions(-)

Can you please also add a test for fdt_get_resource()?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
