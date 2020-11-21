Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6B2BC295
	for <lists+uboot-stm32@lfdr.de>; Sun, 22 Nov 2020 00:08:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62AD0C5663B;
	Sat, 21 Nov 2020 23:08:13 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B22C5663A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 23:08:10 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id k3so12421243otp.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 15:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gPSC0l73ok/vHEwTgGmbtzBMpvwzgLLxyasVcmtcvC4=;
 b=aRRVO0NgxVoNJ/qVeRDSAG2qUmt+sDvqwXjlhtBhAMFLAgBA70psxAnpZSpU7HtjyB
 BYcEXdUEq1Z6Nf+Uiocb9EYEsBLp1rc61r5kMlZvtIpLMRjbyGJHE9jKA6EaI73aWpmb
 YZMII9ebI4QazlWJu/bFzoyhnwtu/cJmfeiK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gPSC0l73ok/vHEwTgGmbtzBMpvwzgLLxyasVcmtcvC4=;
 b=jl/XZ+YofRXSdCc3Wa+frITVgKL62/Sn7VUX/sJHCCjNziD2/x6i5gmQQOn9UENpul
 hdbmY+ShQnNS6Q4XCFfhj/7LwdzJUAhOKf0p9nPLSrHwBp6t7zUF96mBW5Gf4zq0uZHL
 dsubQUmdILnw+aNQ9pbCBJ6j3OnVo++mC1Ua/KrEAa9Yfsi4XSbBHpF7wV78pMD4mQtS
 XUCWijdk8YQIdGFqHmi1j5OlNvn1yqbsdHAjMxAGdubKu9rKv3sV72hsuvXDNpQ6fSva
 c625d7OJsr0zPe+BMrqL1MUp1D7OGoTddq6T+ng+R63qZhQkRuiKMMpkiaEglKk2teSw
 Zypw==
X-Gm-Message-State: AOAM532EUfp75fW4CQSU619KI7XRUrRtYS521LRzlDVmVuoE1eYZoObH
 Vu+lcFsU5zuHU/vWyy1quAPh2Vj8GAWI6oPLaSvSFbz31HBcLw==
X-Google-Smtp-Source: ABdhPJzpGGJmvAhyEPjYZKTGCYP/ow/jqu7BS3+RQLP/vufesQwSZ+NM9qfs0i9eb1BATDf63iuEGzpJ4kTD1O/gGrA=
X-Received: by 2002:a05:6830:18a:: with SMTP id
 q10mr2523067ota.54.1606000089247; 
 Sat, 21 Nov 2020 15:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201119090843.5614-1-patrick.delaunay@st.com>
 <20201119090843.5614-2-patrick.delaunay@st.com>
In-Reply-To: <20201119090843.5614-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 21 Nov 2020 16:07:45 -0700
Message-ID: <CAPnjgZ3R7uHfcm2hDB6awxDV4_iBj0ZmaX6qRXcZ4uTZC=q+9w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/3] test: correct the test prefix in ut
	cmd_mem
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

On Thu, 19 Nov 2020 at 03:09, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Align the prefix used in cmd_ut_category function and name of tests
> for ut mem.
> This patch solves the issues detected by "make qcheck" after previous
> patch.
>
> Fixes: 550a9e7902ce ("cmd: Update the memory-search command")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  test/cmd/mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
