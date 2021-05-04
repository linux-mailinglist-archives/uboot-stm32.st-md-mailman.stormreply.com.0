Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22004372E54
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 May 2021 18:58:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1D61C59783;
	Tue,  4 May 2021 16:58:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D376AC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 16:58:38 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h4so10178040wrt.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 May 2021 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2I10Kb+LTigLvc/ZOZqxWotapytT5KlJsDGOKjRUsc=;
 b=Zpp5MUnfXzd1oHPn7RWW/LA/ZV5rruxoXjb10cLFKPEmyC28djBL2OHEz5aI7O1+Bw
 /09zi1WJk3L/x9r0am14l27iUXpWENugCRVwUTJaI0SY4G7g9Rug7liDdDAgsQKq71Rk
 U3k+bPsg05xQx69ykCryEwV0yTR13XrYUn77k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2I10Kb+LTigLvc/ZOZqxWotapytT5KlJsDGOKjRUsc=;
 b=MMPe/R+D13yxAmWfTOD+EeUdWW9hiFBMWRl0nwKbLFN2e44yYEQuITxrV5Y/c2Pmjf
 dVU4TrBOP0TCbSjt7C1b+QOcvVPOgH2TnF8jNN0L7yH4lbHRHfJzMNDsd8SQ5uy/Nh9O
 UPACU8sRovJrjDrC75zboIVxhQRwdJJvkimyn8vGOlPDmJxZoV3iwcZDQ+VOry/L80yZ
 2jNooI4iQ3Liwm7+mLdPPYc4WawXz958KrMfLIpUTfdkH/3GkgbKnPbQxviJAAF1vw+9
 jlFyNZcQt+azHeYP422RhXpfwVGb+XBFB69BW61VRHQT9UpJPScfua7nirD1fDClAaHF
 TnqA==
X-Gm-Message-State: AOAM532+vMvGRWqLXXwqH8iWS4fhGC6dC37uNnDKrxz1zWdM13iW+tIq
 +N5xsMeOYmQ1b9bSL4gfSgKCOngUP1ijVlQPnxxVvQ==
X-Google-Smtp-Source: ABdhPJyoHsfvak8PUGiJZnwuDgjr4xSJZ5cIebm+YCldTRbyWxnj/5ow2g71HKGMTCHoEyeOaIvcB86YMaBKUBQXnb4=
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr11390567wrx.43.1620147518009; 
 Tue, 04 May 2021 09:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210504120237.v3.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
In-Reply-To: <20210504120237.v3.1.I94f875f95a48be081d332f9a2c447c0b78955e75@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 4 May 2021 09:58:25 -0700
Message-ID: <CAPnjgZ26bfdjXZDV1YavacjbsoSobPx6sKDOq5E9ijpBMpeMhA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v3] dm: core: Add address translation in
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

On Tue, 4 May 2021 at 04:02, Patrick Delaunay
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
> Changes in v3:
> - add test dm_test_read_resource
>
> Changes in v2:
> - remove translate in luton_switch.c:luton_probe()
>
>  drivers/firmware/scmi/smt.c               | 12 +--------
>  drivers/net/mscc_eswitch/jr2_switch.c     |  4 +--
>  drivers/net/mscc_eswitch/luton_switch.c   |  5 +---
>  drivers/net/mscc_eswitch/ocelot_switch.c  |  4 +--
>  drivers/net/mscc_eswitch/serval_switch.c  |  4 +--
>  drivers/net/mscc_eswitch/servalt_switch.c |  4 +--
>  lib/fdtdec.c                              |  6 ++++-
>  test/dm/test-fdt.c                        | 33 +++++++++++++++++++++++
>  8 files changed, 44 insertions(+), 28 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
