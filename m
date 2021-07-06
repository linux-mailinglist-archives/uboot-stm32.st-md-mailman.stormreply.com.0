Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA663BC4BF
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Jul 2021 04:24:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6F0BC5718D;
	Tue,  6 Jul 2021 02:24:43 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4FA6C424BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jul 2021 02:24:39 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 x22-20020a9d6d960000b0290474a76f8bd4so18543784otp.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jul 2021 19:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WNS9bwJU7xqvj8nSdBAqQTOA9vyoqw6w/TagjX2yyDM=;
 b=SCie+UlxqbzxNSsidbXpniSCe8UU1OQKEPjWrKFwU8GKYAnfLgds3yxQOmKVNx7RO4
 NlH5pM6DPWwS0UjMuXfAaHEPxg6m6cDH2YQBMTZxM/hYjof5jyofvcbGi4sU72VGOtj4
 SFeH66L53K7sltTu2drwa8MCgT6lx7ty/vQRjy4LaiR+xvXS2ZkKaVQEBjUVJbAxLiWI
 SBMgzwNbY/YTks/F2gTT9Hg10bKKZd4iXCrjKoVU0vewAKLPznv/duYumRZFYYbjkKgF
 gq1lg0cye2BEyPmRgbIwP5d9OnJSpnygi2MJBjcvs/kshjhBKt8GkJB67m+T2y/27G9f
 72Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WNS9bwJU7xqvj8nSdBAqQTOA9vyoqw6w/TagjX2yyDM=;
 b=U3OkcCEK9tY5FT7heHf4Y7W0fMZYWCYgnFheR5CfKH4IUXAhv9JQ94j4ypkNqQDKns
 Dbd8DJphVKRTKIJbnkVJTUm5nHv1iDqegcsCCwFO+KE5btBH8UajfrqM3f7PMNPqYhsA
 8qOhjlkF54+cSOWvFljEF3KprK6mJXAIMP7R6x0YVJN+et4PyO2En9aN8aj0gDsQ1zhT
 LfNJMQ2YjDx6widywtS3MJNQS09nYQ9DN0/CHBkfc+hslu0pBeqxxK1doZTluXEHOET7
 cV/m9ZLQV+lxLpmVKCk3g8chX9yLbYWYO9c7VU5xsuHLtgrnPyRXyZkCaxHldxzC3AhS
 PKjw==
X-Gm-Message-State: AOAM530EUKAdSEwWyRomM+xrMVMJFnqZ98fVyzvg9YUDT75c8gC9+5Dc
 UyB3UU2PwaOZkxVeTl0jJxJlHFsyNEhDPfwMKeM=
X-Google-Smtp-Source: ABdhPJyiw0Mgdc0I6iRgeYZbYpUHo7/GlmYPgOV55Pz3goyYDL5Nwxdy6MS+pFBuQEPYII74wu9NouBydTcjDaSazuc=
X-Received: by 2002:a9d:7192:: with SMTP id o18mr13491360otj.370.1625538278019; 
 Mon, 05 Jul 2021 19:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid>
 <5d06fe48-bf97-8d23-36e7-8a509f0127ed@denx.de>
 <CAGi-RU+jA-zSy9n7zMJ--AEVuV0gi=vr5Q=eMZhZ5c57AT2gPQ@mail.gmail.com>
 <dd7843dc-6376-16a5-11b4-531492207302@foss.st.com>
In-Reply-To: <dd7843dc-6376-16a5-11b4-531492207302@foss.st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Tue, 6 Jul 2021 05:24:27 +0300
Message-ID: <CAGi-RUJLMgghWRingbN5R-GmM5_ZJ64BrDZfg=x565SjtXkNNA@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: cosmetic: remove unused
	define EQOS_DESCRIPTOR_ALIGN
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

On Mon, Jul 5, 2021 at 8:50 PM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Ramon,
>
> On 3/31/21 4:43 PM, Ramon Fried wrote:
> > On Tue, Mar 30, 2021 at 5:12 PM Marek Vasut <marex@denx.de> wrote:
> >> On 3/30/21 2:34 PM, Patrick Delaunay wrote:
> >>> Remove the define EQOS_DESCRIPTOR_ALIGN unused since the
> >>> commit 6f1e668d964e ("net: dwc_eth_qos: Pad descriptors to cacheline size")
> >>>
> >>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> >> Acked-by: Marek Vasut <marex@denx.de>
> >>
> >> Thanks
> > Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> It seens this patch is not applied on u-boot-net/network_master or on
> u-boot/next
>
> even if it is accepted in patchwork.
>
> http://patchwork.ozlabs.org/project/uboot/patch/20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid/
>
>
> Any reason ?
>
> or it is just a error in patchwork and the patch is forgotten...
>
>
> best regards.
>
> Patrick
>
>
>
>
Hi Patrick.
The patch was introduced just a bit before I started maintaining a
tree, up until then the patches were picked by Tom.
I applied it to my tree.
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
