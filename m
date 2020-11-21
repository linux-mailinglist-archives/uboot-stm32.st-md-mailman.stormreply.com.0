Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93C2BC296
	for <lists+uboot-stm32@lfdr.de>; Sun, 22 Nov 2020 00:08:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FE46C5663D;
	Sat, 21 Nov 2020 23:08:13 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03238C56638
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 23:08:10 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n12so8909884otk.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Nov 2020 15:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w43bIzd2abyAQeHNHqihFO3O3Bq+GBUzuc6JiCby2co=;
 b=MpX9zZm8a21UC1vBLi7hqF9Ovp7lc969NY6Xe/0GU+P6lFYnYP+MZG/8/TNR0qN8Ry
 A1L7+hv0sNEqIEANyg8Wl/YlBUdOA8RBp26PwXk4NILzYIpp1iQCpP1DvqVJe+E3TRXL
 XQy4KKLsNqeXRkg0egxayyacxKKlJi1Y4HZiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w43bIzd2abyAQeHNHqihFO3O3Bq+GBUzuc6JiCby2co=;
 b=X7LhOi4ixQJjWlxY/6z1ZrcetTbhWEy/wex2Ci4eKBFoinzBYNXf/YKyR0gfiJ6Fqv
 jnTZnHKSbhzKvGFtjd1WbF4fnxT+/m5AibDr3IWv+5J1ssCSba8/I56VD/N4yDkBrUrS
 CxmyazkXnXyCUedbZE3xjAYzWzj8c4Yrimelw+aEAwqLUo83SyJrB9iHSWXedXdhr89b
 DeCQ8xx3FmBHHS/ns00urOaP313lbcI2w6p1Qwyaw11TykrnFUqxTE3HGDTjNrX33FCa
 fOqUQkGqKIRYW+LzrXJ6G2bN0WOLdNAa0cIjcEPO+V0wcnA5j/C0ZOd00KfQcwecFyUv
 o5mQ==
X-Gm-Message-State: AOAM530PYR3FoWj3x57VvICc34agps61UjCPtfj+QxzvecUzPFIAwLkO
 1v++RTQQZ+Ty1Ujon1HOnWdSJWQSzP+T5g2A7XQa3Q==
X-Google-Smtp-Source: ABdhPJxG+Cl5RcYyyASHRsCA892QZADvvXJPNli2k2LPPxI7yeYAGa+ELYL/n02a0RnCqoqX2R/4U7nJLz2EtcbppVY=
X-Received: by 2002:a9d:39b7:: with SMTP id y52mr19492044otb.28.1606000089236; 
 Sat, 21 Nov 2020 15:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201120084833.31845-1-patrick.delaunay@st.com>
In-Reply-To: <20201120084833.31845-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 21 Nov 2020 16:07:52 -0700
Message-ID: <CAPnjgZ0-c5VNvQJkFc88XxTPH5cXXyiMuH8huMfxeXVmWTu1Qg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] sandbox: remove ram buffer file when
	U-Boot is loaded by SPL
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

On Fri, 20 Nov 2020 at 02:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update management of "--rm_memory" sandbox's option and force
> this option when U-Boot is loaded by SPL in os_spl_to_uboot()
> and remove the ram file after reading in main() as described
> in option help message: "Remove memory file after reading".
>
> This patch avoids that the file "/tmp/u-boot.mem.XXXXXX" [created in
> os_jump_to_file() when U-Boot is loaded by SPL] is never deleted
> because state_uninit() is not called after U-Boot execution
> (CtrlC or with running pytest for example).
>
> This issue is reproduced by
> > build-sandbox_spl/spl/u-boot-spl
>   and CtrlC in U-Bot console
>
> > make qcheck
>
> One temp file is created after each SPL and U-Boot execution
> (7 tims in qcheck after test_handoff.py, test_ofplatdata.py,
>  test_spl.py execution).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/sandbox/cpu/os.c    | 5 +++++
>  arch/sandbox/cpu/start.c | 7 +++++++
>  arch/sandbox/cpu/state.c | 4 ----
>  3 files changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
