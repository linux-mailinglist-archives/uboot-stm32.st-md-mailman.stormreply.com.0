Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF5412A2E
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 03:11:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF657C5A4D1;
	Tue, 21 Sep 2021 01:11:44 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76319C5A4D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 01:11:43 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id g16so12362983uam.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYTHLFwzplS167Y2rgrK4PpzJbsdwId7VDGFm1YL+Z8=;
 b=T8QK2URSx1CHyacigNW93brNqTrh+tdH3SXOF2HsKm2O290S/xSJdakxrvv8HCVmCW
 AZ1+UYXwpS9jqKi6BEsc9zRamlwuDzP3I8c3t89UKSkZ2dMymPF9221pC9XQuygIsYaz
 cL2S4bZHkIkpNbGzfcPuss/Pp0xwAwFFGd7BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYTHLFwzplS167Y2rgrK4PpzJbsdwId7VDGFm1YL+Z8=;
 b=kaZ1eZ25cUQYNisA690VP4oArOJpUNDfXwaxFSOmFa2vLMTjzXCA2jm0T8wyJXoKNH
 3mLnPVsOS4G1IQWWhNS+MkCGI61yJirnj0frpps4fEFb7PVZmwmmxZmbcM/S7oQ16Bv3
 Eo2p91cI5b8pV5z585f9+CCh19q+xv+W7VQ505gUW+1ISWA6H3XWTnLy5rMJOTGZUh4W
 Z8cq4VjTE76OaM/77ei+psnp1rg3xUhFBkhTpqYrgvlau+21RzLlSLuvxCnrDFQmYTE0
 lhFZQONnFjqLTLu9yGHJLPSpgsS6KjJB+bH/3AH0HF+qhJfAtK/A+aBw+ubuK0wBuxOZ
 9dcw==
X-Gm-Message-State: AOAM530rkLD9SK1FP25J/NJBBQq48GF+ZzUpQM2IFb/rCijLHI1uGdG6
 wMQchDp/RtERHMh+qM4lZIIUM1jenuvFUqsiHDSt/w==
X-Google-Smtp-Source: ABdhPJywea8dLoGlno+I9V4yvAuCh4ujEisds5V4LRon+1z/ECNP7/dUJvr4KD6bNxxgJYjoUyynFjyFbjqIRTtC2t0=
X-Received: by 2002:ab0:14a7:: with SMTP id d36mr14328655uae.96.1632186702280; 
 Mon, 20 Sep 2021 18:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210920182717.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
In-Reply-To: <20210920182717.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 Sep 2021 19:11:30 -0600
Message-ID: <CAPnjgZ2oEy3kSYihsFdoPR6kn=tVprH3s4WHKYGJGZfmQNvqBA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Nandor Han <nandor.han@vaisala.com>
Subject: Re: [Uboot-stm32] [PATCH] reboot-mode: migrate uclass to livetree
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

On Mon, 20 Sept 2021 at 10:27, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use dev_ function to support a live tree.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/reboot-mode/reboot-mode-uclass.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
