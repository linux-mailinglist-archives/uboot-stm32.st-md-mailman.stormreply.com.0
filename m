Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565536F3CF
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Apr 2021 03:47:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEB6EC58D59;
	Fri, 30 Apr 2021 01:46:59 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D67DCC57B74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 01:46:56 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id z1so81061309ybf.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 18:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kw7XQppknutCfbiSyIzLRVHu+UGhT4eu/102R7oSL+U=;
 b=RfDAcsynbNHKyHPexoRXgBnjhZ2e8BHXWLuJNPwvexaSMvMVGSK0v1jUVw4c08AxNg
 6VZT2qsoZTryZiELPuSSLeiXGvSBb6mlriOTi64xNcrvRlNs5Unyc/Bw1d1JMzeky8uH
 VeM7zjQrmQ1MqhBHz0a5k0OWCcbM3NhE+wGls5HcPaS61rBwei+mbMg7sVfX0Q++ZZs4
 lnNUQdUKaiRyQmXWAowPhD8E5jWLpqr/j7mkVrktF1290XSf4P0Orf/Y0PVBEOmNwe+B
 xdzfCVXIM7Gwylu+nwlninLOcEAgAYwvWZRT0UUrUoB81004SfioKjLm0jNQG4Dz/iL0
 s0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kw7XQppknutCfbiSyIzLRVHu+UGhT4eu/102R7oSL+U=;
 b=BvxFiBOLsILS8xsXfl/uNE+LUQ7yiwWAPpPSJDGcLc6k/TSDsXqzfLbycer6k0nbP4
 cEDuVgKNo8Lak8uWOHLH8oQem6yQYnK/rhrwuLHaOacvhXmTQznMrTJ9C/w+YGvD8+Vr
 ZAheoGeyb8dB5MmJbDv4SJYlPbTMcEWt7awVxsHiEy7Dm9QAjxldC5k444D1MOf6j1E8
 IuhpGNVsshPqLZm3+Z0bHn/di6yoSQwTyUx8h+XM/zQPGuqJJQgMP5rDhMjT5FaURZxc
 nDLCahdzhD3QzagV+iCo+wECUKy7B1HW7SG78DCat2u+8v9GBVbAg0VmKaKeynT3ceTn
 AGlg==
X-Gm-Message-State: AOAM532RqrQLGyDjnneFw9x7wPk7p3bxjzr72aRdi3y5Hzn9tTCjZJ4B
 GFKhAnLzKYq4bD0HLQ+tRJR3qQTXYSxkNzWp6Lk=
X-Google-Smtp-Source: ABdhPJy2i7FWVqfE50c2V/KOs85V3ZnyQf3TR5yayXHGdbNWSdjjC2q3BAy8Eoq6cHyHEyjEwmaSX8aWXAGtizCJWSI=
X-Received: by 2002:a25:db84:: with SMTP id g126mr3620551ybf.122.1619747214994; 
 Thu, 29 Apr 2021 18:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
 <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
In-Reply-To: <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Apr 2021 09:46:43 +0800
Message-ID: <CAEUhbmXd8vS9x5Co4MeUzP6N3O8gK7=9GHJB8yNZwFbvZh3jfg@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBEYW5pcw==?= <frederic.danis@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wasim Khan <wasim.khan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] image-fdt: save no-map parameter
	of reserve-memory
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

On Fri, Apr 30, 2021 at 12:13 AM Simon Glass <sjg@chromium.org> wrote:
>
> Hi Patrick,
>
> On Wed, 28 Apr 2021 at 03:23, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
> >
> > Save the no-map information present in 'reserved-memory' node to allow
> > correct handling when the MMU is configured in board to avoid
> > speculative access.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > ---
> >
> > (no changes since v1)
> >
> >  common/image-fdt.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
>
> Where is no-map documented?

See Linux kernel
Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Bin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
