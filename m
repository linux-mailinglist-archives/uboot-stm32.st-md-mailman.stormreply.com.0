Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBC1A4A71
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 21:31:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0375FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 19:31:07 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C8C7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 19:31:05 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g23so2818005otq.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 12:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=jTEc3bF3rimetAQssgdIhhG863borTxcvzZKZEXdw+Q=;
 b=uhgd4GHXjMSLvIC2RZWaWC6KVmAbHLMufBgSoJJ5M/4EK0KGVpTrWNRrYis69ediQg
 wAv84Ar+3GWq5/qjQVLcBtArjhtf6nw50OL+6+6rbcjmbKcS/tbB5prlsAEZiDEQfRko
 G2gto6gcgvpOQa50pcZ79cxUJ4iQWrvyQ3SqPiFFGZTJhz1YC5tTHqwagI4Qksf04kDt
 fObvtMDENyhtDmXAGN+ksCCVvdQDhPX3NiDW1nt6Ycnlf+dKlppTu7PB4hQFlwpd3wwx
 QfXgg/eNmJrgFWQ9EYQPOQ7Sibc9zt9izJK6KvV3iT+J/lSxSFLAxrWOPtaiHGcywGb4
 8zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=jTEc3bF3rimetAQssgdIhhG863borTxcvzZKZEXdw+Q=;
 b=srqaEFghFcdehrdNfjaopzYnNFYe5r7K6IIShpCR+gd5lIrf/lwpO4OxMVpERYZk1b
 kLhJ+XEXQsa+8Ql6ciPnU3FpGILAa+PQFGHSFXzHpbBQIBEyJgX2+VMwOTobNm0Tsfou
 Fe4WBXdjqUzM2ypT7/ytR+rJVXfNa4dOWOW+tVIl2CumXiaDjwrj0vrLOJsr1tTSjrzA
 07PwQkBY9EwaP/nXxesys6dK5vTRP7vfqH3pgkUoWLZl1y1jlXE1DMklGLouRxKxQKv8
 zH9/vBGwPjBkyRRTopPeyt8TY6cboZXkSk7G3xbuwm94wx7NFw+Asv5FCnPkuxCVB0Mm
 eJMQ==
X-Gm-Message-State: AGi0PuZJZ0wDy2iSKoFPMiqHbrzzwEGVaRbH2fy0VQC7r9c1wcu/fSSC
 2lBf5BazyYpYIjaAxdNSXg5v7lanUzQoFiZYJK6d1g==
X-Google-Smtp-Source: APiQypJTISLliPvHXhk/jaRqfwE0Sg5efFw00mZhdaQH3NURSh7kz0RnZ9E+dr9ksC0z/js98z/vmcGi59AxKrfoVNM=
X-Received: by 2002:a9d:1e82:: with SMTP id n2mr5287998otn.356.1586547063714; 
 Fri, 10 Apr 2020 12:31:03 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Apr 2020 12:31:01 -0700
MIME-Version: 1.0
From: sjg@google.com
In-Reply-To: <CAPnjgZ0s-=ONFEe5kOTpc2cGXDOWSw81qX-Cf2=Rd4fFdAAw7g@mail.gmail.com>
References: <CAPnjgZ0s-=ONFEe5kOTpc2cGXDOWSw81qX-Cf2=Rd4fFdAAw7g@mail.gmail.com>
 <20200403113844.v2.1.If3d7baadb24504a63742fe82f963f481b030fafa@changeid>
Date: Fri, 10 Apr 2020 12:31:01 -0700
X-Google-Sender-Auth: JAQ3Gjx8vghCDeiJTTr2IYJXtxc
Message-ID: <CAPnjgZ2Qgc+-LtNWgFD0YX6ucgkcZBu1WrXi1K_znf38JCE=hA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: core: remove the duplicated
	function dm_ofnode_pre_reloc
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

On Fri, 3 Apr 2020 at 03:39, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The content dm_ofnode_pre_reloc() is identical with ofnode_pre_reloc()
> defined in drivers/core/ofnode.c and used only three times:
> - drivers/core/lists.c:lists_bind_fdt()
> - drivers/clk/at91/pmc.c::at91_clk_sub_device_bind
> - drivers/clk/altera/clk-arria10.c::socfpga_a10_clk_bind
>
> So this function dm_ofnode_pre_reloc can be removed and replaced
> by these function calls by ofnode_pre_reloc().
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Hi Simon,
>
> It is a rebased patch for http://patchwork.ozlabs.org/patch/1035799/
> marked as superseded but never resent (and I forget it).
>
> Compilation is OK on travis:
> https://travis-ci.org/github/patrickdelaunay/u-boot/builds/670029232
>
> Patrick
>
>
> Changes in v2:
> - rebase on master
> - udpate dm_ofnode_pre_reloc call in at91_clk_sub_device_bind and
>   socfpga_a10_clk_bind
>
>  drivers/clk/altera/clk-arria10.c |  2 +-
>  drivers/clk/at91/pmc.c           |  2 +-
>  drivers/core/lists.c             |  2 +-
>  drivers/core/util.c              | 28 ----------------------------
>  include/dm/util.h                | 27 ---------------------------
>  5 files changed, 3 insertions(+), 58 deletions(-)
>

Acked-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
