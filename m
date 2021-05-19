Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 519733892BA
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 May 2021 17:34:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E092C57B60;
	Wed, 19 May 2021 15:34:23 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6653DC57B69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 15:34:21 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so12115776otp.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELVlvqs7fq6YOrVT0taHztiJBYr4PtaV5Xfyt5XnTFM=;
 b=H3mi5ZINqDO0Vh8GocAKwf8kw9x4XGj1Qj6PRlkwfnvUyaWSrk2QHtGPSDsiYwbLlf
 BOQSqILzBDWfSguntWCZhBciGLUDxPV0RBGhTklPN5cxMMRYwfdSHksvIc3puBvVP8Vw
 j66R9eHX1SiemZKS/u+f3PFTc3DCC8mKrFvME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELVlvqs7fq6YOrVT0taHztiJBYr4PtaV5Xfyt5XnTFM=;
 b=E2EcDb18NZJGVfGpnN8C8zy7fEq1ETHeqVJdTE7qKLY2CR339FvpsBC/o3W+rdPpxF
 l2qhdJihtpxIewgs6QA+QB6tigFVFA2Y0ez1eWphvxg2KV7yst6AxWQ4i44bFxoepJer
 d6MfQTcdgo5zA+xP22JLek0tAhllFrv/5g4q8H8p8tzNzZQQFH3/0cxm9/VEojkjaxP/
 SQaBO8mJvhW1OzluoaOBL9cG04P8PGZnzSQzMXHDaRHvePFGZ5RF/+jlyEPt4h4f4TZz
 roFHgmxnuD+2goO5Au0X7+zGm4WQwU9z/h5o1abGPhuOp2K2eOcJk/Txmx8RAFACMbPn
 2VBA==
X-Gm-Message-State: AOAM5308WNMa8DF22kFou5GSih+uyArR34WU/yJeNeS2mLMR/cCATfey
 4/PhLrAJ0SCTRzF53C0V06kl2LCVPfg62b8fvcJkiQ==
X-Google-Smtp-Source: ABdhPJwUB/9XbWJe4YM364q8EW1v87qcGUKeuzXoAFAHW8IYxAk2xy8LmeTYDlm/4x6iICBjIfN4/WdM1xwyNKAURZ4=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr13110otf.88.1621438459947;
 Wed, 19 May 2021 08:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142916.v2.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
In-Reply-To: <20210519142916.v2.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 19 May 2021 09:34:01 -0600
Message-ID: <CAPnjgZ3Gwgja_imuVCsLhZKmC7Ux5CCViHAGCEMn+2NXMY6NyA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] cmd: pinmux: update result of
	do_status
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

On Wed, 19 May 2021 at 06:30, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> From: Patrick Delaunay <patrick.delaunay@st.com>
>
> Update the result of do_status and always returns a CMD_RET_ value
> (-ENOSYS was a possible result of show_pinmux).
>
> This patch also adds pincontrol name in error messages (dev->name)
> and treats correctly the status sub command when pin-controller device is
> not selected.
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - keep result in show_pinmux
> - add comment in API pinctrl_get_pins_count() for -ENOSYS result
>
>  cmd/pinmux.c                 | 31 +++++++++++++++++--------------
>  include/dm/pinctrl.h         |  2 +-
>  test/py/tests/test_pinmux.py |  4 ++--
>  3 files changed, 20 insertions(+), 17 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
