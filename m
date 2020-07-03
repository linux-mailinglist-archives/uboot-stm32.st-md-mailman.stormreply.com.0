Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F3213256
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 05:50:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63873C36B26
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 03:50:57 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AA2C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 03:50:54 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s14so12118321plq.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2020 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXurr3VAvpcX5nXReKc6mQM2yUz+sJTz3d6TQ2Vo76c=;
 b=fdJKrbjeBft/KspBgXrO7dpZXtkTTcBsnM+SzDS8iP22BcSyBmXXR1ALqKJzrfITed
 CwT0ecflqW9wFUKUcDXN7f0PS9SJQ9wFIJtbJ8ckyuU2QoypVEfpYJ0PNs+9JI+oFW3X
 ezABbfOlMJaCbOTnIRGLQZrb5CSF5B4RD3edE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXurr3VAvpcX5nXReKc6mQM2yUz+sJTz3d6TQ2Vo76c=;
 b=LG7vYIAKahswsH5/IOgb313PhkolP/I1YtXsoAAlD/ww3ucASX8iih/DlcuwjpPmv+
 f8hGWSzXTr9jJn1Kts25EhpRBxndIQm1RfX32Q3SbHwbtyAkB3ymBtsMslIoVIbAS1av
 e3WFFnPs7aLcOFp5/GyRBCrd/PHq+GDiYwiNQKhdo3RX8B2QyWKP8/Cs6V7EJD9Iq+vs
 OLw68Rplpl2Q/bcxqfsgtp21TV9IhEc5BXLX8wYl/jXP7kBiQs0+CFun/Zhz5gwDOaEu
 ZUygXV6H0aNEd7+e0HWGPI9W4xiXjH6ZVlgS5aOUaCmAV3Q+RnUzxieW0eMXtznX7T7X
 rGHg==
X-Gm-Message-State: AOAM530zrQ2gefbiXNuNmfcTefL/nszR4de08fbl8eItl5lGSDx6F8BB
 6SDCEp5SvWst76HVqpNJUyLSZYFCGRsSjAdBK4dPVg==
X-Google-Smtp-Source: ABdhPJwszbJEkPKkSSgqKjkBXfMZvT8bAu8nKeCTk6aiahblZeFMm1y5Ue+ySjNbuICGlGEsiXXFJvyVO4saG4FFOqs=
X-Received: by 2002:a17:902:704a:: with SMTP id
 h10mr28639914plt.85.1593748252907; 
 Thu, 02 Jul 2020 20:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200702175254.22954-1-patrick.delaunay@st.com>
In-Reply-To: <20200702175254.22954-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 2 Jul 2020 21:50:35 -0600
Message-ID: <CAPnjgZ3y6vR7ts0Vf3rH9hfksohq4JpnJrtcspO_xyk03QgyrQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] Add information for skipped commit options
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

On Thu, 2 Jul 2020 at 11:53, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The unsupported Commit-xxx option are silently skipped
> and removed as 're_remove=Commit-\w*', this patch adds
> warning message in this case to detect misspelled issue
> for the 2 supported options:
>   Commit-notes:
>   Commit-changes:
>
> For example: the final 's' is missing (Commit-note:)
>
> NB: no issue for Series-xxx option as only the supported
>     options are accepted (see valid_series in series.py)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  tools/patman/patchstream.py | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
