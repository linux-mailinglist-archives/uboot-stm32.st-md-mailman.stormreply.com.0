Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514226D064
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 03:10:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C2C8C3FAE1
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 01:10:02 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E1EC3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 01:10:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id n2so553418oij.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 18:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qaiUtQRKqDJTXBzUANOH6XFzgiUM3S5/Ow1BORzi4U0=;
 b=Yrg8MckpaUK43w7B8iCPiBa1zr63XGV5ya9n9feS0LgCLr3jacS+RyVN7G4LJF9ZCd
 Ct3iSTrjykvYgeQeXILgq+9DD8pi3lrQiIocSnl+Jw1/C3kTaVBwZduygD+7yLkf2gNL
 YvvTNMG1AZ0Ql10NrTUs0V7f/uUG9aC1UEgPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaiUtQRKqDJTXBzUANOH6XFzgiUM3S5/Ow1BORzi4U0=;
 b=QjSxCkkHPfTVeASTeP0yVVJ0Q1vpdg8V/gnR0MzPvdjBY8FUuP8sZgHJ4ztQU0d2Rf
 ERW2GG2yNMCfwDGx75ZAqD/D/ODsNzukMJvJaYQMTg/SPGazNIKTstPa/l6Ewnf4peSb
 lOp48J7sqTJiR2xHqzp2uCyAOJNVPIRxz3i4PHORIpYQ31sa3jkOsofDLDJNhjLoNPIe
 B8cZJQcOnFmEWuz+ajo9ITTxnSrrPbTemUWGFZVCCCwTXabri3H6GesjEHj7iY5SdFS6
 UvR3d34ftT3VadSzxUpUR5xdM7kbZqtHw/5bXvvWDAd7xbc34Ay9+Oc5ymphc7c3BlHi
 2UCw==
X-Gm-Message-State: AOAM533JSJ99b4UxIYsAD9Zv12hHIInXp1GKeZUq9JW0WzgquDjXyfxc
 +iBgNP2yCO/iWAp27SjaI8SThBx5zhCRz0N2HLJilw==
X-Google-Smtp-Source: ABdhPJz0aCPhZlpSqtHHpUcTIpHhT0Wc4PeKd6Q7KFpZ6qysGno1cbh26SQO29Nv3jwO9ut9u1e9lMiZidgZ/RvaaU4=
X-Received: by 2002:a05:6808:69a:: with SMTP id
 k26mr4847713oig.127.1600304999605; 
 Wed, 16 Sep 2020 18:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200910162617.28257-1-patrick.delaunay@st.com>
In-Reply-To: <20200910162617.28257-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 16 Sep 2020 19:09:45 -0600
Message-ID: <CAPnjgZ1rmWnQ4-7Z1cAiR+G51YDBacqapyAi=FcH5rOJJ4fSWw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dm: add cells_count parameter in live DT
	APIs of_parse_phandle_with_args
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

On Thu, 10 Sep 2020 at 10:26, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> In the live tree API ofnode_parse_phandle_with_args, the cell_count
> argument must be used when cells_name is NULL.
>
> But this argument is not provided to the live DT function
> of_parse_phandle_with_args even it is provided to
> fdtdec_parse_phandle_with_args.
>
> This patch adds support of the cells_count parameter in dev_ and
> of_node API to allow migration and support of live DT:
> - of_parse_phandle_with_args
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/core/of_access.c | 7 ++++---
>  drivers/core/ofnode.c    | 3 ++-
>  include/dm/of_access.h   | 4 +++-
>  3 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
