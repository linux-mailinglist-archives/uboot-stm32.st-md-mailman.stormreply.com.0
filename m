Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF031F80B0
	for <lists+uboot-stm32@lfdr.de>; Sat, 13 Jun 2020 05:11:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24042C36B0D
	for <lists+uboot-stm32@lfdr.de>; Sat, 13 Jun 2020 03:11:34 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC81EC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jun 2020 03:11:32 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v13so8936550otp.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 20:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=pGOLOiVBPt9OMQqQldfWhNeFJ7fGpVWIFjzExziQAbI=;
 b=P6BEzg6PnmqmZx1/LUIQHY6qeyMVG06sUMscM8r7s6hU2CDiL9h8AT6ThTxB1NAv/Y
 HuLyJDIOJxMW168JqBZ6MRCRkO7v4fjuzSpP8+Zm8dKZVivk2KdvXTq3buH2mejhOnyb
 AFbJADi7BOTFY2zi0VXz/XayDht7WJ2i2mSv7qjg/TCJurVozJMQ/pOtqN6XucQv32cr
 N8HMx7faO263QBM/2SDV/OQr8x2wxiQdAbyw7QX7cCfojcHrlrN17TSMA52bC4L9B3lB
 Lrh02MROoFMlSPJSaEqo/FKKOTsX7MzHpG/iTggL2ETkE1NG2ePep6npWH9A2de4NC9U
 OeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=pGOLOiVBPt9OMQqQldfWhNeFJ7fGpVWIFjzExziQAbI=;
 b=k1o69bqQLnOyfbN2ebsUa5gcetPIQloMkgnjE0JOdMW+TS//ujRqHTeReG7fLFJ3Jt
 UHythoo7I44KawN8aeMgCrICJlMDXJAJ4gfPdoE7Z6BzGN0C4DzzJG43kGebpkrtSxOt
 Oynqnd/BobopUuPl9xiJQNde+rvOmM6m5V+SOST5IpkJKIDHUhewVozjtKDDmn6R+h9T
 /HqF6qjRE1+uqAfkudGWj758pPz1QetWxZ954xdhzO9WTCEuI/tyEFN7mAHt8NY4TaeC
 /k5fjmRW25JFKx1ppvEs9EVRWGjcfvoAYabW/h4PRlVBl7Vrg94TRpH0OzAQQOly1kY/
 UcJg==
X-Gm-Message-State: AOAM5321aRhYSy4Pj/5LZkAP7uIUe/xfHLGzrOwCoqUv1h5Lh9YqoDDk
 K2G9kwqZjKXl2YaGoqm24lvllcmhsVq3Nd2rDPgFTg==
X-Google-Smtp-Source: ABdhPJz26MrEeCNjZw4aHx4fVJCOhRfpNAwdLBLw3f0OasMsxur2/+ZenZb6bKp+ijSbIIg4X0XV4KGEX0J0jjjCK7U=
X-Received: by 2002:a9d:6f12:: with SMTP id n18mr14200242otq.100.1592017890622; 
 Fri, 12 Jun 2020 20:11:30 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 13 Jun 2020 03:11:29 +0000
MIME-Version: 1.0
From: sjg@google.com
In-Reply-To: <CAPnjgZ1f6X0kiBnwBj0oFAU5YoLZKamk_UE67d4a78eEejYj1w@mail.gmail.com>
References: <CAPnjgZ1f6X0kiBnwBj0oFAU5YoLZKamk_UE67d4a78eEejYj1w@mail.gmail.com>
 <20200527074331.4607-1-patrick.delaunay@st.com>
Date: Sat, 13 Jun 2020 03:11:29 +0000
X-Google-Sender-Auth: PHTdRJdeHlIovpFHjsAWhVjLApU
Message-ID: <CAPnjgZ1bzjjqnwS+PwASdWUsBKj6UZ-Mxuf3Z1PD1UY7YvpEdg@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
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

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
