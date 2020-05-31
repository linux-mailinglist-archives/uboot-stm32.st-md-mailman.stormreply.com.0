Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F41E9813
	for <lists+uboot-stm32@lfdr.de>; Sun, 31 May 2020 16:11:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148BBC36B21
	for <lists+uboot-stm32@lfdr.de>; Sun, 31 May 2020 14:11:05 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4076EC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2020 14:11:03 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z13so4879094ljn.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2020 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VFUi4Kc5HLa2PCLhUxGn4X3nk9xTJ/74i343yQTv9x4=;
 b=IFzI5+eWmtBntFgnQSGT1O2J5v5mpHteNQ8rMCF2kIyUK5Osa2WuQVzCeNMll6zsYI
 wcDAzTdLDOXSOX9cyH/my3MVrBti8W1oPs5x5l8jjlE39gnkqSpzbC1f790+xt2gBDVF
 uFuxnfDZPIKcj32nwNOlSP/mXBJl/om9jiZiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VFUi4Kc5HLa2PCLhUxGn4X3nk9xTJ/74i343yQTv9x4=;
 b=Dy7JPyAWgWGSbPkaqxjinvTvLj24P6RVtoD5qZvrc6Hiis7fd9AEa9EZgERgWNjRgz
 gaeaKqurKSVMBbCXTdwlAEVmvK7liHn7tnJJcdG+bdGVmZz3uaE+qmqwzDlLGwzyeM5Z
 A6g9ueE4/paP9bqF2m9zCXUi9qpTaSoree+cszbc+OsIbPMfgsomjFoH8cie1bOlcglJ
 kv9noCwgALmn3lw672J+z6rGsUoyBHb+sa0xvRpGJqMUk7PIm1oiv0cr/sNH8qPqorlo
 60D+kdvjl0wW+PDTrc8S0IKujLkGltwRvfmO3V92qwLFeDFCi4Wo26irX3lRCLOfBIQX
 2BYw==
X-Gm-Message-State: AOAM533YBHEyaoPkVvFzPp3pAqvFWj5/1YKix8op0oU45GzTY9njjiEt
 jiWK5j8CSa7kTa8oP8bbODsfDdNKoZSnMs1/GNoqQQ==
X-Google-Smtp-Source: ABdhPJyOkpCcDsvwNoBveG6eb5fVZAcmC6UcWoRfmDYXztXjpUGHjwN4sjjcp2yU1K4hc1gBYLMyknw1GNsYFJ5vLrI=
X-Received: by 2002:a05:651c:2c6:: with SMTP id
 f6mr8287347ljo.371.1590934262816; 
 Sun, 31 May 2020 07:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200527074331.4607-1-patrick.delaunay@st.com>
In-Reply-To: <20200527074331.4607-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 31 May 2020 08:08:18 -0600
Message-ID: <CAPnjgZ1f6X0kiBnwBj0oFAU5YoLZKamk_UE67d4a78eEejYj1w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] doc: log: correct option name
	CONFIG_LOG_MAX_LEVEL
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

On Wed, 27 May 2020 at 01:43, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Replace CONFIG_(SPL_)MAX_LOG_LEVEL by the correct name as defined in
> common/Kconfig:
> line 668:config LOG_MAX_LEVEL
> line 688:config SPL_LOG_MAX_LEVEL
> line 708:config TPL_LOG_MAX_LEVEL
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add commnet for TPL with CONFIG_TPL_LOG_MAX_LEVEL example
>
>  doc/README.log | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
